# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  kind       :string           not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#

class Track < ActiveRecord::Base
  validates :album_id, :kind, presence: true
  validates :kind, inclusion: %w(bonus regular)

  belongs_to :album
end
