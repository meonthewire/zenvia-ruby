module Zenvia
  class Configuration
    attr_accessor :account, :code, :dispatch, :from

    def initialize
      @account  = ''
      @code     = ''
      @dispatch = ''
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