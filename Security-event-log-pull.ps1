<#
SYNOPSIS

 Locally ran script to find Windows security event logs related to a specific user or process. 

PARAMETERS

name of user or process to audit in the test case its the NT Authority

$logonname = "NT Authority"

User must set the Month/Day/Year for start date and end date of audit 
If requester needs audit from 04 July 2019 to 08JUL2019 the dates should be extended and set as 
$startdate = '07/3/2019'
$enddate = '07/9/2019'
The script is set for dates after and before;it is not set for dates on and/or of. 

$startdate = '2/1/2020'

$enddate = '4/17/2020'


OUTPUTS
to a CSV file stored on the admin Desktop  $home\Desktop\$logonname-Security-Log-Events-$Reportdate.csv
In the example script the file will be strored as "NT Authority-Security-Log-Events-2020-04-28" 

.NOTES
  Version:        1.0
  Author:         CountDClem
  Creation Date:  2020-04-28
  Purpose/Change: N/A Initial script development

This posting is provided "AS IS" with no warranties, and confers no rights.

This Sample Code is provided for the purpose of illustration only and is not
intended to be used in a production environment.  THIS SAMPLE CODE AND ANY
RELATED INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.  We grant You a
nonexclusive, royalty-free right to use and modify the Sample Code and to
reproduce and distribute the object code form of the Sample Code, provided
that You agree: (i) to not use Our name, logo, or trademarks to market Your
software product in which the Sample Code is embedded; (ii) to include a valid
copyright notice on Your software product in which the Sample Code is embedded;
and (iii) to indemnify, hold harmless, and defend Us and Our suppliers from and
against any claims or lawsuits, including attorneys’ fees, that arise or result
from the use or distribution of the Sample Code.

#> 



#Auto sets the date of the report for current date in csv output name 

$Reportdate = Get-Date -UFormat “%Y-%m-%d” 

#name of user or process to audit

$logonname = "NT Authority"

#User must set the Month/Day/Year for start date and end date of audit 
# If requester needs audit from 04 July 2019 to 08JUL2019 the dates should be extended and set as 
# $startdate = '07/3/2019'
# $enddate = '07/9/2019'
#The script is set for dates after and before;it is not set for dates on and/or of. 

$startdate = '2/1/2020'

$enddate = '4/17/2020'

$logonEvents = Get-EventLog -LogName Security -After (Get-Date -Date $startdate) -Before (Get-Date -Date $enddate) | 
where {$_.Message -like "*$logonname*"}
$logonEvents | 
Export-csv -Path "$home\Desktop\$logonname-Security-Log-Events-$Reportdate.csv" -Append -NoTypeInformation











