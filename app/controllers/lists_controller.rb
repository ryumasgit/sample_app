class ListsController < ApplicationController
  def new
    # viewへ渡すためのインスタンス変数に空のオブジェクトを生成する。
    @list = List.new
  end

  def create
    # データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    # データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 詳細画面へリダイレクト
    redirect_to list_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    # listテーブルの中にあるidに対応するレコードを取得
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
    #　データレコードを1件取得
    list = List.find(params[:id])
    # データレコードを削除
    list.destroy
    # 投稿一覧画面へリダイレクト
    redirect_to '/lists'
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
