# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  it 'É válido' do
    user = build(:user)

    expect(user).to be_valid
  end
end
