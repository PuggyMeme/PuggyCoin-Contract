import "@openzeppelin/contracts/security/Pausable.sol";

abstract contract PuggyPausable is Pausable{

    mapping (address => bool) _addresspaused;

    event addresspause (address pauseaddress , bool bPaused);
    event addressunpause (address pauseaddress , bool bUnPaused);

    modifier whenNotAddressPaused(address _pauseaddress) {
        require(!addresspaused(_pauseaddress) , "PuggyPausable: address paused");
        _;
    }

    modifier whenAddressPaused (address _pauseaddress) {
        require(addresspaused(_pauseaddress) , "PuggyPausable: address not paused");
        _;
    }

    function addresspaused(address _pauseaddress) public view virtual returns (bool) {
        return _addresspaused[_pauseaddress];
    }

    function _addresspause(address _pauseaddress) internal virtual whenNotAddressPaused( _pauseaddress) {
        _addresspaused[_pauseaddress] = true;
        emit addresspause (_pauseaddress , true);
    }

    function _addressunpause(address _pauseaddress) internal virtual whenAddressPaused(_pauseaddress) {
        _addresspaused[_pauseaddress] = false;
        emit addressunpause(_pauseaddress , false);
    }

}

