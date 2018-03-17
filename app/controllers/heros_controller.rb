class HerosController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_hero, only: [:show, :edit, :update, :destroy]
  # GET /heros
  # GET /heros.json
  def index
    @heros = Hero.all
  end

  # GET /heros/1
  # GET /heros/1.json
  def show
  end

  # GET /heros/new
  def new
    @hero = Hero.new
  end

  # GET /heros/1/edit
  def edit
    @hero = Hero.find(params[:id])
  end

  def add_custom
    @hero = Hero.find(params[:hero_id])
    @value = params[:increment_amount]
    @hero.increment!(:unlocks, @value.to_i)
    respond_to do |format|
      format.html {
        redirect_to heros_url
      }
      format.js
      format.json {
        render :show, status: :added, location: @hero
      }
    end
  end
  # POST /heros
  # POST /heros.json
  def create
    @hero = Hero.new(hero_params)

    respond_to do |format|
      if @hero.save
        format.html { redirect_to @hero, notice: 'Hero was successfully created.' }
        format.json { render :show, status: :created, location: @hero }
      else
        format.html { render :new }
        format.json { render json: @hero.errors, status: :unprocessable_entity }
      end
    end
  end

  def add
    @hero = Hero.find(params[:hero_id])
    @hero.increment!(:unlocks)
    respond_to do |format|
      format.html {
        redirect_to heros_url
      }
      format.js
      format.json {
        render :show, status: :added, location: @hero
      }
    end
  end

  # PATCH/PUT /heros/1
  # PATCH/PUT /heros/1.json
  def update
    respond_to do |format|
      if @hero.update(hero_params)
        format.html { redirect_to @hero, notice: 'Hero was successfully updated.' }
        format.json { render :show, status: :ok, location: @hero }
      else
        format.html { render :edit }
        format.json { render json: @hero.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /heros/1
  # DELETE /heros/1.json
  def destroy
    @hero.destroy
    respond_to do |format|
      format.html { redirect_to heros_url, notice: 'Hero was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_hero
    @hero = Hero.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def hero_params
    params.require(:hero).permit(:name, :total, :unlocks, :image_url, :increment_amount)
  end
end
