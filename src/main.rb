require_relative "matrix.rb"


puts "This is main Ruby Program"

kei = Matrix.new(9)
kei.describe()

zai = [[1, 3], [1, 4]]
kei.setMatrix(zai)
kei.describe()