// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './ERC721.sol';

contract ERC721Enumerable is ERC721 {

    uint256[] private _allTokens;

    mapping(uint256 => uint256) private _allTokenIndex;
    mapping(uint256 => uint256) private _ownedTokensIndex;
    mapping(address => uint256[]) private _ownedToken;

    function totalSupply() public view returns (uint256) {
        return _allTokens.length;
    }

    function _mint(address to, uint256 tokenId) internal override(ERC721) {
        super._mint(to, tokenId);

        _addTokensToTotalSupply(tokenId);
    }

    function _addTokensToTotalSupply(uint256 tokenId) private {
        _allTokens.push(tokenId);
    }

}