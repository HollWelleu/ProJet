class HomeController < ApplicationController

    before_action :authenticate_user!, except: [:welcome]

    def index
        @projects = current_user.projects
    end

    def admin
        @users = User.all
    end

end
