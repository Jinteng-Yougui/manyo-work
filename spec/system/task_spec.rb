require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '新規登録機能' do
    context 'タスクを新規登録した場合' do
      it 'ステータスも登録できる' do
        visit new_task_path
        fill_in 'task_title', with: 'Factoryで作ったデフォルトのタイトル１'
        fill_in 'task_content', with: 'Factoryで作ったデフォルトのコンテント１'
        select '未着手', from: 'task_priority'
        click_button '登録'
        expect(page).to have_content'タスクの登録が完了しました！'
      end
    end
  end
  describe '検索機能' do
    let!(:task){FactoryBot.create(:task, title: 'task1', priority: '未着手')}
    let!(:second_task){FactoryBot.create(:second_task, title: 'task2', priority: '未着手')}
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