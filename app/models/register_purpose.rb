class RegisterPurpose < ApplicationRecord
  include ActiveModel::Model

  attr_accessor :purpose
  validates :purpose, presence: :true
end
