require 'rails_helper'

RSpec.describe "responses/edit", type: :view do
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

  it "renders the edit response form" do
    render

    assert_select "form[action=?][method=?]", response_path(@response), "post" do

      assert_select "textarea[name=?]", "response[content]"
    end
  end
end
