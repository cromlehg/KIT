pragma solidity ^0.4.18;

import './CommonCrowdsale.sol';


contract Presale is CommonCrowdsale {

  uint public devLimit;

  uint public softcap;

  bool public refundOn;

  bool public softcapAchieved;

  bool public devWithdrawn;

  address public devWallet;

  address public nextSaleAgent;

  mapping (address => uint) public balances;

  function Presale() public {
    minInvestedLimit = 10000000000000000;
    price = 1000000000000000000000;
    bountyTokensPercent = 3;
    advisorsTokensPercent = 1;
    devTokensPercent = 4;
    foundersTokensPercent = 10;
    softcap = 20000000000000000000;
    hardcap = 63000000000000000000000;
    addBonus(7,42);
    addBonus(7,25);
    addBonus(7,11);
    start = 1513774800;
    end = 1516885200;
    devLimit = 7000000000000000000;
    wallet = 0x72EcAEB966176c50CfFc0Db53E4A2D3DbC0d538B;
    devWallet = 0xEA15Adb66DC92a4BbCcC8Bf32fd25E2e86a2A770;
    bountyTokensWallet = 0x7E513B54e3a45B60d6f92c6CECE10C68977EEA8c;
    foundersTokensWallet = 0x4227859C5A9Bb4391Cc4735Aa655e980a3DD4380;
    advisorsTokensWallet = 0x6e740ef8618A7d822238F867c622373Df8B54a22;
    devTokensWallet = 0xCaDca9387E12F55997F46870DA28F0af1626A6d4;
  }

  function setNextSaleAgent(address newNextSaleAgent) public onlyOwner {
    nextSaleAgent = newNextSaleAgent;
  }

  function setSoftcap(uint newSoftcap) public onlyOwner {
    softcap = newSoftcap;
  }

  function setDevWallet(address newDevWallet) public onlyOwner notLocked {
    devWallet = newDevWallet;
  }

  function setDevLimit(uint newDevLimit) public onlyOwner notLocked {
    devLimit = newDevLimit;
  }

  function refund() public {
    require(now > start && refundOn && balances[msg.sender] > 0);
    uint value = balances[msg.sender];
    balances[msg.sender] = 0;
    msg.sender.transfer(value);
  }

  function createTokens() public payable saleIsOn {
    balances[msg.sender] = balances[msg.sender].add(msg.value);
    calculateAndTransferTokens(msg.sender, msg.value);
    if (!softcapAchieved && invested >= softcap) {
      softcapAchieved = true;
    }
  }

  function withdrawDev() public {
    require(softcapAchieved);
    require(devWallet == msg.sender || owner == msg.sender);
    if (!devWithdrawn) {
      devWithdrawn = true;
      devWallet.transfer(devLimit);
    }
  }

  function withdraw() public {
    require(softcapAchieved);
    require(owner == msg.sender);
    withdrawDev();
    wallet.transfer(this.balance);
  }

  function finishMinting() public onlyOwner {
    if (!softcapAchieved) {
      refundOn = true;
      token.finishMinting();
    } else {
      mintExtendedTokens();
      token.setSaleAgent(nextSaleAgent);
    }
  }

}
