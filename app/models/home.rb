# -*- encoding : utf-8 -*-
class Home
  include Cequel::Record

  key :id, :uuid, auto: true
  column :email, :varchar
  column :username, :varchar
  column :encrypted_password, :varchar
  column :role, :varchar
end
