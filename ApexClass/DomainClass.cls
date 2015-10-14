/**
 * See https://github.com/financialforcedev/fflib-apex-common for more info
 *
 * Install library via 
 *   https://githubsfdeploy.herokuapp.com/app/githubdeploy/financialforcedev/fflib-apex-common
 */

/**
 * Encapsulates all behaviour logic relating to the {{ object_name }} object
 * 
 * For more guidelines and details see 
 *   https://developer.salesforce.com/page/Apex_Enterprise_Patterns_-_Domain_Layer
 *
 **/
public class {{ api_name }} extends fflib_SObjectDomain {

	public {{ api_name }}(List<{{ object_name }}> records) {
		super(records);	
	}

	public override void onValidate() {
		for ({{ object_name }} record : (List<{{ object_name }}>) records) {
		}
	}

	public override void onValidate(Map<Id, SObject> existingRecords) {
		for ({{ object_name }} record : (List<{{ object_name }}>) records) {
		}
	}

	public override void onBeforeInsert() {
		someMethod();
	}

	public override void onBeforeUpdate(Map<Id, SObject> existingRecords) {
		someMethod();
	}

	public void someMethod() {
		for ({{ object_name }} record : (List<{{ object_name }}>) records) {
			System.debug(record.Name + ' (' + record.Id + ')');
		}
	}

	public class Constructor implements fflib_SObjectDomain.IConstructable {
		public fflib_SObjectDomain construct(List<SObject> records) {
			return new {{ api_name }}(records);
		}
	}
}