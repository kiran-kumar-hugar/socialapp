class Group < ApplicationRecord
	validates :name, presence: true
	has_many :groupadmins, dependent: :destroy
	accepts_nested_attributes_for :groupadmins, reject_if: :all_blank, allow_destroy: true
end
