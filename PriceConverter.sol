// SPDX-License-Identifier: MIT

pragma solidity 0.8.26; //stating our version solidity

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


library PriceConverter {

    function getPrice() internal view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        ( , int256 price,,,) = priceFeed.latestRoundData();
        return uint256(price *1e10);
    }

    function getConversationRate(uint256 ethAmount) internal view returns(uint256){
        uint256 ethPrice = getPrice();  //Get price of ETH in USD (in wei)
        uint256 ethToConvert = (ethPrice * ethAmount)/1e18;   //convert ETH to wei. Remember: each ETH has a value of 1e^18. So, the conversion is multiplied by 1E18 to get the actual value of our ETH (in wei)
        return ethToConvert;
    }


}