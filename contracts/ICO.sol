pragma solidity ^0.4.18;

import './CommonCrowdsale.sol';


contract ICO is CommonCrowdsale {

  function finishMinting() public onlyOwner {
    mintExtendedTokens();
    token.finishMinting();
  }

  function createTokens() public payable saleIsOn {
    calculateAndTransferTokens(msg.sender, msg.value);
    wallet.transfer(msg.value);
  }

}
