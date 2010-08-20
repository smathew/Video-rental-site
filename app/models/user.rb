# == Schema Information
# Schema version: 20100817190258
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  password           :string(255)
#  password_confirm   :string(255)
#  phone_number       :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  remember_token     :string(255)
#  salt               :string(255)
#  encrypted_password :string(255)
#  admin              :boolean
#

# == Schema Information
# Schema version: 20100817131509
#
# Table name: users
#
#  id               :integer         not null, primary key
#  name             :string(255)
#  email            :string(255)
#  password         :string(255)
#  password_confirm :string(255)
#  phone_number     :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  remember_token   :string(255)
#
require 'digest'
class User < ActiveRecord::Base
  has_many :videos, :dependent => :destroy
  #has_one :video
  #belongs_to :checkout_statuses
  has_many :checkout_statuses, :dependent => :destroy
  validates_presence_of :name, :email, :password, :password_confirm, :phone_number
  validates_confirmation_of :password
  validates_length_of :name, :within => 3..60
  validates_length_of :password, :within => 5..20
  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_format_of :email, :with => EmailRegex
  Phoneformat = /\A[0-9]+-[0-9]+-[0-9]+\z/i
  validates_format_of :phone_number, :with => Phoneformat
  validates_length_of :phone_number, :maximum => 12, :message => "The phone number is invalid. Should be in the format XXX-XXX-XXXX"
  
  # Automatically create the virtual attribute 'password_confirmation'.
  validates_confirmation_of :password
  
  before_save :encrypt_password
  # Return true if the user's password matches the submitted password.
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def remember_me!
    self.remember_token = encrypt("#{salt}--#{id}--#{Time.now.utc}")
    save_without_validation
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
   private

    def encrypt_password
      unless password.nil?
        self.salt = make_salt
        self.encrypted_password = encrypt(password)
      end
    end

    def encrypt(string)
      secure_hash("#{salt}#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

end
