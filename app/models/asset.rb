# == Schema Information
#
# Table name: assets
#
#  id                :integer          not null, primary key
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#  assetable_id      :integer
#  assetable_type    :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  asset_type        :integer
#

class Asset < ActiveRecord::Base

  enum asset_type: { attendance_list: 0, teacher_material: 1, participant_material: 2, other: 99 }

  belongs_to :assetable, :polymorphic => true

  has_attached_file :file
  validates_attachment_content_type :file, content_type: %w(application/vnd.ms-excel
                                                           application/vnd.ms-powerpoint
                                                           application/msword
                                                           application/vnd.openxmlformats-officedocument.wordprocessingml.document
                                                           application/pdf
                                                           image/jpeg)

  validates_attachment_size :file, :less_than => 15.megabytes


  def to_s
    file_file_name
  end

end
