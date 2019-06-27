require 'rails_helper'

describe 'BlogPosts Api', type: :request do
  let!(:blog_posts) {create_list(:blog_post, 10)}
  let(:blog_post_id) {blog_posts.first.id}

  describe 'GET /blog_posts' do
    before {get '/blog_posts'}

    it 'returns blog posts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /blog_posts/:id' do
    before {get "/blog_posts/#{blog_post_id}"}

    context 'when the record exists' do
      it 'returns the blog' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(blog_post_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:blog_post_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Blog/)
      end
    end
  end

  describe 'POST /blog_posts' do
    # valid payload
    let(:valid_attributes) { { title: 'Learn Rails', body: 'lakdns  mdask dkmas kdm askmkam skma dmksa', author: 'Bruce Wayne' } }

    context 'when the request is valid' do
      before { post '/blog_posts', params: valid_attributes }

      it 'creates a blog' do
        expect(json['title']).to eq('Learn Rails')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/blog_posts', params: { title: 'Foobar', body: 'ddd' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Author can't be blank/)
      end
    end
  end

  describe 'PUT /blog_posts/:id' do
    let(:valid_attributes) { { title: 'Learn kung fu' } }

    context 'when the record exists' do
      before { put "/blog_posts/#{blog_post_id}", params: valid_attributes }

      it 'updates the record' do
        expect(json['title']).to eq('Learn kung fu')
      end

      it 'returns status code 202' do
        expect(response).to have_http_status(202)
      end
    end
  end

  describe 'DELETE /blog_posts/:id' do
    before { delete "/blog_posts/#{blog_post_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end