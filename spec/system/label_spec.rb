require 'rails_helper'
RSpec.describe 'ラベルに関連する機能', type: :system do
  describe 'ラベルの登録' do
    let!(:user) { FactoryBot.create(:user) }
    context '新規登録に入力した場合' do
      it '新規ラベル登録できる' do
        visit root_path
        fill_in 'session_email', with: 'iseki@dic.xom'
        fill_in 'session_password', with: 'iseki@dic.xom'
        click_button 'ログイン'
        visit new_label_path
        fill_in 'label_label_name', with: '万葉'
        click_button '登録'
        expect(page).to have_content'万葉'
      end
    end
  end
end