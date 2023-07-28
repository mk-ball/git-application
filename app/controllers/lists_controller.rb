class ListsController < ApplicationController
  def new
    # Viewへ渡すインスタンス変数の定義
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
    end

    # # データをうけとるインスタンス
    # list = List.new(list_params)
    # # データをdbに保存するメソッド
    # list.save
    # # トップ画面へリダイレクト
    # # redirect_to '/top'
    # # 詳細画面へリダイレクト
    # redirect_to list_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
