/**
 * Class encapsulates query logic for {{ object_name }}
 *
 * https://developer.salesforce.com/page/Apex_Enterprise_Patterns_-_Selector_Layer
 **/
public class {{ api_name }} extends fflib_SObjectSelector {

	public List<Schema.SObjectField> getSObjectFieldList() {
		return new List<Schema.SObjectField> {
			{{ object_name }}.Id
		};
	}

	public Schema.SObjectType getSObjectType() {
		return {{ object_name }}.sObjectType;
	}

	public List<{{ object_name }}> selectById(Set<Id> ids) {
		return (List<{{ object_name }}>) selectSObjectsById(ids);
	}

	/*
	 * For more examples see https://github.com/financialforcedev/fflib-apex-common-samplecode
	 * 
	public List<{{ object_name }}> selectBySomethingElse(List<String> somethings) {
		assertIsAccessible();
		return (List<{{ object_name }}>) Database.query(
				String.format(
				'select {0}, ' +
				  'from {1} ' +
				  'where Something__c in :somethings ' + 
				  'order by {2}',
				new List<String> {
					getFieldListString(),
					getSObjectName(),
					getOrderBy() } ) );
	}
	 */
}
