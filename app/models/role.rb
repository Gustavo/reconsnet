# == Schema Information
#
# Table name: roles
#
#  id            :integer          not null, primary key
#  name          :string
#  resource_id   :integer
#  resource_type :string
#  created_at    :datetime
#  updated_at    :datetime
#

class Role < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true, required: false

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify

  GLOBAL_ROLES = %w(admin event_admin volunteer_admin person_admin instructor volunteer)
end
