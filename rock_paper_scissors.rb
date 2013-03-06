require 'sinatra'

get '/:move' do
	defeats = { scissors: :stone, stone: :paper, paper: :scissors }
	you = params[:move]
	unless defeats.include?(you.to_sym)
		msg = "Not a valid move!"
	else
		ai = defeats.keys.sample

		msg = if ai.to_s == you.to_s
			"<h1>It's a tie!</h1>"
		elsif ai.to_s == defeats[you.to_sym].to_s
			"<h1>You lost!</h1>"
		else
			"<h1>You win!</h1>"
		end
		msg = msg + "<span style='font-size:120%; font-weight:bold'>#{ai}</span> (Computer)<br/> VS <br/><span style='font-size:120%; font-weight:bold'>#{you}</span> (You)"		
	end
	msg
end