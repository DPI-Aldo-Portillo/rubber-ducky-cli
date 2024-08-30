require 'minitest/autorun'
require_relative '../app/duck_session'

class DuckSessionTest < Minitest::Test
  def test_initialization
    session = DuckSession.new("Test Session")
    assert_equal "Test Session", session.title
    assert_equal "", session.notes
  end

  def test_add_note
    session = DuckSession.new("Test Session")
    session.add_note("This is a test note")
    assert_includes session.notes, "You: This is a test note"
  end
end
