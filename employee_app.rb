# https://drive.google.com/file/d/1DBwethY2Ux8p8S-58DALn8apk9tQfR1i/view
# Bonus: Use the tty-table gem
# https://github.com/piotrmurach/tty-table
# Bonus: Use the pstore library to save the data to a file
# https://ruby-doc.org/stdlib-2.5.3/libdoc/pstore/rdoc/PStore.html

# INITIAL EMPLOYEES
entry1 = { id: 1, first_name: "Saron", last_name: "Yitbarek", salary: 100000, active: true }
entry2 = { id: 2, first_name: "Majora", last_name: "Carter", salary: 70000, active: true }

# EMPLOYEE CLASS
class Employee
  attr_accessor :id, :first_name, :last_name, :salary, :active

  def initialize(input_options)
    @id = input_options[:id]
    @first_name = input_options[:first_name]
    @last_name = input_options[:last_name]
    @salary = input_options[:salary]
    @active = input_options[:active]
  end
end

# TWO INSTANCES FOR THE INITIAL EMPLOYEES
employee1 = Employee.new(entry1)
employee2 = Employee.new(entry2)

# ARRAY TO HOLD THE EMPLOYEE INSTANCES
employees = []
employees << employee1
employees << employee2
puts "EMPLOYEES (#{employees.length} TOTAL)"
p employees

# FIRST PROMPT FOR EACH OPTION
puts "[C]reate [R]ead [U]pdate [D]elete [Q]uit: "
user_entry = gets.chomp.upcase

# CONDITIONAL FOR EACH OPTION
if user_entry == "C" # Create a new entry
  new_entry = {}
  puts "First Name: "
  first_name = gets.chomp
  puts "Last Name: "
  last_name = gets.chomp
  puts "Salary: "
  salary = gets.chomp.to_i
  new_entry[:id] = employees.length + 1
  new_entry[:first_name] = first_name
  new_entry[:last_name] = last_name
  new_entry[:salary] = salary
  new_entry[:active] = true
  new_employee = Employee.new(new_entry)
  employees << new_employee
elsif user_entry == "R" # Enter an employee id# and print their information
elsif user_entry == "U" # Enter an employee id# and update their active status
elsif user_entry == "D" # Enter an employee id# and delete their entry
elsif user_entry == "Q" # Quit application
else
end

p employees
