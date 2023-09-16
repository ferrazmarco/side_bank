# frozen_string_literal: true

module Agency
  # Model for Agency
  class Record < ApplicationRecord
    self.table_name = 'agencies'

    validates :name, {
      presence: true
    }

    validates :code, {
      presence: true,
      uniqueness: true
    }
  end
end
