// SPDX-License-Identifier: MIT

pragma solidity 0.8.26; //stating our version solidity

import "./PriceConverter.sol";


contract FundMe {
    using PriceConverter for uint256;
    
    uint256 public minimumUsd = 5e18;

    address[] public funders;

    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    function fundMe() public payable {
        require(msg.value.getConversationRate() >= minimumUsd, "Invalid amount sent");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    function withdraw() public {
        for (uint funderIndex = 0; funderIndex < funders.length; funderIndex++){
           address funder = funders[funderIndex];
           addressToAmountFunded[funder] = 0 ;
        }
    }

}