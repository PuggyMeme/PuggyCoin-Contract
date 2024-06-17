// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "../../security/Pausable.sol";

contract PuggyCoin is ERC20 , ERC20Burnable , Ownable , PuggyPausable{

    constructor() ERC20 ( "PUGGY Coin" , "PUGGY" )  {
        _mint (msg.sender , 88888888888 * (10 ** decimals()));
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpaused() public onlyOwner {
        _unpause();
    }

    function addrpause(address _pauseaddress) public onlyOwner {
        _addresspause(_pauseaddress);
    }

    function addrunpause(address _pauseaddress) public onlyOwner {
        _addressunpause(_pauseaddress);
    }    
    
    function _beforeTokenTransfer(address from, address to, uint256 amount) 
        internal  
        whenNotPaused
        whenNotAddressPaused(from)
        override(ERC20)
    {
        super._beforeTokenTransfer(from , to , amount);
    }
}
