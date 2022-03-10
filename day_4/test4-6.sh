#DAY 4 challenge 4 
echo CHALLENGE 4
echo create wild tiger with 100 energy and have it take a break
dfx canister call main create_animal_then_takes_a_break '("wild tiger", 100)'

echo CHALLENGE 5
echo created list

echo CHALLENGE 6
echo add animal to list crazy tiger, 50 energy
dfx canister call main push_animal '(record { specie = "crazy tiger"; energy = 50 : nat })'
echo get list of animals
dfx canister call main get_animals '()'


  

