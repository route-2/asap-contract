const { expect } = require("chai");
const { ethers } = require("hardhat");

describe( "Sample", function(){
  async function deployContract() {
    const [owner] = await ethers.getSigners();
    const Contract = await ethers.getContractFactory("Contract");
    const contract = await Contract.deploy();
    await contract.deployed();
    return contract;
}


})



describe("Greeter", function (deployContract) {
  it("Should return the new greeting once it's changed", async function () {
    const Greeter = await ethers.getContractFactory("Greeter");
    const greeter = await Greeter.deploy("Hello, world!");
    await greeter.deployed();

    expect(await greeter.greet()).to.equal("Hello, world!");

    const setGreetingTx = await greeter.setGreeting("Hola, mundo!");

    // wait until the transaction is mined
    await setGreetingTx.wait();

    expect(await greeter.greet()).to.equal("Hola, mundo!");
  });
});
