pragma solidity ^0.5.16;
pragma experimental ABIEncoderV2;       //needed this for the string array

contract Contract1
{
    string[] private data;
    string[] private username;

    function getUserData() public view returns (string[] memory) 
    {
        return data;        //returning the corresponding user's data
    }

    function getUserN() public view returns (string [] memory)
    {
        return username;        //returning the corresponding user's name
    }

    function setData(string memory newData, string memory newUser) public
    {
        data.push(newData);       //pushing data into the array
        username.push(newUser);       //pushing corresponding user into the array
    }
}


//tried it here
//https://remix.ethereum.org/#optimize=false&runs=200&evmVersion=null&version=soljson-v0.5.17+commit.d19bba13.js
