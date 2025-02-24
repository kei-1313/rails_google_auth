module OAuth
  class GoogleOauth2Controller < ApplicationController
    def callback
      # Access the authentication hash for the user
      auth = request.env["omniauth.auth"]
      origin = request.env["omniauth.origin"]

      render json: {
        auth: auth,
        origin: origin
      }
    end
  end
end