require "tty-table"
require "pstore"

# table = TTY::Table.new(["header1", "header2"], [["a1", "a2"], ["b1", "b2"]])
# p table.row(1)

# table << [100, 100]
# p table

file = PStore.new("file.pstore")
