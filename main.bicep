param conditionalParameter bool

// Contains Objects for both cases
var objectArrayBase = [
  {
    name: 'obj1'
    properties: {
      dummy: 'dummy1'
    }
  }
  {
    name: 'obj2'
    properties: {
      dummy: 'dummy1'
    }
  }
]

//contains object for specific case
var objectArrayAddition = [
  {
    name: 'obj3'
    properties: {
      dummy: 'dummy2'
    }
  }
]
//Realization for Additionaly objects in specific cases
var objectArray = conditionalParameter ? union(objectArrayBase, objectArrayAddition) : objectArrayBase


// Realization of either / or

var objectArrayCase1 = [
  {
    name: 'obj1'
    properties: {
      dummy: 'dummy1'
    }
  }
  {
    name: 'obj2'
    properties: {
      dummy: 'dummy1'
    }
  }
]

var objectArrayCase2 = [
  {
    name: 'obj3'
    properties: {
      dummy: 'dummy2'
    }
  }
]

var objectArrayEitherOr = conditionalParameter ? objectArrayCase1 : objectArrayCase2


resource exampleAppgw 'Microsoft.Network/applicationGateways@2020-11-01' = {
  name: 'name'
  location: 'global'
  properties: {
    gatewayIPConfigurations: [
      // Field that accepts array of Objects deployed unconditionally
      {
        name: 'name'
        properties: {
          subnet: {
            id: 'id'
          }
        }
      }
      {
        name: 'name'
        properties: {
          subnet: {
            id: 'id'
          }
        }
      }
    ]
    // Field that accepts array of Objects deployed conditionally
    frontendIPConfigurations: objectArray
    redirectConfigurations: objectArrayEitherOr
  }
}

