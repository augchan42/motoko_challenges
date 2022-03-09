#DAY 3 challenge 7
echo CHALLENGE 7
echo sum of array 3,2,1,5,4
dfx canister call day_3 sum_of_array '(vec {3;2;1;5;4})'


echo CHALLENGE 8
echo square each element in array 3,2,1,5,4
dfx canister call day_3 squared_array '(vec {3;2;1;5;4})'

echo CHALLENGE 9
echo increase_by_index each element in array 3,2,1,5,4
dfx canister call day_3 increase_by_index '(vec {3;2;1;5;4})'