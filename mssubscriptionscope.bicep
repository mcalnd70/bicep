targetScope = 'subscription'

param p_azresouregroup01 string
param p_azlocation string
param p_azsarandomprefix string

resource azresourcegroup01 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: p_azresouregroup01
  location: p_azlocation
}

module storageaccount1 './modules/mssa-random.bicep' = {
  name: 'storageaccount1'
  scope: azresourcegroup01
  params: {
    azsaprefix: p_azsarandomprefix
    azsalocation: azresourcegroup01.location
    azsasku: 'Standard_LRS'
    azsakind: 'StorageV2'
  }
}

module storageaccount2 './modules/mssa-random.bicep' = {
  name: 'storageaccount2'
  scope: azresourcegroup01
  params: {
    azsaprefix: p_azsarandomprefix
    azsalocation: azresourcegroup01.location
    azsasku: 'Standard_LRS'
    azsakind: 'StorageV2'
  }
}
