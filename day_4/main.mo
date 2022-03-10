import Card "custom";
import Animal "animal";
import List "mo:base/List";

actor {

//challenge 1
  public type TradingCard = Card.TradingCard;
  let black_lotus : TradingCard = {
    name = "Black Lotus";
    rarity = "rare";
  };

  public func fun () : async TradingCard {
      return (black_lotus);
  };


//challenge 4
  public type Animal4 = Animal.Animal4;
  

  public func create_animal_then_takes_a_break  (specie : Text, energy : Nat) : async Animal4 {

    let new_animal : Animal4 = {
      specie = specie;
      energy = energy;
    };
    
    return (Animal.animal_sleep_4(new_animal));
  };

  //challenge 5
  var animals = List.nil<Animal4>();

  //challenge 6
  public func push_animal(animal : Animal4) : async () {
    animals := List.push<Animal4>(animal, animals);
  };

  public func get_animals () : async [Animal4] {
    return List.toArray(animals);
  };

};

