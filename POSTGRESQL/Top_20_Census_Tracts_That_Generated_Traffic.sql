/***********************************************************************************************
Top 20 Census Tracts That Generated Traffic To The Santa Rosa Plaza

Packages Required:
Airsage 2017

Universal Identifiers:
propertyId

Primary Columns Used:
asOfDate
censusTractHome
countyFIPS
propertyId
timeOfDay

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
18/08/2020

DatasetKey:
35

This sample query returns the top 20 census tracts that generated traffic to the Santa Rosa Plaza for June, 2018

***********************************************************************************************/

select  p.propertyid, p.propertyName, censusTractHome , cy.countyName ,st.name as stateName , totalSightingsMH
from snlProp p
join airsageMonthlyHome mh
        on p.propertyId = mh.propertyId
join refUSCensusTract ct
        on mh.censusTractHome = ct.censusTractFips
join refUSCensusCounty cy
        on ct.CountyFips = cy.countyFIPS
join refUSCensusState st
        on ct.stateFIPS = st.stateFIPS
where p.propertyId = 31713      --Santa Rosa Plaza
and mh.AsOfDate = '6/30/2018'
and mh.timeOfDay = 8            --All Day
order by totalSightingsMH desc
limit 20
