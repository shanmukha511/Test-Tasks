The Powershell function retrieve value from the object using key,here the get-key-from-object function takes 2 parameters first prameter is object and second parameter is key

1. In this function we take first input parameter and we split the object with delimiter ":" and do string replacement operations ,"}","{", '"' post the string manipulations  we get plain string in array
2. And second paramter we take the key and split with delimiter '/' and get plain string in array.
3. And the 2 arrays we compare get the uncommon values which inturn we get value for the key.
4. The object here should be declared in here string as it enclosed in multiple double quotes and in json like below example

Example: 

$object = @'

{"a":{"b":{"c":"d"}}}

'@

$key = "a"

**Syntax Powershell function call** : get-key-from-object $object $key

**Note**: This is powershell script .Please pass the first input parameter using here string @" "@ as it not recognizing as string because of multiple double quotes and please donot copy input from doc as double quotes in doc was not proper format it is this “ but it should be ".
