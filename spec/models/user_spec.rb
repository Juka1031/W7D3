# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do 

    subject(:user) { 
        User.create(
            username: 'anthill499',
            password: 'password')
        }
    # shoulda matchers
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_length_of(:password).is_at_least(6)}

    let(:incomplete_user) { User.new(username: '', password: 'password') }
        it 'validates presence of a username' do
            expect(incomplete_user).to_not be_valid
        end

end
