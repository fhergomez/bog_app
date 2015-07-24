class CreaturesController < ApplicationController

  def index
    @creatures = Creature.all
  end

  def show
    @creature = Creature.find(params[:id])
    @tags = @creature.tags
  end

  def new # displays the form new record
    @creature = Creature.new
    @tags = Tag.all
  end

  def create # save new record
    @creature = Creature.new(creature_params) #Creature.create(creature_params) will also work withouth having to add Creature.save on the next line. This will create it and save it in one step
    @creature.save
    # update_tags c
    redirect_to creatures_path
  end



  def edit #display form for existing
    @creature = Creature.find(params[:id])
    @tags = Tag.all
  end

  def update
    # render json: params
    c = Creature.find params[:id]
    c.update creature_params

    c.tags.clear
    update_tags c

    redirect_to creatures_path
  end

  def destroy
    Creature.find(params[:id]).delete
    redirect_to creatures_path
  end

  private

  def update_tags creature
    creature_tags = params[:creature][:tag_ids]
    creature_tags.each do |id|
      creature.tags << Tag.find(id) unless id.blank?
    end
  end

  def creature_params
    params.require(:creature).permit(:description,:name)
  end

end
