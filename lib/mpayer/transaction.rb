class Mpayer::Transaction < Mpayer::Base

	#GET
	#/transactions/all
	def all
		get('/transactions/all')
	end

	#PUT
	#/transactions/deposit
	#`ref_id: 'this is a unique field for every transaction(can be used to id a transaction)'
	#`amount: 'this is the amount being transfered'
	#`cr_party: 'this is the recipient(can be an account number or a payable number)'
	#############when it is a payable number a '#' is prepended to
	############indicate: deposit as per the propotions in the payable
	##example => {ref_id:"EO4GM2GOGXWPGZ", amount:"200", cr_party:"#GOGXWP"}
	#
	def deposit(json_body)
		put('/transactions/deposit', json_body)
	end

	#POST
	#/transactions/withdraw
	############Parameters [all the listed parameters are manadatory]
	#`ref_id: 'this is a unique field for every transaction(can be used to id a transaction)'
	#`amount: 'this is the amount being transfered'
	#`dr_party: 'this is the sender'
	#`cr_party: 'this is the recipient(can be an account number or a payable number)'
	#############when it is a payable number a '#' is prepended to
	############indicate:  withdraw as per the propotions in the payable
	#example=> {ref_id:"345345244545345",amount:"10",cr_party:"#GOGXWP",dr_party:"00043230652927"}
	#
	def withdraw(json_body)
		post('/transactions/withdraw', json_body)
	end

	#POST
	#/transactions/transfer
	#Parameters [all the listed parameters are manadatory]
	#`ref_id: 'this is a unique field for every transaction(can be used to id a transaction)'
	#`amount: 'this is the amount being transfered'
	#`cr_party: 'this is the recipient(can be an account number or a payable number)'
	#`dr_party: 'this is the sender'
	#############when it is a payable number a '#' is prepended to indicate pay.
	#example: ==> {ref_id:"EO4GM2GOGXWPGZ",amount:"36", cr_party:"#GOGXWP", dr_party:"0004354652927"}
	#
	def transfer(json_body)
		post('/transactions/transfer', json_body)
	end

end