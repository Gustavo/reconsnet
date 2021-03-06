class ResourceAssetPolicy < ApplicationPolicy

  def show?
    return true if can_edit?

    return false unless user

    # Docente global pode ver todos material
    return true if user.has_role? :instructor

    if record.is_a?(ResourceAsset)
      event = record.assetable # assuming event for now
      # Material do participante
      return true if record.asset_type == 'participant_material' and
                                                 user.has_role?(:participant, event)
    end
  end


  ##
  # If assets, in general, should be shown in a specified event
  # Needed when we don't have the asset object but are checking against the Asset class

  def show_in_event?(event)
    return false unless user
    return true if can_edit?
    return true if user.has_role?(:participant, event) or user.has_role?(:instructor, event) or user.has_role?(:instructor)
  end

  def create?
    can_edit?
  end

  def new?
    can_edit?
  end

  def update?
    can_edit?
  end

  def edit?
    can_edit?
  end

  def destroy?
    can_edit?
  end


  private

    def can_edit?
      return false unless user
      return true if (user.is_admin? or user.is_event_admin?)
      if record.is_a?(ResourceAsset)
        event = record.assetable # assuming event for now
        return true if user.has_role?(:instructor, event)
      end
    end

end
