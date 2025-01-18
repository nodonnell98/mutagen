# frozen_string_literal: true

# This class is used to store the traits of an entity.
# It is used to store the base value of an trait and the modifiers that affect it.
# The cached value is the sum of the base value and the modifiers.
# The update_cached_value method is used to update the cached value of the trait.
class EntityTrait < ApplicationRecord
  belongs_to :entity, polymorphic: true
  belongs_to :trait

  def update_cached_value
    total = base_value
    modifiers = Modifier.where(target: self).sum(:modifier)
    update!(cached_value: total + modifiers)
  end

  def name
    trait.name
  end
end
