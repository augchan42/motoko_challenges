import Hashmap "mo:base/HashMap";
import Hash "mo:base/Hash";
import TokenIndex "TokenIndex";


actor {

//challenge 1
  public type TokenIndex = TokenIndex.TokenIndex;
  
  public type Error = {
    #errorType1;
    #errorType2;
  };
  
  //challenge 2
  let registry : Hashmap.HashMap<TokenIndex, Principal> = Hashmap.HashMap<TokenIndex, Principal>(0, TokenIndex.equal, Hash.hash);

  //challenge 3
  var nextTokenIndex : Nat = 0;


};

