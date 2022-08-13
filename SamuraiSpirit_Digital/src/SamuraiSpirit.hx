class SamuraiSpirit extends hxd.App {

    var common:Array<Raider>;
    var lieut:Array<Raider>;
    var boss:Array<Raider>;
    var master:Array<Raider> = []; // this is the deck that players will pull cards from each round

    var deck:BuildDeck = new BuildDeck();

    var t:h2d.Text;
    var cardCount: h2d.Text;
    var rNum:Int = 0;
    var x:Int = 200;
    var y:Int = 200;
  
    var card:Raider;

    override function init() {
        
        common = deck.loadCommon();
        lieut = deck.loadLieut();
        boss = deck.loadBoss();
       
        //var playerCount:Int = Math.round(Math.random() * 7);
        var playerCount:Int = 1;

        if (playerCount == 0){
        playerCount = 1;
        }

        for(r in 1 ... 4){
          
            // for round 1 a random selection of plunderer cards make a playing deck
            if (r == 1){
                master = shuffleCards(playerCount * 7, common);
                

            }

            // round 2 sees that lieutenent cards are added to the playing deck.
            else if (r == 2){
               
                master = master.concat(shuffleCards(playerCount, lieut));
                master = shuffleCards(master.length, master);
               

            }

            else if (r == 3){
                master = master.concat(shuffleCards(playerCount, boss));
                master = shuffleCards(master.length, master);
            }
        }
        
        t = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        t.text = master[rNum].getID();
        t.setPosition(x,y);
        t.scale(4);


        // cardCount = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        // cardCount.text  = Std.string(playerCount);
        // cardCount.setPosition(100, 100);
        // cardCount.scale(2);

        cardCount = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        cardCount.text  = Std.string(master.length);
        cardCount.setPosition(100, 50);
        cardCount.scale(2);
        

    }

    override function update(dt:Float){

        if (hxd.Key.isReleased(hxd.Key.UP)){
          
            if(rNum <= 0){
                rNum = 0;
            }
            else{
                rNum -= 1;
            }

        }
        else if(hxd.Key.isReleased(hxd.Key.DOWN)){
          

            if(rNum >= master.length - 1){
                rNum = master.length - 1;
            }
            else{
                rNum += 1;
            }

        }

        t.text = master[rNum].getID();
        t.setPosition(x,y);

      

    }

    function shuffleCards(numCards:Int, arr:Array<Raider>) : Array<Raider>{
        var cardPos:Int;
        var tempArr:Array<Raider> = [];
        trace(numCards);
        for (draw in 0 ... (numCards)){
            cardPos = Math.round(Math.random() * arr.length - 1);

            if(cardPos <= 0){
                cardPos = 0;
            };
          
            card = arr[cardPos];

            tempArr.push(card);
            arr.remove(card);
        }
   
        return tempArr;
    }


    static function main() {
        new SamuraiSpirit();
    }
}