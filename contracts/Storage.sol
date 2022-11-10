//SPDX-License-Identifier: MIT


contract Storage {

mapping(address =>string)  public  nested ;
 mapping(address => bool ) public check;
function setKeys(address owner, string memory hashes)public{
  nested[owner]=hashes;
    check[owner]=true;
   require(check[owner] == true && msg.sender == owner, 'No hash found');
}




}