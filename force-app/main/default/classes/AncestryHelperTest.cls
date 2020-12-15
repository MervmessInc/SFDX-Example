/**
 * @description       :
 * @author            : nigel.hughes@sage.com
 * @group             :
 * @last modified on  : 15-12-2020
 * @last modified by  : nigel.hughes@sage.com
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   14-12-2020   nigel.hughes@sage.com   Initial Version
 **/
@isTest
public with sharing class AncestryHelperTest {
	@isTest
	public static void testGetAncestors() {
		Ancestry__c bart = [
			SELECT Id, Name, First_Name__c, Family_Name__c, Parent__c
			FROM Ancestry__c
			WHERE First_Name__c = 'Bartholomew JoJo'
		];

		Test.startTest();

		List<Id> ancestors = AncestryHelper.getAncestors(bart.Id);

		Test.stopTest();

		System.assert(!ancestors.isEmpty(), 'List wrong size');
	}

	@TestSetup
	static void makeData() {
		TestDataFactory.theSimpsons();
	}
}
