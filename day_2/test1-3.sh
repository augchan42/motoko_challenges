#challenge 1 day 2
echo CHALLENGE 1
echo "convert 255 to Nat8"
dfx canister call day_2 nat_to_nat8 '(255)'
echo "convert 256 to Nat8"
dfx canister call day_2 nat_to_nat8 '(256)'

#challenge 2 day 2
echo CHALLENGE 2
echo "max number with 256 bits"
dfx canister call day_2 max_number_with_n_bits '(256)'
echo "max number with 8 bits"
dfx canister call day_2 max_number_with_n_bits '(8)'

#challenge 3 day 2
echo CHALLENGE 3
echo "decimal_to_bits 256"
dfx canister call day_2 decimal_to_bits '(256)'
echo "decimal_to_bits 255"
dfx canister call day_2 decimal_to_bits '(255)'
echo "decimal_to_bits 2"
dfx canister call day_2 decimal_to_bits '(2)'
echo "decimal_to_bits 4"
dfx canister call day_2 decimal_to_bits '(4)'
echo "decimal_to_bits 3"
dfx canister call day_2 decimal_to_bits '(3)'
echo "decimal_to_bits 294"
dfx canister call day_2 decimal_to_bits '(294)'
