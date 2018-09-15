/* 2_deploy_contracts.js.
The numbered prefix indicates what order the migration file should be run.
The suffix is extra optional descriptions.
*/

// Sets the varible `Staff` to whatever Contract is in `Staff`.
// Here, the contract name is used rather than the file name, as one file can have multiple contracts.

var Staff_checkin = artifacts.require("Staff_checkin");

// All migrations in Truffle need to export via `module.exports`.
// More details here: https://truffleframework.com/docs/truffle/getting-started/running-migrations
module.exports = function(deployer) {
  deployer.deploy(Staff_checkin)
}