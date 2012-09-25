require 'spec_helper'

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

	describe "when title is too long" do
		before { @post.title = "a" * 51 }
		it { should_not be_valid }
	end

	describe "when content is not present" do
		before { @post.content = " " }
		it { should_not be_valid }
	end

	describe "when content is too long" do
		before { @post.content = "a" * 501 }
		it { should_not be_valid }
	end

	describe "when location is not present" do
		before { @post.location = " " }
		it { should_not be_valid }
	end

	describe "when location is too long" do
		before { @post.location = "a" * 101 }
		it { should_not be_valid }
	end

	describe "when price is not present" do
		before { @post.price = " " }
		it { should_not be_valid }
	end

	describe "when price is negative" do
		before { @post.price = -1 }
		it { should_not be_valid }
	end
end
