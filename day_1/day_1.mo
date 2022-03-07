import Debug "mo:base/Debug";
import Nat "mo:base/Nat"; 
import Array  "mo:base/Array"; 
import Buffer  "mo:base/Buffer"; 

actor {
  
 //challenge 1
    public func add (x : Nat, y : Nat ) : async Nat {
      return(x + y);
    };

 //challenge 2
 public func square (x : Nat) : async Nat {
      return(x * x);
    };

  //challenge 3
  public func days_to_second (x : Nat) : async Nat {
  let seconds_in_a_day : Nat = 86400;
      return(x * seconds_in_a_day);
    };


  //challenge 4
  var counter : Nat = 0; //initialize counter to 0

  public func increment_counter (x : Nat) : async Nat {
    counter := counter + x;
    return (counter);
  };

  public func clear_counter () : async Text {
    counter := 0;

    return "Counter vriable set to 0";
    
  };

    
  //Challenge 5
  public func divide (n : Nat, m: Nat) : async Bool {
    let divisible : Nat = m % n;
    if (divisible == 0) {
      return true;
    };
    return false;
  };
  
  //Challenge 6
    public func is_even (n : Nat) : async Bool {
    let is_even : Nat = n % 2;
    if (is_even == 0) {
      return true;
    };
    return false;
  };

  //challenge 7
  public func sum_of_array(a : [Nat]) : async Nat {
    var sum : Nat = 0;
    for (value in a.vals()){
            sum := sum + value;
        };
    return sum;
  };

  //challenge 8
  public func maximum (a : [Nat]) : async Nat {
    var max : Nat = 0;    
    for (value in a.vals()){
        if (max < value) {
          max := value;
        };
    };
    return max;
  };

  //challenge 9
  public func remove_from_array (a : [Nat], n : Nat) : async [Nat] {
    var remove_me : Nat = n;
    let array = Array.filter<Nat>(a, func(p) { p != remove_me });

    return array;
  };

  //challenge 10
  public func selection_sort (unsorted_array : [Nat]) : async [Nat] {
    var minimum_idx : Nat = 0; // initialize lowest value to first array entry
    // var sorted_array : [Nat] = [];
    var unsorted_buffer = Buffer.Buffer<Nat>(10);
    var sorted_buffer = Buffer.Buffer<Nat>(10);
    var current_minimum_idx = get_smallest_index(Array.thaw<Nat>(unsorted_array));
    var return_array : [Nat] = [];
    // var unsorted_partition : [var Nat]  = [];
    var current_idx : Nat = 0;
    var mutable_array : [var Nat] = Array.thaw(unsorted_array);
    //initialize buffer
    for (value in unsorted_array.vals()){                
      unsorted_buffer.add(value);         
    };
    
    Debug.print(Nat.toText(mutable_array[0]));    

    while (mutable_array.size() > 0) {               
      swap(mutable_array, minimum_idx, get_smallest_index(mutable_array));          
      
      sorted_buffer.add(mutable_array[0]);
      mutable_array := remove_from_array_by_index(Array.freeze<Nat>(mutable_array), 0);
      
    };    

    // Debug.print(Nat.toText(mutable_array[0]));
    // Debug.print(Nat.toText(sorted_buffer.toArray()[0]));


    // var mutable_array : [var Nat] = unsorted_buffer.toVarArray();
    // for (values in mutable_array.vals()) {
    //   Debug.print(Nat.toText(values))
    // };

    // var sorted_array : [var Nat] = swap(mutable_array, minimum_idx, current_minimum_idx);
    // for (values in mutable_array.vals()) {
    //   Debug.print(Nat.toText(values))
    // };
    
    // for (value in sorted_array.vals()) {
    //   sorted_partition.add(value);
    // };

    return sorted_buffer.toArray();
    
  };
  
  func remove_from_array_by_index (a : [Nat], index_to_remove : Nat) : [var Nat] {
    let array = Array.filter<Nat>(a, func(p) { p != a[index_to_remove] });
    return Array.thaw<Nat>(array);
  };

  public func pub_get_smallest_index (array : [Nat]) : async Nat {
    return get_smallest_index(Array.thaw<Nat>(array));
  };

  func get_smallest_index(array : [var Nat]) : Nat {
    var smallest : Nat = array[0];
    var counter : Nat = 0;
    var smallestIdx : Nat = 0;

    for (value in array.vals()){
      if (value < smallest) {
        smallest := value;
        smallestIdx := counter;
      };
      counter += 1;
    };
    return smallestIdx;  
  };


  public func pub_get_smallest_value (array : [Nat]) : async Nat {
    return get_smallest_value(array);
  };

  func get_smallest_value(array : [Nat]) : Nat {
    var smallest : Nat = array[0];
    var counter : Nat = 0;

    for (value in array.vals()){
      if (value < smallest) {
        smallest := value;
      };
      counter += 1;
    };
    return smallest;  
  };

  
  // public func pubswap (array : [Nat], entry1 : Nat, entry2 : Nat) : async [Nat] {  
  //   return swap(array, entry1, entry2);
  // };

  //swap entry 1 and entry 2 in array
  func swap (mutable_array : [var Nat], entry1 : Nat, entry2 : Nat) : () {
    let entry1_val = mutable_array[entry1];
    let entry2_val = mutable_array[entry2];
    var buffer = Buffer.Buffer<Nat>(10);
    var counter : Nat = 0;
    
    mutable_array[entry1] := entry2_val;
    mutable_array[entry2] := entry1_val;
    
    /*
    for (value in array.vals()) {
      if (counter == entry1) {
        buffer.add(entry2_val);
      } else       
      if (counter == entry2) {
        buffer.add(entry1_val);
      } else {
        buffer.add(value);
      };
      
      counter += 1;
       //Debug.print(Nat.toText(counter))
    };

    return buffer.toArray();
    */
    // return mutable_array;
    return;
  };
};