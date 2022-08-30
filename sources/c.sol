//SPDX-License-Identifier: GPL-30
pragma Solidity =>0.4.16 <0.9.0;

contract c{

  uint storedData;

  function set( uint new_value ) public{
    storedData = new_value;
  }

  function get() public view returns (uint ) {
    return storedData;
  }

}

