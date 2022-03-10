module {

//for challenge 3 with mutable energy for sleep function, so same Animal can be returned
  public type Animal = {
    specie : Text;
    var energy : Nat;    
  };

//for challenge 4, all variables non mutable
  public type Animal4 = {
    specie : Text;
    energy : Nat;    
  };

//challenge 3 return same animal with more energy after sleeping
  public func animal_sleep ( animal :  Animal) : Animal {
    animal.energy += 10;
      return (animal);
  };

//challenge 4 since using public function in Actor have to create new Animal
//since non of the vars can be mutable
  public func animal_sleep_4 ( animal4 :  Animal4) : Animal4 {
    return {
        specie =  animal4.specie;
        energy = animal4.energy + 10;
    };
  };

}
