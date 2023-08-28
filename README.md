# DEGEN Token Smart Contract

This is a blockchain project made with Solidity on the Avalanche Network. This program creates an ERC20 Token that can be minted by the owner and transferred. The tokens can be used to redeem NFTs on the network 
## Description

This program is a smart contract written in Solidity, a programming language used for developing smart contracts. The is an ERC20 Token contract and has functions inherited from the OpenZepplin Library that provide secure standards to create contracts. The contract contains functions like Transfer, Mint, Allow, BalanceOf, Owner, Symbol, Name, etc. On top of that I have created an NFT collection where only owner can add the NFTs and other people can use their DGN token to redeem the NFTs.

## Getting Started

### Executing program
_Add your private key and Snowtrace API inside the **hardhat.config.js** file._
  
- Inside the project directory, in the terminal type: npm i
- Open two additional terminals in your VS code
- In the second terminal type: ```npx hardhat node```
- In the third terminal, type: ```npx hardhat run scripts/deploy.js --network fuji```
- To verify the smart contract run: ```npx hardhat verify <Contract Address> --network fuji```
  

## Authors

Sritam Biswal
