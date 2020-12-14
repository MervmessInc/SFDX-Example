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
public with sharing class TestDataFactory {
	public static void theSimpsons() {
		Ancestry__c abe = new Ancestry__c(
			Family_Name__c = 'Simpson',
			First_Name__c = 'Abraham Jebediah "Abe"'
		);
		insert abe;

		Ancestry__c mona = new Ancestry__c(
			Family_Name__c = 'Simpson',
			First_Name__c = 'Mona Penelope',
			Ancestry__c = abe.Id
		);
		insert mona;

		abe.Ancestry__c = mona.Id;
		update abe;

		Ancestry__c clarence = new Ancestry__c(
			Family_Name__c = 'Bouvier',
			First_Name__c = 'Clarence "Clancy"'
		);
		insert clarence;

		Ancestry__c jacqueline = new Ancestry__c(
			Family_Name__c = 'Bouvier',
			First_Name__c = 'Jacqueline Ingrid',
			Ancestry__c = clarence.Id
		);
		insert jacqueline;

		clarence.Ancestry__c = jacqueline.Id;
		update clarence;

		Ancestry__c homer = new Ancestry__c(
			Family_Name__c = 'Simpson',
			First_Name__c = 'Homer Jay',
			Parent__c = mona.Id
		);
		insert homer;

		Ancestry__c marjorie = new Ancestry__c(
			Family_Name__c = 'Simpson',
			First_Name__c = 'Marjorie Jacqueline Bouvier',
			Ancestry__c = homer.Id,
			Parent__c = jacqueline.Id
		);
		insert marjorie;

		homer.Ancestry__c = marjorie.Id;
		update homer;

		Ancestry__c selma = new Ancestry__c(
			Family_Name__c = 'Bouvier',
			First_Name__c = 'Selma',
			Parent__c = jacqueline.Id
		);
		insert selma;

		Ancestry__c patty = new Ancestry__c(
			Family_Name__c = 'Bouvier',
			First_Name__c = 'Patty',
			Parent__c = jacqueline.Id
		);
		insert patty;

		Ancestry__c bartholomew = new Ancestry__c(
			Family_Name__c = 'Simpson',
			First_Name__c = 'Bartholomew JoJo',
			Parent__c = marjorie.Id
		);
		insert bartholomew;

		jacqueline.Parent__c = bartholomew.Id;
		update jacqueline;

		Ancestry__c lisa = new Ancestry__c(
			Family_Name__c = 'Simpson',
			First_Name__c = 'Lisa Marie',
			Parent__c = marjorie.Id
		);
		insert lisa;

		Ancestry__c margaret = new Ancestry__c(
			Family_Name__c = 'Simpson',
			First_Name__c = 'Margaret Evelyn',
			Parent__c = marjorie.Id
		);
		insert margaret;
	}
}
