class RegisterContact < ApplicationRecord
  include ActiveModel::Model

  attr_accessor :number
  validates :number, presence: true
end
