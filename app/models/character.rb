# frozen_string_literal: true

# Character model
class Character < ApplicationRecord
  has_many :entity_traits, as: :entity
  has_many :entity_resources, as: :entity
  has_many :gear, through: :entity_resources, source: :resource, source_type: 'Gear'
  has_many :weapons, through: :entity_resources, source: :resource, source_type: 'Weapon'

  validates :name, presence: true
  validates :level, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def traits
    entity_traits.includes(:trait).order('traits.display_order ASC').reload
  end

  def health
    constitution_trait = entity_traits.joins(:trait).find_by(traits: { name: 'Constitution' })
    constitution_trait ? (constitution_trait.modifier * 3) + 5 : 0
  end

  def threat_power
    level + main_trait.modifier + 3
  end

  def main_trait
    entity_traits.joins(:trait).find_by(traits: { name: 'Sense' })
  end

  def weapon_trait_modifier(weapon)
    entity_trait = traits.find_by(traits: { name: weapon.trait.name })
    entity_trait ? entity_trait.modifier : 0
  end
end
