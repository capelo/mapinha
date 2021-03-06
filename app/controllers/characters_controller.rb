class CharactersController < ApplicationController
 
  respond_to :json, :html

  # GET /characters
  # GET /characters.xml
  def index

    @characters = Character.all
    
    if params[:tipo]  
      @characters = Character.where(:tipo =>(params[:tipo]))  
    end  


    @json = @characters.to_gmaps4rails

    respond_with @json

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.xml  { render :xml => @characters }
    #end
  end

  # GET /characters/1
  # GET /characters/1.xml
  def show
    @character = Character.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @character }
    end
  end

  # GET /characters/new
  # GET /characters/new.xml
  def new
    @character = Character.new
    @character.name = '[adicione uma descricao]'
    @character.tipo = 'default'
    @character.longitude = '-46.6571723'
    @character.latitude = '-23.6909241'

    #@json = Character.all.to_gmaps4rails
    @json = @character.to_gmaps4rails
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @character }
    end
  end

  # GET /characters/1/edit
  def edit
    @json = Character.find(params[:id]).to_gmaps4rails
    @character = Character.find(params[:id])
  end

  # POST /characters
  # POST /characters.xml
  def create
    @character = Character.new(params[:character])

    respond_to do |format|
      if @character.save
        format.html { redirect_to(characters_url) }
        #format.html { redirect_to(@character, :notice => 'Character was successfully created.') }
        format.xml  { render :xml => @character, :status => :created, :location => @character }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @character.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /characters/1
  # PUT /characters/1.xml
  def update
    @character = Character.find(params[:id])
    @json = Character.find(params[:id]).to_gmaps4rails
    respond_to do |format|
      if @character.update_attributes(params[:character])
        format.html { redirect_to(@character, :notice => 'Character was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @character.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.xml
  def destroy
    @character = Character.find(params[:id])
    @character.destroy

    respond_to do |format|
      format.html { redirect_to(characters_url) }
      format.xml  { head :ok }
    end
  end
end
