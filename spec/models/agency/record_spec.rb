# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Agency::Record, type: :model do
  describe 'validations' do
    describe 'name' do
      it { is_expected.to validate_presence_of(:name) }
    end

    describe 'code' do
      it { is_expected.to validate_presence_of(:code) }
      it { is_expected.to validate_uniqueness_of(:code) }
    end
  end
end
