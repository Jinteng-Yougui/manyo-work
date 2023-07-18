require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'scopeのテスト' do
    let!(:task){FactoryBot.create(:task, title: 'task1', priority: '未着手')}
    let!(:second_task){FactoryBot.create(:second_task, title: 'task2', priority: '未着手')}
    context 'タスクのタイトルを検索欄に入力' do
      it '検索ができる' do
        expect(Task.search_by_title('task1').count).to eq 1
      end
    end
    context 'タスクのステータスを検索欄で選択' do
      it '検索ができる' do
        expect(Task.search_by_priority('未着手').count).to eq 2
      end
    end
    context 'タスクのタイトルとステータスを検索欄に入力' do
      it '検索ができる' do
        expect(Task.search_by_title('task1').search_by_priority('未着手').count).to eq 1
      end
    end
  end
end
