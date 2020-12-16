Ancestry__c bart = [
	SELECT Id, Name, First_Name__c, Family_Name__c, Parent__c
	FROM Ancestry__c
	WHERE First_Name__c = 'Bartholomew JoJo'
];

List<Id> ancestors = AncestryHelper.getAncestors(bart.id);

List<Ancestry__c> people = [
	SELECT Id, Name, First_Name__c, Family_Name__c, Parent__c
	FROM Ancestry__c
	WHERE Id IN :ancestors
];

system.debug(json.serializePretty(people));
system.debug(ancestors.size());
