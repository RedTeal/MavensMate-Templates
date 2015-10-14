public with sharing class {{ api_name }} {

	private ApexPages.StandardController sc;
	private {{ sobjecttype }} record;
	
	public {{ api_name }}(ApexPages.StandardController sc) {
		this.sc = sc;
		if (!Test.isRunningTest()) {
			sc.addFields('Name,CreatedDate'.split(','));
			record = ({{ sobjecttype }}) sc.getRecord();
		}
		else {
            record = [ SELECT Id, Name, CreatedDate FROM {{ sobjecttype }} WHERE Id = :sc.getId() ];
		}
	}
}