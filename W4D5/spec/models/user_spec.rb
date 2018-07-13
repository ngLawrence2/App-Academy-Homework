require 'rails_helper'


RSpec.describe User, type: :model do
  it { should validate_presence_of(:email)}
  it {should validate_presence_of(:password_digest)}
 it { should validate_length_of(:password).is_at_least(6) }

 describe '#is_password?' do
   u = User.new(email: 'test', password_digest: BCrypt::Password.create('123456789') )
   it 'returns true if it is the password' do
     expect(u.is_password?('123456789')).to be true
   end
 end

  describe '#reset_session_token!' do
    u = User.new(email: 'test1', password_digest: 'fdiafsajism132')
    u.session_token = User.generate_session_token
    current_session_token = u.session_token
    it 'changes the users session token' do
        expect(current_session_token).not_to eq(u.reset_session_token!)
    end
  end

  describe '::find_by_credentials' do

    it 'finds the user' do
        found_user = User.find_by_credentials('test', '123456789')
        expect(found_user.email).to eq('test')
    end
  end
end
