require 'rails_helper'

RSpec.describe User, type: :model do
  let(:client_user) { User.new(role: 'client') }
  let(:admin_user) { User.new(role: 'admin') }

  describe 'client validations' do
    context 'when client attributes are valid' do
      it 'is valid with a first name, last name, username, password, and email' do
        client_user.first_name = 'John'
        client_user.last_name = 'Doe'
        client_user.username = 'johndoe123'
        client_user.password = 'password123'
        client_user.email = 'john@example.com'

        expect(client_user).to be_valid
      end
    end

    context 'when first name is missing' do
      it 'is not valid without a first name' do
        client_user.last_name = 'Doe'
        client_user.username = 'johndoe123'
        client_user.password = 'password123'
        client_user.email = 'john@example.com'

        expect(client_user).not_to be_valid
        expect(client_user.errors[:first_name]).to include("can't be blank")
      end
    end

    context 'when last name is missing' do
      it 'is not valid without a last name' do
        client_user.first_name = 'John'
        client_user.username = 'johndoe123'
        client_user.password = 'password123'
        client_user.email = 'john@example.com'

        expect(client_user).not_to be_valid
        expect(client_user.errors[:last_name]).to include("can't be blank")
      end
    end

    context 'when username is not unique' do
      before { User.create!(first_name: 'Fulano_200', last_name: 'exersise', username: 'fulano_200', password: '1234567890', email: 'fulano_200@exersise.com', role: 'client') }

      it 'is not valid without a unique username' do
        client_user.first_name = 'John'
        client_user.last_name = 'exersise'
        client_user.username = 'fulano_200'
        client_user.password = '1234567890'
        client_user.email = 'john@exersise.com'

        expect(client_user).not_to be_valid
        expect(client_user.errors[:username]).to include("has already been taken")
      end
    end

    context 'when email is invalid' do
      it 'is not valid with an invalid email format' do
        client_user.first_name = 'John'
        client_user.last_name = 'Doe'
        client_user.username = 'johndoe123'
        client_user.password = 'password123'
        client_user.email = 'invalid_email_format'

        expect(client_user).not_to be_valid
        expect(client_user.errors[:email]).to include("is invalid")
      end
    end
  end

  describe 'admin validations' do
    context 'when admin attributes are valid' do
      it 'is valid with a username, password, and email' do
        admin_user.username = 'adminuser123'
        admin_user.password = 'password123'
        admin_user.email = 'admin@example.com'

        expect(admin_user).to be_valid
      end
    end

    context 'when username is not unique' do
      before { User.create!(username: 'adminuser123', password: 'password123', email: 'admin@example.com', role: 'admin') }

      it 'is not valid without a unique username' do
        admin_user.username = 'adminuser123'
        admin_user.password = 'password123'
        admin_user.email = 'anotheradmin@example.com'

        expect(admin_user).not_to be_valid
        expect(admin_user.errors[:username]).to include("has already been taken")
      end
    end

    context 'when email is invalid' do
      it 'is not valid with an invalid email format' do
        admin_user.username = 'adminuser123'
        admin_user.password = 'password123'
        admin_user.email = 'invalid_email_format'

        expect(admin_user).not_to be_valid
        expect(admin_user.errors[:email]).to include("is invalid")
      end
    end
  end
end
