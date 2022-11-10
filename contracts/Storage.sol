//SPDX-License-Identifier: MIT


contract Storage {

mapping(address => mapping (address=>string) ) public  nested ;
 mapping(address => bool ) public check;
function setKeys(address owner, address nestedAddress, string memory hashes)public{
    nested[owner][nestedAddress]=hashes;
    check[owner]=true;
   require(check[owner] == true, 'No hash found');
}




}