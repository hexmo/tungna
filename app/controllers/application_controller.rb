class ApplicationController < ActionController::API
    def index
        render json: {appName: "Tungna", version:"21.1.8"}, status: 200
    end
end
