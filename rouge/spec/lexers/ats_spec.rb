# -*- coding: utf-8 -*- #

describe Rouge::Lexers::ATS do
  let(:subject) { Rouge::Lexers::ATS.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.dats'
      assert_guess :filename => 'foo.sats'
      assert_guess :filename => 'foo.cats'
      assert_guess :filename => 'foo.hats'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-ats'
    end
  end

  describe 'lexing' do
    include Support::Lexing

    it 'recognizes value as a Name' do
      assert_tokens_equal 'value', ['Name', 'value']
    end

    it 'recognizes nonrec as a Keyword' do
      assert_tokens_equal 'nonrec', ['Keyword', 'nonrec']
    end
  end
end

