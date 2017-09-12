class ProfileController < ApplicationController

  def show
    res = run_interaction(Profile::Show, permitted_params)
    {
      true => -> {
        @user = res.result
        render :show
      },
      false => -> {
        flash[:error] = res.errors.full_messages.to_sentence
        redirect_to user_path(current_user)
      }
    }[!!res.valid?].call
  end
end