class ArticlesController < ApplicationController

  def index
    @artikuj=Article.all
  end

  def show
    @naslov=Article.find(params[:id])
  end

  def new
    @novo=Article.new ()
  end

  def create
    @novo=Article.new(novo_params)
    if @novo.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@novo)
    else
      render 'new'
    end
  end

  def edit
    @novo=Article.find(params[:id])
  end

  def update
    @novo=Article.find(params[:id])   
    if @novo.update(novo_params)
      flash[:success] = "Article was successfully edited"
      redirect_to article_path(@novo)
    else
      render 'edit'
    end
  end

  def destroy
    @fshie=Article.find(params[:id])
    @fshie.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end

  private
  
  def novo_params
     params.require(:article).permit(:title, :description)
  end

end
