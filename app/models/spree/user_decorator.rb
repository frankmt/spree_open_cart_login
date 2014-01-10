Spree::User.class_eval do

  alias :devise_valid_password? :valid_password?

  def valid_password?(password)
    devise_result = devise_valid_password?(password)
    return true if devise_result

    return false unless Digest::SHA1.hexdigest("#{oc_salt}#{Digest::SHA1.hexdigest("#{oc_salt}#{Digest::SHA1.hexdigest(password)}")}") == oc_password
    logger.info "User #{email} is using the old password hashing method, updating attribute."
    self.password = password
    self.oc_password = nil
    self.oc_salt = nil
    true
  end

end
