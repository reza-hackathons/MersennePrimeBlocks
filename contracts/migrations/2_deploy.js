const mersennePrimeBlock = artifacts.require("MersennePrimeBlock");

module.exports = async function (deployer) {
  await deployer.deploy(mersennePrimeBlock);
};