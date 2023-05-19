
class SamuraiSpirit extends hxd.App {

    var common:Array<Raider>;
    var lieut:Array<Raider>;
    var boss:Array<Raider>;
    var master:Array<Raider>; // this is the deck that players will pull cards from each round
    var roster:Array<Samurai> = []; // contains all player data. This means chosen Samurai
    var deck:BuildDeck = new BuildDeck();

    var Game:h2d.scene;
    var Select:h2d.scene;

    var t:h2d.Text;
    var playerCount:h2d.TextInput;
    var cardCount: h2d.Text;
    var numPlayers:h2d.Text;
    var selectChar:h2d.Text;

    var p1Name:h2d.Text;
    var p1Samurai:h2d.Text;
    var p2Name:h2d.Text;
    var p2Samurai:h2d.Text;
    var p3Name:h2d.Text;
    var p3Samurai:h2d.Text;
    var p4Name:h2d.Text;
    var p4Samurai:h2d.Text;
    var p5Name:h2d.Text;
    var p5Samurai:h2d.Text;
    var p6Name:h2d.Text;
    var p6Samurai:h2d.Text;
    var p7Name:h2d.Text;
    var p7Samurai:h2d.Text;

    // initalize samurai character variables
    var daisuke:samuraiChar.Daisuke = new samuraiChar.Daisuke();
    var gorobei:samuraiChar.Gorobei = new samuraiChar.Gorobei();
    var heihachi:samuraiChar.Heihachi = new samuraiChar.Heihachi();
    var kanbei:samuraiChar.Kanbei = new samuraiChar.Kanbei();
    var katsushiro:samuraiChar.Katsushiro = new samuraiChar.Katsushiro();
    var kikuchiyo:samuraiChar.Kikuchiyo = new samuraiChar.Kikuchiyo();
    var kyuzo:samuraiChar.Kyuzo = new samuraiChar.Kyuzo();
    
    var rNum:Int;
    var x:Int = 200;
    var y:Int = 200;
    var confirm = false;

    // all player join slots.
    var slot1:h2d.Text;
    var slot2:h2d.Text;
    var slot3:h2d.Text;
    var slot4:h2d.Text;
    var slot5:h2d.Text;
    var slot6:h2d.Text;
    var slot7:h2d.Text;
     
    override function init(){

        hxd.Res.initEmbed(); //load resources
        //hxd.Window.getInstance().addEventTarget(assignSamurai);

        common = deck.loadCommon();
        lieut = deck.loadLieut();
        boss = deck.loadBoss();

        master = new Array();
        roster = new Array();

        var p1:Player = new Player("player1");
        
        var p2:Player = new Player("player2");
        var p3:Player = new Player("player3");
        var p4:Player = new Player("player4");
        var p5:Player = new Player("player5");
        var p6:Player = new Player("player6");
        var p7:Player = new Player("player7");

        var cp1:Player = new Player("com1");
        var cp2:Player = new Player("com2");
        var cp3:Player = new Player("com3");
        var cp4:Player = new Player("com4");
        var cp5:Player = new Player("com5");
        var cp6:Player = new Player("com6");
        var cp7:Player = new Player("com7");
    
        // load all samurai characters, their images, and make selectable.
      
        daisuke.load(s2d);
        gorobei.load(s2d);
        heihachi.load(s2d);
        kanbei.load(s2d);
        katsushiro.load(s2d);
        kikuchiyo.load(s2d);
        kyuzo.load(s2d);
        
        
        //TODO: assign samurai to player
        //TODO: Create and assign Player roster array.

        roster.push(daisuke);
        roster.push(gorobei);
        roster.
    
        // There needs to be an eaiser way to assign samurai to the same player
        // Create function for each player that accepts a samurai as a parameter.
        //p1.set(daisuke.getBattleTrack());
        //p1.setSamurai(daisuke);
        
        // player join slots at the correct postion. TODO: make it fit multiple screen sizes
        slot1 = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        slot1.text = "Player 1: press any key to join";
        slot1.setPosition(50, 343);
        slot1.scale(3);

        slot2 = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        slot2.text = "Player 2: press any key to join";
        slot2.setPosition(50, 686);
        slot2.scale(3);

        slot3 = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        slot3.text = "Player 3: press any key to join";
        slot3.setPosition(50, 1080);
        slot3.scale(3);

        slot4 = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        slot4.text = "Player 4: press any key to join";
        slot4.setPosition(974, 1080);
        slot4.scale(3);

        slot5 = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        slot5.text = "Player 5: press any key to join";
        slot5.setPosition(1898, 1080);
        slot5.scale(3);

        slot6 = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        slot6.text = "Player 6: press any key to join";
        slot6.setPosition(1898, 686);
        slot6.scale(3);

        slot7 = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        slot7.text = "Player 7: press any key to join";
        slot7.setPosition(1898, 343);
        slot7.scale(3);

        // numPlayers = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        // numPlayers.text = "Number of Players";
        // numPlayers.setPosition(100, 100);
        // numPlayers.scale(4);

        // playerCount = new h2d.TextInput(hxd.res.DefaultFont.get(), s2d);
        // playerCount.text = "E";
        // playerCount.setPosition(650, 100);
        // playerCount.scale(4);

        //Add players to array.
        // If CPU allowed to make selections to fill out the roster. let the player set the option.
        // This should be togglable. 
        // player roster
         // Create For loop for Players where selected samurai are connected to players.
            // How to make this a simulataneous Selection
         
        //Input Samurai Select here with images
        // selectChar = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        // selectChar.text = "Select Your Samurai";
        // selectChar.setPosition(x,y);
        // selectChar.scale(4);
        
        t = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        t.setPosition(x,y);
        t.scale(4);


        // hxd.Window.getInstance().addEventTarget(playerSelect);

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
    
    // assigns to the player their chosen samurai
    function clickOnSamurai(event: hxd.Event){
        //sam:Samurai, p:Player){
        // if (event.kind == ERelease && (hxd.Window.mouseX == sam1.x) && (hxd.Window.mouseY == sam1.y)){
        //     // samurai == object at mouse pos
        //     // playerSelectSamurai(something, something);

        // }
    
    }

    function playerSelectSamurai(sam: Samurai, p: Player){
        p.setSamurai(sam);
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

    function getRoster(){
        return roster;
    }

}