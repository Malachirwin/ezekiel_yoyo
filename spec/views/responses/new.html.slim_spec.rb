require 'rails_helper'

RSpec.describe "responses/new", type: :view do
  before(:each) do
    @comments = assign(:comment, Comment.all)
    @comment = assign(:comment, Comment.create!(
      :content => "MyText",
      :name => "Malachi"
    ))
    assign(:response, Response.new(
      :content => "MyText",
      :comment_id => 1
    ))
  end

  it "renders new response form" do
    render

    assert_select "form[action=?][method=?]", responses_path, "post" do

      assert_select "textarea[name=?]", "response[content]"
    end
  end
end
