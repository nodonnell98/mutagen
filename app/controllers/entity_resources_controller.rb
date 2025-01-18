# frozen_string_literal: true

# The controller for the entity_resources model.
class EntityResourcesController < ApplicationController
  def destroy
    entity = params[:entity]
    resource = params[:resource]
    entity_resource = EntityResource.find_by(entity: entity, resource: resource)

    if entity_resource
      entity_resource.destroy
      redirect_to polymorphic_path(entity), notice: "Gear removed successfully."
    else
      redirect_to polymorphic_path(entity), alert: "Gear not found."
    end
  end
end
