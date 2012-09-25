require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
describe Post do

	before do
		@post = Post.new(
					title: "Example Title",
					content: "Example Content",
					location: "Example Location",
					price: 15.50
		)
	end

	subject { @post }

	it { should respond_to(:title) }
	it { should respond_to(:content) }
	it { should respond_to(:location) }
	it { should respond_to(:price) }

	it { should be_valid }

	describe "when title is not present" do
		before { @post.title = " " }
		it { should_not be_valid }
	end
end

end
