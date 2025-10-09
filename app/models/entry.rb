class Entry < ApplicationRecord
  belongs_to :project

  validates :title, presence: true
  validates :body, presence: true
end
