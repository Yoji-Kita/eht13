pragma solidity ^0.4.24;

contract ERC865 {

  string public name = "";
  string public symbol = "";
  uint256 public decimals = 18;
  uint256 public totalSupply = 20000000000000000000000000;

  event Transfer(address indexed from, address indexed to, uint256 value);

  mapping (address => uint256) balances; //ERC20
  mapping(bytes => bool) signatures; //ERC865

  constructor() public {
    balances[msg.sender] = totalSupply;
  }
  
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender]);

    balances[msg.sender] = balances[msg.sender] - _value;
    balances[_to] = balances[_to] + _value;
    emit Transfer(msg.sender, _to, _value);
    return true;
  }

  function balanceOf(address _owner) public view returns (uint256 balance) {
    return balances[_owner];
  }
  
  function transferPreSigned(bytes _signature, address _to, uint256 _value, uint256 _fee, uint256 _nonce) public returns (bool) {
    // Let's Hack Here
  }

  function hash(address _token, address _to, uint256 _value, uint256 _fee, uint256 _nonce) public pure returns (bytes32) {
    return keccak256(abi.encodePacked(_token, _to, _value, _fee, _nonce));
  }

  function recover(bytes32 _hash, bytes sig) public pure returns (address) {
    bytes32 r;
    bytes32 s;
    uint8 v;

    //Check the signature length
    if (sig.length != 65) {
      return (address(0));
    }

    // Divide the signature in r, s and v variables
    assembly {
      r := mload(add(sig, 32))
      s := mload(add(sig, 64))
      v := byte(0, mload(add(sig, 96)))
    }

    // Version of signature should be 27 or 28, but 0 and 1 are also possible versions
    if (v < 27) {
      v += 27;
    }

    // If the version is correct return the signer address
    if (v != 27 && v != 28) {
      return (address(0));
    } else {
      return ecrecover(_hash, v, r, s);
    }
  }
}



