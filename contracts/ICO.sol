pragma solidity ^0.4.18;

import './CommonCrowdsale.sol';


contract ICO is CommonCrowdsale {

  function ICO() public {
    minInvestedLimit = 10000000000000000;
    price = 909000000000000000000;
    bountyTokensPercent = 3;
    advisorsTokensPercent = 1;
    devTokensPercent = 4;
    foundersTokensPercent = 10;
    hardcap = 67500000000000000000000;
    addBonus(7,10);
    addBonus(7,5);
    start = 1519131600;
    end = 1521550800;
    wallet = 0x72EcAEB966176c50CfFc0Db53E4A2D3DbC0d538B;
    bountyTokensWallet = 0x7E513B54e3a45B60d6f92c6CECE10C68977EEA8c;
    foundersTokensWallet = 0x4227859C5A9Bb4391Cc4735Aa655e980a3DD4380;
    advisorsTokensWallet = 0x6e740ef8618A7d822238F867c622373Df8B54a22;
    devTokensWallet = 0xCaDca9387E12F55997F46870DA28F0af1626A6d4;
  }

  function finishMinting() public onlyOwner {
    mintExtendedTokens();
    token.finishMinting();
  }

  function createTokens() public payable saleIsOn {
    calculateAndTransferTokens(msg.sender, msg.value);
    wallet.transfer(msg.value);
  }

}
