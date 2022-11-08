//SPDX-License-Identifier: MIT


contract ASAP{
    mapping(address => bytes32) hashes;

    function setHash(string memory hash)public{
        hashes[msg.sender]=keccak256(abi.encode(hash));
    }

    function GetHash(address owner)public view returns(bytes32){
        require(msg.sender == owner,'Only owner can call');
        return hashes[msg.sender];
    }
}