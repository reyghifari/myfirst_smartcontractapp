// SPDX-License-Identifier: MIT
pragma solidity 0.8.26; //stating our version solidity

import "./SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage[] public listOfSimpleStorage;

    function createSimpleStorage() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        listOfSimpleStorage.push(simpleStorage);
    }

    function sfStore(uint _indexStorage, uint _newSimpleStorageNumber) public {
        SimpleStorage simpleStorage = listOfSimpleStorage[_indexStorage];
        simpleStorage.storeFavoriteNumber(_newSimpleStorageNumber);
    }

    function sgGet(uint _indexStorage)public view returns(uint){
       return listOfSimpleStorage[_indexStorage].getFavoriteNumber();
    }
    

}