/**
 * @description       :
 * @author            : nigel.hughes@sage.com
 * @group             :
 * @last modified on  : 26-02-2021
 * @last modified by  : nigel.hughes@sage.com
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   14-12-2020   nigel.hughes@sage.com   Initial Version
 **/
public with sharing class AncestryHelper {
	public static List<Id> getAncestors(Id descendant) {
		Set<Id> ancestors = new Set<Id>();
		Ancestry__c person = [
			SELECT
				Id,
				Name,
				First_Name__c,
				Family_Name__c,
				Parent__c,
				Parent__r.Ancestry__c
			FROM Ancestry__c
			WHERE Id = :descendant
		];

		Map<Id, Ancestry__c> m = new Map<Id, Ancestry__c>(
			[SELECT Id, Parent__c, Parent__r.Ancestry__c FROM Ancestry__c]
		);

		while (person.Parent__c != null) {
			ancestors.add(person.Parent__r.Ancestry__c);
			if (ancestors.add(person.Parent__c)) {
				person = m.get(person.Parent__c);
			} else {
				break;
			}
		}
		return new List<Id>(ancestors);
	}

	@AuraEnabled(cacheable=true)
	public static List<Ancestry__c> getDescendents(Id parentId) {
		List<Ancestry__c> children = [
			SELECT Id, Name, First_Name__c, Family_Name__c
			FROM Ancestry__c
			WHERE Parent__r.Ancestry__c = :parentId OR Parent__c = :parentId
		];
		return children;
	}
}
