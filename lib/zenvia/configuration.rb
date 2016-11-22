module Zenvia
  class Configuration
    attr_accessor :account, :code, :callbackOption, :from

    def initialize
      @account  = ''
      @code     = ''
      @callbackOption = ''
      @from     = ''
    end
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end

end