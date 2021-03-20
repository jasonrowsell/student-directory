class Directory

  def initialize
    @students = []
  end
  
  def input_students
    puts "Please enter the names of the students"
    puts "To finish, hit return twice"
    name = gets.chomp
    
    while !name.empty? do
      @students << {name: name, cohort: :november}
      puts "#{name} has been added to the directory"
      puts "We now have #{@students.count}"
      name = gets.chomp
    end
  end
    
  def print_header
    puts "The students of Villains Academy"
    puts "-------------"
  end
  
  def print_names
    @students.each_with_index do |student,index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort].capitalize} cohort)"
    end
  end
  
  def print_footer
    print "Overall, we have #{@students.size} great students"
  end
  
  def start
    print_header
    input_students
    print_names
    print_footer
  end

end

test = Directory.new
test.start