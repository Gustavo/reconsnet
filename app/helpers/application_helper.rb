module ApplicationHelper

  def date_display(date)
    if date.year == Time.now.year
      I18n.l date, format: :short
    else
      I18n.l date, format: :long
    end
  end

  # mais detalhes em http://railscasts.com/episodes/196-nested-model-form-revised
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render('common/' + association.to_s.singularize + '_fields', f: builder)
    end
    link_to(name, '#', class: 'add_fields', data: {id: id, fields: fields.gsub('\n', '')})
  end

end
