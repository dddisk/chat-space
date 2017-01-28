class Group < ApplicationRecord
  has_many :messages
  has_many :users, through: :user_groups
  has_many :user_groups, dependent: :destroy
  accepts_nested_attributes_for :users, allow_destroy: true

  validates :name, presence: true
end
