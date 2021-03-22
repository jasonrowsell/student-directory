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
    puts "Please enter the cohort of the cohort that the student belongs to"
    cohort = gets.chomp
    puts "To finish, leave inputs blank"
    
    while !name.empty? && !cohort.empty? do
      @students << {name: name, cohort: cohort}
      puts "#{name} from the #{cohort} cohort has been added to the directory"
      if @students.count > 1
        puts "We now have #{@students.count} students"
      else
        puts "We now have #{@students.count} student"
      end
      name = gets.chomp
      cohort = gets.chomp
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

  def save_students
    file = File.open("students.csv", "w")
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    file.close
  end

  def load_students
    file = File.open ("students.csv", "r")
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      @students << {name: name, cohort: cohort.to_sym}
    end
    file.close
  end

  def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
  end

  def process(selection)
    case selection
      when "1"
        input_students
      when "2"
        show_students
      when "3"
        save_students
      when "4"
        load_students
      when "9"
        exit
      else
        puts "Unknown input, try again"
    end
  end

  def interactive_menu
    loop do
      print_menu
      process(gets.chomp)
    end
  end
end

test = Directory.new
test.interactive_menu