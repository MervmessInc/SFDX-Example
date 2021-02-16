/**
 * @description       :
 * @author            : nigel.hughes@sage.com
 * @group             :
 * @last modified on  : 02-16-2021
 * @last modified by  : Nigel Hughes
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   14-12-2020   nigel.hughes@sage.com   Initial Version
 **/
public with sharing class AncestryHelper {
	public static List<Id> getAncestors(Id descendant) {
		List<Id> ancestors = new List<Id>();
		Ancestry__c person = [
			SELECT Id, Name, First_Name__c, Family_Name__c, Parent__c
			FROM Ancestry__c
			WHERE Id = :descendant
		];

		while (person.Parent__c != null) {
			ancestors.add(person.Parent__c);
			person = [
				SELECT Parent__c
				FROM Ancestry__c
				WHERE Id = :person.Parent__c
			];
		}

		return ancestors;
	}
}
