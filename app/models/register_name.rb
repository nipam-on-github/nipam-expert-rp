class RegisterName < ApplicationRecord
  include ActiveModel::Model

  attr_accessor :name, :last_name
  validates :name, presence: true
  validates :last_name, presence: true
end
