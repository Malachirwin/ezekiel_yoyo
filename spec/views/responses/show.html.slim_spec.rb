require 'rails_helper'

RSpec.describe "responses/show", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :content => "MyText",
      :name => "Malachi"
    ))
    @response = assign(:response, Response.create!(
      :content => "MyText",
      :comment_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
