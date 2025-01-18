class CharacterModifierService
  attr_reader :character

  def initialize(character)
    @character = character
  end

  def call
    modify_character
  end

  def modify_character
    reset_traits

    # Collect all the relevant entity traits for the character
    target_traits = EntityTrait.where(entity: character, trait: character.entity_resources.flat_map { |er| er.resource.modifiers.map(&:target) }).index_by(&:trait)

    # Collect all the necessary updates
    updates = []

    character.entity_resources.each do |entity_resource|
      entity_resource.resource.modifiers.each do |modifier|
        target_trait = target_traits[modifier.target]
        if target_trait
          updates << { trait: modifier.target, modifier: modifier.modifier, current_value: target_trait.cached_value }
        end
      end
    end

    # Perform all updates in a batch operation
    EntityTrait.transaction do
      updates.each do |update|
        target_trait = target_traits[update[:trait]]
        target_trait.update!(cached_value: target_trait.cached_value + update[:modifier]) if target_trait
      end
    end
  end

  private

  def reset_traits
    character.entity_traits.each do |entity_trait|
      entity_trait.update!(cached_value: entity_trait.base_value)
    end
  end
end
