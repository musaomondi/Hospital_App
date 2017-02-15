class UserTypesController < ApplicationController
  def create
    @user_type = UserType.new(user_type_params)
    @user_type.save
  end
  private
  def user_type_params
    params.require(:user_type).permit(:user_type_name)
  end
end
