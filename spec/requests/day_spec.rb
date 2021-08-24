require 'rails_helper'

RSpec.describe "Days", type: :request do
  let(:user) { create(:user) }
  let!(:track) { create(:track, patient: user.id) }
  let!(:days) { create_list(:day, 20, track_id: track.id) }
  let(:track_id) { track.id }
  let(:id) { days.first.id }
  let(:headers) { valid_headers }

  describe 'GET /tracks/:track_id/days' do
    before { get "/tracks/#{track_id}/days", params: {}, headers: headers }
 
     context 'when track exists' do
       it 'returns status code 200' do
         expect(response).to have_http_status(200)
       end
 
       it 'returns all track items' do
         expect(json.size).to eq(20)
       end
     end
 
     context 'when track does not exist' do
       let(:track_id) { 0 }
 
       it 'returns status code 404' do
         expect(response).to have_http_status(404)
       end
 
       it 'returns a not found message' do
         expect(response.body).to match(/Couldn't find Track/)
       end
     end
   end
 
   describe 'GET /tracks/:track_id/days/:id' do
    before { get "/tracks/#{track_id}/days/#{id}", params: {}, headers: headers }
 
     context 'when track day exists' do
       it 'returns status code 200' do
         expect(response).to have_http_status(200)
       end
 
       it 'returns the day' do
         expect(json['id']).to eq(id)
       end
     end
 
     context 'when track day does not exist' do
       let(:id) { 0 }
 
       it 'returns status code 404' do
         expect(response).to have_http_status(404)
       end
 
       it 'returns a not found message' do
         expect(response.body).to match(/Couldn't find Day/)
       end
     end
   end
 
   describe 'POST /tracks/:track_id/days' do
    let(:valid_attributes) { { blood_pressure: 89, blood_sugar: 23 }.to_json }

    context 'when request attributes are valid' do
      before do
        post "/tracks/#{track_id}/days", params: valid_attributes, headers: headers
      end

       it 'returns status code 201' do
         expect(response).to have_http_status(201)
       end
     end
 
     context 'when an invalid request' do
      before { post "/tracks/#{track_id}/days", params: {}, headers: headers }

       it 'returns status code 422' do
         expect(response).to have_http_status(422)
       end
 
       it 'returns a failure message' do
         expect(response.body).to match("{\"message\":\"Validation failed: Blood pressure can't be blank, Blood sugar can't be blank\"}")
       end
     end
   end
 
   describe 'PUT /tracks/:track_id/days/:id' do
     let(:valid_attributes) { { blood_pressure: 92 }.to_json }
    
     before do
      put "/tracks/#{track_id}/days/#{id}", params: valid_attributes, headers: headers
     end

     context 'when item exists' do
       it 'returns status code 204' do
         expect(response).to have_http_status(204)
       end
 
       it 'updates the day' do
         updated_item = Day.find(id)
         expect(updated_item.blood_pressure).to match(92)
       end
     end
 
     context 'when the day does not exist' do
       let(:id) { 0 }
 
       it 'returns status code 404' do
         expect(response).to have_http_status(404)
       end
 
       it 'returns a not found message' do
         expect(response.body).to match(/Couldn't find Day/)
       end
     end
   end
 
   describe 'DELETE /tracks/:id' do
    before { delete "/tracks/#{track_id}/days/#{id}", params: {}, headers: headers }
 
     it 'returns status code 204' do
       expect(response).to have_http_status(204)
     end
   end
end
