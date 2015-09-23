module Zenvia
  class Sms
    include Base

    attr_accessor :msg, :cel_phone

    def initialize(id_sms, msg, cel_phone)
      @id_sms    = id_sms
      @msg       = msg
      @cel_phone = cel_phone
    end

    def forward
      send_to_zenvia(@id_sms, @msg, @cel_phone)
    end
  end
end