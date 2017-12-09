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
    wallet = 0xd89626E2c4218281Ad0Fc5F22AE52dC0FF39DDC4;
    bountyTokensWallet = 0xDa67155b22973bE05Bcd28c07107b2E17314A1e2;
    foundersTokensWallet = 0xf8b4Da46E85e43c47EBbF73ac8C6746fE3d3f111;
    advisorsTokensWallet = 0xA0B1Bd7827C070F29b5aBa47e7B73FF4EfA00a57;
    devTokensWallet = 0x8f840bB49CD83Baad5a228728b2a6edAc828f446;
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
