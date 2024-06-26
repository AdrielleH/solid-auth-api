class UserController < ApplicationController
	def create
		service = ::Services::User::CreateUserService.new(params: user_params)
		result = service.execute

		render json: result
	end

	private
	
	def user_params
		params.permit(:username, :password)
	end
end
