// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {
    // Event emitted when NFT is successfully redeemed
    event NftRedeemed(address indexed redeemer, string nftName, uint256 price);

    // NFT Structure
    struct NFT {
        uint256 ID;
        string nftName;
        uint256 price;
    }

    // Mapping an NFT with ID
    mapping(uint256 => NFT) public nftList;
    uint256 public nftCount; // NFT Count

    // Constructor to initialize the token
    constructor() ERC20("DEGEN", "DGN") {}

    // Mint tokens (same as before)
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Adding an NFT to the list
    function addNft(string memory _nftName, uint256 _price) external onlyOwner {
        nftCount++;
        NFT memory nft = NFT(nftCount, _nftName, _price);
        nftList[nftCount] = nft;
    }

    // Redeeming Tokens for an NFT
    function redeem(uint256 _ID) external {
        require(_ID > 0 && _ID <= nftCount, "Invalid NFT ID");
        NFT memory redeemNft = nftList[_ID];

        require(balanceOf(msg.sender) >= redeemNft.price, "Insufficient Balance");

        _transfer(msg.sender, owner(), redeemNft.price);
        emit Transfer(msg.sender, address(0), redeemNft.price);

        emit NftRedeemed(msg.sender, redeemNft.nftName, redeemNft.price);
    }
}
