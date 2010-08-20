class CheckoutStatusesController < ApplicationController
   before_filter :authenticate
  
  ## JOSH
  def new
	@checkout_status = CheckoutStatus.new
	@video = Video.find( params[:video_id] )
  end
  ## JOSH

  def create
	@video = Video.find( params[:video_id] )
	@checkout_status = CheckoutStatus.new
	@checkout_status.user = current_user
	@checkout_status.video = @video
	@checkout_status.save
	flash[:notice] = "Video checked out. To avoid late fees, return in 10 days after receiving the video"
	#redirect_to @video
	redirect_to current_user
  end
  
  def index
	@user = current_user
  end
  
  def destroy
	@checkout_status = CheckoutStatus.find( params[:id] )
	@checkout_status.delete
    redirect_to current_user
  end
end
