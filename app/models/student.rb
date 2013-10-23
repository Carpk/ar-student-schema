require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here

# raise "emailerror" unless
  #validates :email if

# @student.assign_attributes(:email => address)


validates :email, :format => { :with => /.+@.+\.+.{2,}/,
    :message => "Only letters allowed" }

validates :email, :uniqueness => true

validates :age, :numericality => { :greater_than_or_equal_to => 5 }

validates :phone, :format => { :with => /.?\d{3}.? \d{3}\D*\d{4}.?.*/,
    :message => "Invalid Phone Number" }





  # def email(address)
  #   self.assign_attributes(:email => address) if address =~ /.+@.+\.+.{2,}/
  # end

  def name
    "#{first_name} #{last_name}"
  end

  def age
    Date.today.year - birthday.year
  end

end
