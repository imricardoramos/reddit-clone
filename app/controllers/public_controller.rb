class PublicController < ApplicationController
  def index
    @communities = Community.all
    @posts = Post.all
  end
end
