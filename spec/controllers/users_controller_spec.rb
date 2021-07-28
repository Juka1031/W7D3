require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe 'GET #new' do 
        
        it 'should return a form to fill out' do
            get :new
            expect(response).to render_template(:new)
        end
    end


    describe 'GET #index' do 
        it 'should return everyone' do
            get :index
            expect(response).to render_template(:index) # -> renders index.html.erb on its own
                                                        # -> render_template = checks views
        end
    end

    describe 'POST #create' do 
 
    subject(:user) { 
        User.create(
            username: 'anthill499',
            password: 'password')
        }

        let(:valid_params) { {user: {username: 'anthill499', password: 'password'} }}
        let(:invalid_params) { {user: {username: '', password: ''} } }

        context 'with valid params' do
            it 'creates a user' do
                post :create, params: valid_params
                expect(User.last.username).to eql('anthill499')
            end

        end

        it 'should go to the specific user\''\'s profile' do
            get :new
            expect(response).to render_template(:new)
        end


    end


    




    

end