// SPDX-License-Identifier: MIT
pragma solidity 0.8.26; //stating our version solidity

import "./SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage public simpleStorage;

    function createSimpleStorage() public {
        simpleStorage = new SimpleStorage();
    }


}