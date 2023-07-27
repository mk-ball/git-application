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
    redirect_to '/top'
  end

  def index
    @lists = List.all
  end

  def show
  end

  def edit
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
