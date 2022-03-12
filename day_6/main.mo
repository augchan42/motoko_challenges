import Hashmap "mo:base/HashMap";
import Hash "mo:base/Hash";
import TokenIndex "TokenIndex";
import Result "mo:base/Result";
import Principal "mo:base/Principal";
import Option "mo:base/Option";
import Nat "mo:base/Nat";


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
  stable var nextTokenIndex : Nat = 0;
  public type Result = Result.Result<Text, Text>;

  public shared ({caller}) func mint () : async Result {
    if (Principal.isAnonymous(caller)) {
      return #err("Sorry, your principal is anonymous and can't mint");
    } else {
      let mintedIndex = nextTokenIndex;
      registry.put(mintedIndex, caller);
      nextTokenIndex := nextTokenIndex + 1;//increment for next mint
      return #ok("minted and associated token: " # Nat.toText(mintedIndex) # " with your principal: " # Principal.toText(caller) );      
    };
  };

  //challenge 4
  public shared ({caller}) func transfer (to : Principal, tokenIndex : Nat) : async Result {

    let nftOwner = registry.get(tokenIndex);    

    // switch(nftOwner) {
    //   case null { return #err("No one owns this nft") };
    //   case (?p) {
    //     if (caller == registry.get(tokenIndex)) {//make sure the caller owns this nft
    //       ignore registry.replace(tokenIndex, to);
    //       return #ok("nft #" # Nat.toText(tokenIndex) # " transferred to: " # Principal.toText(to));
    //     };        
    //   };
    // }

    if (nftOwner == caller) {//make sure the caller owns this nft
      ignore registry.replace(tokenIndex, to);
      return #ok("nft #" # Nat.toText(tokenIndex) # " transferred to: " # Principal.toText(to));
    };

    if (nftOwner == null) {
      return #err("No one owns this nft");
    };   
    
    if (Principal.isAnonymous(to)) {
      return #err("Cant transfer to anonymous principal");
    };

    if (Principal.isAnonymous(caller)) {
      return #err("Cant transfer using anonymous principal");
    };

    if (nftOwner != caller) {
      return #err("Sorry, you can't transfer an nft you don't own");
    };

    return #err ("Missed case - Should not reach here");
  };


};

