# Replace API_KEY and API_SECRET with the values you got from Twitter

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, "API_KEY", "API_SECRET"
end