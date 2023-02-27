# https://drive.google.com/file/d/1DBwethY2Ux8p8S-58DALn8apk9tQfR1i/view
# Bonus: Use the tty-table gem
# https://github.com/piotrmurach/tty-table
# Bonus: Use the pstore library to save the data to a file
# https://ruby-doc.org/stdlib-2.5.3/libdoc/pstore/rdoc/PStore.html

require "tty-table"
require "pstore"

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

database = PStore.new("people.store")

while true
  system "clear"
  database.transaction do
    ids = database.roots
    puts "EMPLOYEES (#{ids.length} TOTAL)"
    header = ["ID", "FIRST NAME", "LAST NAME", "SALARY", "ACTIVE"]
    rows = ids.map { |ids| [ids, database[ids].first_name, database[ids].last_name, database[ids].salary, database[ids].active] }
    table = TTY::Table.new header, rows
    puts table.render(:unicode)
  end
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
    employee = Employee.new(
      first_name: first_name,
      last_name: last_name,
      salary: salary,
      active: true,
    )
    database.transaction do
      ids = database.roots
      new_id = ids.max.to_i + 1
      database[new_id] = employee
    end
  elsif user_entry == "R" # Enter an employee id# and print their information
    puts "Enter Employee ID: "
    entry_id = gets.chomp.to_i
    database.transaction do
      employee = database[entry_id]
      pp employee
      puts "Press enter to continue"
      gets.chomp
    end
  elsif user_entry == "U" # Enter an employee id# and update their active status
    puts "Enter Employee ID: "
    entry_id = gets.chomp.to_i
    database.transaction do
      employee = database[entry_id]
      puts "Update active status (#{employee.active})"
      input_active = gets.chomp
      if input_active.downcase == "true"
        input_active = true
      elsif input_active.downcase == "false"
        input_active = false
      else
        input_active = nil
      end
      employee.active = input_active
      database[entry_id] = employee
    end
  elsif user_entry == "D" # Enter an employee id# and delete their entry
    puts "Enter Employee ID: "
    entry_id = gets.chomp.to_i
    database.transaction do
      database.delete(entry_id)
    end
  elsif user_entry == "Q" # Quit application
    puts "Thank you!"
    break
  else
  end
end
