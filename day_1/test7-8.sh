#challenge 7
#dfx canister call day_1 nat_to_text '(1234)'
echo summing array 1,2,3,4,5
dfx canister call day_1 sum_of_array '(vec {1;2;3;4;5})'
#challenge 8
echo max of array 1,2,3,4,5
dfx canister call day_1 maximum '(vec {1;2;3;4;5})'
