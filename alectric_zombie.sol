//SPDX-License-Identifier: GPL-30
pragma solidity ^0.8.0;
import "./zombie_factory.sol";


//Un zombie electricos es una zombie alimentado por
//Baterías, si no tiene baterías es peso muerto
contract AlectricZombie is ZombieFactory {

  //Un token para cargar o descargar
  //Puede personalizarse
  struct Bat {
    bool isUsed;
    uint adn;
  }

  Bat[] public bats;

  mapping( uint => uint )    zombieBatsCount;
  mapping( address => uint ) batToOwner;
  
 //NOTA, FALTA inutilizar los tokens a la vez que se gastan los tokens
  function  _recargarZombie(uint _zombieId, uint _newBats) private {
     zombieBatsCount[_zombieId] = zombieBatsCount[_zombieId] + _newBats ;
  }

  function _fundirBat( uint _batId ) private
  {
    bats[_batId].isUsed = true;
  }
}
