let HDWalletProvider = require('truffle-hdwallet-provider');
// const secrets = require('./secrets');
const mnemonic = 'spirit supply whale amount human item harsh scare congress discover talent hamster';
const rinkeby = 'https://rinkeby.infura.io/v3/e8d98c55631040fbaca0acad4772cac6';

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*", // Match any network id
      gas: 9999999
    },
    rinkeby: {
      provider: () => new HDWalletProvider(mnemonic, rinkeby),
      network_id: 4,
      gas : 4500000,
      gasPrice : 10000000000
    }
  }
};