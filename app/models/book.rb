class Book < ApplicationRecord
  belongs_to :user

  enum :status, { unread: 0, reading: 1, finished: 2 }

  validates :title, :author, presence: true
  validates :finished_on, presence: true, if: :finished?
  validates :finished_on,
          comparison: { less_than_or_equal_to: Date.current },
          allow_nil: true

end

