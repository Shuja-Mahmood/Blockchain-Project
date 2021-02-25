pragma solidity ^0.4.22;
pragma experimental ABIEncoderV2;       //needed this for the string array

contract Blogger
{
    // To represent our single blogger
    struct  poster {
        bool allowed;               // is this person allowed to post or not
        string email;       // blogger's email 
        string username;    // Blogger's name

    }
    
    // this is a type for a single message.
    struct message{
        uint upVote;    // number of upvotes
        uint downVote;  // number of downvotes
        string text;    // blogger's blog message
    }
    
    // This declares a state variable that stores a `Poster` struct for each possible address.
    address  moderator;
    mapping (address => poster)  usermap;
    
    // A dynamic array of messages
    message[] public messages;
    poster[] public posters; 
    // create a new post to choose a 'blogger name'
    
    constructor(string msgs, string name, string mail)  public {
        moderator = msg.sender;
        usermap[moderator].allowed = true;
        messages.push(message({ text: msgs, upVote: 0, downVote: 0}));
        posters.push(poster({ username: name, email: mail, allowed: true}));
    }
    
    function uVote(uint vt) public {
        messages[vt].upVote += 1;
    }
    
    function dVote(uint vt) public {
        messages[vt].downVote += 1;
    }
    
    
    function TopPost() public view returns (uint tp)
    {
        uint TopMostPost = 0;
        for (uint p = 0; p < messages.length; p++)
        {
            if((messages[p].upVote-messages[p].downVote) > TopMostPost )
            {
                TopMostPost = messages[p].upVote-messages[p].downVote;
                tp = p;
            }
        }
    }
    
    
    function getAllPosts() public view returns (message[] memory) 
    {
        return messages;        //returning the corresponding user's data
    }

    function getUsers() public view returns (poster[] memory)
    {
        return posters;        //returning the corresponding user's name
    }
}


//tried it here
//https://remix.ethereum.org/#optimize=false&runs=200&evmVersion=null&version=soljson-v0.5.17+commit.d19bba13.js
