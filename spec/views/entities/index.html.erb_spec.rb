require 'rails_helper'

RSpec.describe "entities/index", :type => :view do
  before(:each) do
    assign(:entities, [
      Entity.create!(
        :name => "Name",
        :type => "Type",
        :lat => "9.99",
        :lon => "9.99",
        :description => "MyText",
        :url => "Url",
        :address => "Address",
        :year_estab => "",
        :user_id => ""
      ),
      Entity.create!(
        :name => "Name",
        :type => "Type",
        :lat => "9.99",
        :lon => "9.99",
        :description => "MyText",
        :url => "Url",
        :address => "Address",
        :year_estab => "",
        :user_id => ""
      )
    ])
  end

  it "renders a list of entities" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
