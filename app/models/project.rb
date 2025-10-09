class Project < ApplicationRecord
  belongs_to :user
  has_many :entries, dependent: :destroy


  validates :name, presence: true
  validates :description, presence: true

  accepts_nested_attributes_for :entries, allow_destroy: true
end
