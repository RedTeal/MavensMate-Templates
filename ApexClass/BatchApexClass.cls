global class {{ api_name }} implements Database.Batchable<SObject> {
	
	String query;
	
	global {{ api_name }}() {
		
	}
	
	global Database.QueryLocator start(Database.BatchableContext bc) {
		return Database.getQueryLocator(query);
	}

   	global void execute(Database.BatchableContext bc, List<SObject> scope) {
	
	}
	
	global void finish(Database.BatchableContext bc) {
		
	}
}