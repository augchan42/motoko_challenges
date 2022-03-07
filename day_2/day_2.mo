import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Char "mo:base/Char";

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
  }

};