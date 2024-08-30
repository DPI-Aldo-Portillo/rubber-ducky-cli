require_relative 'responses'

class DuckSession
  attr_accessor :title, :notes

  def initialize(title)
    @title = title
    @notes = ""
  end

  def add_note(note)
    @notes += "\nYou: #{note}"
  end

  def add_duck_response(note)
    response = Responses.generate_response(note)
    @notes += "\nDuck: #{response}"
    response
  end

  def save
    Dir.mkdir('sessions') unless Dir.exist?('sessions')

    File.open("sessions/#{@title.gsub(" ", "_").downcase}.txt", "w") do |file|
      file.write("Session Title: #{@title}\n")
      file.write(@notes)
    end
  end
end
