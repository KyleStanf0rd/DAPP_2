require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
  solidity: "0.8.9",
  networks: {
    rinkeby: {
      url: process.env.NODE_API_URL,
      accounts: [process.env.RINKEBY_PRIVATE_KEY],
    },
  },
};
