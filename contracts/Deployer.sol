pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import './GENSharesToken.sol';
import './Presale.sol';
import './ICO.sol';

contract Deployer is Ownable {

  Presale public presale;  
 
  ICO public ico;

  GENSharesToken public token;

  function deploy() public onlyOwner {
    owner = 0x379264aF7df7CF8141a23bC989aa44266DDD2c62;  
      
    token = new GENSharesToken();
    
    presale = new Presale();
    presale.setToken(token);
    token.setSaleAgent(presale);
    presale.setMinInvestedLimit(100000000000000000);  
    presale.setPrice(250000000000000000000);
    presale.setBountyTokensPercent(4);
    presale.setAdvisorsTokensPercent(2);
    presale.setDevTokensPercent(10);
    presale.setSoftcap(40000000000000000000);
    presale.setHardcap(50000000000000000000000);
    presale.addBonus(7,50);
    presale.addBonus(7,40);
    presale.addBonus(100,35);
    presale.setStart(1511571600);
    presale.setEnd(1514156400);    
    presale.setDevLimit(6000000000000000000);
    presale.setWallet(0x4bB656423f5476FeC4AA729aB7B4EE0fc4d0B314);
    presale.setBountyTokensWallet(0xcACBE5d8Fb017407907026804Fe8BE64B08511f4);
    presale.setDevTokensWallet(0xa20C62282bEC52F9dA240dB8cFFc5B2fc8586652);
    presale.setAdvisorsTokensWallet(0xD3D85a495c7E25eAd39793F959d04ACcDf87e01b);
    presale.setDevWallet(0xEA15Adb66DC92a4BbCcC8Bf32fd25E2e86a2A770);

    ico = new ICO();
    ico.setToken(token); 
    presale.setNextSaleAgent(ico);
    ico.setMinInvestedLimit(100000000000000000);
    ico.setPrice(250000000000000000000);
    ico.setBountyTokensPercent(4);
    ico.setAdvisorsTokensPercent(2);
    ico.setDevTokensPercent(10);

    ico.setHardcap(206000000000000000000000);
    ico.addBonus(7,25);
    ico.addBonus(7,10);
    ico.setStart(1514163600);
    ico.setEnd(1517356800);
    ico.setWallet(0x65954fb8f45b40c9A60dffF3c8f4F39839Bf3596);
    ico.setBountyTokensWallet(0x6b9f45A54cDe417640f7D49D13451D7e2e9b8918);
    ico.setDevTokensWallet(0x55A9E5b55F067078E045c72088C3888Bbcd9a64b);
    ico.setAdvisorsTokensWallet(0x3e11Ff0BDd160C1D85cdf04e012eA9286ae1A964);

    presale.lockChanges();
    ico.lockChanges();
    
    presale.transferOwnership(owner);
    ico.transferOwnership(owner);
    token.transferOwnership(owner);
  }

}

