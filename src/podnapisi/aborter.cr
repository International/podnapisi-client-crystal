module Podnapisi
  class Aborter
    def self.stop(message)
      abort message
    end
  end
end
