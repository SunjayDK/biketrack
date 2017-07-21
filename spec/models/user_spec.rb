require 'rails_helper'

RSpec.describe User, type: :model do
  require 'spec_helper'
  describe 'validations' do
    let(:user) { User.new({
      email: "sleepyheadzzz@gmail.com",
      password: 'SnoozeAlarm12pm',
      fullname: "Rip van Winkle"
    }) }

    it 'allows if valid user' do
      expect(user.save).to be true
    end

    it 'does not allow if no email' do
      user.email = nil
      expect(user.save).to be false
    end

    it 'does not allow if no name' do
      user.fullname = nil
      expect(user.save).to be false
    end

    it 'does not allow if no password' do
      user.password = nil
      expect(user.save).to be false
    end

    it 'stores encrypted password' do
      user.save
      expect(user.password_hash).not_to eq('SnoozeAlarm12pm')
    end

    it 'returns unencrypted password' do
      user.save
      expect(user.password).to eq('SnoozeAlarm12pm')
    end

    it 'stores encrypted password as string' do
      user.save
      expect(user.password).to be_a String
    end

  end

  describe '#authenticate' do
    let(:user) { User.create!({
      email: "sleepyheadzzz@gmail.com",
      password: 'SnoozeAlarm12pm',
      fullname: "Rip van Winkle"
    }) }

    it 'accepts correct password/email combination' do
      expect(User.authenticate(user.email, "SnoozeAlarm12pm")).to eq(user)
    end

    it 'rejects wrong password' do
      expect(User.authenticate(user.email, "incorrectpassword")).to eq nil
    end

    it 'rejects wrong email' do
      expect(User.authenticate("wrong@wrong.com", "SnoozeAlarm12pm")).to eq nil
    end
  end
end
