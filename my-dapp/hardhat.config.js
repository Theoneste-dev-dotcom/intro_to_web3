require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  networks: {
    ganache: {
      url: "http://127.0.0.1:8545",
      accounts: [
        "0x4f7dd632dc2949833d630951005e526416eaa62614f7b4113c82461bdd799bea"
      ],
    },
  },
  solidity: "0.8.28",
};