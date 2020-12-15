/*

List<Ancestry__c> ancestries = [
    SELECT Id From Ancestry__c
];

system.debug(Ancestries);

Delete Ancestries;

*/

List<Ancestry__c> theSimpsons = new List<Ancestry__c>();

Ancestry__c abe = new Ancestry__c(
	Family_Name__c = 'Simpson',
	First_Name__c = 'Abraham Jebediah "Abe"'
);
insert abe;
theSimpsons.Add(abe);

Ancestry__c mona = new Ancestry__c(
	Family_Name__c = 'Simpson',
	First_Name__c = 'Mona Penelope'
);
insert mona;
theSimpsons.Add(mona);

Ancestry__c clarence = new Ancestry__c(
	Family_Name__c = 'Bouvier',
	First_Name__c = 'Clarence "Clancy"'
);
insert clarence;
theSimpsons.Add(clarence);

Ancestry__c jacqueline = new Ancestry__c(
	Family_Name__c = 'Bouvier',
	First_Name__c = 'Jacqueline Ingrid'
);
insert jacqueline;
theSimpsons.Add(jacqueline);

Ancestry__c homer = new Ancestry__c(
	Family_Name__c = 'Simpson',
	First_Name__c = 'Homer Jay'
);
insert homer;
theSimpsons.Add(homer);

Ancestry__c marjorie = new Ancestry__c(
	Family_Name__c = 'Simpson',
	First_Name__c = 'Marjorie Jacqueline Bouvier'
);
insert marjorie;
theSimpsons.Add(marjorie);

Ancestry__c selma = new Ancestry__c(
	Family_Name__c = 'Bouvier',
	First_Name__c = 'Selma'
);
insert selma;
theSimpsons.Add(selma);

Ancestry__c patty = new Ancestry__c(
	Family_Name__c = 'Bouvier',
	First_Name__c = 'Patty'
);
insert patty;
theSimpsons.Add(patty);

Ancestry__c bartholomew = new Ancestry__c(
	Family_Name__c = 'Simpson',
	First_Name__c = 'Bartholomew JoJo'
);
insert bartholomew;
theSimpsons.Add(bartholomew);

Ancestry__c lisa = new Ancestry__c(
	Family_Name__c = 'Simpson',
	First_Name__c = 'Lisa Marie'
);
insert lisa;
theSimpsons.Add(lisa);

Ancestry__c margaret = new Ancestry__c(
	Family_Name__c = 'Simpson',
	First_Name__c = 'Margaret Evelyn'
);
insert margaret;
theSimpsons.Add(margaret);

abe.Ancestry__c = mona.Id;
mona.Ancestry__c = abe.Id;
clarence.Ancestry__c = jacqueline.Id;
jacqueline.Ancestry__c = clarence.Id;
homer.Ancestry__c = marjorie.Id;
marjorie.Ancestry__c = homer.Id;
homer.Parent__c = mona.Id;
marjorie.Parent__c = jacqueline.Id;
selma.Parent__c = jacqueline.Id;
patty.Parent__c = jacqueline.Id;
bartholomew.Parent__c = marjorie.Id;
lisa.Parent__c = marjorie.Id;
margaret.Parent__c = marjorie.Id;

update theSimpsons;
