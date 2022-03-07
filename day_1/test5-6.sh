#challenge 5
#dfx canister call day_1 check_size '()'
#dfx canister call day_1 check_index '(6)'
echo does 2 divide into 4
dfx canister call day_1 divide '(2, 4)'
echo does 3 divide into 4
dfx canister call day_1 divide '(3, 4)'
#challenge 6
#Note: this is output on the replica console, not in the current terminal
#dfx canister call day_1 test '()'
#dfx canister call day_1 test2 '()'

echo is 4 even?
dfx canister call day_1 is_even '(4)'
echo is 5 even?
dfx canister call day_1 is_even '(5)'
