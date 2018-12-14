class BookmarksController < ApplicationController
  
   before_action :authenticate_user!
   
  def index
    @bookmarks = Bookmark.all

    render("bookmark_templates/index.html.erb")
  end

  def show
    @bookmark = Bookmark.find(params.fetch("id_to_display"))

    render("bookmark_templates/show.html.erb")
  end

  def new_form
    @bookmark = Bookmark.new

    render("bookmark_templates/new_form.html.erb")
  end

  def create_row
   
    #check if there's a user signed in. if not, redirect to sign in page
    @bookmark = Bookmark.new

    @bookmark.item_id = params.fetch("item_id")
    @bookmark.user_id = params.fetch("user_id")

    if @bookmark.valid?
      @bookmark.save

      redirect_back(:fallback_location => "/bookmarks", :notice => "Bookmark created successfully.")
    else
      render("bookmark_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @bookmark = Bookmark.find(params.fetch("prefill_with_id"))

    render("bookmark_templates/edit_form.html.erb")
  end

  def update_row
    @bookmark = Bookmark.find(params.fetch("id_to_modify"))

    @bookmark.item_id = params.fetch("item_id")
    @bookmark.user_id = params.fetch("user_id")

    if @bookmark.valid?
      @bookmark.save

      redirect_to("/bookmarks/#{@bookmark.id}")
    else
      render("bookmark_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @bookmark = Bookmark.find(params.fetch("id_to_remove"))

    @bookmark.destroy

    redirect_to("/items", :notice => "Bookmark deleted successfully.")
  end
end
