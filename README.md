# TTSwap
TTSwap is a DEX (decentralized exchange) on the ThunderCore blockchain based on the model: Automated Market-Making (AMM) inspired by [Uniswap](https://uniswap.org/docs/v1).
## Information

- Website [TTSwap](https://ttswap.space)
- [Address of Factory](https://viewblock.io/thundercore/address/0xce393b11872ee5020828e443f6ec9de58cd8b6c5?tab=code)
- [Implementation of Exchange](https://viewblock.io/thundercore/address/0x7c1e1a39703ab5c21b5537d4093ccd1117ded405?tab=code)

## Documents
* [IUniswapExchange](#iuniswapexchange)
  * [AddLiquidity](#event-addliquidity)
  * [EthPurchase](#event-ethpurchase)
  * [RemoveLiquidity](#event-removeliquidity)
  * [TokenPurchase](#event-tokenpurchase)
  * [addLiquidity](#function-addliquidity)
  * [ethToTokenSwapInput](#function-ethtotokenswapinput)
  * [ethToTokenSwapOutput](#function-ethtotokenswapoutput)
  * [ethToTokenTransferInput](#function-ethtotokentransferinput)
  * [ethToTokenTransferOutput](#function-ethtotokentransferoutput)
  * [factoryAddress](#function-factoryaddress)
  * [getEthToTokenInputPrice](#function-getethtotokeninputprice)
  * [getEthToTokenOutputPrice](#function-getethtotokenoutputprice)
  * [getInputPrice](#function-getinputprice)
  * [getOutputPrice](#function-getoutputprice)
  * [getTokenToEthInputPrice](#function-gettokentoethinputprice)
  * [getTokenToEthOutputPrice](#function-gettokentoethoutputprice)
  * [removeLiquidity](#function-removeliquidity)
  * [tokenAddress](#function-tokenaddress)
  * [tokenToEthSwapInput](#function-tokentoethswapinput)
  * [tokenToEthSwapOutput](#function-tokentoethswapoutput)
  * [tokenToEthTransferInput](#function-tokentoethtransferinput)
  * [tokenToEthTransferOutput](#function-tokentoethtransferoutput)
  * [tokenToExchangeSwapInput](#function-tokentoexchangeswapinput)
  * [tokenToExchangeSwapOutput](#function-tokentoexchangeswapoutput)
  * [tokenToExchangeTransferInput](#function-tokentoexchangetransferinput)
  * [tokenToExchangeTransferOutput](#function-tokentoexchangetransferoutput)
  * [tokenToTokenSwapInput](#function-tokentotokenswapinput)
  * [tokenToTokenSwapOutput](#function-tokentotokenswapoutput)
  * [tokenToTokenTransferInput](#function-tokentotokentransferinput)
  * [tokenToTokenTransferOutput](#function-tokentotokentransferoutput)

## IUniswapExchange

### *event* AddLiquidity

IUniswapExchange.AddLiquidity(provider, eth_amount, token_amount) `06239653`

Arguments

| **type** | **name** | **description** |
|-|-|-|
| *address* | provider | indexed |
| *uint256* | eth_amount | indexed |
| *uint256* | token_amount | indexed |

### *event* EthPurchase

IUniswapExchange.EthPurchase(buyer, tokens_sold, eth_bought) `7f4091b4`

Arguments

| **type** | **name** | **description** |
|-|-|-|
| *address* | buyer | indexed |
| *uint256* | tokens_sold | indexed |
| *uint256* | eth_bought | indexed |

### *event* RemoveLiquidity

IUniswapExchange.RemoveLiquidity(provider, eth_amount, token_amount) `0fbf06c0`

Arguments

| **type** | **name** | **description** |
|-|-|-|
| *address* | provider | indexed |
| *uint256* | eth_amount | indexed |
| *uint256* | token_amount | indexed |

### *event* TokenPurchase

IUniswapExchange.TokenPurchase(buyer, eth_sold, tokens_bought) `cd60aa75`

Arguments

| **type** | **name** | **description** |
|-|-|-|
| *address* | buyer | indexed |
| *uint256* | eth_sold | indexed |
| *uint256* | tokens_bought | indexed |



### *function* addLiquidity

IUniswapExchange.addLiquidity(min_liquidity, max_tokens, deadline) `payable` `422f1043`

**Deposit ETH && Tokens (token) at current ratio to mint UNI tokens.**

> min_liquidity does nothing when total UNI supply is 0.

Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | min_liquidity | Minimum number of UNI sender will mint if total UNI supply is greater than 0. |
| *uint256* | max_tokens | Maximum number of tokens deposited. Deposits max amount if total UNI supply is 0. |
| *uint256* | deadline | Time after which this transaction can no longer be executed. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | uint256 The amount of UNI minted. |

### *function* ethToTokenSwapInput

IUniswapExchange.ethToTokenSwapInput(min_tokens, deadline) `payable` `f39b5b9b`

**Convert ETH to Tokens.**

> User specifies exact input (msg.value) && minimum output.

Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | min_tokens | Minimum Tokens bought. |
| *uint256* | deadline | Time after which this transaction can no longer be executed. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of Tokens bought. |

### *function* ethToTokenSwapOutput

IUniswapExchange.ethToTokenSwapOutput(tokens_bought, deadline) `payable` `6b1d4db7`

**Convert ETH to Tokens.**

> User specifies maximum input (msg.value) && exact output.

Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | tokens_bought | Amount of tokens bought. |
| *uint256* | deadline | Time after which this transaction can no longer be executed. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of ETH sold. |

### *function* ethToTokenTransferInput

IUniswapExchange.ethToTokenTransferInput(min_tokens, deadline, recipient) `payable` `ad65d76d`

**Convert ETH to Tokens && transfers Tokens to recipient.**

> User specifies exact input (msg.value) && minimum output

Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | min_tokens | Minimum Tokens bought. |
| *uint256* | deadline | Time after which this transaction can no longer be executed. |
| *address* | recipient | The address that receives output Tokens. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of Tokens bought. |

### *function* ethToTokenTransferOutput

IUniswapExchange.ethToTokenTransferOutput(tokens_bought, deadline, recipient) `payable` `0b573638`

**Convert ETH to Tokens && transfers Tokens to recipient.**

> User specifies maximum input (msg.value) && exact output.

Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | tokens_bought | Amount of tokens bought. |
| *uint256* | deadline | Time after which this transaction can no longer be executed. |
| *address* | recipient | The address that receives output Tokens. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of ETH sold. |

### *function* factoryAddress

IUniswapExchange.factoryAddress() `view` `966dae0e`




Outputs

| **type** | **name** | **description** |
|-|-|-|
| *address* |  | Address of factory that created this exchange. |

### *function* getEthToTokenInputPrice

IUniswapExchange.getEthToTokenInputPrice(eth_sold) `view` `cd7724c3`

**external price function for ETH to Token trades with an exact input.**


Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | eth_sold | Amount of ETH sold. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of Tokens that can be bought with input ETH. |

### *function* getEthToTokenOutputPrice

IUniswapExchange.getEthToTokenOutputPrice(tokens_bought) `view` `59e94862`

**external price function for ETH to Token trades with an exact output.**


Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | tokens_bought | Amount of Tokens bought. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of ETH needed to buy output Tokens. |

### *function* getInputPrice

IUniswapExchange.getInputPrice(input_amount, input_reserve, output_reserve) `view` `89f2a871`

> Pricing function for converting between ETH && Tokens.

Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | input_amount | Amount of ETH or Tokens being sold. |
| *uint256* | input_reserve | Amount of ETH or Tokens (input type) in exchange reserves. |
| *uint256* | output_reserve | Amount of ETH or Tokens (output type) in exchange reserves. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of ETH or Tokens bought. |

### *function* getOutputPrice

IUniswapExchange.getOutputPrice(output_amount, input_reserve, output_reserve) `view` `fd11c223`

> Pricing function for converting between ETH && Tokens.

Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | output_amount | Amount of ETH or Tokens being bought. |
| *uint256* | input_reserve | Amount of ETH or Tokens (input type) in exchange reserves. |
| *uint256* | output_reserve | Amount of ETH or Tokens (output type) in exchange reserves. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of ETH or Tokens sold. |

### *function* getTokenToEthInputPrice

IUniswapExchange.getTokenToEthInputPrice(tokens_sold) `view` `95b68fe7`

**external price function for Token to ETH trades with an exact input.**


Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | tokens_sold | Amount of Tokens sold. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of ETH that can be bought with input Tokens. |

### *function* getTokenToEthOutputPrice

IUniswapExchange.getTokenToEthOutputPrice(eth_bought) `view` `2640f62c`

**external price function for Token to ETH trades with an exact output.**


Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | eth_bought | Amount of output ETH. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of Tokens needed to buy output ETH. |

### *function* removeLiquidity

IUniswapExchange.removeLiquidity(amount, min_eth, min_tokens, deadline) `nonpayable` `f88bf15a`

> Burn UNI tokens to withdraw ETH && Tokens at current ratio.

Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | amount | Amount of UNI burned. |
| *uint256* | min_eth | Minimum ETH withdrawn. |
| *uint256* | min_tokens | Minimum Tokens withdrawn. |
| *uint256* | deadline | Time after which this transaction can no longer be executed. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | The amount of ETH && Tokens withdrawn. |
| *uint256* |  | The amount of ETH && Tokens withdrawn. |

### *function* tokenAddress

IUniswapExchange.tokenAddress() `view` `9d76ea58`




Outputs

| **type** | **name** | **description** |
|-|-|-|
| *address* |  | Address of Token that is sold on this exchange. |

### *function* tokenToEthSwapInput

IUniswapExchange.tokenToEthSwapInput(tokens_sold, min_eth, deadline) `nonpayable` `95e3c50b`

**Convert Tokens to ETH.**

> User specifies exact input && minimum output.

Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | tokens_sold | Amount of Tokens sold. |
| *uint256* | min_eth | Minimum ETH purchased. |
| *uint256* | deadline | Time after which this transaction can no longer be executed. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of ETH bought. |

### *function* tokenToEthSwapOutput

IUniswapExchange.tokenToEthSwapOutput(eth_bought, max_tokens, deadline) `nonpayable` `013efd8b`

**Convert Tokens to ETH.**

> User specifies maximum input && exact output.

Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | eth_bought | Amount of ETH purchased. |
| *uint256* | max_tokens | Maximum Tokens sold. |
| *uint256* | deadline | Time after which this transaction can no longer be executed. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of Tokens sold. |

### *function* tokenToEthTransferInput

IUniswapExchange.tokenToEthTransferInput(tokens_sold, min_eth, deadline, recipient) `nonpayable` `7237e031`

**Convert Tokens to ETH && transfers ETH to recipient.**

> User specifies exact input && minimum output.

Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | tokens_sold | Amount of Tokens sold. |
| *uint256* | min_eth | Minimum ETH purchased. |
| *uint256* | deadline | Time after which this transaction can no longer be executed. |
| *address* | recipient | The address that receives output ETH. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of ETH bought. |

### *function* tokenToEthTransferOutput

IUniswapExchange.tokenToEthTransferOutput(eth_bought, max_tokens, deadline, recipient) `nonpayable` `d4e4841d`

**Convert Tokens to ETH && transfers ETH to recipient.**

> User specifies maximum input && exact output.

Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | eth_bought | Amount of ETH purchased. |
| *uint256* | max_tokens | Maximum Tokens sold. |
| *uint256* | deadline | Time after which this transaction can no longer be executed. |
| *address* | recipient | The address that receives output ETH. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of Tokens sold. |

### *function* tokenToExchangeSwapInput

IUniswapExchange.tokenToExchangeSwapInput(tokens_sold, min_tokens_bought, min_eth_bought, deadline, exchange_addr) `nonpayable` `b1cb43bf`

**Convert Tokens (token) to Tokens (exchange_addr.token).**

> Allows trades through contracts that were not deployed from the same factory.User specifies exact input && minimum output.

Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | tokens_sold | Amount of Tokens sold. |
| *uint256* | min_tokens_bought | Minimum Tokens (token_addr) purchased. |
| *uint256* | min_eth_bought | Minimum ETH purchased as intermediary. |
| *uint256* | deadline | Time after which this transaction can no longer be executed. |
| *address* | exchange_addr | The address of the exchange for the token being purchased. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of Tokens (exchange_addr.token) bought. |

### *function* tokenToExchangeSwapOutput

IUniswapExchange.tokenToExchangeSwapOutput(tokens_bought, max_tokens_sold, max_eth_sold, deadline, exchange_addr) `nonpayable` `ea650c7d`

**Convert Tokens (token) to Tokens (exchange_addr.token).**

> Allows trades through contracts that were not deployed from the same factory.User specifies maximum input && exact output.

Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | tokens_bought | Amount of Tokens (token_addr) bought. |
| *uint256* | max_tokens_sold | Maximum Tokens (token) sold. |
| *uint256* | max_eth_sold | Maximum ETH purchased as intermediary. |
| *uint256* | deadline | Time after which this transaction can no longer be executed. |
| *address* | exchange_addr | The address of the exchange for the token being purchased. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of Tokens (token) sold. |

### *function* tokenToExchangeTransferInput

IUniswapExchange.tokenToExchangeTransferInput(tokens_sold, min_tokens_bought, min_eth_bought, deadline, recipient, exchange_addr) `nonpayable` `ec384a3e`

**Convert Tokens (token) to Tokens (exchange_addr.token) && transfers        Tokens (exchange_addr.token) to recipient.**

> Allows trades through contracts that were not deployed from the same factory.User specifies exact input && minimum output.

Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | tokens_sold | Amount of Tokens sold. |
| *uint256* | min_tokens_bought | Minimum Tokens (token_addr) purchased. |
| *uint256* | min_eth_bought | Minimum ETH purchased as intermediary. |
| *uint256* | deadline | Time after which this transaction can no longer be executed. |
| *address* | recipient | The address that receives output ETH. |
| *address* | exchange_addr | The address of the exchange for the token being purchased. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of Tokens (exchange_addr.token) bought. |

### *function* tokenToExchangeTransferOutput

IUniswapExchange.tokenToExchangeTransferOutput(tokens_bought, max_tokens_sold, max_eth_sold, deadline, recipient, exchange_addr) `nonpayable` `981a1327`

**Convert Tokens (token) to Tokens (exchange_addr.token) && transfers        Tokens (exchange_addr.token) to recipient.**

> Allows trades through contracts that were not deployed from the same factory.User specifies maximum input && exact output.

Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | tokens_bought | Amount of Tokens (token_addr) bought. |
| *uint256* | max_tokens_sold | Maximum Tokens (token) sold. |
| *uint256* | max_eth_sold | Maximum ETH purchased as intermediary. |
| *uint256* | deadline | Time after which this transaction can no longer be executed. |
| *address* | recipient | The address that receives output ETH. |
| *address* | exchange_addr | The address of the exchange for the token being purchased. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of Tokens (token) sold. |

### *function* tokenToTokenSwapInput

IUniswapExchange.tokenToTokenSwapInput(tokens_sold, min_tokens_bought, min_eth_bought, deadline, token_addr) `nonpayable` `ddf7e1a7`

**Convert Tokens (token) to Tokens (token_addr).**

> User specifies exact input && minimum output.

Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | tokens_sold | Amount of Tokens sold. |
| *uint256* | min_tokens_bought | Minimum Tokens (token_addr) purchased. |
| *uint256* | min_eth_bought | Minimum ETH purchased as intermediary. |
| *uint256* | deadline | Time after which this transaction can no longer be executed. |
| *address* | token_addr | The address of the token being purchased. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of Tokens (token_addr) bought. |

### *function* tokenToTokenSwapOutput

IUniswapExchange.tokenToTokenSwapOutput(tokens_bought, max_tokens_sold, max_eth_sold, deadline, token_addr) `nonpayable` `b040d545`

**Convert Tokens (token) to Tokens (token_addr).**

> User specifies maximum input && exact output.

Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | tokens_bought | Amount of Tokens (token_addr) bought. |
| *uint256* | max_tokens_sold | Maximum Tokens (token) sold. |
| *uint256* | max_eth_sold | Maximum ETH purchased as intermediary. |
| *uint256* | deadline | Time after which this transaction can no longer be executed. |
| *address* | token_addr | The address of the token being purchased. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of Tokens (token) sold. |

### *function* tokenToTokenTransferInput

IUniswapExchange.tokenToTokenTransferInput(tokens_sold, min_tokens_bought, min_eth_bought, deadline, recipient, token_addr) `nonpayable` `f552d91b`

**Convert Tokens (token) to Tokens (token_addr) && transfers        Tokens (token_addr) to recipient.**

> User specifies exact input && minimum output.

Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | tokens_sold | Amount of Tokens sold. |
| *uint256* | min_tokens_bought | Minimum Tokens (token_addr) purchased. |
| *uint256* | min_eth_bought | Minimum ETH purchased as intermediary. |
| *uint256* | deadline | Time after which this transaction can no longer be executed. |
| *address* | recipient | The address that receives output ETH. |
| *address* | token_addr | The address of the token being purchased. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of Tokens (token_addr) bought. |

### *function* tokenToTokenTransferOutput

IUniswapExchange.tokenToTokenTransferOutput(tokens_bought, max_tokens_sold, max_eth_sold, deadline, recipient, token_addr) `nonpayable` `f3c0efe9`

**Convert Tokens (token) to Tokens (token_addr) && transfers        Tokens (token_addr) to recipient.**

> User specifies maximum input && exact output.

Inputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* | tokens_bought | Amount of Tokens (token_addr) bought. |
| *uint256* | max_tokens_sold | Maximum Tokens (token) sold. |
| *uint256* | max_eth_sold | Maximum ETH purchased as intermediary. |
| *uint256* | deadline | Time after which this transaction can no longer be executed. |
| *address* | recipient | The address that receives output ETH. |
| *address* | token_addr | The address of the token being purchased. |

Outputs

| **type** | **name** | **description** |
|-|-|-|
| *uint256* |  | Amount of Tokens (token) sold. |

---