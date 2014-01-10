Spree::User.class_eval do

  alias :devise_valid_password? :valid_password?

  def valid_password?(password_input)
    return true if devise_valid_password?(password_input)
    return false unless Digest::SHA1.hexdigest("#{password_salt}#{Digest::SHA1.hexdigest("#{password_salt}#{Digest::SHA1.hexdigest(password_input)}")}") == encrypted_password

    logger.info "User #{email} is using the old password hashing method, updating attribute."
    self.password = password_input
    self.save!
    true
  end

end
