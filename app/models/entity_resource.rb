# frozen_string_literal: true

# This class is used to store the resources of an entity.
class EntityResource < ApplicationRecord
  belongs_to :entity, polymorphic: true
  belongs_to :resource, polymorphic: true
end

def trait_modifier
  entity_trait&.modifier || 0
end

def trait
  resource.trait if resource.respond_to?(:trait)
end

private

def entity_trait
  EntityTrait.find_by(entity: entity, trait: trait)
end
