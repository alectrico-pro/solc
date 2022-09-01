// SPDX-License-Identifier: UNLINCESED
pragma solidity ^0.8.0;

contract BatFactory {

    event NewBat(uint batId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Bat 
    {
        string name;
        uint   dna;
    }

    Bat[] public bats;

    mapping( uint => address ) public batToOwner;
    mapping( address => uint ) ownerBatCount;
    mapping( address => uint ) favoriteNumber;


    function _createBat(string memory _name, uint _dna) internal
    {
        Bat memory bat = Bat(_name, _dna);
        bats.push(bat) ;
        uint id = bats.length - 1;
        emit NewBat(id, _name, _dna);
        batToOwner[id] = msg.sender;
        ownerBatCount[msg.sender]++;
    }

    function _generateRandomDna(string memory _str) private view returns (uint)     {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomBat(string memory _name) public
    {
        require( ownerBatCount[msg.sender] == 0);
        uint randDna = _generateRandomDna(_name);
        _createBat(_name, randDna);
    }

}
