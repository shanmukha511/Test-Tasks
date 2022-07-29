# Powershell cmdlet to query instance metadata output format json

$MetaDataObject = Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET  -Uri "http://169.254.169.254/metadata/instance?api-version=2021-02-01" | convertto-Json -Depth 100

# Print Metadata output in Json Format

$MetaDataObject

# Writing json output to file

$MetaDataObject | Out-File -FilePath .\instance-metadata.txt

$json = Get-Content .\instance-metadata.txt | ConvertFrom-Json

#iterating over file content

foreach ($obj in $json) {

    $computeobj = $obj.compute
    $computeobjpropertyNames = $computeobj.psobject.Properties.Name
    $networkobj = $obj.network
    $networkobjpropertyNames = $networkobj.psobject.Properties.Name

}

# Print ComputeObject Metadata Keys/Properities
  
  echo "***** Compute object keys/Attributes *****"
  
  $computeobjpropertyNames

# Compute object Metadta value can be retrived by using key name

# Example below getting value of Compute Metadata using keyname

  $computeobj.azenvironment
  $computeobj.name
  $computeobj.resourceGroupName
  $computeobj.vmSize

# Print NetworkObject Meatdata Keys/Properities
 
  echo "***** Network object keys/Attributes *****"
  
  $networkobjpropertyNames

# Network Object Metadata value can be retrived by using key name

# Example below getting value of Network Metadata using Keyname 

  $networkobj.interface.ipv4.ipAddress

  $networkobj.interface.ipv4.subnet

  $networkobj.interface.ipv4.subnet.prefix
  
  $networkobj.interface.ipv6
