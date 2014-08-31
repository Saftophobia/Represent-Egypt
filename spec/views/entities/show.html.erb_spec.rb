require 'rails_helper'

RSpec.describe "entities/show", :type => :view do
  before(:each) do
    @entity = assign(:entity, Entity.create!(
      :name => "Name",
      :type => "Type",
      :lat => "9.99",
      :lon => "9.99",
      :description => "MyText",
      :url => "Url",
      :address => "Address",
      :year_estab => "",
      :user_id => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
