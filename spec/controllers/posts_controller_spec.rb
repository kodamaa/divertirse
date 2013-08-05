# coding:utf-8
require 'spec_helper'

describe PostsController do

  fixtures :posts

  describe 'post一覧画面へアクセスした場合' do
    before do
      get :index
    end
    it 'サクセスすること' do
      response.should be_success
    end
    # it '一覧データが20件取得できること' do
    #   # TODO: 未実装
    # end
    # it 'カテゴリ検索のプルダウンが取得されること' do
    #   # TODO: 未実装
    # end
  end
  
  describe '存在するidでshowページへアクセスした場合' do
    before do
      get :show, :id => 1
    end
    it 'サクセスすること' do
      response.should be_success
    end
    # it 'idにひもづくデータが表示されること' do
    #   # TODO: 未実装
    # end
  end
  describe '存在しないidでshowページへアクセスした場合' do
    it '例外が発生すること' do
      proc {
        get :show, :id => 999
      }.should raise_error
    end
  end
end
