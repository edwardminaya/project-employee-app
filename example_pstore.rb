require "pstore"

database = PStore.new("example.store")

array1 = [1, 2, 3, 4, 5]
array2 = [6, 7, 8, 9, 10]

database.transaction do
  database[:one] = array1
end

database.transaction do
  database[:two] = array2
end

# 6.times do
#   array = [rand(1..10), rand(1..10)]
#   database = array
# end

database.transaction do
  p database[:one]
end
