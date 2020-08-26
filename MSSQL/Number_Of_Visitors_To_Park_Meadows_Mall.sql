/***********************************************************************************************
Number Of Visitors To Park Meadows Mall 

Packages Required:
Airsage 2017

Universal Identifiers:
propertyId

Primary Columns Used:
asOfDate
propertyId

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
18/08/2020

DatasetKey:
35

This sample query returns the number of visitors to Park Meadows Mall, Centennial, Colorado on Black Friday for each of the last three years (2017,2018,2019), and how many of those visitors are determined to have come from higher income groups

***********************************************************************************************/

select p.propertyid, p.propertyName, ds.asOfDate, ds.totalDevicesDS, ds.income75To100KDS, ds.income100To125KDS, ds.income125To150KDS, ds.income150To200KDS, ds.income200KPlusDS
from dbo.snlProp p
join airsageDailySummary ds
        on p.propertyId = ds.propertyId
where p.propertyId = 36163              --Park Meadows Mall
and ds.AsOfDate in ('11/24/2017','11/23/2018','11/29/2019')     --Black Friday
order by p.propertyName, ds.asOfDate
