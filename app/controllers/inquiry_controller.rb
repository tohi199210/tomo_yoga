class InquiryController < ApplicationController
  def index
  	@inquiry = Inquiry.new
  	render :action => 'index'
  end

  def confirm
  	@inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
  	if @inquiry.valid?
  end

  def thanks
  end
end
