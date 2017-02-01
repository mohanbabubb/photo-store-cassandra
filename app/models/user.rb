# -*- encoding : utf-8 -*-
class User
  include Cequel::Record

  key :id, :uuid, auto: true
  column :email, :varchar
  column :username, :varchar
  column :encrypted_password, :varchar
end
