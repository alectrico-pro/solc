//SPDX-License-Identifier: GPL-30
pragma solidity ^0.8.0;
import "./zombie_factory.sol";
import "./bat_factory.sol";


//Un zombie electricos es una zombie alimentado por
//Baterías, si no tiene baterías es peso muerto
contract BatZombie is ZombieFactory {
  
  
  function feedAndMultiply(uint _zombieId, uint _targetDna) public {
    require(msg.sender == zombieToOwner[_zombieId]);
    Zombie storage myZombie = zombies[_zombieId];
    _targetDna = _targetDna % dnaModulus;
    uint newDna = (myZombie.dna + _targetDna) / 2;
    // Add an if statement here
    _createZombie("NoName", newDna);
  }

  function feedOnBat(uint _zombieId, uint _batId) public {
    uint batDna;
    batDna = bats[_batId ].dna;
    feedAndMultiply(_zombieId, batDna);
  }

}
