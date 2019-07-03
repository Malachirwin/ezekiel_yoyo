require 'rails_helper'

RSpec.describe "responses/index", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :content => "MyText",
      :name => "Malachi"
    ))
    assign(:responses, [
      Response.create!(
        :comment_id => 1,
        :content => "MyText"
      ),
      Response.create!(
        :content => "MyText",
        :comment_id => 1
      )
    ])
  end

  it "renders a list of responses" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
