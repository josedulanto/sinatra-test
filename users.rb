require 'sinatra'

get '/:user/profile' do
	@user = params[:user]
	erb '/users/profile'.intern # #to_sym
end