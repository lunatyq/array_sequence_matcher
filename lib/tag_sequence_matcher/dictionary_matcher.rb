module TagSequenceMatcher

  class DictionaryMatcher

    attr_reader :pattern
    delegate :encode, :to => :dictionary

    def initialize(pattern)
      @pattern = pattern
    end

    def match(list)
      encode(list).include?(encoded_pattern)
    end

    def encoded_pattern
      @encoded_pattern ||= encode(pattern)
    end

    def dictionary
      @dictionary ||= Dictionary.new(pattern)
    end

  end

  class Dictionary

    UsableLetters = [(0..9), (?a..?z), (?A..?Z)].map(&:to_a).flatten

    def initialize(list)
      @list = list.uniq
    end

    delegate :[], :to => :mapper

    def mapper
      letters = UsableLetters.dup

      @mapper ||= list.inject(Hash.new(' ')) do |memo, string|
        memo.update(string => letters.shift)
      end
    end

    def encode(subject)
      subject.map { |s| mapper[s] }.join
    end

    private

    attr_reader :list
  end

end
