module Services
  class Exception < Exception
    attr_reader :code

    def initialize(message, error_code = 500)
      super(message)
      @code = error_code
    end
  end
end