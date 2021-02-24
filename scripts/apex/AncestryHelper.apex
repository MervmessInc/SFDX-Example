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

/*
public with sharing class AncestryHelper {
	public static List<Id> getAncestors(Id descendant) {
		List<Id> ancestors = new List<Id>();
		Ancestry__c person = [
			SELECT Id, Name, First_Name__c, Family_Name__c, Parent__c
			FROM Ancestry__c
			WHERE Id = :descendant
		];

		Map<Id, Ancestry__c> m = new Map<Id, Ancestry__c>([
            SELECT Id, Parent__c
			FROM Ancestry__c
        ]);
		while (person.Parent__c != null) {
			ancestors.add(person.Parent__c);
            person = m.get(person.Parent__c);
		}

		return ancestors;
	}

	@AuraEnabled(cacheable=true)
	public static List<Ancestry__c> getDescendents(Id parentId){
		List<Ancestry__c> children = [
			SELECT Id,Name,First_Name__c,Family_Name__c 
			FROM Ancestry__c 
			WHERE Parent__r.Ancestry__c=:parentId OR Parent__c=:parentId
		];
		return children;
	}

}
*/

