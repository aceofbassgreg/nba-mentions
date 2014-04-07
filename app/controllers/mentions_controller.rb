class MentionsController < ApplicationController
  # GET /mentions
  # GET /mentions.json
  def index
    @mentions = Mention.all

    render json: @mentions
  end

  # GET /mentions/1
  # GET /mentions/1.json
  def show
    @mention = Mention.find(params[:id])

    render json: @mention
  end

  # POST /mentions
  # POST /mentions.json
  def create
    @mention = Mention.new(params[:mention])

    if @mention.save
      render json: @mention, status: :created, location: @mention
    else
      render json: @mention.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mentions/1
  # PATCH/PUT /mentions/1.json
  def update
    @mention = Mention.find(params[:id])

    if @mention.update(params[:mention])
      head :no_content
    else
      render json: @mention.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mentions/1
  # DELETE /mentions/1.json
  def destroy
    @mention = Mention.find(params[:id])
    @mention.destroy

    head :no_content
  end
end
