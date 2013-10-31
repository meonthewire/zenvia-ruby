module Zenvia
  class Configuration
    attr_accessor :account, :code, :dispatch, :from
  end

  def initialize
    @account  = ''
    @code     = ''
    @dispatch = ''
    @from     = ''
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration || Configuration.new
    yield configuration
  end

end