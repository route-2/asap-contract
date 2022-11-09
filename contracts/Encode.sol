//SPDX-License-Identifier: MIT


contract ASAP{
    mapping(address => bytes32) hashes;
     mapping(address => mapping (address => bool)) public nested ;
     mapping(address => uint256 ) public check;

    function setHash(string memory hash)public{
        hashes[msg.sender]=keccak256(abi.encode(hash));
        uint x = check[msg.sender];
        check[msg.sender] = x+1;
    }

    function GetHash(address owner)public view returns(bytes32){
        require(msg.sender == owner || nested[owner][msg.sender] == true, 'Only owner can call');
         require(check[msg.sender] <= 1, 'No hash found');
       
        return hashes[owner];
       
        
    }
    function removeAccess(address owner, address nestedAddress)public{
        require(msg.sender == owner, 'Only owner can call');
        nested[msg.sender][nestedAddress] = false;
    }


   


    function setNested(address owner, address nestedAddress)public{
        nested[owner][nestedAddress]=true;

       
     


    }
}