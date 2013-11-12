require 'tag_sequence_matcher'

describe TagSequenceMatcher::DictionaryMatcher do

  context "2 strings pattern" do

    let(:matcher) { instance(["JJ", "NNS"]) }

    it "match 2 strings subsequence" do
      matcher.match([ "DT", "JJ", "NNS", "PRP"]).should be(true)
    end

    it "doesnt match when order is broken" do
      matcher.match([ "DT", "JJ", "PRP", "NNS"]).should be(false)
      matcher.match([ "DT", "JJ", "NN", "PRP"]).should be(false)
    end

  end

  context "5 string pattern" do
    let(:matcher) { instance(%w(DT JJ ST NNA PRP)) }

    it "matches containing full sequence" do
      matcher.match(%w(AS DT JJ ST NNA PRP SA PRP)).should be(true)
    end

    it "doesnt match when subsequence is divided" do
      matcher.match(%w(AS DT JJ ST NNA AS PRP)).should be(false)
    end

  end

  def instance(list)
    TagSequenceMatcher::DictionaryMatcher.new(list)
  end

end
