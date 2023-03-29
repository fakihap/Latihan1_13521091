require_relative "matrix.rb"


puts "\t   Program Penyelesaian TSP", "\tmenggunakan Branch and Bound", "\t     dan Reduced Matrix", "\n"

kei = Matrix.new


# zai = [[0, 3, 9], [-1, 0, 1], [-1, -1, -1]]
# zai = [
#    [12, 20, 30, 10, 11],
#    [15, 8, 16, 4, 2],
#    [3, 5, 11, 2, 4],
#    [19, 6, 18, 9, 3],
#    [16, 4, 7, 16, 8]
# ]
# zai = [
#    [-1, 20, 30, 10, 11],
#    [15, -1, 16, 4, 2],
#    [3, 5, -1, 2, 4],
#    [19, 6, 18, -1, 3],
#    [16, 4, 7, 16, -1]
# ]
zai = [
   [-1, 2, 7, 8],
   [6, -1, 3, 7],
   [5, 8, -1, 4],
   [7, 6, 9, -1]
]
kei.setMatrix(zai)
# kei.describe()

# puts kei.isReduced(zai)

kei.solve(3)