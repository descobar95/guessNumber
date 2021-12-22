contract GuessNumber {

    address private player;
    uint prize;
    uint shuffleNumber;

    event Number(uint randomNumber, uint guessNumber, uint prize);

    function guess(uint guessNumber) public payable {
        uint randomNumber = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender))) % 10 + 1;

        if(guessNumber == randomNumber){
            player = msg.sender;
            prize = 1000000000000000000;
        }
        emit Number(randomNumber,guessNumber,prize);
    }
}