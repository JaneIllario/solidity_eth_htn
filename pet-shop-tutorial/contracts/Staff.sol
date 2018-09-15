// The required minimum version of Solidity needed to compile the contract.
pragma solidity ^0.4.17;

contract Staff_checkin {
  /* Contract-wide variable `staff` of type array w/ length 10.
  Each array element is of type `address`. The `public` keyword opens access
  to the value of the variable externally.

  This variable will hold the addresses of our staff address. 
  Holds Ether address of staff log. */
  
  address[10] public staff;

  /* Publicly available functionn that will modify the staff variable by
  translating `staffId` into an index of the staff array.

  Function headers can be generalized as:
  `function FUNCTION_NAME (ARG_TYPE1 ARG_NAME1, ARG_TYPE2 ARG_NAME2, ...) FUNCTION_MODIFIER1 FUNCTION_MODIFIER2 ... returns (RETURN_TYPE)`

  This function acts as the setter function for the `staff` array by changing the staff address. */


  function checkin (uint staffId) public returns (uint) {
    // Check if the staffId is within bounds. (we only have 10 staff)
    require(staffId >= 0 && staffId <= 9);

    /* For given staff in array (using staffID) use `msg.sender` to retrieve the
    address of the person or smart contract that called the function.
    msg.sender is the address of the said staff */
    staff[staffId] = msg.sender;

    return staffId;
  }

  /* Returns the entire array of staff. Must be explicitly written as default
  getter functions for arrays can only retrieve specific elements

  the `view` function modifier here indicates that the function cannot modify the
  contract's behavior, much like a read-only function.

  Return all staff
  */

  function getStaff() public view returns (address[10]) {
    // We can return staff here because it was declared as a contract-wide variable.
    return staff;
  }
}