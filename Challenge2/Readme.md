The Powershell script to query instance metadata output format json and retrieve value using key

1. Here using Invoke-RestMethod to query instance metadata and print the output in json format
2. Storing the ouput to file and get the content of file
3. Iterating the file content
4. For the json output we have 2 main keys.One is compute and other is network
5. Getting Compute object sub keys and print the the required compute nested sub key value 
   
   **Example**:
    **$computeobj.azenvironment**
    
    **$computeobj.name**
    
    **$computeobj.resourceGroupName**
    
    **$computeobj.vmSize**

6. Getting Network object sub keys and print the the required Network nested sub key value 
   
   **Example**:
    **$networkobj.interface.ipv4.ipAddress**
    
    **$networkobj.interface.ipv4.subnet**
    
    **$networkobj.interface.ipv4.subnet.prefix**
    
    **$networkobj.interface.ipv6**
    


