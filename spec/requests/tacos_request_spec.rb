require 'rails_helper'

RSpec.describe "Tacos", type: :request do

  # Test suite for GET /tacos
  describe 'GET /tacos' do
    let!(:taco) { FactoryBot.create(:taco) }
    # make HTTP get request before each example
    before { get '/tacos' }

    it 'returns tacos' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /tacos' do
    # valid payload
    let(:valid_params) { { 'meat': 'Steak', 'rice': true, 'salsa': false } }
    context 'when the request is valid' do
      before { post '/tacos', params: valid_params }

      it 'creates a todo' do
        expect(json['meat']).to eq('Steak')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/tacos', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Meat can't be blank/)
      end
    end
  end

  describe 'DELETE /tacos/:id' do
    let!(:taco) { FactoryBot.create(:taco) }
    before { delete "/tacos/#{taco.id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
