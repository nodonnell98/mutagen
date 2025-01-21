# frozen_string_literal: true

# Trait model
class Trait < ApplicationRecord
  has_many :entity_traits
  has_many :weapons
end
