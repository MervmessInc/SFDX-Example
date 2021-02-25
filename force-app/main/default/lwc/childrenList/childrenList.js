/**
 * @description       :
 * @author            : nigel.hughes@sage.com
 * @group             : Sage People
 * @last modified on  : 25-02-2021
 * @last modified by  : nigel.hughes@sage.com
 * Modifications Log
 * Ver   Date         Author                  Modification
 * 1.0   25-02-2021   nigel.hughes@sage.com   Initial Version
 **/
import { LightningElement, api, wire, track } from "lwc";
import getDescendents from "@salesforce/apex/AncestryHelper.getDescendents";

export default class ChildrenList extends LightningElement {
	@api recordId;

	@track columns = [
		{
			label: "First Name",
			fieldName: "First_Name__c",
			type: "text",
			sortable: true
		},
		{
			label: "Family Name",
			fieldName: "Family_Name__c",
			type: "text",
			sortable: true
		}
	];

	@track error;
	@track kidsList;

	@wire(getDescendents, { parentId: "$recordId" })
	wiredDescendents({ error, data }) {
		if (data) {
			this.kidsList = data;
		} else if (error) {
			this.error = error;
		}
	}
}
