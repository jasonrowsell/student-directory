class Directory

  def initialize
    @students = []
  end

  def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
  end

  def interactive_menu
    loop do
      print_menu
      process(STDIN.gets.chomp)
    end
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

  def input_students
    puts "Please enter the names of the student"
    name = STDIN.gets.chomp.strip
    # if first input is empty then program will terminate with error message
      if name.empty?
        abort("Error: Input is empty")
      end
    puts "Please enter the cohort of the cohort that the student belongs to"
    cohort = STDIN.gets.chomp.strip
    puts "To finish, leave inputs blank"
    
    while !name.empty? && !cohort.empty? do
      @students << {name: name, cohort: cohort}
      puts "#{name} from the #{cohort} cohort has been added to the directory"
      if @students.count > 1
        puts "We now have #{@students.count} students"
      else
        puts "We now have #{@students.count} student"
      end
      puts "Name: "
      name = STDIN.gets.chomp.strip
      puts "Cohort: "
      cohort = STDIN.gets.chomp.strip
    end
  end

  def show_students
    print_header
    print_names
    print_footer
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

  def print_footer
    if @students.size > 1
      puts "Overall, we have #{@students.size} great students"
      puts
    else
      puts "Overall, we have #{@students.size} great student"
      puts
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
  
  def save_students
    file = File.open("students.csv", "w")
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    file.close
  end

  def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      @students << {name: name, cohort: cohort}
    end
    file.close
  end

  def try_load_students
    filename = ARGV.first
    return if filename.nil?
    if File.exists?(filename)
      load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
    else
      abort("Error: #{filename} does not exist")
    end
  end

end

test = Directory.new
test.try_load_students
test.interactive_menu