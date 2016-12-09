# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  album_type :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#

class Album < ActiveRecord::Base
  validates :band_id, :album_type, presence: true
  validates :album_type, inclusion: %w(live studio)

  belongs_to :band

  has_many :tracks, dependent: :destroy
end
