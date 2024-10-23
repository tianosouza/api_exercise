class ApplicationController < ActionController::API
  before_action :ensure_json_request

  def ensure_json_request
    return if request.headers["Accept"] =~ /vnd\.api\+json/
    render json: { error: "Only JSON requests are accepted" }, status: :not_acceptable
  end

  def encode_token(payload)
    JWT.encode(payload, "secret")
  end

  def decode_token
    auth_token = request.headers["Authorization"]

    if auth_token
      token = auth_token.split(" ").last
      begin
        JWT.decode(token, "secret", true, algorithm: "HS256")
      rescue JWT::VerificationError
        nil
      end
    end
  end

  def authorized_user
    decoded_token = decode_token
    if decoded_token
      user_id = decoded_token[0]["user_id"]
      @user = User.find_by(id: user_id)
    end
  end

  def authorize
    render json: { error: "Not authorized" }, status: :unauthorized unless authorized_user
  end
end
