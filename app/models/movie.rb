class Movie < ApplicationRecord

  has_many :reviews
  mount_uploader :poster_image_url, ImageUploader

  validates :title, presence: true
  validates :director, presence: true
  validates :description, presence: true
  # validates :poster_image_url, presence: true
  validates :release_date, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }

  validate :release_date_is_in_the_past

  scope :under_90, -> { where("runtime_in_minutes < ?", 90) }
  scope :between_90_and_120, -> { where("runtime_in_minutes >= ? AND runtime_in_minutes <= ?", 90, 120) }
  scope :over_120, -> { where("runtime_in_minutes > ?", 120) }

  def review_average
    reviews.size == 0 ? 0 : (reviews.sum(:rating_out_of_ten)/reviews.size.to_f).round(1)
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

end
