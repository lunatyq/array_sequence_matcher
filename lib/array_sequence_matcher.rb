require 'active_support/core_ext'
require 'array_sequence_matcher/dictionary_matcher'
module ArraySequenceMatcher

  def self.from_tags(*list)
    DictionaryMatcher.new(list.flatten)
  end
end
