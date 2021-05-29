1.Display the id,first name and last name of an agent whose agentcpmmission is greater than 40000.

SELECT a.agentid,a.agentfname,a.agentlname,b.agentnetamount
FROM agents as a,agentcommission as b
WHERE a.agentid=b.agentid and b.agentnetamount > 40000;

2.Display the custid,premiumtype,policyname and expirydate of policyid '512N312V02'.
SELECT p.policyid,c.custid,c.premiumtype,p.policyname,c.expirydate
FROM policies as p,custpolicies as c
WHERE p.policyid=c.policyid and p.policyid='512N312V02';

3.write a query to display the policy name and id where premiumtype is 'Quaterly'.

SELECT policyid,policyname
FROM policies
WHERE policyid in
(
SELECT policyid
FROM   custpolicies
WHERE premiumtype='Quaterly'

);

4.Write a query to display policyid, policy name, first and last names of customers who paid the premium before 20th March 2021.
SELECT a.policyid, a.policyname, b.fname, b.custlname
FROM POLICIES as a, CUSTOMER as b, CUSTPOLICIES as c
WHERE c.custpolicyid IN ( SELECT custpolicyid 
FROM custpremiumdates
WHERE previouspremiumdate<'2021-03-20') AND c.policyid=a.policyid AND c.custid=b.custid;


5.Write a query to Display the  policyid and policyname details whose bonusrate is 10.
select policyid,policyname
from policies
group by policyid,policyname
having bonusrate=10;
