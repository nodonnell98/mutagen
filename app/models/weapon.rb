# frozen_string_literal: true

# Weapon model
class Weapon < ApplicationRecord
  has_many :entity_resources, as: :resource
  has_many :modifiers, as: :source
  belongs_to :trait

  validates :name, presence: true
end
