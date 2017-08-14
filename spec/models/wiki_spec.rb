require 'rails_helper'

RSpec.describe Wiki, type: :model do

    let(:wiki) { Wiki.new(title: "New Post Title", body: "New Post Body", private: true) }

    it 'should respond to title' do
        expect(wiki).to respond_to(:title)
    end

    it 'should respond to body' do
        expect(wiki).to respond_to(:body)
    end

    it 'should respond to resolved' do
        expect(wiki).to respond_to(:private)
    end
end
