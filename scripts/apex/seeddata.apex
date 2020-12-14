/*

List<Ancestry__c> ancestries = [
    SELECT Id From Ancestry__c
];

system.debug(Ancestries);

Delete Ancestries;

*/
Ancestry__c Abe = new Ancestry__c(
	Family_Name__c = 'Simpson',
	First_Name__c = 'Abraham Jebediah "Abe"'
);
insert Abe;

Ancestry__c Mona = new Ancestry__c(
	Family_Name__c = 'Simpson',
	First_Name__c = 'Mona Penelope',
	Ancestry__c = Abe.Id
);
insert Mona;

Abe.Ancestry__c = Mona.Id;
update Abe;

Ancestry__c Clarence = new Ancestry__c(
	Family_Name__c = 'Bouvier',
	First_Name__c = 'Clarence "Clancy"'
);
insert Clarence;

Ancestry__c Jacqueline = new Ancestry__c(
	Family_Name__c = 'Bouvier',
	First_Name__c = 'Jacqueline Ingrid',
	Ancestry__c = Clarence.Id
);
insert Jacqueline;

Clarence.Ancestry__c = Jacqueline.Id;
update Clarence;

Ancestry__c Homer = new Ancestry__c(
	Family_Name__c = 'Simpson',
	First_Name__c = 'Homer Jay',
	Parent__c = Mona.Id
);
insert Homer;

Ancestry__c Marjorie = new Ancestry__c(
	Family_Name__c = 'Simpson',
	First_Name__c = 'Marjorie Jacqueline Bouvier',
	Ancestry__c = Homer.Id,
	Parent__c = Jacqueline.Id
);
insert Marjorie;

Homer.Ancestry__c = Marjorie.Id;
update Homer;

Ancestry__c Selma = new Ancestry__c(
	Family_Name__c = 'Bouvier',
	First_Name__c = 'Selma',
	Parent__c = Jacqueline.Id
);
insert Selma;

Ancestry__c Patty = new Ancestry__c(
	Family_Name__c = 'Bouvier',
	First_Name__c = 'Patty',
	Parent__c = Jacqueline.Id
);
insert Patty;

Ancestry__c Bartholomew = new Ancestry__c(
	Family_Name__c = 'Simpson',
	First_Name__c = 'Bartholomew JoJo',
	Parent__c = Marjorie.Id
);
insert Bartholomew;

Ancestry__c Lisa = new Ancestry__c(
	Family_Name__c = 'Simpson',
	First_Name__c = 'Lisa Marie',
	Parent__c = Marjorie.Id
);
insert Lisa;

Ancestry__c Margaret = new Ancestry__c(
	Family_Name__c = 'Simpson',
	First_Name__c = 'Margaret Evelyn',
	Parent__c = Marjorie.Id
);
insert Margaret;
