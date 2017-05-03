class Patient < ActiveRecord::Base
  # attr_accessor :date_of_birth, :email_id, :first_name, :last_name, :phone
  number_regex = /[0-9]{3}-[0-9]{3}-[0-9]{4}/
  #validations for the attributes of this entity.
  validates :date_of_birth, :presence => true
  validates :email_id, :presence => true, :format => {:with => SessionsHelper::EMAIL_REGEX}
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :phone, :presence => true
  validates_format_of :phone, :with =>  number_regex, :message => "- Phone numbers must be in xxx-xxx-xxxx format."
  has_secure_password
  #User can treat many patients. similarly, patients can get treatment from many Users so many to many relation between Users and Patients
  # is connected through intersection table user_patients.
  has_many :user_patients
  has_many :users, :through => :user_patients
  has_many :messages

  def date_of_birth_string
    if !date_of_birth.blank? && date_of_birth != nil
      date_of_birth.strftime("%d-%m-%Y")
    end
  end

  def created_at_string
    if !created_at.blank? && created_at != nil
      created_at.strftime("%d-%m-%Y")
    end
  end
  def Patient.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  private
  def downcase_email
    self.email = email.downcase
  end
end
