require 'csv'

csv = CSV.read('./raw_data.csv', headers: true)

## Q4 流浪狗以何種品種居多？何種顏色居多？

# 選取小狗
dogs = csv.select { |row| row['animal_type'] == 'Dog'}

# 依品種數量分類
breeds = dogs.map { |row| row['breed']}.compact
breed_counts = Hash.new(0)
breeds.each { |breed| breed_counts[breed] += 1 }

p '---Top Breeds---'
p breed_counts.sort_by { |_k, v| v }.reverse.first(5)

# 依顏色數量分類
colors = dogs.map { |row| row['color']}.compact
color_counts = Hash.new(0)
colors.each { |color| color_counts[color] += 1 }

# 排序並印出前五名
p '---Top Colors---'
p color_counts.sort_by { |_k, v| v }.reverse.first(5)
