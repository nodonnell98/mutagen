# This class applies modifiers to entities
# A resource such as a Weapon can apply modifiers to an entity such as a Character
# The weapon would be the source and an trait would be the target
class Modifier < ApplicationRecord
  belongs_to :target, polymorphic: true
  belongs_to :source, polymorphic: true
end
