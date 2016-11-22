module Zenvia
  class Sms
    include Base

    attr_accessor :id_sms, :msg, :cel_phone, :schedule_date, :aggregateId

    def initialize(id_sms, msg, cel_phone, schedule_date = "", aggregateId = "")
      @id_sms    = id_sms
      @msg       = msg
      @cel_phone = cel_phone
      @aggregateId = aggregateId
      @schedule_date = schedule_date
      @schedule_date = schedule_date.strftime("%Y-%m-%dT%H:%M:%S") if !schedule_date.blank?
    end

    def send
      send_to_zenvia(@id_sms, @cel_phone, @msg, @schedule_date, @aggregateId)
    end
  end
end