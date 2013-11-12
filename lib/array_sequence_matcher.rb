require 'active_support/core_ext'
require 'tag_sequence_matcher/dictionary_matcher'
module TagSequenceMatcher

  def self.from_tags(*list)
    DictionaryMatcher.new(list.flatten)
  end
end
