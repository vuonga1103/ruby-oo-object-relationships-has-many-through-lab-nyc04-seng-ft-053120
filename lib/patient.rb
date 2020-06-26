class Patient
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all 
  end

  def new_appointment(doctor_instance, date)
    Appointment.new(date, self, doctor_instance)
  end

  def appointments
    Appointment.all.select {|appointment_instance| appointment_instance.patient == self }
  end

  def doctors
    self.appointments.map { |appointment_instance| appointment_instance.doctor }
  end
end