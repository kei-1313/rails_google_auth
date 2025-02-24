class SessionsController < ApplicationController
  def create
    # Access the authentication hash for the user
    auth = request.env["omniauth.auth"]
    origin = request.env["omniauth.origin"]

    user = User.find_by(email: auth.info.email)

    if auth && user.nil?
      auth_user = User.create(
        username: auth.info.name,
        email: auth.info.email,
        password: SecureRandom.hex(10)
      )

      user_account = UserAccount.find_or_create_by(user: auth_user, provider: auth.provider) do |user_account|
        user_account.provider = auth.provider
        user_account.provider_account_id = auth.uid
        user_account.auth_protocol = "oauth2"
        user_account.access_token = auth.credentials.token
        user_account.token_type = "Bearer"
        user_account.scope = auth.credentials.scope
        user_account.refresh_token = auth.credentials.refresh_token
        user_account.expires_at = Time.at(auth.credentials.expires_at).to_datetime
        user_account.user = auth_user
      end

      session[:user_id] = auth_user.id
    end

    redirect_to "/users"
  end
end
