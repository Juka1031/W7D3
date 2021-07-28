class SessionsController < ApplicationController


    def new
        @user = User.new
    end

    # def destroy
    #     current_user.reset_session_token!
    #     session[:session_token] = nil
    #     current_user = nil
    # end

    # def create
    # end
end
