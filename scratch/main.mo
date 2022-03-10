import Card "custom";

actor {

  public type card = Card.TradingCard;
  let black_lotus : TradingCard = {
    name = "Black Lotus";
    rarity = "rare";
  };

  public function fun() : async Card {
      return (black_lotus);
  }


};