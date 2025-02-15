require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  networks: {
    ganache: {
      url: "http://127.0.0.1:8545",
      accounts: [
        "0x02920119569394fb6c72d099218740384428b157f3a3e8061869756b7e3628e2",
        "0x217adf422ae686101582c9f5803f360c793c9216398ae6712548bbb495e1606c",
      ],
    },
  },
  solidity: "0.8.28",
};