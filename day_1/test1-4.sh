#challenge 1
echo "challenge 1 add 1+1"
dfx canister call day_1 add '(1, 1)'
#dfx canister call day_1 equal_to_one '(1)'
#dfx canister call day_1 equal_to_one '(2)'

#dfx canister call day_1 inf_to_one '(1)'
#dfx canister call day_1 inf_to_one '(0)'
#dfx canister call day_1 inf_to_one '(2)'
#dfx canister call day_1 inf_to_one '("2")'

#challenge 2
echo "challenge 2 square 3"
dfx canister call day_1 square '(3)'

#challenge 3
echo "challenge 3 days_to_second 2 days in seconds"
dfx canister call day_1 days_to_second '(2)'

#challenge 4
echo "challenge 4 increment_counter adding 3"
dfx canister call day_1 increment_counter '(3)'
echo "challenge 4 increment_counter adding 2"
dfx canister call day_1 increment_counter '(2)'
echo "challenge 4 increment_counter adding 4"
dfx canister call day_1 increment_counter '(4)'
echo "challenge 4 clear_counter"
dfx canister call day_1 clear_counter '()'
