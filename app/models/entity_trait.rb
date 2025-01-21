# frozen_string_literal: true

# This class is used to store the traits of an entity.
# It is used to store the base value of an trait and the modifiers that affect it.
# The cached value is the sum of the base value and the modifiers.
# The update_cached_value method is used to update the cached value of the trait.
class EntityTrait < ApplicationRecord
  belongs_to :entity, polymorphic: true
  belongs_to :trait

  def name
    trait.name
  end

  def modifier
    (cached_value / 10) - 2
  end

  def crit_success
    (cached_value / 4).floor
  end

  def crit_fail
    (cached_value * 2)
  end
end
