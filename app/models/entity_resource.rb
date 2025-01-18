# frozen_string_literal: true

# This class is used to store the resources of an entity.
class EntityResource < ApplicationRecord
  belongs_to :entity, polymorphic: true
  belongs_to :resource, polymorphic: true
end
