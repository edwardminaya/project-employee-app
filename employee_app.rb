# https://drive.google.com/file/d/1DBwethY2Ux8p8S-58DALn8apk9tQfR1i/view
# Bonus: Use the tty-table gem
# https://github.com/piotrmurach/tty-table
# Bonus: Use the pstore library to save the data to a file
# https://ruby-doc.org/stdlib-2.5.3/libdoc/pstore/rdoc/PStore.html

# CREATE TABLE
require "tty-table"
header = ["ID", "FIRST NAME", "LAST NAME", "SALARY", "ACTIVE"]
table = TTY::Table.new(header: header)

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

# PUT EMPLOYEES IN TABLE
employees = []
employees << employee1
employees << employee2
employees.each do |employee|
  array = []
  array << employee.id
  array << employee.first_name
  array << employee.last_name
  array << employee.salary
  array << employee.active
  table << array
end

while true
  system "clear"
  puts "EMPLOYEES (#{employees.length} TOTAL)"
  puts table.render(:unicode)
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
    puts "Enter Employee ID: "
    entry_id = gets.chomp.to_i
    puts "First Name: #{employees[entry_id - 1].first_name}"
    puts "Last Name: #{employees[entry_id - 1].last_name}"
    puts "Salary: $#{employees[entry_id - 1].salary}"
    puts "Active?: #{employees[entry_id - 1].active}"
  elsif user_entry == "U" # Enter an employee id# and update their active status
    puts "Enter Employee ID: "
    entry_id = gets.chomp.to_i
    puts "First Name: #{employees[entry_id - 1].first_name}"
    puts "Last Name: #{employees[entry_id - 1].last_name}"
    puts "Salary: $#{employees[entry_id - 1].salary}"
    puts "Active?: #{employees[entry_id - 1].active}"
    puts "Update Active Status enter 'fired' or 'reinstate': "
    status_update = gets.chomp
    if status_update.downcase == "fired"
      employees[entry_id - 1].active = false
    elsif status_update.downcase == "reinstate"
      employees[entry_id - 1].active - true
    end
    puts "First Name: #{employees[entry_id - 1].first_name}"
    puts "Last Name: #{employees[entry_id - 1].last_name}"
    puts "Salary: $#{employees[entry_id - 1].salary}"
    puts "Active?: #{employees[entry_id - 1].active}"
  elsif user_entry == "D" # Enter an employee id# and delete their entry
    puts "Enter Employee ID: "
    entry_id = gets.chomp.to_i
    puts "First Name: #{employees[entry_id - 1].first_name}"
    puts "Last Name: #{employees[entry_id - 1].last_name}"
    puts "Salary: $#{employees[entry_id - 1].salary}"
    puts "Active?: #{employees[entry_id - 1].active}"
    puts "Are you sure you want to delete employee? Type 'Yes' or 'No'"
    delete_decision = gets.chomp
    if delete_decision.downcase == "yes"
      employees.delete_at(entry_id - 1)
    end
  elsif user_entry == "Q" # Quit application
    puts "Thank you!"
    break
  else
  end
end
