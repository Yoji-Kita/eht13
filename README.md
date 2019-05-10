# eht13
Ethereum Hack Tokyo #13

## Agenda

1. やることの説明（ホワイトボード）

2. クライアント側 (Javascript) [※ 要 Node.js]
  - Coding
  - Test Run
  - (option) API で叩く

3. スマートコントラクト側 (Solidity) [※ 要 Remix/Rinkeby ETH]
  - Coding
  - Deploy
  - Verify
  - 普通に送ってみる

4. 実験: クライアント署名 → スマコンに投げる → 結果確認

5. Tachyon Demo

## APIs
- 秘密鍵&アドレス生成: https://vanity-eth.tk/
- Hash: http://18.179.196.24:3002/api/v1/erc865hash?token=&to=&value=1000&fee=100&nonce=123
- Sign: http://18.179.196.24:3002/api/v1/erc865sign?hash=&privateKey=

