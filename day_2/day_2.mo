import Iter "mo:base/Iter";
import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Char "mo:base/Char";
import Nat32 "mo:base/Nat32";
import Float "mo:base/Float";
import Array "mo:base/Array";
import Buffer "mo:base/Buffer";

actor {

//challenge 1
  public func nat_to_nat8 ( n : Nat ) : async Nat8 {
    return(Nat8.fromNat(n));
  };

//challenge 2
  public func max_number_with_n_bits  ( bits: Nat ) : async Nat {
    return((2 ** bits) -1 );//max is 2 to the exponent bits minus 1
  };

//challenge 3
  public func decimal_to_bits ( n : Nat ) : async Text {
  var counter : Nat = 0;
  var bits : Nat = n;
  var bitflags : Text = "";

  // if (n % 2 > 0) {
  //   bitflags := "1";
  //   bits -= 1;
  // } else {
  //   bitflags := "0";
  // }

    //keep dividing n by 2 while it's greater than 0
    while (bits > 0) {
      if (bits % 2 > 0) {
        bitflags := Text.concat("1", bitflags);
      } else {
        bitflags := Text.concat("0", bitflags);
      };

      bits := bits / 2;
    };

    // return(Nat.toText(counter));
    return (bitflags);
  };

//challenge 4
  public func capitalize_character  ( c : Char ) : async Char {
    let upperToLowerAscii : Nat32 = 32; //uppercase A = 65, lowercase a = 97
    // let lowerToUpperAscii : Nat32 = -32; //uppercase A = 65, lowercase a = 97
    let letterInUnicode : Nat32 = Char.toNat32(c);
    var newChar : Char = c;
    
    if (Char.isLowercase(c)) {
      var capitalizedLetter : Nat32 = letterInUnicode - upperToLowerAscii;
      newChar := Char.fromNat32(capitalizedLetter);
    };
    
    return (newChar);
  };

//challenge 5
  public func capitalize_text ( t : Text ) : async Text {
    var upperCaseText = "";
    
    for (char in t.chars()) {
      var upperCharAsText : Text = Text.fromChar(cap_character(char));
      upperCaseText := Text.concat(upperCaseText, upperCharAsText);
    };

    return (upperCaseText);
  };

// had to use this function instead of challenge 4 function  due to:
//  type error [M0096], expression of type
//   async<$capitalize_text> Char
// cannot produce expected type
//   Char
  func cap_character  ( c : Char ) : Char {
    let upperToLowerAscii : Nat32 = 32; //uppercase A = 65, lowercase a = 97
    // let lowerToUpperAscii : Nat32 = -32; //uppercase A = 65, lowercase a = 97
    let letterInUnicode : Nat32 = Char.toNat32(c);
    var newChar : Char = c;
    
    if (Char.isLowercase(c)) {
      var capitalizedLetter : Nat32 = letterInUnicode - upperToLowerAscii;
      newChar := Char.fromNat32(capitalizedLetter);
    };
    
    return (newChar);
  };

  //challenge 6
  public func is_inside ( t : Text, c : Char) : async Bool {
    for (char in t.chars()) {
      if (Char.equal(char, c)) {
        return true;
      };
    };
    return false;
  };

  //challenge 7
  public func trim_whitespace ( t : Text) : async Text {
    var whitespace : Char = ' ';
    return Text.trim(t, #char ' ');
  };

  //challenge 8
  public func duplicated_character ( t : Text) : async Text {
    var prevChar : Char = Char.fromNat32(0);
    var currentChar : Char = Char.fromNat32(0);

    for (char in t.chars()) {
      if (Char.equal (prevChar, char) ) {
        return (Char.toText(char));
      };
      prevChar := char;
    };
    return (t);//failure case
  };

  //challenge 9 
  public func size_in_bytes ( t : Text) : async Text {
    var sizeInDecimal : Nat32 = 0;
    for (char in t.chars()) {
      sizeInDecimal += Char.toNat32(char);
    };
    // return Nat32.toNat(sizeInDecimal);
    var sizeInBits : Text = decimal_to_bytes(Nat32.toNat(sizeInDecimal));
    return (sizeInBits);
  };

  func decimal_to_bytes ( n : Nat ) : Text {
  var counter : Nat = 0;
  var bits : Nat = n;
  var bitflags : Text = "";
  
    //keep dividing n by 2 while it's greater than 0
    while (bits > 0) {
      if (bits % 2 > 0) {
        bitflags := Text.concat("1", bitflags);
      } else {
        bitflags := Text.concat("0", bitflags);
      };

      bits := bits / 2;
    };

    var numberOfBits : Nat = bitflags.size();
    var bytes : Float = Float.ceil(Float.fromInt(numberOfBits) / 8);
    return (Float.toText(bytes));
  };

  //challenge 10
  public func bubble_sort (arry : [Nat]) : async [Nat] {
    return Array.freeze(priv_bubble_sort(Array.thaw(arry)));
  };

  func priv_bubble_sort (arry : [var Nat]) : [var Nat] {
    if (arry.size() > 0) {
      for (i in Iter.range(0, arry.size())) {
        for (j in Iter.range(0, arry.size())) {
          var current = j;
          var next = j + 1;
          if (current < (arry.size() - 1)) {
            if (arry[current] > arry[next]) {
              swap (arry, current, next);
            };
          };
        };
      };
    };
    
    return (arry);
  };

  //swap entry 1 with entry 2 in the array, by index.  index starts at 0
  func swap (mutable_array : [var Nat], entry1 : Nat, entry2 : Nat) : () {
    let entry1_val = mutable_array[entry1];
    let entry2_val = mutable_array[entry2];
    var buffer = Buffer.Buffer<Nat>(10);
    var counter : Nat = 0;
    
    mutable_array[entry1] := entry2_val;
    mutable_array[entry2] := entry1_val;
    
    return;
  };
};