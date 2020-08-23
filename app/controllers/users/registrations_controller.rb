# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # def show
  #   user = User.find(params[:id])
  #   @nickname = user.nickname
  # end
  # def create
  #   @user = User.new
  #   user.create(user_params)
  # end
  # private

  # def user_params
  #   params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :first_name, :familiy_name, :first_name_reading, :familiy_name_reading, :date[])
  # end
end
