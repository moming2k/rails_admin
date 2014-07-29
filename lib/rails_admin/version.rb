module RailsAdmin
  class Version
    MAJOR = 0
    MINOR = 6
    PATCH = 2
    PRE = 2

    class << self
      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH, PRE].compact.join('.')
      end
    end
  end
end
