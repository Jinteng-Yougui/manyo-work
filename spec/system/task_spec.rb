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
        fill_in 'session_email', with: 'yuki@yuki.com'
        fill_in 'session_password', with: 'yuki@yuki.com'
        click_button 'ログイン'
        expect(page).to have_content('yuki@yuki.com')
      end
    end
    context '一般ユーザが他人の詳細画面を表示しようとした場合' do
      it 'タスク一覧画面に遷移する' do
        fill_in 'session_email', with: 'iseki@dic.xom'
        fill_in 'session_password', with: 'iseki@dic.xom'
        click_button 'ログイン'
        sleep(1)
        visit user_path(admin_user)
        expect(page).to have_content('タスク一覧')
      end
    end
    context 'ログアウトする場合' do
      it 'ログアウトできる' do
        fill_in 'session_email', with: 'yuki@yuki.com'
        fill_in 'session_password', with: 'yuki@yuki.com'
        click_button 'ログイン'
        click_link 'ログアウト'
        expect(page).to have_content('ログイン')
      end
    end
  end
  describe '管理者画面' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    let!(:task) { FactoryBot.create(:task, user: user) }
    before do
      visit root_path
    end
    context '管理者がログインした場合' do
      it '管理者画面を表示できる' do
        visit new_session_path
        fill_in 'session_email', with: 'yuki@yuki.com'
        fill_in 'session_password', with: 'yuki@yuki.com'
        click_button 'ログイン'
        sleep(1)
        visit admin_users_path
        expect(page).to have_content('登録者一覧')
      end
      it 'ユーザの新規登録ができる' do
        fill_in 'session_email', with: 'yuki@yuki.com'
        fill_in 'session_password', with: 'yuki@yuki.com'
        click_button 'ログイン'
        sleep(1)
        visit admin_users_path
        click_link '新規ユーザ登録'
        # 3人目の登録作業
        fill_in 'user_name', with: 'koba@koba.com'
        fill_in 'user_email', with: 'koba@koba.com'
        fill_in 'user_password', with: 'koba@koba.com'
        fill_in 'user_password_confirmation', with: 'koba@koba.com'
        click_button '登録'
        expect(User.count).to eq 3
      end
      it 'ユーザの編集ができる' do
        fill_in 'session_email', with: 'yuki@yuki.com'
        fill_in 'session_password', with: 'yuki@yuki.com'
        click_button 'ログイン'
        sleep(1)
        visit admin_users_path
        click_button '編集', match: :first
        expect(page).to have_content('ユーザ編集')
      end
      it 'ユーザの削除ができる' do
        fill_in 'session_email', with: 'yuki@yuki.com'
        fill_in 'session_password', with: 'yuki@yuki.com'
        click_button 'ログイン'
        sleep(1)
        visit admin_users_path
        click_button '削除', match: :first
        expect(page).to have_content('本当に削除しますか')
      end
    end
    context '管理者がユーザの詳細画面にアクセスする場合' do
      it '詳細画面が表示できる' do
        fill_in 'session_email', with: 'iseki@dic.xom'
        fill_in 'session_password', with: 'iseki@dic.xom'
        click_button 'ログイン'
        sleep(1)
        visit user_path(admin_user)
        expect(page).to have_content('タスク一覧')
      end
    end
    context '一般ユーザが管理者画面にアクセスする場合' do
      it 'アクセスできない' do
        fill_in 'session_email', with: 'iseki@dic.xom'
        fill_in 'session_password', with: 'iseki@dic.xom'
        click_button 'ログイン'
        sleep(1)
        visit admin_users_path
        expect(current_path).to eq (tasks_path)
      end
    end
  end
end