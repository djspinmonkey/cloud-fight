class FightsController < ApplicationController
  # GET /fights
  # GET /fights.xml
  def index
    @fights = Fight.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fights }
    end
  end

  # GET /fights/1
  # GET /fights/1.xml
  def show
    @fight = Fight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fight }
    end
  end

  # GET /fights/new
  # GET /fights/new.xml
  def new
    @fight = Fight.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fight }
    end
  end

  # GET /fights/1/edit
  def edit
    @fight = Fight.find(params[:id])
  end

  # POST /fights
  # POST /fights.xml
  def create
    @fight = Fight.new(params[:fight])

    respond_to do |format|
      if @fight.save
        format.html { redirect_to(@fight, :notice => 'Fight was successfully created.') }
        format.xml  { render :xml => @fight, :status => :created, :location => @fight }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fights/1
  # PUT /fights/1.xml
  def update
    @fight = Fight.find(params[:id])

    respond_to do |format|
      if @fight.update_attributes(params[:fight])
        format.html { redirect_to(@fight, :notice => 'Fight was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fights/1
  # DELETE /fights/1.xml
  def destroy
    @fight = Fight.find(params[:id])
    @fight.destroy

    respond_to do |format|
      format.html { redirect_to(fights_url) }
      format.xml  { head :ok }
    end
  end
end
