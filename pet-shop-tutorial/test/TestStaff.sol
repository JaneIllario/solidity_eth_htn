pragma solidity ^0.4.17;

import "truffle/Assert.sol"; /*global truffle files, not truffle dir; assertions*/

import "truffle/DeployedAddresses.sol"; /*global truffle files, not truffle dir; fresh batch of contracts deployed when testing, get addresses of deployed contracts*/

import "../contracts/Staff.sol"; /*contract being tested*/

contract TestStaff {
  Staff_checkin check = Staff_checkin(DeployedAddresses.Staff_checkin());

  // Testing the checkin() function
  function testStaffCanCheckIn() public {
    uint returnedId = check.checkin(8);

    uint expected = 8;

    Assert.equal(returnedId, expected, "Check in of staff 8 should be recorded.");
  }


  // Testing retrieval of a single staffs id
  function testGetStaffAddressByStaffId() public {
    // Expected owner is this contract
    address expected = this;

    address staff = check.staff(8);

    Assert.equal(staff, expected, "Staff address of staff ID 8 should be recorded.");
  }


  // Testing retrieval of all staff addresses
  function testGetStaffAddressBySatffIdInArray() public {
    // Expected staff is this contract
    address expected = this;

    // Store staff in memory rather than contract's storage
    address[10] memory staff = check.getStaff();

    Assert.equal(staff[8], expected, "Staff address of staff ID 8 should be recorded.");
  }
}