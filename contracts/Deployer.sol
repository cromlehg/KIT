pragma solidity ^0.4.18;

import './ownership/Ownable.sol';
import './KITToken.sol';
import './Presale.sol';
import './ICO.sol';


contract Deployer is Ownable {

  Presale public presale;

  ICO public ico;

  KITToken public token;

  function deploy() public onlyOwner {
    owner = 0x55dd7A6353FC004B4F6Da9855F9403B35f4530B1;
    // owner = msg.sender;

    token = new KITToken();

    presale = new Presale();
    presale.setToken(token);
    token.setSaleAgent(presale);
    presale.setMinInvestedLimit(10000000000000000);
    presale.setPrice(1000000000000000000000);
    presale.setBountyTokensPercent(3);
    presale.setAdvisorsTokensPercent(1);
    presale.setDevTokensPercent(4);
    presale.setFoundersTokensPercent(10);
    presale.setSoftcap(20000000000000000000);
    presale.setHardcap(63000000000000000000000);
    presale.addBonus(7,42);
    presale.addBonus(7,25);
    presale.addBonus(7,11);
    presale.setStart(1513774800);
    presale.setEnd(1516885200);
    presale.setDevLimit(6000000000000000000);

    presale.setWallet(0xd89626E2c4218281Ad0Fc5F22AE52dC0FF39DDC4);
    presale.setDevWallet(0x8f840bB49CD83Baad5a228728b2a6edAc828f446);

    presale.setBountyTokensWallet(0xDa67155b22973bE05Bcd28c07107b2E17314A1e2);
    presale.setFoundersTokensWallet(0xf8b4Da46E85e43c47EBbF73ac8C6746fE3d3f111);
    presale.setAdvisorsTokensWallet(0xA0B1Bd7827C070F29b5aBa47e7B73FF4EfA00a57);
    presale.setDevTokensWallet(0x8f840bB49CD83Baad5a228728b2a6edAc828f446);

    ico = new ICO();
    ico.setToken(token);
    presale.setNextSaleAgent(ico);
    ico.setMinInvestedLimit(10000000000000000);
    ico.setPrice(909000000000000000000);
    ico.setBountyTokensPercent(3);
    ico.setAdvisorsTokensPercent(1);
    ico.setDevTokensPercent(4);
    ico.setFoundersTokensPercent(10);
    ico.setHardcap(67500000000000000000000);
    ico.addBonus(7,10);
    ico.addBonus(7,5);
    ico.setStart(1519131600);
    ico.setEnd(1521550800);
    ico.setWallet(0xd89626E2c4218281Ad0Fc5F22AE52dC0FF39DDC4);
    ico.setBountyTokensWallet(0xDa67155b22973bE05Bcd28c07107b2E17314A1e2);
    ico.setFoundersTokensWallet(0xf8b4Da46E85e43c47EBbF73ac8C6746fE3d3f111);
    ico.setAdvisorsTokensWallet(0xA0B1Bd7827C070F29b5aBa47e7B73FF4EfA00a57);
    ico.setDevTokensWallet(0x8f840bB49CD83Baad5a228728b2a6edAc828f446);

    presale.lockChanges();
    ico.lockChanges();

    presale.transferOwnership(owner);
    ico.transferOwnership(owner);
    token.transferOwnership(owner);
  }

}

