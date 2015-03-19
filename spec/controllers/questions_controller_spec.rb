require 'spec_helper'
require 'rails_helper'


describe QuestionsController do
  describe "GET #index" do
    before(:each) do
      get :index
    end
    it 'returns a status of 200' do
      expect(response.status).to eq(200)
    end
  end

  describe "upvote button event" do
    it "increases the upvote attribute by 1" do
      question = Question.create(title: "YUP")
      put :upvote, id: question
      expect(question.reload.upvote).to eq(1)
    end
  end

  describe "downvote button event" do
    it "decreases the downvote attribute by 1" do
      question = Question.create(title: "nooop")
      put :downvote, id: question
      expect(question.reload.downvote).to eq(-1)
    end
  end


end








