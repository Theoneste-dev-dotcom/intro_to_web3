git clone <git repo uri>

-- in palent folder
run the following command


Step 1: Connect MetaMask to Ganache

Open MetaMask.

Click on the network dropdown (top-right) and select Add Network.
Choose "Add a network manually" and enter the following details:

Network Name: Ganache
New RPC URL: http://127.0.0.1:8545  // replace with your ganache local server
Chain ID: 1337
Currency Symbol: ETH
Block Explorer URL: (Leave blank)

Import an Account

run in you terminal

ganache-cli


In MetaMask, go to Import Account.
Copy one of the private keys from Ganache and paste it into MetaMask.
Now MetaMask is connected to Ganache and has test ETH from the generated accounts.


You can create your own web3 project with

mkdir my-dapp && cd my-dapp
npm init -y
npm install --save-dev hardhat
npx hardhat



npm install --save-dev @nomicfoundation/hardhat-toolbox
npm install ethers hardhat-deploy dotenv

-- in harhat.config.js  should be formated like this


require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  networks: {
    ganache: {
      url: "http://127.0.0.1:8545", // replace with  the url for your ganache cli 
      accounts: [
        "0x02920119569394fb6c72d099218740384428b157f3a3e8061869756b7e3628e2",
        "0x217adf422ae686101582c9f5803f360c793c9216398ae6712548bbb495e1606c",
      ],
    },
  },
  solidity: "0.8.20",
};



the compile and deploy you smart contract with this deploy.js

const hre = require("hardhat");

async function main() {
  const SimpleStorage = await hre.ethers.getContractFactory("SimpleStorage");
  const simpleStorage = await SimpleStorage.deploy();

  await simpleStorage.waitForDeployment(); // FIXED

  console.log(`SimpleStorage deployed to: ${await simpleStorage.getAddress()}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});



run this command


npx hardhat compile
npx hardhat run scripts/deploy.js --network ganache




