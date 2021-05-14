# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # github callback
  def github
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
    else
      flash[:error] = 'There was a problem signing you in through Github. Please register or try signing in later.'
      redirect_to after_omniauth_failure_path_for(@user)
    end
  end

  # google callback
  def google_oauth2
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    else
      flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
      redirect_to after_omniauth_failure_path_for(@user)
    end
  end

  # facebook callback
  def facebook
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
      redirect_to after_omniauth_failure_path_for(@user)
    end
  end

  # twitter callback
  def twitter
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'Twitter') if is_navigational_format?
    else
      flash[:error] = 'There was a problem signing you in through Twitter. Please register or try signing in later.'
      redirect_to after_omniauth_failure_path_for(@user)
    end
  end

  # GET|POST /resource/auth/twitter
  def passthru
    super
  end

  # generic failure callback
  # called in user ungrant or redirection failure
  # GET|POST /users/auth/twitter/callback
  def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
    redirect_to after_omniauth_failure_path_for(@user)
  end

  protected

  # The path used when OmniAuth fails
  def after_omniauth_failure_path_for(scope)
    new_registration_path(scope)
  end
end
