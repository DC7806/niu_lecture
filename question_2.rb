require 'csv'

csv = CSV.read('./raw_data.csv', headers: true)

## Q2 年邁的小狗與生病的小狗相較，何者回歸飼主家居多？比例相差多少

# 選取回歸飼主家小狗（包含年邁與生病）
dogs_return = csv.select { |row| row['outcome_type'] == 'Return to Owner' && row['animal_type'] == 'Dog'}

# 選取回歸飼主家且年邁的小狗
aged_dogs = dogs_return.select { |row| row['intake_condition'] == 'Aged'}.size

# 選取回歸飼主家且生病的小狗
sick_dogs = dogs_return.select { |row| row['intake_condition'] == 'Sick'}.size

# 計算差異差異
ratio_difference = ((aged_dogs - sick_dogs) / dogs_return.size.to_f) * 100

# 印出結果
puts "Aged Dogs Amount: #{aged_dogs}"
puts "Sick Dogs Amount: #{sick_dogs}"
puts "Ratio Difference: #{ratio_difference.round(2)}%"
