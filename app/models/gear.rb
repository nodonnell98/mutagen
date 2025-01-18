# frozen_string_literal: true

# Gear model
class Gear < ApplicationRecord
  has_many :entity_resources, as: :resource
  has_many :modifiers, as: :source
end
