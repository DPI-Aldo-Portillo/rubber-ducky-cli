require_relative 'duck_session'

class RubberDuckyCLI
  def initialize
    puts "Hello, I'm your Rubber Ducky! Let's talk through your problem."
    start_session
  end

  def start_session
    print "Enter a title for this session: "
    title = gets.chomp

    session = DuckSession.new(title)
    puts "Great! Start explaining your problem. I'll be listening!"

    loop do
      print "You: "
      input = gets.chomp
      break if input.downcase == 'exit'

      session.add_note(input)
      response = session.add_duck_response(input)
      puts "Duck: #{response}"
    end

    session.save
    puts "Session saved. Remember, sometimes just talking things out can help you find the solution!"
  end
end

RubberDuckyCLI.new
