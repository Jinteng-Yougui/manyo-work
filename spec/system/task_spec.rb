require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '新規登録機能' do
    context 'タスクを新規登録した場合' do
      it 'ステータスも登録できる' do
        visit new_task_path
        fill_in 'task_title', with: 'Factoryで作ったデフォルトのタイトル１'
        fill_in 'task_content', with: 'Factoryで作ったデフォルトのコンテント１'
        fill_in 'task_priority' with: '未着手'
        click_button '登録'
        expect(page).to have_content'タスクの登録が完了しました！'
      end
    end
  end
  let!(:task){ FactoryBot.create(:task, title: 'task1')}
  let!(:second_task){ FactoryBot.create(:second_task, title: 'task2')}
  describe '検索機能' do
    before do
      visit tasks_path
    end
    context 'タイトルを入力した場合' do
      it 'そのタイトルを含むタスク一覧が表示される' do
        expect(page).to have_content'task1'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        expect([task, second_task]).to contain_exactly(second_task, task)
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
