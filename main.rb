require_relative "src/matrix.rb"

# lat1
   # -1 20 30 10 11
   # 15 -1 16 4 2
   # 3 5 -1 2 4
   # 19 6 18 -1 3
   # 16 4 7 16 -1

# lat2
#  -1 2 7 8
# 6 -1 3 7
# 5 8 -1 4
# 7 6 9 -1

puts  "\t   Program Penyelesaian TSP", 
   "\tmenggunakan Branch and Bound", 
   "\t     dan Reduced Matrix", 
   "\n"

puts "Masukkan banyak simpul yang dimiliki : "
simpulCount = gets.to_i

arr = Array.new(simpulCount) { Array.new(simpulCount) }
puts ""

costMat = Matrix.new
puts "Masukkan matrix ongkos : "
puts "NOTE : masukkan Infinite sebagai -1"
for i in (0...simpulCount)
   inp = gets.strip.split(" ")

   for j in (0...simpulCount)
      arr[i][j] = inp[j].to_i
   end
end
costMat.setMatrix(arr)
puts ""

puts "Masukkan simpul awal solusi : "
start = gets.to_i
puts ""

costMat.solve(start)

puts "\n\n"