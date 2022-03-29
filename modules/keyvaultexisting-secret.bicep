param azkvname string
param azkvsecretname string
param azkvsecretvalue string

resource keyvault 'Microsoft.KeyVault/vaults@2021-10-01' existing = {
  name: azkvname
}

resource keyvaultsecret 'Microsoft.KeyVault/vaults/secrets@2021-10-01' = {
  name: '${azkvname}/${azkvsecretname}'
  properties: {
    value: azkvsecretvalue
  }
}
