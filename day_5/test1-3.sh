#DAY 3 challenge 1 
echo CHALLENGE 1
echo is my principal anonymous
dfx canister call day_5 is_anonymous '()'

echo CHALLENGE 2
echo create hashmap 'favoriteNumber'

echo CHALLENGE 3
echo add favorite number 7
dfx canister call day_5 add_favorite_number '(7)'
echo show avorite number 7
dfx canister call day_5 show_favorite_number '()'
