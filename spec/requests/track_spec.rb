require 'rails_helper'

RSpec.describe "Track API", type: :request do
  let(:user) { create(:user) }
  let!(:tracks) { create_list(:track, 10, patient: user.id) }
  let(:track_id) { tracks.first.id }
  let(:headers) { valid_headers }

  describe 'GET /track' do
    before { get '/tracks', params: {}, headers: headers }

    it 'returns track' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /tracks/:id' do
    before { get "/tracks/#{track_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the track' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(track_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:track_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Track with 'id'=100\"}")
      end
    end
  end

  describe 'POST /tracks' do
    let(:valid_attributes) do
      { title: 'Health Status', patient: user.id.to_s }.to_json
    end

    context 'when the request is valid' do
      before { post '/tracks', params: valid_attributes, headers: headers }

      it 'creates a track' do
        expect(json['title']).to eq('Health Status')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { title: nil }.to_json }
      before { post '/tracks', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  describe 'PUT /tracks/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      let(:valid_attributes) { { title: 'Shopping' }.to_json }

      context 'when the record exists' do
        before { put "/tracks/#{track_id}", params: valid_attributes, headers: headers }

        it 'updates the record' do
          expect(response.body).to be_empty
        end

        it 'returns status code 204' do
          expect(response).to have_http_status(204)
        end
      end
    end

    describe 'DELETE /tracks/:id' do
      before { delete "/tracks/#{track_id}", params: {}, headers: headers }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
