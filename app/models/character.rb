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
end
