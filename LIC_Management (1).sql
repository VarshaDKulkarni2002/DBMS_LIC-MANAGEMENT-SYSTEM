
create table policies(
policyid varchar(15),
policyname varchar(50),
policyterm varchar(20),
policyamount numeric(15,3),
policyfaceamount numeric(16),
policyinterest numeric(2),
policydate date,
bonusperiod numeric(2),
bonusrate numeric(2)
);

alter table policies add constraint policyid,policyname primary key(policyid,policyname);



create table agents(
agentid numeric(11),
agentfname varchar(20),
agentlname varchar(20),
agentage numeric(3),
agentsex varchar(1),
agentqual varchar(20),
agentoccupation varchar(20),
agentaddress varchar(50),
agentregdate Date,
agentsecuritydeposit numeric(10,3));

alter table agents add constraint agentid primary key(agentid);


create table agentcommission(
agentid numeric(11),
agentnetamount numeric(13,3),
FOREIGN KEY(agentid) references agents delete on cascade);

alter table agentcommission add constraint agentid primary key(agentid);



create table customer(
custid numeric(11),
custfname varchar(33),
custlname varchar(35),
custage numeric(3),
custsex varchar(1),
custqual varchar(35),
custaddress varchar(40),
custoccupation varchar(35),
custregdate date,
PRIMARY KEY(custid));




create  table custpolicies(
custpolicyid numeric(11),
custid numeric(10),
policyid varchar(15),
policydate date,
premiumtype varchar(10),
premiumamount numeric(15,2),
nomineename varchar(35),
relation varchar(20),
agentid numeric(11),
expirydate date,
PRIMARY KEY(custpolicyid),
FOREIGN KEY(custid) references customer  on delete  cascade,
FOREIGN KEY(policyid) references policies  on delete cascade,
FOREIGN KEY(agentid)   references agents on delete cascade);




create table custpolicyamounts(
custpolicyid numeric(14),
amount numeric(15,3),
interestamount numeric(15,2),
netamount numeric(15,2),
PRIMARY KEY(custpolicyid),
FOREIGN KEY(custpolicyid) references custpolicies on delete cascade);




create table custpremiumdates(
custpolicyid numeric(14),
previouspremiumdate date,
nextpremiumdate date,
primary key(custpolicyid),
foreign key(custpolicyid) references custpolicies on delete cascade);



create table policycommission(
targetamount numeric(20,3),
commissionrate numeric(5,2));



create table premiumamounts(
policyid varchar(15),
monthly numeric(15,2),
quarterly numeric(15,2),
halfyearly numeric(15,2),
annually numeric(15,2),
FOREIGN KEY(policyid) references policies on delete cascade);






create table custbonusdates(
custpolicyid numeric(14),
previousbonusdate date,
nextbonusdate date,
PRIMARY KEY(custpolicyid),
FOREIGN KEY(custpolicyid) references custpolicies  on delete cascade);



