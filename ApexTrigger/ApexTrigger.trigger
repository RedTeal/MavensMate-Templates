trigger {{ api_name }} on {{ object_name }} (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

	Boolean isBeforeInsert = Trigger.isBefore && Trigger.isInsert;
	Boolean isAfterInsert = Trigger.isAfter && Trigger.isInsert;
	Boolean isBeforeUpdate = Trigger.isBefore && Trigger.isUpdate;
	Boolean isAfterUpdate = Trigger.isAfter && Trigger.isUpdate;
	Boolean isBeforeDelete = Trigger.isBefore && Trigger.isDelete;
	Boolean isAfterDelete = Trigger.isAfter && Trigger.isDelete;

	List<{{ object_name }}> records = Trigger.isDelete ? Trigger.old : Trigger.new;

	if (isBeforeInsert) {
		// Context availability: records=new
		for ({{ object_name }} record : records) {
		}
	}

	if (isAfterInsert) {
		// Context availability: records=new; newMap
		for ({{ object_name }} record : records) {
		}
	}

	if (isBeforeUpdate) {
		// Context availability: records=new; newMap; old; oldMap
		for ({{ object_name }} record : records) {
			{{ object_name }} oldRecord = Trigger.oldMap.get(record.Id);
		}
	}

	if (isAfterUpdate) {
		// Context availability: records=new; newMap; old; oldMap
		for ({{ object_name }} record : records) {
			{{ object_name }} oldRecord = Trigger.oldMap.get(record.Id);
		}
	}

	if (isBeforeDelete) {
		// Context availability: records=old; oldMap
		for ({{ object_name }} record : records) {
		}
	}

	if (isAfterDelete) {
		// Context availability: records=old; oldMap
		for ({{ object_name }} record : records) {
		}
	}

	if (Trigger.isUndelete) {
		// Context availability: records=new; newMap
		for ({{ object_name }} record : records) {
		}
	}
}