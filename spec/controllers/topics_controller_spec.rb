require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
 # #13
   let(:my_post) { my_topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

    describe "GET show" do
     it "returns http success" do
       get :show, topic_id: my_topic.id, id: my_post.id
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #show view" do
       get :show, topic_id: my_topic.id, id: my_post.id
       expect(response).to render_template :show
     end
 
     it "assigns my_topic to @topic" do
       get :show, topic_id: my_topic.id, id: my_post.id
       expect(assigns(:topic)).to eq(my_topic)
     end
   end
   describe "GET new" do
     it "returns http success" do
       get :new, topic_id: my_topic.id
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #new view" do
       get :new, topic_id: my_topic.id
       expect(response).to render_template :new
     end
 
     it "initializes @topic" do
       get :new, topic_id: my_topic.id

       expect(assigns(:topic)).not_to be_nil
     end
   end

   describe "POST create" do
     it "increases the number of topics by 1" do
       expect{post :create, topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Post,:count).by(1)
     end
   
     it "assigns Topic.last to @topic" do
       post :create, topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
       expect(assigns(:topic)).to eq Topic.last
     end
 
     it "redirects to the new topic" do
      post :create, topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
 # #24
       expect(response).to redirect_to [my_topic, Post.last]
     end
   end

   describe "GET edit" do
     it "returns http success" do
       get :edit, topic_id: my_topic.id, id: my_post.id
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
       get :edit, topic_id: my_topic.id, id: my_post.id
       expect(response).to render_template :edit
     end
 
     it "assigns topic to be updated to @topic" do
       get :edit, topic_id: my_topic.id, id: my_post.id
       topic_instance = assigns(:topic)
 
       expect(topic_instance.id).to eq my_topic.id
       expect(topic_instance.name).to eq my_topic.name
       expect(topic_instance.description).to eq my_topic.description
     end
   end
   describe "PUT update" do
     it "updates topic with expected attributes" do
       new_name = RandomData.random_sentence
       new_description = RandomData.random_paragraph
 
       put :update, topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body}
 
       updated_topic = assigns(:topic)
       expect(updated_topic.id).to eq my_topic.id
       expect(updated_topic.name).to eq new_name
       expect(updated_topic.description).to eq new_description
     end
 
     it "redirects to the updated topic" do
       new_name = RandomData.random_sentence
       new_description = RandomData.random_paragraph
 
       put :update, topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body}
 # #30
       expect(response).to redirect_to [my_topic, my_post]
     end
   end
   describe "DELETE destroy" do
     it "deletes the topic" do
       delete :destroy, topic_id: my_topic.id, id: my_post.id
       count = Topic.where({id: my_topic.id}).size
       expect(count).to eq 0
     end
   
      it "redirects to topic show" do
 # #32
        delete :destroy, topic_id: my_topic.id, id: my_post.id
 # #33
        expect(response).to redirect_to my_topic
     end
   end
end
