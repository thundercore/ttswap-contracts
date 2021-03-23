pragma solidity ^0.5.0;

import "./UniswapExchange.sol";
import "../interfaces/IUniswapExchange.sol";


contract UniswapFactory {

  /***********************************|
  |       Events And Variables        |
  |__________________________________*/

  event NewExchange(address indexed token, address indexed exchange);

  address public exchangeTemplate;
  uint256 public tokenCount;
  mapping (address => address) internal token_to_exchange;
  mapping (address => address) internal exchange_to_token;
  mapping (uint256 => address) internal id_to_token;

  /***********************************|
  |         Factory Functions         |
  |__________________________________*/

  function initializeFactory(address template) public {
    require(exchangeTemplate == address(0));
    require(template != address(0));
    exchangeTemplate = template;
  }
  
  function createExchange(address token) public returns (address) {
    require(token != address(0));
    require(exchangeTemplate != address(0));
    require(token_to_exchange[token] == address(0));
    address payable newEx = address(uint160(createClone(exchangeTemplate)));
    UniswapExchange exchange = UniswapExchange(newEx);
    exchange.setup(token);
    token_to_exchange[token] = address(exchange);
    exchange_to_token[address(exchange)] = token;
    uint256 token_id = tokenCount + 1;
    tokenCount = token_id;
    id_to_token[token_id] = token;
    emit NewExchange(token, address(exchange));
    return address(exchange);
  }

  function createClone(address target) internal returns (address result) {
    bytes20 targetBytes = bytes20(target);
    assembly {
      let clone := mload(0x40)
      mstore(clone, 0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000)
      mstore(add(clone, 0x14), targetBytes)
      mstore(add(clone, 0x28), 0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000)
      result := create(0, clone, 0x37)
    }
  }

  /***********************************|
  |         Getter Functions          |
  |__________________________________*/

  function getExchange(address token) public view returns (address) {
    return token_to_exchange[token];
  }

  function getToken(address exchange) public view returns (address) {
    return exchange_to_token[exchange];
  }

  function getTokenWithId(uint256 token_id) public view returns (address) {
    return id_to_token[token_id];
  }

}

