# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts 'Seeding the database...'
puts 'Creating a character...'
character = Character.find_or_create_by!(
  name: 'Alice',
  description: 'A character named Alice',
  level: 1
)

puts 'Creating traits...'
traits = ["Strength", "Constitution", "Discipline", "Intelligence", "Sense", "Will"].map do |trait_name|
  Trait.find_or_create_by!(name: trait_name, code: trait_name.downcase)
end

puts 'Creating entity traits...'
traits.each do |trait|
  EntityTrait.find_or_create_by!(
    entity: character,
    trait: trait,
    base_value: 20,
    cached_value: 20
  )
end

puts 'Setting the first trait as a core trait...'
character.entity_traits.first.update(core_trait: true)

puts 'Creating a gear...'
kevlar = Gear.find_or_create_by!(
  name: 'Kevlar Vest',
  description: 'A piece of armour'
)

puts 'Creating an entity resource...'
EntityResource.find_or_create_by!(
  entity: character,
  resource: kevlar
)

puts 'Creating a modifier for the kevlar that increases the strength of a character...'
Modifier.find_or_create_by!(
  target: Trait.find_by(name: 'Strength'),
  source: kevlar,
  modifier: 5
)

puts 'Creating a sword...'
sword = Weapon.find_or_create_by!(
  name: 'Sword',
  description: 'A sharp piece of metal'
)

puts 'Creating an entity resource...'
EntityResource.find_or_create_by!(
  entity: character,
  resource: sword
)

puts 'Creating a modifier for the sword that increases the will of a character...'
Modifier.find_or_create_by!(
  target: Trait.find_by(name: 'Will'),
  source: sword,
  modifier: 5
)

puts 'seed complete'

