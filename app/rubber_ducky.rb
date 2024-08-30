require 'tty-cursor'
require 'tty-screen'
require 'colorize'
require_relative 'duck_session'

class RubberDuckyCLI
  def initialize
    animate_duck
    puts "Hello, I'm your Rubber Ducky! Let's talk through your problem.".colorize(:yellow)
    start_session
  end

  def animate_duck
    cursor = TTY::Cursor
    width = TTY::Screen.width
    frames = [
      "     __\n   <(o )___\n    (   __\\\n     | |  | |",
      "     __\n   <(o )__o\n    (   __\\\n     | |  | |",
      "     __\n   <(o )___\n    (  o__\\\n     | |  | |",
      "     __\n   <(o )___\n    (   __\\\n     | o  | |"
    ]

    3.times do
      frames.each do |frame|
        print cursor.move_to((width - 12) / 2, 5)
        puts frame.colorize(:yellow)
        sleep(0.2)
        print cursor.clear_screen
      end
    end
  end

  def animate_duck_sleeping
    cursor = TTY::Cursor
    width = TTY::Screen.width
    frames = [
      "     __\n   <( -)___\n    (   __\\\n     | |  | |",
      "     __\n   <( z)___\n    (   __\\\n     | |  | |",
      "     __\n   <( z)___\n    (   __\\\n     | |  | |",
      "     __\n   <(z )___\n    (   __\\\n     | |  | |"
    ]

    3.times do
      frames.each do |frame|
        print cursor.move_to((width - 12) / 2, 5)
        puts frame.colorize(:blue)
        sleep(0.5)
        print cursor.clear_screen
      end
    end

    puts "The duck is now asleep. Goodbye!".colorize(:magenta)
  end

  def start_session
    print "Enter a title for this session: ".colorize(:cyan)
    title = gets.chomp

    session = DuckSession.new(title)
    puts "Great! Start explaining your problem. I'll be listening!".colorize(:green)

    loop do
      print "You: ".colorize(:blue)
      input = gets.chomp
      break if input.downcase == 'exit'

      session.add_note(input)
      response = session.add_duck_response(input)
      puts "Duck: #{response}".colorize(:yellow)
    end

    session.save
    puts "Session saved. Remember, sometimes just talking things out can help you find the solution!".colorize(:magenta)
    
    # Animate the duck going to sleep
    animate_duck_sleeping
  end
end

RubberDuckyCLI.new
