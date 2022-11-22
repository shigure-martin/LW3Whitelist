pragma solidity ^0.8.0;

/// @title A title that should describe the contract/interface
/// @author The name of the author
/// @notice Explain to an end user what this does
/// @dev Explain to a developer any extra details

contract Whitelist {
    uint8 public maxWhitelistedAddress;

    mapping(address => bool) public whitelistedAddresses;

    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddress) {
        maxWhitelistedAddress = _maxWhitelistedAddress;
    }

    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");

        require(numAddressesWhitelisted < maxWhitelistedAddress, "More addresses cant be added, limit reached");

        whitelistedAddresses[msg.sender] = true;

        numAddressesWhitelisted += 1;
    }
}