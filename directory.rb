class Directory

  def initialize
    @students = []
  end
  
  def input_students
    puts "Please enter the names of the student"
    name = gets.chomp
    # if first input is empty then program will terminate with error message
      if name.empty?
        abort("ERROR: Input is empty")
      end
    puts "Please enter the month of the cohort that the student belongs to"
    month = gets.chomp
    puts "To finish, leave inputs blank"
    
    while !name.empty? && !month.empty? do
      @students << {name: name, cohort: month}
      puts "#{name} from the #{month} cohort has been added to the directory"
      if @students.count > 1
        puts "We now have #{@students.count} students"
      else
        puts "We now have #{@students.count} student"
      end
      name = gets.chomp
      month = gets.chomp
    end
  end
    
  def print_header
    puts "The students of Villains Academy"
    puts "-------------"
  end
  
  def print_names
    # prints indexed list of students and corresponding cohort
    @students.each_with_index do |student,index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort].capitalize} cohort)"
    end
  end
  
  # optional method to group students by cohort
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
    if @students.size > 1
      print "Overall, we have #{@students.size} great students"
    else
      print "Overall, we have #{@students.size} great student"
    end
  end

  def show_students
    print_header
    print_names
    print_footer
  end

  def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
  end

  def process(selection)
    case selection
      when "1"
        input_students
      when "2"
        show_students
      when "9"
        exit
      else
        puts "Unknown input, try again"
      end
    end
  end

  def interactive_menu
    loop do
      print_menu
      selection = gets.chomp
      process(selection)
    end
  end
end

test = Directory.new
test.interactive_menu