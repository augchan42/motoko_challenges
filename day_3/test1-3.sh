#DAY 3 challenge 1 
echo CHALLENGE 1
echo swap number 4 and number 1 in array 3,2,1,5,4 - index 4 and index 2 are swapped
dfx canister call day_3 swap '(vec {3;2;1;5;4}, 4, 2)'


echo CHALLENGE 2
echo init_count array of 5 
dfx canister call day_3 init_count '(5)'

echo CHALLENGE 3
echo find seven in array 3,2,1,5,4
dfx canister call day_3 seven  '(vec {3;2;1;5;4})'
echo find seven in array 3,2,1,7,4
dfx canister call day_3 seven  '(vec {3;2;1;7;4})'