require_relative "matrix.rb"


puts "This is main Ruby Program"

kei = Matrix.new(9)
kei.describe()

zai = [[0, 3], [1, 0]]
kei.setMatrix(zai)
kei.describe()
puts kei.isReduced(zai)