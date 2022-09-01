//SPDX-License-Identifier: GPL-30
pragma solidity ^0.8.0;
import "./zombie_factory.sol";



contract ZombieFeeding is ZombieFactory {
 function feedAndMultiply(uint _zombieId, uint _targetDna) public view {
   require(msg.sender == zombieToOwner[_zombieId] );
   Zombie storage myZombie = zombies[_zombieId] ;
   _targetDna = _targetDna % dnaModulus;
   uint newDna =  2 ;
 }
}
