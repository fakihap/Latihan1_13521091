require_relative "matrix.rb"


puts "This is main Ruby Program"

kei = Matrix.new(2, 9)
kei.describe()

zai = [[], []]
kei.setMatrix(zai)
kei.describe()