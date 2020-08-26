/***********************************************************************************************
Daily Foot Traffic In April 2017 

Packages Required:
Airsage 2017

Universal Identifiers:
propertyId
institutionId

Primary Columns Used:
asOfDate
institutionId
propertyId

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
18/08/2020

DatasetKey:
35

This sample query returns daily foot traffic in April 2017 between the hours of 10 AM and 4PM for all properties still owned by Acadia Reality Trust

***********************************************************************************************/

select c.institutionId, c.institutionName, p.propertyid, p.propertyName, po.ownershipStartDate,  devices10AMTo12AM,devices12PMTo2PM,devices2PMTo4PM
from snlCorp c
join snlPropOwnership po        
        on c.institutionId = po.institutionId
join snlProp p
        on po.propertyId = p.propertyId
join airsageDailySummary ds
        on p.propertyId = ds.propertyId
where c.institutionId = 103085          --Acadia Realty Trust
and po.currentOwner = 1
and ds.AsOfDate between '4/1/2017' and '4/30/2017'
order by p.propertyName, ds.asOfDate
