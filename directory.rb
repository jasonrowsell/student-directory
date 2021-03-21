class Directory

  def initialize
    @students = []
  end
  
  def input_students
    puts "Please enter the names of the student"
    name = gets.chomp
    puts "Please enter the month of the cohort that the student belongs to"
    month = gets.chomp
    puts "To finish, leave inputs blank"
    
    while !name.empty? && !month.empty? do
      @students << {name: name, cohort: month}
      puts "#{name} from the #{month} cohort has been added to the directory"
      puts "We now have #{@students.count}"
      name = gets.chomp
      month = gets.chomp
    end
  end
    
  def print_header
    puts "The students of Villains Academy"
    puts "-------------"
  end
  
  def print_names
    @students.each_with_index do |student,index|
      puts "#{index + 1}. #{student[:name]} (#{student[:month].capitalize} cohort)"
    end
  end
  
  def print_by_cohort
    puts "Enter the cohort of students to be displayed"
    cohort = gets.chomp
    @students.each_with_index do |student,index|
      if student[:cohort] == cohort
        puts "#{index + 1}. #{student[:name]}"
      end
    end
  end
  
  def print_footer
    print "Overall, we have #{@students.size} great students"
  end
  
  def start
    print_header
    input_students
    print_by_cohort
    print_footer
  end

end

test = Directory.new
test.start