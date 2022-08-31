// SPDX-License-Identifier: GPL-30
// https://cryptozombies.io/en/lesson/1/chapter/2
//pragma solidty >=0.5.0 <0.6.0; #Error, este compilador es para 0.8

pragma solidity >=0.8.0 <0.9.0;

contract HelloWorld{

  uint adn;

  function create() public {
    adn = 1;
  }

  function get() public view returns (uint) {
    return adn;
  }

}
