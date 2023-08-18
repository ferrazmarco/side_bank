# frozen_string_literal: true

class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  validates_presence_of :document_number, :email, :name
  validates_uniqueness_of :document_number, :email
end
