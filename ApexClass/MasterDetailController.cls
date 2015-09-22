public with sharing class {{ api_name }} {

	private final ApexPages.StandardController sc;
	private final {{ master_name }} record;
	
	public final List<ItemWrapper> items {get; set;}
	
	public String orderBy {get; set;}
	public String orderDir {get; set;}
	
	public {{ api_name }}(ApexPages.StandardController sc) {
		this.sc = sc;
		orderBy = 'Name';
		orderDir = 'ASC';
		if (!Test.isRunningTest()) {
			sc.addFields(new List<String> {
				// Include any fields not auto-selected via VF
			});
			record = ({{ master_name }}) sc.getRecord();
		}
		else {
			record = [ SELECT Id, Name FROM {{ master_name }} WHERE Id = :sc.getId() ];
		}
		items = new List<ItemWrapper>();
		for ({{ detail_name }} item : selectItems(sc.getId())) {
			items.add(new ItemWrapper(item));
		}
	}
	
	public List<{{ detail_name }}> selectItems(Id masterId) {
		return Database.query(
		           'SELECT Id, Name' +
		           ' FROM {{ detail_name }}' +
		           ' WHERE {{ master_field_name }} = :masterId' +
		           ' ORDER BY ' + orderBy + ' ' + orderDir);
	}
	
	public PageReference save() {
		try {
			// Finalize field values here...
			sc.save(); // save the master record
			saveItems(); // save the detail records
		}
		catch (Exception e) {
			addApexPageError(e);
			return null;
		}
		return new PageReference('/' + record.Id);
	}
	
	private void saveItems() {
		List<{{ detail_name }}> recs = new List<{{ detail_name }}>();
		for (ItemWrapper item : items) {
			recs.add(item.record);
		}
		update recs;
	}
	
	public void addApexPageError(Exception e) {
		ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,
		                     e.getMessage() + '<br/><a href="javascript:showStacktrace();//" class="stacktrace-link">' +
		                     'Stacktrace</a><span class="stacktrace">' + e.getStackTraceString() + '</span>'));
	}
	
	public class ItemWrapper {
		public {{ detail_name }} record {get; set;}
		public Boolean selected {get; set;}
		
		public ItemWrapper({{ detail_name }} record) {
			this.record = record;
			selected = false;
		}
	}
}