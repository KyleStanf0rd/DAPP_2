// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Keyboards {
    enum KeyboardKind {
        SixtyPercent,
        SeventyFivePercent,
        EightyPercent,
        Iso105
    }

    struct Keyboard {
        KeyboardKind kind;
        bool isPBT;
        string filter;
        address owner;
    }

    event KeyboardCreated(Keyboard keyboard);
    //allows us to tell the users when they've recieved a tip on our site
    event TipSent(address recipient, uint256 amount);

    Keyboard[] public createdKeyboards;

    function getKeyboards() public view returns (Keyboard[] memory) {
        return createdKeyboards;
    }

    function create(
        KeyboardKind _kind,
        bool _isPBT,
        string calldata _filter
    ) external {
        Keyboard memory newKeyboard = Keyboard({
            kind: _kind,
            isPBT: _isPBT,
            filter: _filter,
            owner: msg.sender
        });
        createdKeyboards.push(newKeyboard);
        emit KeyboardCreated(newKeyboard);
    }

    function tip(uint256 _index) external payable {
        address payable owner = payable(createdKeyboards[_index].owner);
        owner.transfer(msg.value);
        emit TipSent(owner, msg.value);
    }
}
