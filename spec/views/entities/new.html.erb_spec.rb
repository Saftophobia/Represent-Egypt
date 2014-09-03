require 'rails_helper'

RSpec.describe "entities/new", :type => :view do
  before(:each) do
    assign(:entity, Entity.new(
      :name => "MyString",
      :type => "",
      :lat => "9.99",
      :lon => "9.99",
      :description => "MyText",
      :url => "MyString",
      :address => "MyString",
      :year_estab => "",
      :user_id => ""
    ))
  end

  it "renders new entity form" do
    render

    assert_select "form[action=?][method=?]", entities_path, "post" do

      assert_select "input#entity_name[name=?]", "entity[name]"

      assert_select "input#entity_type[name=?]", "entity[type]"

      assert_select "input#entity_lat[name=?]", "entity[lat]"

      assert_select "input#entity_lon[name=?]", "entity[lon]"

      assert_select "textarea#entity_description[name=?]", "entity[description]"

      assert_select "input#entity_url[name=?]", "entity[url]"

      assert_select "input#entity_address[name=?]", "entity[address]"

      assert_select "input#entity_year_estab[name=?]", "entity[year_estab]"

      assert_select "input#entity_user_id[name=?]", "entity[user_id]"
    end
  end
end
