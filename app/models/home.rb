# -*- encoding : utf-8 -*-
class Home
  include Cequel::Record
  attr_accessor :password_confirmation,:password_required
  key :id, :uuid, auto: true
  column :email, :varchar
  column :username, :varchar, :index => true
  column :password, :varchar
  column :remember_token, :varchar, :index => true
  column :role, :varchar


  def self.authenticate(name, password)
    return nil if name.blank? || password.blank?
    user = find_by_username(name) or return nil
    password == user.password ? user : nil
  end

  def refresh_remember_token
    self.remember_token = SecureRandom.base64(32)
    save(:validate => false)
  end

  def forget_me
    self.remember_token = nil
    save(:validate => false)
  end

end
