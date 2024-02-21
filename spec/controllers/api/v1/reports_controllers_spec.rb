require 'rails_helper'

RSpec.describe Api::V1::ReportsController, type: :controller do
  describe 'GET #index' do
    context 'when authenticated with correct token' do
      before do
        get :index, params: { key: 'true_key' }
      end

      it 'returns a success response' do
        expect(response).to have_http_status(:success)
      end

      it 'returns posts within specified date range' do
        # Создаем фабрику для поста
        FactoryBot.create(:post, created_at: Date.current)

        # Вызываем контроллер
        get :index, params: { key: 'true_key', start_date: Date.current, end_date: Date.current }

        # Проверяем, что возвращен правильный JSON
        expect(response.body).to eq(Post.where("created_at > ? AND created_at < ?", Date.current.beginning_of_day, Date.current.end_of_day).to_json)
      end
    end

    context 'when not authenticated with correct token' do
      it 'returns a 422 response' do
        get :index, params: { key: 'wrong_key' }
        expect(response).to have_http_status(422)
      end
    end
  end
end
