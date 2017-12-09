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
    wallet = 0xd89626E2c4218281Ad0Fc5F22AE52dC0FF39DDC4;
    devWallet = 0x8f840bB49CD83Baad5a228728b2a6edAc828f446;
    bountyTokensWallet = 0xDa67155b22973bE05Bcd28c07107b2E17314A1e2;
    foundersTokensWallet = 0xf8b4Da46E85e43c47EBbF73ac8C6746fE3d3f111;
    advisorsTokensWallet = 0xA0B1Bd7827C070F29b5aBa47e7B73FF4EfA00a57;
    devTokensWallet = 0x8f840bB49CD83Baad5a228728b2a6edAc828f446;
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

  function widthrawDev() public {
    require(softcapAchieved);
    require(devWallet == msg.sender || owner == msg.sender);
    if (!devWithdrawn) {
      devWithdrawn = true;
      devWallet.transfer(devLimit);
    }
  }

  function widthraw() public {
    require(softcapAchieved);
    require(owner == msg.sender);
    widthrawDev();
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
