class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  # def show
  #   @link = Link.find_by(shortened_url: params[:shortened_url])
  # end

  # def new
  #   @link = Link.new
  # end

  def create
    @link = Link.new(link_params)
    @link.shortened_url = SecureRandom.hex(3)
    if @link.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  # private

  # def link_params
  #   params.require(:link).permit(:original_url)
  # end
end