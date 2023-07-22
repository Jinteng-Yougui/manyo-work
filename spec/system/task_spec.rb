require 'rails_helper'
RSpec.describe 'ユーザー登録', type: :system do
  describe '新規登録機能' do
    context 'ユーザー情報を新規登録に入力した場合' do
      it '新規登録できる' do
        visit new_user_path
        fill_in 'user_name', with: 'User1'
        fill_in 'user_email', with: 'user1@gmail.com'
        fill_in 'user_password', with: 'password1'
        fill_in 'user_password_confirmation', with: 'password1'
        click_button '登録'
        expect(page).to have_content'登録が完了しました！'
      end
    end
    context 'ログインせずタスク一覧に飛ぼうとしたとき' do
      it 'ログイン画面に遷移する' do
        visit user_path
        click_button 'ログアウト'
        visit root_path
        expect(page).to have_content'ログイン'
      end
    end
  end
  describe '検索機能' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    let!(:task) { FactoryBot.create(:task, user: user) }
    before do
      visit tasks_path
    end
    context 'タイトルを入力した場合' do
      it 'そのタイトルを含むタスク一覧が表示される' do
        fill_in 'query', with: 'task1'
        click_button '検索'
        expect(page).to have_content('task1')
      end
    end
    context 'ステータスを選択した場合' do
      it 'その選択肢含むタスク一覧が表示される' do
        select '未着手', from: 'priority'
        click_button '検索'
        expect(page).to have_content('未着手')
      end
    end
    context 'タイトルを入力しステータスを選択した場合' do
      it 'そのタイトルと選択肢含むタスク一覧が表示される' do
        fill_in 'query', with: 'task1'
        select '未着手', from: 'priority'
        click_button '検索'
        expect(page).to have_content('task1')
        expect(page).to have_content('未着手')
      end
    end
  end
end