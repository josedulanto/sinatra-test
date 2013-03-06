require 'sinatra'

get '/' do
  '<h2>Let\'s play Rock, Paper, Scissors!</h2>To play write your move in the url path, example: <strong>http://localhost:4567/rock</strong> and if you\'re lucky you could beat the CPU!'
end

get '/:move' do
	defeats = { scissors: :rock, rock: :paper, paper: :scissors }
	you = params[:move]
	if !defeats.include?(you.to_sym)
		msg = 'Not a valid move!'
	else
		ai = defeats.keys.sample

		msg = if ai.to_s == you.to_s
			'<h1>It\'s a tie!</h1>'
		elsif ai.to_s == defeats[you.to_sym].to_s
			'<h1>You lost!</h1>'
		else
			'<h1>You win!</h1>'
		end
		msg = msg + "<span style='font-size:120%; font-weight:bold'>#{ai}</span> (Computer)<br/> VS <br/><span style='font-size:120%; font-weight:bold'>#{you}</span> (You)"
	end
	msg
end