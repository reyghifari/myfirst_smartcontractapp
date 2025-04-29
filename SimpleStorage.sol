// SPDX-License-Identifier: MIT
pragma solidity 0.8.26; //stating our version solidity

contract SimpleStorage {
    //Variable bool, uint ,int, address, byte
    uint public favoriteNumber;

    struct Person {
        string name;
        uint age;
    }

    mapping(string => uint) public nameToFavoriteNumber;

    Person[] public listPeople;

    function storeFavoriteNumber(uint _favoriteNumber) public {
        favoriteNumber = _favoriteNumber ;
    } 

    function getFavoriteNumber() public view returns(uint){
        return favoriteNumber ;
    }

     function addPeople(string memory _name, uint _age) public {
        listPeople.push(Person({name:_name , age:_age}));
        nameToFavoriteNumber[_name] = _age ;
    } 
    
    function getSizePeople() public view returns (uint ) {
       return listPeople.length ;
    } 

    function getAgeFromName(string calldata _name) public view returns (uint ) {
       return nameToFavoriteNumber[_name] ;
    } 
}