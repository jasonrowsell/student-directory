def input_students
  puts "Please enter the names of the students"
  name = gets.chomp
  puts "Please enter the month of the cohort the student belongs to"
  puts "To finish, hit return when prompted for name and cohort"
  cohort = gets.chomp
  
  students = []
  
  while !cohort.empty? do
    students << {name: name, cohort: cohort}
    puts "We now have #{students.count} students"
    puts "Name: "
    name = gets.chomp
    puts "Cohort: "
    cohort = gets.chomp
  end
  students
end
  
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_names(students)
  students.each_with_index do |student,index|
    if student[:name].length < 12
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