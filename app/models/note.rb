# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  track_id   :integer          not null
#  text       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Note < ActiveRecord::Base
  validates :user_id, :track_id, :text, presence: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  belongs_to :track
end
