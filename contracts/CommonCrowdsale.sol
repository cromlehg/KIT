pragma solidity ^0.4.18;

import './ownership/Ownable.sol';
import './math/SafeMath.sol';
import './lifecycle/LockableChanges.sol';
import './KITToken.sol';


contract CommonCrowdsale is Ownable, LockableChanges {

  using SafeMath for uint256;

  uint public constant PERCENT_RATE = 100;

  uint public price;

  uint public minInvestedLimit;

  uint public hardcap;

  uint public start;

  uint public end;

  uint public invested;

  uint public minted;

  address public wallet;

  address public bountyTokensWallet;

  address public devTokensWallet;

  address public advisorsTokensWallet;

  address public foundersTokensWallet;

  uint public bountyTokensPercent;

  uint public devTokensPercent;

  uint public advisorsTokensPercent;

  uint public foundersTokensPercent;

  address public directMintAgent;

  struct Bonus {
    uint periodInDays;
    uint bonus;
  }

  Bonus[] public bonuses;

  KITToken public token;

  modifier saleIsOn() {
    require(msg.value >= minInvestedLimit && now >= start && now < end && invested < hardcap);
    _;
  }

  function setHardcap(uint newHardcap) public onlyOwner {
    hardcap = newHardcap;
  }

  function setStart(uint newStart) public onlyOwner {
    start = newStart;
  }

  function setBountyTokensPercent(uint newBountyTokensPercent) public onlyOwner {
    bountyTokensPercent = newBountyTokensPercent;
  }

  function setAdvisorsTokensPercent(uint newAdvisorsTokensPercent) public onlyOwner {
    advisorsTokensPercent = newAdvisorsTokensPercent;
  }

  function setDevTokensPercent(uint newDevTokensPercent) public onlyOwner {
    devTokensPercent = newDevTokensPercent;
  }

  function setFoundersTokensPercent(uint newFoundersTokensPercent) public onlyOwner {
    foundersTokensPercent = newFoundersTokensPercent;
  }

  function setBountyTokensWallet(address newBountyTokensWallet) public onlyOwner {
    bountyTokensWallet = newBountyTokensWallet;
  }

  function setAdvisorsTokensWallet(address newAdvisorsTokensWallet) public onlyOwner {
    advisorsTokensWallet = newAdvisorsTokensWallet;
  }

  function setDevTokensWallet(address newDevTokensWallet) public onlyOwner {
    devTokensWallet = newDevTokensWallet;
  }

  function setFoundersTokensWallet(address newFoundersTokensWallet) public onlyOwner {
    foundersTokensWallet = newFoundersTokensWallet;
  }

  function setEnd(uint newEnd) public onlyOwner {
    require(start < newEnd);
    end = newEnd;
  }

  function setToken(address newToken) public onlyOwner {
    token = KITToken(newToken);
  }

  function setWallet(address newWallet) public onlyOwner {
    wallet = newWallet;
  }

  function setPrice(uint newPrice) public onlyOwner {
    price = newPrice;
  }

  function setMinInvestedLimit(uint newMinInvestedLimit) public onlyOwner {
    minInvestedLimit = newMinInvestedLimit;
  }

  function bonusesCount() public constant returns(uint) {
    return bonuses.length;
  }

  function addBonus(uint limit, uint bonus) public onlyOwner {
    bonuses.push(Bonus(limit, bonus));
  }

  modifier onlyDirectMintAgentOrOwner() {
    require(directMintAgent == msg.sender || owner == msg.sender);
    _;
  }

  function setDirectMintAgent(address newDirectMintAgent) public onlyOwner {
    directMintAgent = newDirectMintAgent;
  }

  function directMint(address to, uint investedWei) public onlyDirectMintAgentOrOwner saleIsOn {
    calculateAndTransferTokens(to, investedWei);
  }

  function mintExtendedTokens() internal {
    uint extendedTokensPercent = bountyTokensPercent.add(devTokensPercent).add(advisorsTokensPercent).add(foundersTokensPercent);
    uint extendedTokens = minted.mul(extendedTokensPercent).div(PERCENT_RATE.sub(extendedTokensPercent));
    uint summaryTokens = extendedTokens.add(minted);

    uint bountyTokens = summaryTokens.mul(bountyTokensPercent).div(PERCENT_RATE);
    mintAndSendTokens(bountyTokensWallet, bountyTokens);

    uint advisorsTokens = summaryTokens.mul(advisorsTokensPercent).div(PERCENT_RATE);
    mintAndSendTokens(advisorsTokensWallet, advisorsTokens);

    uint foundersTokens = summaryTokens.mul(foundersTokensPercent).div(PERCENT_RATE);
    mintAndSendTokens(foundersTokensWallet, foundersTokens);

    uint devTokens = extendedTokens.sub(bountyTokens).sub(advisorsTokens).sub(foundersTokens);
    mintAndSendTokens(devTokensWallet, devTokens);
  }

  function mintAndSendTokens(address to, uint amount) internal {
    token.mint(to, amount);
    minted = minted.add(amount);
  }

  function calculateAndTransferTokens(address to, uint investedInWei) internal {
    // update invested value
    invested = invested.add(investedInWei);

    // calculate tokens
    uint tokens = msg.value.mul(price).div(1 ether);
    uint bonus = getBonus();
    if (bonus > 0) {
      tokens = tokens.add(tokens.mul(bonus).div(100));
    }

    // transfer tokens
    mintAndSendTokens(to, tokens);
  }

  function getBonus() public constant returns(uint) {
    uint prevTimeLimit = start;
    for (uint i = 0; i < bonuses.length; i++) {
      Bonus storage bonus = bonuses[i];
      prevTimeLimit += bonus.periodInDays * 1 days;
      if (now < prevTimeLimit)
        return bonus.bonus;
    }
    return 0;
  }

  function createTokens() public payable;

  function() external payable {
    createTokens();
  }

  function retrieveTokens(address anotherToken) public onlyOwner {
    ERC20 alienToken = ERC20(anotherToken);
    alienToken.transfer(wallet, alienToken.balanceOf(this));
  }

}
