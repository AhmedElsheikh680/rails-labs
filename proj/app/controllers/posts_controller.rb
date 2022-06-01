class PostsController < ApplicationController
    layout 'auth'
    before_action :unauthenticated_user
    def index
        render 'index'
        
    end
end
