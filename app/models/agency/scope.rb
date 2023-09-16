# frozen_string_literal: true

module Agency
  # Attributes Scope for Agency
  class Scope
    include ::Micro::Attributes.with(:initialize)

    attribute :id, default: proc(&::Kind::ID)

    def valid? = id.valid?

    def invalid? = !valid?
  end
end
