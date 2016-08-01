require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }

  it {is_expected.to have_many(:posts)}
  
  describe "attributes" do
    it { should have_db_column(:name).of_type(:string)}
    it { should have_db_column(:description).of_type(:text)}
    it { should have_db_column(:public).of_type(:boolean)}

    it "is public by default" do
      expect(topic.public).to be(true)

    end
  end

end