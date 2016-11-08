require 'spec_helper'

describe RereValidator do
  describe 'regex' do
    it 'returns valid when match the regex' do
      expect('foo_bar').to match(/\A[a-zA-Z0-9_.-]+\z/)
    end

    it 'returns invalid when not match the regex' do
      expect('foo&bar').to_not match(/\A[a-zA-Z0-9_.-]+\z/)
    end

    context 'when begin with invalid characters' do
      ['.foo', '-foo', '_foo'].each do |username|
        it "returns invalid for #{username}" do
          expect(username).to match(/\A[_.-].*\z/)
        end
      end
    end

    context 'when end with invalid characters' do
      ['bar.', 'bar-', 'bar_'].each do |username|
        it "returns invalid for #{username}" do
          expect(username).to match(/\A.*[_.-]\z/)
        end
      end
    end
  end

  describe 'reserved' do
    it 'returns valid when not included in reserved words' do
      expect(RESERVED_WORDS).to_not include('foobar')
    end

    it 'returns invalid when included in reserved words' do
      expect(RESERVED_WORDS).to include('admin')
    end

    context 'when included in add reserved words' do
      before do
        @user = UserWithAddReservedWords.new
      end

      it 'returns invalid' do
        @user.username = 'foobar'
        expect(@user).to_not be_valid
      end
    end
  end
end
