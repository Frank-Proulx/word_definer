class Word
  attr_accessor :word, :id

  @@words = {}
  @@total_rows = 0

  def initialize(attributes)
    @word = attributes[:word]
    @id = attributes[:id] || @@total_rows += 1
  end

  def self.all
    @@words.values
  end

  def save
    @@words[self.id] = Word.new({:word => self.word, :id => self.id})
  end

  def ==(word_to_compare)
    self.word == word_to_compare.word
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@words[id]
  end

end