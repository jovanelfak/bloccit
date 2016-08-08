require 'rails_helper'
include RandomData

RSpec.describe Api::V1::CommentsController, type: :controller do
  let(:my_topic)   { create(:topic) }
  let(:my_post)    { create(:post, topic: my_topic, user: my_user) }
  let(:my_user)    { create(:user) }
  let(:other_user) { create(:user) }
  let(:my_comment) { Comment.create!(body: 'Comment Body', post: my_post, user: my_user) }

  context "unauthenticated users" do
    it "GET show returns http unauthenticated" do
      get :show, post_id: my_post.id, id: my_comment.id
      expect(response).to have_http_status(401)
    end
  end

  context "authenticated and unauthorized users" do
    before do
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
    end

    it "GET show returns http forbidden" do
      get :show, post_id: my_topic.id, id: my_comment.id
      expect(response).to have_http_status(403)
    end
  end

  context "authenticated and authorized users" do
    before do
      my_user.admin!
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
    end

    describe "GET show" do
      before { get :show, post_id: my_post.id, id: my_comment.id }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "returns my_post serialized" do
        expect(my_comment.to_json).to eq response.body
      end
    end
  end
end