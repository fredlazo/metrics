class AppsController < ApplicationController
  def index
    @apps = App.all
  end

  def show
    @app = App.find(params[:id])
    @events = @app.events.group_by(&:name)
  end

  def new
    @app = App.new
  end

  def create
    @app = App.new
    @app.name = params[:app][:name]
    @app.url = params[:app][:url]
    @app.user = current_user

    if @app.save
      flash[:notice] = "Success"
      redirect_to apps_path
    else
      flash.now[:alert] = "Fail!"
      render :new
    end
  end

  def edit
    @app = App.find(params[:id])
  end


  def update
    @app = App.find(params[:id])
    @app.name = params[:app][:name]
    @app.url = params[:app][:url]
    @app.user = current_user

    if @app.save
      flash[:notice] = "Success"
      redirect_to apps_path
    else
      flash.now[:alert] = "Fail!"
      render :new
    end
  end

  def destroy
    @app = App.find(params[:id])

    if @app.destroy
      flash[:notice] = "Success"
      redirect_to apps_path
    else
      flash.now[:alert] = "Fail!"
      render :show
    end

  end

end
