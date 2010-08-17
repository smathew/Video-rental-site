class CheckoutStatusesController < ApplicationController
  # GET /checkout_statuses
  # GET /checkout_statuses.xml
  def index
    @checkout_statuses = CheckoutStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @checkout_statuses }
    end
  end

  # GET /checkout_statuses/1
  # GET /checkout_statuses/1.xml
  def show
    @checkout_status = CheckoutStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @checkout_status }
    end
  end

  # GET /checkout_statuses/new
  # GET /checkout_statuses/new.xml
  def new
    @checkout_status = CheckoutStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @checkout_status }
    end
  end

  # POST /checkout_statuses
  # POST /checkout_statuses.xml
  def create
    @checkout_status = CheckoutStatus.new(params[:checkout_status])

    respond_to do |format|
      if @checkout_status.save
        flash[:notice] = 'CheckoutStatus was successfully created.'
        format.html { redirect_to(@checkout_status) }
        format.xml  { render :xml => @checkout_status, :status => :created, :location => @checkout_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @checkout_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /checkout_statuses/1
  # DELETE /checkout_statuses/1.xml
  def destroy
    @checkout_status = CheckoutStatus.find(params[:id])
    @checkout_status.destroy

    respond_to do |format|
      format.html { redirect_to(checkout_statuses_url) }
      format.xml  { head :ok }
    end
  end
end
