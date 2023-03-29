require_relative "matrix.rb"


puts "This is main Ruby Program"

kei = Matrix.new(9)
kei.describe()

# zai = [[0, 3, 9], [-1, 0, 1], [-1, -1, -1]]
zai = [
   [12, 20, 30, 10, 11],
   [15, 8, 16, 4, 2],
   [3, 5, 11, 2, 4],
   [19, 6, 18, 9, 3],
   [16, 4, 7, 16, 8]
]
kei.setMatrix(zai)
kei.describe()

puts kei.isReduced(zai)

kei.solve()