class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
  end
  
  def update
    @chef = Chef.find(params[:id])
    redirect_to "chef/#{@chef.id}"
  end
end