//SPDX-License-Identifier: GPL-30
pragma solidity ^0.8.0;

import "./zombie_factory.sol";


//Una Ronda es un crédito de Atención para atender una solicitud

contract RondaFactory {

  event RondaNueva (
     uint id, 
    string nombre, 
    string comuna, 
    string descripcion, 
    string tipo );

  struct Ronda {
    string nombre;
    string fono;
    string direccion;
    string comuna;
    string descripcion;
    string tipo;
    uint zombie_id;
  }

  Ronda[] public rondas;


  //Se crea una ronda sin zombie 
  function _crearRonda(
     string memory _nombre,
     string memory _fono,
     string memory _direccion, 
     string memory _comuna ,
     string memory _descripcion,
     string memory _tipo) private {

     rondas.push( Ronda( _nombre,
                           _fono,
                      _direccion,
                         _comuna,
                    _descripcion,
                           _tipo,
                              0));
 }

  //La ronda la crea el instalador y genera un evento que es entregado a cada colaborador
  //requiere que sea el instalador, no se permite al colaborador-instalador
  function _crearRondaConEvento( 
      string memory _nombre,
      string memory _fono,
      string memory _direccion,
      string memory _comuna,
      string memory _descripcion,
      string memory _tipo) public {

      _crearRonda( 
            _nombre, 
            _fono, 
            _direccion, 
            _comuna, 
            _descripcion, 
            _tipo );

     uint len = rondas.length;
     uint id  = len - 1;
     _difundirRonda( id );

  }

  //La ronda se difunde a cada colaborador
  //requiere que sea el instalador o colaborador instalador
  function _difundirRonda(uint _id) private  {
    emit RondaNueva(_id, rondas[_id].nombre, rondas[_id].comuna, rondas[_id].descripcion, rondas[_id].tipo );
  }

  //La ronda se cambia de dueño
  //require que el zombie dueño de la ronda quiera pasarla
  function _pasarRonda(uint _ronda_id, uint _zombie_id) public {
    rondas[_ronda_id].zombie_id = _zombie_id;
  } 

  //Requiere que el zombie que vaya a recibir la ronda tenga saldo positivo de baterías
  function _tomarRonda(uint _ronda_id, uint _zombie_id) public {
    rondas[_ronda_id].zombie_id = _zombie_id; 
  }
 
}
