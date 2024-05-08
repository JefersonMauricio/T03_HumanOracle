// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract HumanOracle {
    address public oracle;
    mapping(bytes32 => bool) public isAnswered;
    mapping(bytes32 => string) public answers;

    constructor() {
        oracle = msg.sender;
    }

    function askQuestion(bytes32 _questionId) public {
        require(msg.sender == oracle, "Only oracle can ask questions");
        isAnswered[_questionId] = false;
    }

    function giveAnswer(bytes32 _questionId, string memory _answer) public {
        require(msg.sender == oracle, "Only oracle can give answers");
        isAnswered[_questionId] = true;
        answers[_questionId] = _answer;
    }
}