module PlayIt
  class Library
    attr_accessor :music
    attr_reader :dump_path

    ##
    # Creates a new library of music
    #
    def initialize
      @music = Set.new
      @dump_path = Configuration.library_path
    end

    ##
    # Loads the file containing the saved library.
    #
    def load
      return unless File.exist?(dump_path)
      File.open(dump_path, 'rb') { |file| @music = Marshal.load(file.read) }
    end

    ##
    # Creates a file containing the current state of the library.
    #
    def dump
      File.open(dump_path, 'wb') { |file| file.write(Marshal.dump(@music)) }
    end

    ##
    # Adds a new music to the library.
    #
    # @param msc [Music] the new music that will be added.
    #
    def add(msc)
      @music << msc unless @music.member?(msc)
    end

    ##
    # Removes the music with the given +path+.
    #
    # @param path [String] path of the music to be removed.
    #
    def remove(path)
      @music.delete_if { |msc| msc.path == path }
    end

    ##
    # Get a sample song.
    #
    # @return [Music] A random song.
    #
    def sample
      music.to_a.sample
    end
  end
end
