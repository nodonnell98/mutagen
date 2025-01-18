# frozen_string_literal: true

# Character model
class Character < ApplicationRecord
  has_many :entity_traits, as: :entity
  has_many :entity_resources, as: :entity
end
