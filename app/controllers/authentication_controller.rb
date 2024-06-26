class AuthenticationController < ApplicationController
  def login
    service = ::Services::Auth::LoginService.new(params: login_params)

    session = service.execute

    render json: session
  end

  private

  def login_params
    params.permit(:username, :password, :authentication)
  end
end