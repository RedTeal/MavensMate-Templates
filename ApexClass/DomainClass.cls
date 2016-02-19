/**
 * Encapsulates all behaviour logic relating to the {{ object_name }} object
 *
 * For more guidelines and details see
 *   https://developer.salesforce.com/page/Apex_Enterprise_Patterns_-_Domain_Layer
 */
public class {{ api_name }} extends fflib_SObjectDomain {

	public {{ api_name }}(List<{{ object_name }}> records) {
		super(records);
	}

	/** Apply field defaults to records */
	public override void onApplyDefaults() {
		for ({{ object_name }} record : (List<{{ object_name }}>) records) {
		}
	}

	/** Apply validation to be performed during insert or update */
	public override void onValidate() {
		for ({{ object_name }} record : (List<{{ object_name }}>) records) {
		}
	}

	/** Apply validation to be performed during update */
	public override void onValidate(Map<Id, SObject> existingRecords) {
		for ({{ object_name }} record : (List<{{ object_name }}>) records) {
			{{ object_name }} oldRecord = ({{ object_name }}) existingRecords.get(record.Id);
		}
	}

	/** Perform processing during the before-insert phase */
	public override void onBeforeInsert() {
		for ({{ object_name }} record : (List<{{ object_name }}>) records) {
		}
	}

	/** Perform processing during the before-update phase */
	public override void onBeforeUpdate(Map<Id, SObject> existingRecords) {
		for ({{ object_name }} record : (List<{{ object_name }}>) records) {
			{{ object_name }} oldRecord = ({{ object_name }}) existingRecords.get(record.Id);
		}
	}

	/** Perform processing during the before-delete phase */
	public override void onBeforeDelete() {
		for ({{ object_name }} record : (List<{{ object_name }}>) records) {
		}
	}

	/** Perform processing during the after-insert phase */
	public override void onAfterInsert() {
		for ({{ object_name }} record : (List<{{ object_name }}>) records) {
		}
	}

	/** Perform processing during the after-update phase */
	public override void onAfterUpdate(Map<Id, SObject> existingRecords) {
		for ({{ object_name }} record : (List<{{ object_name }}>) records) {
			{{ object_name }} oldRecord = ({{ object_name }}) existingRecords.get(record.Id);
		}
	}

	/** Perform processing during the after-delete phase */
	public override void onAfterDelete() {
		for ({{ object_name }} record : (List<{{ object_name }}>) records) {
		}
	}

	/** Perform processing during the after-undelete phase */
	public override void onAfterUndelete() {
		for ({{ object_name }} record : (List<{{ object_name }}>) records) {
		}
	}

	public class Constructor implements fflib_SObjectDomain.IConstructable {
		public fflib_SObjectDomain construct(List<SObject> records) {
			{{ api_name }} domain = new {{ api_name }}(records);

			/** Backwards compatability mode for routing handleAfterUpdate to onValidate()
			 *  Default: disabled
			 **/
			// domain.Configuration.enableOldOnUpdateValidateBehaviour();

			/**
			 * Configures reuse of the same Domain instance between before
			 * and after trigger phases (subject to recursive scenarios)
			 * Default: disabled
			 **/
			// domain.Configuration.enableTriggerState();

			/**
			 * Configure the base class to check user CRUD requirements
			 * before invoking trigger methods. Default: enabled
			 **/
			domain.Configuration.disableTriggerCRUDSecurity();

			return domain;
		}
	}
}
