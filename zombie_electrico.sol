//SPDX-License-Identifier: GPL-30
pragma solidity ^0.8.0;
import "./zombie_factory.sol";


//Un zombie electricos es una zombie alimentado por
//Baterías, si no tiene baterías es peso muerto
contract ZombieElectrico is ZombieFactory {

  //Un token para cargar o descargar
  //Puede personalizarse
  struct BaToken {
    bool used;
    uint adn;
  }

  BaToken[] public batokens;

  mapping( uint => uint ) zombieBateriasCount;
  mapping( address => uint ) batTokenToOwner;
  
 //NOTA, FALTA inutilizar los tokens a la vez que se gastan los tokens
  function  _recargarZombie(uint _zombieId, uint _unusedBaTokens) private {
     zombieBateriasCount[_zombieId] = zombieBateriasCount[_zombieId] + _unusedBaTokens ;
  }

  function _fundirBaToken( uint _batokenId ) private
  {
    batokens[_batokenId].used = true;
  }
}
