module Zenvia
  class Sms
    include Base

    attr_accessor :msg, :cel_phone

    def initialize(msg, cel_phone)
      @msg       = msg
      @cel_phone = cel_phone
    end

    def forward
      send_to_zenvia(@msg, @cel_phone)
    end
  end
end