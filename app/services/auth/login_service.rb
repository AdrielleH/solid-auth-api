module Services
  module Auth
    class LoginService
      def initialize(params:)
        @params = params
      end

      def execute
        session = create_session if authenticate_user

        session.login
      end

      private

      def current_user
        user = ::User.find_by(username: @params[:username])
        raise Services::Exception.new("username not found", 400) if !user
      end

      def authenticate_user
        @user = ::User.find_by(username: @params[:username])
        @user.authenticate(@params[:password])
      end

      def create_session
        payload = { user_id: @user.id }

        JWTSessions::Session.new(payload: payload)
      end
    end
  end
end