class Movie < ApplicationRecord
  has_many :bookmarks
  before_destroy :check_for_bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  private

  def check_for_bookmarks
    if bookmarks.count > 0
      errors.add(:base, "Cannot delete movie while bookmarks exist")
      return false
    end
  end
end
