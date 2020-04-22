pragma solidity ^0.5.12;
import "../coffeebase/SupplyChain.sol";

/// Provides basic authorization control
contract Ownable is SupplyChain {
    address payable private origOwner;

    // Define an Event
    event TransferOwnership(address indexed oldOwner, address indexed newOwner);

    /// Assign the contract to an owner
    constructor () public payable {
        origOwner = msg.sender;
        emit TransferOwnership(address(0), origOwner);
    }

    /// Look up the address of the owner
    function getOwner() public view returns (address) {
        return origOwner;
    }

    /// Define a function modifier 'onlyOwner'
    modifier onlyOwner() {
        require(isOwner(), 'ACCESS DENIED');
        _;
    }

    function kill() public {
        if (msg.sender == origOwner) {
            selfdestruct(origOwner);
        }
    }

    /// Check if the calling address is the owner of the contract
    function isOwner() public view returns (bool) {
        return msg.sender == origOwner;
    }

    /// Define a function to renounce ownerhip
    function renounceOwnership() public onlyOwner {
        emit TransferOwnership(origOwner, address(0));
        origOwner = address(0);
    }

    /// Define a public function to transfer ownership
    function transferOwnership(address payable newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    /// Define an internal function to transfer ownership
    function _transferOwnership(address payable newOwner) internal {
        require(newOwner != address(0), 'NEW ADDRESS INVALID');
        emit TransferOwnership(origOwner, newOwner);
        origOwner = newOwner;
    }
}
