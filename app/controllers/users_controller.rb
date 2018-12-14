class UsersController < ApplicationController
    
    def index
        @users = User.all
        
        render("users/index.html.erb")
    end
    
    def show_listings
        @user = User.find(params.fetch("id"))
        @useritems = Item.where(seller_id: @user.id)
        render("users/useritems.html.erb")
    
    end


    def show_bookmarks
        
        @user = User.find(current_user.id)
        @userbookmarks = Bookmark.where(user_id: current_user.id)
        render("users/userbookmarks.html.erb")
    
    end
    
    
end