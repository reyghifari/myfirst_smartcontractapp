// SPDX-License-Identifier: MIT
pragma solidity 0.8.26; //stating our version solidity

import "./SimpleStorage.sol";

contract ExtendSimpleStorage is SimpleStorage {

    function sayHello() public pure returns(string memory) {
        return "hello world!";
    }

    function storeFavoriteNumber(uint _favoriteNumber) public override   {
        favoriteNumber = _favoriteNumber + 5 ;
    } 

}