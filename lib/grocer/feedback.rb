require 'grocer/failed_delivery_attempt'

module Grocer
  class Feedback
    include Enumerable

    attr_accessor :connection
    def initialize(connection)
      @connection = connection
    end

    def each
      while buf = @connection.read(FailedDeliveryAttempt::LENGTH)
        yield FailedDeliveryAttempt.new(buf)
      end
    end
  end
end
