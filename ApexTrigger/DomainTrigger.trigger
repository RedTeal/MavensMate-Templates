/**
 * Boiler plate Apex Trigger to route events to the respective Domain class methods
 *
 * For more guidelines and details see
 *   https://developer.salesforce.com/page/Apex_Enterprise_Patterns_-_Domain_Layer
 **/
trigger {{ api_name }} on {{ object_name }} (after delete, after insert, after update, before delete, before insert, before update) {
	// Creates Domain class instance and calls appropriate methods
	fflib_SObjectDomain.triggerHandler({{ api_name }}.class);
}
