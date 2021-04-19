class RegisterTemp < ApplicationRecord
  include ActiveModel::Model

  attr_accessor :temp
  validates :temp, numericality: true
end
