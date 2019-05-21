require 'csv'

csv = CSV.read('./raw_data.csv', headers: true)

## Q1 在Austin動物中心收留時已達5歲(含)以上的小狗，留置在動物中心超過2天者，數量合計為多少？哪一種品種最多？

# 選取符合條件小狗
dogs = csv.select { |row| row['animal_type'] == 'Dog' && row['time_in_shelter_days'].to_i >= 2 && row['age_upon_intake_(years)'].to_i >= 5 }

# 印出符合條件小狗數量
puts '---Dog Total ---'
p "Dogs filtered: #{dogs.size}"

# 依品種數量分類
breeds = dogs.map {|row| row['breed']}.compact
breed_counts = Hash.new(0)
breeds.each { |breed| breed_counts[breed] += 1 }

# 排序並印出前五名
puts '---Top Dog Breeds ---'
p breed_counts.sort_by { |_k, v| v }.reverse.first(5)
