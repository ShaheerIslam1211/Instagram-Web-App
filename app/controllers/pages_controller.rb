# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    return if user_signed_in?

    redirect_to new_user_session_path
  end
end
