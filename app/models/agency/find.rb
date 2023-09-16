# frozen_string_literal: true

module Agency
  # Implements the Find use case to Agency
  class Find < ::Micro::Case
    attribute :scope, validates: { kind: Scope }
    attribute :repository, {
      default: Repository,
      validates: {kind: {respond_to: :find_agency}}
    }

    def call
      return Failure(:invalid_scope) if scope.invalid?

      agency = repository.find_agency(scope:)

      return Failure(:agency_not_found) unless agency

      Success :agency_found, result: { agency: }
    end
  end
end
