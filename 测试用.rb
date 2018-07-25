class Chromosome
  attr_reader :sequence

  def initialize(x, y)
    @sequence = [x, y]
  end

  def +(other)
    Chromosome.new(self.x + other.x, self.y + other.y)
  end

  def x
    self.sequence[0]
  end

  def y
    self.sequence[1]
  end

  def to_s
    "#{self.x}#{self.y}"
  end

  def *(other)
    %W(#{self.x}#{other.y} #{other.x}#{self.y})
  end
end

a = Chromosome.new 'Aa', 'Bb'
b = Chromosome.new 'AA', 'bb'
puts a * b