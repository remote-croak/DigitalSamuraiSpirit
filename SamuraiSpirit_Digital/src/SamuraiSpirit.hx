

class SamuraiSpirit extends hxd.App {

    var common:Array<Raider>;
    var lieut:Array<Raider>;
    var boss:Array<Raider>;
    var master:Array<Raider>; // this is the deck that players will pull cards from each round
   // var playerRoster:Array<PlayerData>; // contains all player data. This means chosen Samurai
    var deck:BuildDeck = new BuildDeck();

    var t:h2d.Text;
    var playerCount:h2d.TextInput;
    var cardCount: h2d.Text;
    var numPlayers:h2d.Text;
    var selectChar:h2d.Text;
    var rNum:Int;
    var x:Int = 200;
    var y:Int = 200;
    var confirm = false;
    
  
    override function init(){

        hxd.Res.initEmbed(); //load resources

        common = deck.loadCommon();
        lieut = deck.loadLieut();
        boss = deck.loadBoss();

        master = new Array();
        //playerRoster = new Array();
    
        numPlayers = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        numPlayers.text = "Number of Players";
        numPlayers.setPosition(100, 100);
        numPlayers.scale(4);

        playerCount = new h2d.TextInput(hxd.res.DefaultFont.get(), s2d);
        playerCount.text = "E";
        playerCount.setPosition(650, 100);
        playerCount.scale(4);

        //Add players to array.
        // If CPU allowed to make selections to fill out the roster. let the player set the option.
        // This should be togglable. 
        // player roster
         // Create For loop for Players where selected samurai are connected to players.
            // How to make this a simulataneous Selection
         
        //Input Samurai Select here with images
        selectChar = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        selectChar.text = "Select Your Samurai";
        selectChar.setPosition(x,y);
        selectChar.scale(4);
        //var samImg = hxd.Res.art.samurai1SM.toTile();
    
       //var sam1Image = hxd.Res.hxlogo.toTexture();
        //var img = sam1Image.toTile();
        // var sam2Image = hxd.Res.art.samurai-2-sm.toTile();
        // var sam3Image = hxd.Res.art.samurai-3-sm.toTile();
        // var sam4Image = hxd.Res.art.samurai-5-sm.toTile();
        // var sam5Image = hxd.Res.art.samurai-6-sm.toTile();
        // var sam6Image = hxd.Res.art.samurai-7-sm.toTile();
        // var sam7Image = hxd.Res.art.samurai-8-sm.toTile();
       
        var sam1 = new h2d.Graphics(s2d);
        var sam2 = new h2d.Graphics(s2d);
        var sam3 = new h2d.Graphics(s2d);
        var sam4 = new h2d.Graphics(s2d);
        var sam5 = new h2d.Graphics(s2d);
        var sam6 = new h2d.Graphics(s2d);
        var sam7 = new h2d.Graphics(s2d);
        var samImg1 = hxd.Res.art.samurai1SM.toTile();
        var samImg2 = hxd.Res.art.samurai2SM.toTile();
        var samImg3 = hxd.Res.art.samurai3SM.toTile();
        var samImg4 = hxd.Res.art.samurai4SM.toTile();
        var samImg5 = hxd.Res.art.samurai5SM.toTile();
        var samImg6 = hxd.Res.art.samurai6SM.toTile();
        var samImg7 = hxd.Res.art.samurai7SM.toTile();

        sam1.lineStyle(6, 0xFFFFFF);
        //sam1.beginFill(0xEA8220);
        //sam1.drawTile(s2d.width/2, s2d.height/2 - 192,samImg);
        sam1.drawTile(s2d.width/2, s2d.height/2 - 192, samImg1);
        // sam1.drawRect(s2d.width/2, s2d.height/2 - 192, 136, 192);
        trace("Height: " + s2d.height + "by Half: " + s2d.height/2, "Image: " + samImg2.height);
        trace("Width: " + s2d.width + "by Half: " + s2d.width/2, "Image: " + samImg2.width);

        sam2.lineStyle(6, 0xFFFFFF);
        // sam2.beginFill(0xEA8220);
        sam2.drawTile(s2d.width/2 - 136, s2d.height/2 - 192, samImg2);
        sam2.drawRect(s2d.width/2 - 136, s2d.height/2 - 192, 136, 192);
        
        sam3.lineStyle(6, 0xFFFFFF);
        // sam3.beginFill(0xEA8220);
        sam3.drawTile(s2d.width/2 + 136, s2d.height/2 - 192, samImg3);
        sam3.drawRect(s2d.width/2 + 136, s2d.height/2 - 192, 136, 192);

        sam4.lineStyle(6, 0xFFFFFF);
        // sam4.beginFill(0xEA8220);
        sam4.drawTile(s2d.width/2 - 68, s2d.height/2, samImg4);
        sam4.drawRect(s2d.width/2 - 68, s2d.height/2, 136, 192);

        sam5.lineStyle(6, 0xFFFFFF);
        // sam5.beginFill(0xEA8220);
        sam5.drawTile(s2d.width/2 - (68 + 136), s2d.height/2, samImg5);
        sam5.drawRect(s2d.width/2 - (68 + 136), s2d.height/2, 136, 192);
       
        sam6.lineStyle(6, 0xFFFFFF);
        // sam6.beginFill(0xEA8220);
        sam6.drawTile(s2d.width/2 + 68, s2d.height/2, samImg6);
        sam6.drawRect(s2d.width/2 + (68), s2d.height/2, 136, 192);

        sam7.lineStyle(6, 0xFFFFFF);
        // sam7.beginFill(0xEA8220);
        sam7.drawTile(s2d.width/2 + (68 + 136), s2d.height/2, samImg7);
        sam7.drawRect(s2d.width/2 + (68 + 136), s2d.height/2, 136, 192);
       
        t = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        t.setPosition(x,y);
        t.scale(4);

    }

    static function main() {
        new SamuraiSpirit();
    }

     override function update(dt:Float){

        if(hxd.Key.isPressed(hxd.Key.ENTER)){
            trace(playerCount.text);
            distribute(getPlayerCount(playerCount.text), common, lieut, boss);
        }
      
                
        // if (hxd.Key.isReleased(hxd.Key.UP)){
          
        //     if(rNum <= 0){
        //         rNum = 0;
        //     }

        //     else{
        //         rNum -= 1;
        //     }
        // }

        // else if(hxd.Key.isReleased(hxd.Key.DOWN)){
          
        //     if(rNum >= master.length - 1){
        //         rNum = master.length - 1;
        //     }
        //     else{
        //         rNum += 1;
        //     }
        // }
        
        // if(master[rNum] != null){
        //     t.text = master[rNum].getID();
        //     t.setPosition(x,y);
        //     }
        }
    

    function shuffleCards(numCards:Int, arr:Array<Raider>) : Array<Raider>{
        var card:Raider;
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

    // divides the entire collection of raider cards into the master playing deck
    // cards are divided on type and based on the current round.
    // Round 1 sends a portion of common raiders to the master deck
    // Round 2 sends a portion of lieutenants to the master deck
    // Round 3 sends a portion of the bosses to the master deck
    function distribute(playerCount:Int, c:Array<Raider>, l:Array<Raider>, b:Array<Raider>){
        
        for(round in 1 ... 4){
          
            // for round 1 a random selection of plunderer cards make a playing deck

            if (round == 1){           
                master = shuffleCards(playerCount * 7, c);              
            }

            // round 2 sees that lieutenent cards are added to the playing deck.
            else if (round == 2){
                master = master.concat(shuffleCards(playerCount, l));
                master = shuffleCards(master.length, master);   
            }

            else if (round == 3){
                master = master.concat(shuffleCards(playerCount, b));
                master = shuffleCards(master.length, master);
            }
        }

    }

    function getPlayerCount(players:String){

        var count:Int = 0;
        count = Std.parseInt(players);
        return count;

    }

}