require 'spec_helper'

describe Comment do
	before do
		@comment = Comment.new(
					author: "Example Author",
					content: "Example Content",
					post_id: 1
		)
	end

	subject { @comment }

	it { should respond_to(:author) }
	it { should respond_to(:content) }
	it { should respond_to(:post_id) }

	it { should be_valid }

	describe "when author is not present" do
		before { @comment.author = " " }
		it { should_not be_valid }
	end

	describe "when author is too long" do
		before { @comment.author = "a" * 21 }
		it { should_not be_valid }
	end

	describe "when content is not present" do
		before { @comment.content = " " }
		it { should_not be_valid }
	end

	describe "when content is too long" do
		before { @comment.content = "a" * 141 }
		it { should_not be_valid }
	end

	describe "when post_id is not present" do
		before { @comment.post_id = " " }
		it { should_not be_valid }
	end
end
