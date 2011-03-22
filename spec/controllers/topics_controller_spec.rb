require 'spec_helper'

describe TopicsController do
  context "category scope" do
    before :each do
      @category = Factory.create(:category)
      15.times do
        Factory.create(:topic, :category => [@category, nil].sample)
      end
    end

    it "should scope index with category" do
      get :index, :category_id => @category.id
      assigns[:topics].should_not be_nil
      assigns[:topics].each do |topic|
        topic.category.should == @category
      end
    end

    it "should scope index without category" do
      get :index
      assigns[:topics].should_not be_nil
    end
  end

  context "display comments" do

    it "should sort by age"

    it "should sort by age_reverse"

    it "should sort by score"

    it "should sort by hot"

  end
end
