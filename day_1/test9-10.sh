#challenge 9
echo remove 5 from array 1,2,3,4,5
dfx canister call day_1 remove_from_array '(vec {1;2;3;4;5}, 5)'
echo remove 3 from array 1,2,3,4,5
dfx canister call day_1 remove_from_array '(vec {1;2;3;4;5}, 3)'
#challenge 10
#echo sort array 3,2,1,4,5
#dfx canister call day_1 selection_sort '(vec {3;2;1;4;5})'
#echo swap fifth and first elements array 3,2,1,4,5
#dfx canister call day_1 pubswap '(vec {3;2;1;4;5}, 4, 0)'
echo get smallest value array 3,2,1,4,5
dfx canister call day_1 pub_get_smallest_value '(vec {3;2;1;4;5})'
echo get smallest index array 3,2,1,4,5
dfx canister call day_1 pub_get_smallest_index '(vec {3;2;1;4;5})'
echo sort array 3,2,1,5,4
#dfx canister call day_1 selection_sort '(vec {3;2;1;5;4}, 0)'
dfx canister call day_1 selection_sort '(vec {3;2;1;5;4})'
