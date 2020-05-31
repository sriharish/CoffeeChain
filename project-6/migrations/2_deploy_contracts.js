// migrating the appropriate contracts
// let FarmerRole = artifacts.require("./FarmerRole.sol");
// let DistributorRole = artifacts.require("./DistributorRole.sol");
// let RetailerRole = artifacts.require("./RetailerRole.sol");
// let ConsumerRole = artifacts.require("./ConsumerRole.sol");
// let SupplyChain = artifacts.require("./SupplyChain.sol");
let SupplyChain = artifacts.require("./SupplyChain.sol");

module.exports = function(deployer, network, accounts) {
  // deployer.deploy(FarmerRole);
  // deployer.deploy(DistributorRole);
  // deployer.deploy(RetailerRole);
  // deployer.deploy(ConsumerRole);
  deployer.deploy(SupplyChain, { from: accounts[0] });
  // deployer.deploy(Ownable);
};
