import { ethers } from "ethers";

import abi from "../utils/Keyboards.json";

const contractAddress = "0x06E0fC3D4fD709120fA8e199794B5bDF212Ff94F";
const contractABI = abi.abi;

export default function getKeyboardsContract(ethereum) {
  if (ethereum) {
    const provider = new ethers.providers.Web3Provider(ethereum);
    const signer = provider.getSigner();
    return new ethers.Contract(contractAddress, contractABI, signer);
  } else {
    return undefined;
  }
}
