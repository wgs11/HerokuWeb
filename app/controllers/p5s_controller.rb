class P5sController < ApplicationController
    before_action :set_p5, only: [:show, :edit, :update, :destroy]

    def index
      @p5s = P5.all
    end

    def show
      @p5 = P5.find(params[:id])
    end

    def edit

    end

    def create
      @p5 = P5.new(p5_params)
      if @p5.save
        redirect_to @p5
      else
        render 'new'
      end
    end

    def update
      respond_to do |format|
        if @p5.update(p5_params)
          format.html { redirect_to @p5, notice: 'Sketch was successfully updated.' }
          format.json { render :show, status: :ok, location: @p5 }
        else
          format.html { render :edit }
          format.json { render json: @p5.errors, status: :unprocessable_entity }
        end
      end
    end

    def new
      @p5 = P5.new
    end

    def destroy
      @p5.destroy
      respond_to do |format|
        format.html { redirect_to p5s_url, notice: 'Sketch was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def set_p5
      @p5 = P5.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def p5_params
      params.require(:p5).permit(:script_body, :name)
    end
end
