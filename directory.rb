def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "We now have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_names(students)
  students.each_with_index do |student,index|
    if student[:name].chars.first.upcase == 'D'
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort].capitalize} cohort)"
    end
  end
end

def print_footer(names)
  print "Overall, we have #{names.size} great students"
end

students = input_students
print_header
print_names(students)
print_footer(students)