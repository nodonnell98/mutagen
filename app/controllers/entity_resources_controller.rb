# frozen_string_literal: true

# app/controllers/entity_resources_controller.rb
class EntityResourcesController < ApplicationController
  # after_actiom

  def destroy
    entity_resource = EntityResource.find_by(entity: entity, resource: resource)

    if entity_resource
      entity_resource.destroy

      respond_to do |format|
        format.turbo_stream do
          render partial: "characters/#{params[:resource_type].downcase}_list", locals: { character: entity }
        end
        format.html { redirect_to polymorphic_path(entity), notice: 'Gear removed successfully.' }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render partial: 'characters/gear_list', locals: { character: entity }
        end
        format.html { redirect_to polymorphic_path(entity), alert: 'Gear not found.' }
      end
    end
  end

  private

  def entity
    entity_type = params[:entity_type]
    entity_id = params[:entity_id]

    entity_type.constantize.find(entity_id)
  end

  def resource
    resource_type = params[:resource_type]
    resource_id = params[:resource_id]

    resource_type.constantize.find(resource_id)
  end
end
