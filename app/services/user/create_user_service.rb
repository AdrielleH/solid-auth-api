module Services
  module User
    class CreateUserService
      def initialize(params:)
        @params = params
      end

      def execute
        validate_params!

        create_user

      rescue Services::Exception => e
        { message: e.message, code: e.code }
      rescue Exception => e
        { message: e.message, code: e.code }
      end

      private

      def validate_params!
        user = ::User.find_by(username: @params[:username])
        raise Services::Exception.new("username already in use", 400) if user
      end

      def create_user
        user= ::User.new(sanitize_params)

        return user if user.save!

        raise Services::Exception.new("cannot create user", 400)
      end

      def sanitize_params
        {
          username: @params[:username],
          password: @params[:password]
        }
      end
    end
  end
end