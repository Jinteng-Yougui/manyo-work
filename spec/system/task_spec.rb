require 'rails_helper'
RSpec.describe 'ユーザーと管理者に関連する機能', type: :system do
  describe 'ユーザー登録' do
    context 'ユーザー情報を新規登録に入力した場合' do
      it '新規登録できる' do
        visit new_user_path
        fill_in 'user_name', with: 'yuki@yuki.com'
        fill_in 'user_email', with: 'yuki@yuki.com'
        fill_in 'user_password', with: 'yuki@yuki.com'
        fill_in 'user_password_confirmation', with: 'yuki@yuki.com'
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
  describe 'セッション機能' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    let!(:task) { FactoryBot.create(:task, user: user) }
    before do
      visit root_path
    end
    context 'ログイン画面で必要情報をを入力した場合' do
      it 'ログインして詳細画面を表示できる' do
        fill_in 'user_email', with: 'user1@gmail.com'
        fill_in 'user_password', with: 'password1'
        click_button 'ログイン'
        expect(page).to have_content(user_email)
      end
    end
    context '一般ユーザが他人の詳細画面を表示しようとした場合' do
      it 'タスク一覧画面に遷移する' do
        visit user_path with: 'users/3' 
        expect(page).to have_content('タスク一覧')
      end
    end
    context 'ログアウトする場合' do
      it 'ログアウトできる' do
        click_button 'ログアウト'
        expect(page).to have_content('ログイン')
      end
    end
  end
  describe '管理者画面' do
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    let!(:task) { FactoryBot.create(:task, user: user) }
    before do
      visit root_path
    end
    context '管理者がログインした場合' do
      it '管理者画面を表示できる' do
        visit admin_users_path
        expect(page).to have_content(登録者一覧)
      end
      it 'ユーザの新規登録ができる' do
        click_button '新規ユーザ登録' 
        expect(page).to have_content('ユーザ新規登録')
      end
      it 'ユーザの編集ができる' do
        visit admin_users_path
        click_button '編集' 
        expect(page).to have_content('ユーザ編集')
      end
      it 'ユーザの削除ができる' do
        visit admin_users_path
        click_button '削除' 
        expect(page).to have_content('本当に削除しますか')
      end
    end
    context '管理者がユーザの詳細画面にアクセスする場合' do
      it '詳細画面が表示できる' do
        visit task_path with: 'tasks/3'
        expect(page).to have_content('タスク一覧')
      end
    end
    context '一般ユーザが管理者画面にアクセスする場合' do
      it 'アクセスできない' do
        click_button 'ログアウト'
        fill_in 'user_email', with: 'yuki@yuki.com'
        fill_in 'user_password', with: 'yuki@yuki.com'
        visit admin/admin_users_path
        expect(page).to have_content(nil)
      end
    end
  end
end