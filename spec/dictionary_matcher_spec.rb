require 'tag_sequence_matcher'

describe TagSequenceMatcher::DictionaryMatcher do

  it "match subsequence" do
    matcher = instance(["JJ", "NNS"])
    matcher.match([ "DT", "JJ", "NNS", "PRP"]).should be(true)
  end

  it "doesnt match when order is broken" do
    matcher = instance(["JJ", "NNS"])
    matcher.match([ "DT", "JJ", "PRP", "NNS"]).should be(false)
    matcher.match([ "DT", "JJ", "NN", "PRP"]).should be(false)
  end

  def instance(list)
    TagSequenceMatcher::DictionaryMatcher.new(list)
  end

end
