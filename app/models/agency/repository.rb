# frozen_string_literal: true

module Agency
  # Repository for Agency
  module Repository
    class << self

    Conditions = ->(scope) do
      { id: scope.id.value }
    end

    BuildAgency = ->((id, name, code)) do
      ::Agency.new(id:, name:, code:, created_at:, updated_at:)
    end

    def create_agency(name:, code:)
      created_at = ::Time.now

      ::Agency::Record.create(
        name: name.value,
        code: code.value,
        created_at: created_at
      )
    rescue ActiveRecord::RecordInvalid
      raise 'Invalid parameters for create agency'
    end

    def find_agency(scope:)
      ::Agency::Record
        .where(Conditions[scope])
        .pick(:id, :name, :code, :created_at, :updated_at)
        &.then(&BuildAgency)
    end

    def update(scope:)
      ::Agency::Record.where(Conditions[scope])
    end

    private

    def update(conditions:, attributes:)
      attributes.merge!(updated_at: ::Time.current)

      updated = ::Agency::Record.where(conditions).update_all(attributes)

      updated == 1
    end
  end
end
