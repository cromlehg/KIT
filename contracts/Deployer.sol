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
    owner = 0x69F5C3850D1f1d5BAeAe71E947e915A539088Bb0;

    token = new KITToken();

    presale = new Presale();
    presale.setToken(token);
    token.setSaleAgent(presale);

    ico = new ICO();
    ico.setToken(token);
    presale.setNextSaleAgent(ico);

    presale.lockChanges();
    ico.lockChanges();

    presale.transferOwnership(owner);
    ico.transferOwnership(owner);
    token.transferOwnership(owner);
  }

}

