# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Agency::Find, type: :use_case do
  describe '.call' do
    describe 'failures' do
      context 'when the scope attribute has the wrong kind' do
        let(:scope) { nil }

        it 'returns a failure' do
          result = described_class.call(scope:)

          expect(result).to be_a_failure
          expect(result.type).to be(:invalid_attributes)
          expect(result.data.keys).to contain_exactly(:errors)
        end

        it 'exposes the validation errors' do
          result = described_class.call(scope:)

          expect(result[:errors].to be_a(::ActiveRecord::Errors).and include(:scope))
        end
      end

      context 'when the scope is invalid' do
        let(:scope) { Agency::Scope.new({}) }

        it 'returns a failure' do
          result = described_class.call(scope:)

          expect(result).to be_a_failure
          expect(result.type).to be(:invalid_scope)
          expect(result.data.keys).to contain_exactly(:invalid_scope)
        end

        it 'exposes the invalid scope' do
          result = described_class.call(scope:)

          expect(result[:invalid_scope]).to be(true)
        end
      end

      context 'when a agency is not found' do
        let(:agency) { create_agency(name: 'Agency 1', code: 'AG1') }
        let(:scope) { Agency::Scope.new(name: 'Agency 2') }

        it 'returns a failure result' do
          result = described_class.call(scope:)

          expect(result[:agency_not_found]).to be(true)
        end
      end
    end

    describe 'success' do
      context "when agency if found" do
        let!(:agency) { create_agency(name: 'Agency 1', code: 'AG1') }
        let!(:scope) { Agency::Scope.new(name: 'Agency 1') }

        it 'returns a success result' do
          result = described_class.call(scope:)

          expect(result).to be_a_success
          expect(result.type).to be(:agency_found)
          expect(result.data.keys).to contain_exactly(:agency)
        end

        it 'exposes the agency' do
          result = described_class.call(scope:)

          expect(result[:agency]).to match(Agency)
          expect(result[:agency].id).to be == agency.id
        end
      end
    end
  end
end
