#DAY 3 challenge 1 
echo CHALLENGE 3
echo mint nft
dfx canister call main mint '()'

echo challenge 4
echo transfer nft
dfx canister call main transfer '(principal "w7x7r-cok77-xa", 0)'

echo challenge 5
echo show balance of nfts
dfx canister call main balance '()'
