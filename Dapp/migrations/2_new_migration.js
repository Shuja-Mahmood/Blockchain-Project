const Migrations = artifacts.require("Contract1");

module.exports = function (deployer)
{
    deployer.deploy(Migrations);
}