global class {{ api_name }} implements Messaging.InboundEmailHandler {
	
	global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope env) {
		// Create an InboundEmailResult object for returning the result of the
		// Apex Email Service
		
		Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
		
		String body = email.plainTextBody;
		
		result.success = true;
		return result;
	}
}