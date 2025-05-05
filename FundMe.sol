// SPDX-License-Identifier: MIT

pragma solidity 0.8.26; //stating our version solidity

import "./PriceConverter.sol";

error notOwner();

contract FundMe {
    using PriceConverter for uint256;
    
    uint256 public constant MINIMUM_USD = 5e18;

    address[] public funders;

    address public immutable i_owner;

    constructor(){
        i_owner = msg.sender;
    }

    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    function fundMe() public payable {
        require(msg.value.getConversationRate() >= MINIMUM_USD, "Invalid amount sent");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    function withdraw() public onlyOwner {
        for (uint funderIndex = 0; funderIndex < funders.length; funderIndex++){
           address funder = funders[funderIndex];
           addressToAmountFunded[funder] = 0 ;
        }
        funders = new address[](0);
        //transfer
        //payable(msg.sender).transfer(address(this).balance);

        (bool callSuccess,) = payable(msg.sender).call{value : address(this).balance}("");
        require(callSuccess, "Call failed");

    }

    modifier onlyOwner {
        // require(msg.sender == i_owner, "Only the owner can perform this action");
        if(msg.sender != i_owner){
            revert notOwner();
        }
        _;
    }

    receive() external payable { 
        fundMe();
    }

    fallback() external payable { 
        fundMe();
    }

}