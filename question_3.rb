require 'csv'

csv = CSV.read('./raw_data.csv', headers: true)

## Q3 離開Austin動物中心後，回歸至飼主家的小狗，以何種品種居多？

# 選取回歸飼主家小狗
dogs_return = csv.select { |row| row['outcome_type'] == 'Return to Owner' && row['animal_type'] == 'Dog'}

# 依品種數量分類
breeds = dogs_return.map {|row| row['breed']}.compact
breed_counts = Hash.new(0)
breeds.each { |breed| breed_counts[breed] += 1 }

# 排序並印出前五名
puts '---Top Breeds Back To Owners---'
p breed_counts.sort_by { |_k, v| v }.reverse.first(5)
