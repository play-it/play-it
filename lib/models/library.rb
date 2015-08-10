##
# Class that represents a library of musics
class Library
  require_relative 'music'
  require 'set'

  ##
  # Describes the path to the library file
  FILE_PATH = './musics_features.dat'

  ##
  # @return [Set] the library, a set of musics
  attr_accessor :musics

  ##
  # Creates an empty library
  #
  # @return [Library] the object representing the library
  def initialize
    @musics = Set.new
  end

  ##
  # Loads the file containing the saved library
  def load
    return File.new(FILE_PATH, 'wb') unless File.exist?(FILE_PATH)
    File.open(FILE_PATH, 'rb') { |file| @musics = Marshal.load(file.read) }
  end

  ##
  # Creates a file containing the actual state of the library
  def dump
    File.open(FILE_PATH, 'wb') { |file| file.write(Marshal.dump(@musics)) }
  end

  ##
  # Adds a new music to the library
  #
  # @param music [Music] the new music that will be added
  #
  # @return [Nil] if it is not a Music
  def add(music)
    return nil unless music.instance_of?(Music)
    @musics << music
  end

  ##
  # Removes the music with the given +path+
  def remove(path)
    @musics.delete_if { |music| music.path == path }
  end
end