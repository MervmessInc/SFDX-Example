/**
 * @description       :
 * @author            : merv@merv.org.uk
 * @group             :
 * @last modified on  : 14-12-2020
 * @last modified by  : merv@merv.org.uk
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   14-12-2020   merv@merv.org.uk   Initial Version
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
	}

	@TestSetup
	static void makeData() {
		TestDataFactory.theSimpsons();
	}
}
