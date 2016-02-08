class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = %r{\A[a-z0-9!#$%&'*+/=?^_`{|}~-]+(\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@([a-z0-9!$%&'*/=?^`{|}~-]+(\.[a-z0-9!$%&'*/=?^`{|}~-]+)*|\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])\z}i
  validates :email, presence: true, length: {maximum: 254},
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}
end
