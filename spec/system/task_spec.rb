require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task_title', with: 'Factoryで作ったデフォルトのタイトル１'
        fill_in 'task_content', with: 'Factoryで作ったデフォルトのコンテント１'
        click_button '登録'
        expect(page).to have_content'タスクの登録が完了しました！'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
          FactoryBot.create(:task)
          visit tasks_path
          expect(page).to have_content'タイトル１'
      end
    end
  end
  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
        FactoryBot.create(:task)
        visit task_path(Task.last)
        expect(page).to have_content'Factoryで作ったデフォルトのコンテント１'
      end
    end
  end
end
