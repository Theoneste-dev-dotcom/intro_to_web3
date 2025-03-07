require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  networks: {
    ganache: {
      url: "http://127.0.0.1:7545",
      accounts: [
        "0xbf7caccf28c01a26433f7237167a8f0829b828476ac776d55a6f7c4d53690459"
      ],
    },
  },
  solidity: "0.8.0",
};