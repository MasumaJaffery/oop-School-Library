require_relative 'app'
def main
  puts("Welcome to School Library!")
  app = App.new
  app.run
end
main
