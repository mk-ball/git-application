class ListsController < ApplicationController
  def new
    # Viewへ渡すインスタンス変数の定義
    @list = List.new
  end
  
  def create
    # データをうけとるインスタンス
    list = List.new(list_params)
    # データをdbに保存するメソッド
    list.save
    # トップ画面へリダイレクト
    # redirect_to '/top'
    # 詳細画面へリダイレクト
    redirect_to list_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
