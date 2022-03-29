param azkv string
param azkvsname string
param azkvsvalue string

resource keyvault 'Microsoft.KeyVault/vaults/secrets@2021-10-01' = {
  name: '${azkv}/${azkvsname}'
  properties: {
    value: azkvsvalue
  }
}
