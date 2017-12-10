<p align="center">
  <h1>KIT</h1>
  <img src="./logo.png">
</p>


* _Standart_        : ERC20
* _Name_            : KIT
* _Ticket_          : KIT
* _Decimals_        : 18
* _Emission_        : Mintable
* _Crowdsales_      : 2
* _Fiat dependency_ : No
* _Tokens locked_   : Locked

## Smart-contracts description

Contract mint bounty, advisors and founders tokens after each stage finished. 
Crowdsale contracts have special function to retrieve transferred in errors tokens.

### Contracts 
1. _KITToken_ - 
2. _Presale_ - 
3. _ICO_ - 
4. _Deployer_ - 

### How to manage contract
To start working with contract you should follow next steps:
1. Compile it in Remix with enamble optimization flag and compiler 0.4.18
2. Deploy bytecode with MyEtherWallet. Gas 5100000 (actually 5019453).
3. Call 'deploy' function on addres from (3). Gas 4000000 (actually 3979551). 

You can withdraw coins from presale at any time after softcap reached. You should call function _withdraw_ to do this. 
All coins from presale transferred to special eth wallet, which specified in presale configuration.

After each crowdsale stage contract manager must call finishMinting. 

If softcap not reached investors can retrieve coins by calling refund after presale finished.

### How to invest
To purchase tokens investor should send ETH (more than minimum 0.1 EHT) to corresponding crowdsale contract.
Recommended GAS: 200000, GAS PRICE - 21 Gwei.

### Wallets with ERC20 support
1. MyEtherWallet - https://www.myetherwallet.com/
2. Parity 
3. Mist/Ethereum wallet

EXODUS not support ERC20, but have way to export key into MyEtherWallet - http://support.exodus.io/article/128-how-do-i-receive-unsupported-erc20-tokens

Investor must not use other wallets, coinmarkets or stocks. Can lose money.

## Main network configuration

### Crowdsale stages

#### Presale
* _Base price_                 : 1000 KIT per ETH
* _Minimal insvested limit_    : 0.01 ETH
* _Softcap_                    : 20 ETH
* _Hardcap_                    : 63 000 ETH
* _Founders_                   : 10% of total tokens
* _Bounty_                     : 3% of total tokens
* _Advisors_                   : 1% of total tokens
* _Developers_                 : 4% of total tokens
* _Start_                      : Wed, 20 Dec 2017 13:00:00 GMT 
* _End_                        : Thu, 25 Jan 2018 13:00:00 GMT
* _Founders tokens wallet_     : 
* _Bounty tokens wallet_       : 
* _Advisors tokens wallet_     : 
* _Developers tokens wallet_   : 
* _Contract manager_           : 
* _ETH Wallets_                : 

_Milestones_

1. 1 week                      : +42%
2. 1 week                      : +25%
3. 1 week                      : +11%
3. other                       : without bonus

#### ICO
* _Base price_                 : 909 KIT per ETH
* _Minimal insvested limit_    : 0.01 ETH
* _Hardcap_                    : 67 500 ETH
* _Founders_                   : 10% of total tokens
* _Bounty_                     : 3% of total tokens
* _Advisors_                   : 1% of total tokens
* _Developers_                 : 4% of total tokens
* _Start_                      : Tue, 20 Feb 2018 13:00:00 GMT 
* _End_                        : Tue, 20 Mar 2018 13:00:00 GMT
* _Founders tokens wallet_     : 
* _Bounty tokens wallet_       : 
* _Advisors tokens wallet_     : 
* _Developers tokens wallet_   : 
* _Contract manager_           : 
* _ETH Wallets_                : 

_Milestones_
1. 1 week                      : +10%
2. 1 week                      : +5%
3. other                       : base price

## Ropsten network configuration

### Crowdsale stages

#### Presale
* _Base price_                 : 1000 KIT per ETH
* _Minimal insvested limit_    : 0.01 ETH
* _Softcap_                    : 20 ETH
* _Hardcap_                    : 63 000 ETH
* _Founders_                   : 10% of total tokens
* _Bounty_                     : 3% of total tokens
* _Advisors_                   : 1% of total tokens
* _Developers_                 : 4% of total tokens
* _Start_                      : Wed, 20 Dec 2017 13:00:00 GMT
* _End_                        : Thu, 25 Jan 2018 13:00:00 GMT
* _Founders tokens wallet_     : 0xf8b4Da46E85e43c47EBbF73ac8C6746fE3d3f111
* _Bounty tokens wallet_       : 0xDa67155b22973bE05Bcd28c07107b2E17314A1e2
* _Advisors tokens wallet_     : 0xA0B1Bd7827C070F29b5aBa47e7B73FF4EfA00a57
* _Developers tokens wallet_   : 0x8f840bB49CD83Baad5a228728b2a6edAc828f446
* _Contract manager_           : 0x55dd7A6353FC004B4F6Da9855F9403B35f4530B1
* _ETH Wallets_                : 0xd89626E2c4218281Ad0Fc5F22AE52dC0FF39DDC4
* _Developers wallet_          : 0x8f840bB49CD83Baad5a228728b2a6edAc828f446

_Milestones_

1. 1 week                      : +42%
2. 1 week                      : +25%
3. 1 week                      : +11%
3. other                       : without bonus

#### ICO
* _Base price_                 : 909 KIT per ETH
* _Minimal insvested limit_    : 0.01 ETH
* _Hardcap_                    : 67 500 ETH
* _Founders_                   : 10% of total tokens
* _Bounty_                     : 3% of total tokens
* _Advisors_                   : 1% of total tokens
* _Developers_                 : 4% of total tokens
* _Start_                      : Tue, 20 Feb 2018 13:00:00 GMT 
* _End_                        : Tue, 20 Mar 2018 13:00:00 GMT
* _Founders tokens wallet_     : 0xf8b4Da46E85e43c47EBbF73ac8C6746fE3d3f111
* _Bounty tokens wallet_       : 0xDa67155b22973bE05Bcd28c07107b2E17314A1e2
* _Advisors tokens wallet_     : 0xA0B1Bd7827C070F29b5aBa47e7B73FF4EfA00a57
* _Developers tokens wallet_   : 0x8f840bB49CD83Baad5a228728b2a6edAc828f446
* _Contract manager_           : 0x55dd7A6353FC004B4F6Da9855F9403B35f4530B1
* _ETH Wallets_                : 0xd89626E2c4218281Ad0Fc5F22AE52dC0FF39DDC4
* _Developers wallet_          : 0x8f840bB49CD83Baad5a228728b2a6edAc828f446

_Milestones_
1. 1 week                      : +10%
2. 1 week                      : +5%
3. other                       : base price

#### Links
* _Token_   - https://ropsten.etherscan.io/address/0xd57bb7b1a787ff9579c4d8b3855f0deca7e9d561
* _Presale_ - https://ropsten.etherscan.io/address/0xf7361a7c0afa1143fc6a7a772741f49c8f4b0ae0
* _ICO_     - https://ropsten.etherscan.io/address/0x16d42497d1c41c90e922c5a2a23eaf52cfacbe68

### Test audit (Presale)

#### Purchasers

* 0.01 Ether => 14.2 tokens, bonus = 42%, gas = 133365
https://ropsten.etherscan.io/tx/0x3d72a072e2dbfe873b1d427734ab6647d8d8fdf0503e2894eb204a0e03f5a02f
* Rejected refund during the presale, gas = 22260
https://ropsten.etherscan.io/tx/0x9f71e63f29cc55984dd769f1c909d215c816452e82dace7c3aaae732362a37ec
* 7 Ether => 8750 tokens, bonus = 25%, gas = 59187
https://ropsten.etherscan.io/tx/0x7b6e3c3da778f6d106f1aa5c5adfa92e3d8fcb8b6588bf4fd039b2c5a1fc9b78
* 0.01 Ether => 12.5 tokens, bonus = 25%, gas = 64504
https://ropsten.etherscan.io/tx/0x76a9a25c81d3567cfad16f1722ea0186af59ff86286c60a8b4a849e5e94a30a7
* Rejected purchase after the end of the presale, gas = 38861
https://ropsten.etherscan.io/tx/0x26ffe31e4e33c83f5956b13fc32616e49f3b60755f098b2bd0da80ba88cd2f15

#### Service operations
* Change the presale's start, gas = 28386
https://ropsten.etherscan.io/tx/0x2e15a55ea455a61f5eec330adff4ffb0d3e13ac0002d9176bf0878c286844d5a
* Change softcap, gas = 27238
https://ropsten.etherscan.io/tx/0xcba76ea504510c02a8a4600aa4123fd1a1ce71f6fced4d683ddf193fef77100d
* Finish minting, gas = 184591
https://ropsten.etherscan.io/tx/0xecad956ec8b7d38caf8d4e876c40d4bbc12843406b6fb91a894a1cd145f86372
* Withdraw, gas = 94890
https://ropsten.etherscan.io/tx/0x84c3752a75bdb320bc3fa37c3ddeba7c9b831ca64bf46529fd9bc5e27975ccba

### Test audit (ICO)

#### Purchasers
* 0.1 Ether => 99.99 tokens, bonus = 10%, gas = 89851
https://ropsten.etherscan.io/tx/0x173da1d366bc6996e625f0905b99ef8bafaa7c76acf04209b328ab1069a63826
* 1 Ether => 954.45 tokens, bonus = 5%, gas = 60673
https://ropsten.etherscan.io/tx/0x80ac08aa1a86af588cde748d8df887c74ca80faa4dd4fb83a317249bd133dd52
* Rejected purchase after the end of the ICO, gas = 21774
https://ropsten.etherscan.io/tx/0xf06e823abfbd9d94ed913252032c18835c0d9d4698368403b0bb27ac30727465

#### Service operations
* Change the ICO's start, gas = 28078
https://ropsten.etherscan.io/tx/0xcb7f2b33b646a4915c555d44b6ff08bdd84649b78e1e6ea53b48729af735749b
* Change the end time of the ICO, gas = 27735
https://ropsten.etherscan.io/tx/0x6af9be68b698407db3c85a91bf647aa5fa5d268aa6cbd8ff5edeef1ce503f0fd
* Finish minting, gas = 125497
https://ropsten.etherscan.io/tx/0x34a1ec4997a00c3f60dcd982ab55df33e7514c9636042b1d9033751f6bba1624

### Test audit (token transactions)
* Transfer from developers' wallet to investor's wallet, gas = 23048
https://ropsten.etherscan.io/tx/0x5b174ff12d72cab7c37ac3e264c651b1c0a8898e2ba2a4bd9d5052df0a73dcd7


