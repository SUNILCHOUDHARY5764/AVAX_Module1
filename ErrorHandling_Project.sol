// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract errorHandling_vottingSystem {
    mapping(string => bool) public hasVoted;
    mapping(string => uint) public voteCount;

    function vote(string memory candidate ,uint age) external {
        ageVerify(age);

        require(!hasVoted[candidate], "You have already voted");

        voteCount[candidate] += 1;
        hasVoted[candidate] = true;

        assert(voteCount[candidate] > 0);
    }

    function ageVerify(uint age) public pure {
        if(age < 18) {
            revert("Not Eligible to Vote");
        }
    }
}
