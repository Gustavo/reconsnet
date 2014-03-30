require 'spec_helper'

describe 'Participations' do

  it 'adiciona participante' do
    event = create :event
    person = create :person
    visit new_event_participation_path(event.id)
    select person.name, from: 'Pessoa'
    select 'Inscrito', from: 'Status'
    select 'Professor', from: 'Tipo'
  end

end