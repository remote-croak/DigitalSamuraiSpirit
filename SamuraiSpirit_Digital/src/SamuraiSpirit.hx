//import scenes.SplashScne;
class SamuraiSpirit extends hxd.App{

    var txtScne:scenes.TextVersion;
    var splashScne:scenes.SplashScne;
    // private var graphicsScne:h2d.Scene;

    public static var instance(get, null):SamuraiSpirit;

    private static function get_instance():SamuraiSpirit{
        if(instance == null){
            trace("get instance");
            instance = new SamuraiSpirit();
            trace("loaded instance");
        }
        return instance;
    }

    private function new(){
        super();
    }

    public function changeScne(scne:BaseScne){
        trace("change scene", scne);
        
        setScene(scne);
        scne.init();

    }
    // var common:Array<Raider>;
    // var lieut:Array<Raider>;
    // var boss:Array<Raider>;
    // var master:Array<Raider>; // this is the deck that players will pull cards from each round
    // var roster:Array<Player> = []; // contains all player data. This means chosen Samurai
    // var deck:BuildDeck = new BuildDeck();

    // var t:h2d.Text;
    // var gameModeInput:h2d.TextInput;
    // var playerCount:h2d.TextInput;
    // var cardCount: h2d.Text;
    // var numPlayers:h2d.Text;
    // var selectChar:h2d.Text;

    // var p1Name:h2d.Text;
    // var p1Samurai:h2d.Text;
    // var p2Name:h2d.Text;
    // var p2Samurai:h2d.Text;
    // var p3Name:h2d.Text;
    // var p3Samurai:h2d.Text;
    // var p4Name:h2d.Text;
    // var p4Samurai:h2d.Text;
    // var p5Name:h2d.Text;
    // var p5Samurai:h2d.Text;
    // var p6Name:h2d.Text;
    // var p6Samurai:h2d.Text;
    // var p7Name:h2d.Text;
    // var p7Samurai:h2d.Text;

    // // initalize samurai character variables
    // var daisuke:samuraiChar.Daisuke = new samuraiChar.Daisuke();
    // var gorobei:samuraiChar.Gorobei = new samuraiChar.Gorobei();
    // var heihachi:samuraiChar.Heihachi = new samuraiChar.Heihachi();
    // var kanbei:samuraiChar.Kanbei = new samuraiChar.Kanbei();
    // var katsushiro:samuraiChar.Katsushiro = new samuraiChar.Katsushiro();
    // var kikuchiyo:samuraiChar.Kikuchiyo = new samuraiChar.Kikuchiyo();
    // var kyuzo:samuraiChar.Kyuzo = new samuraiChar.Kyuzo();
    
    // var rNum:Int;
    // var x:Int = 200;
    // var y:Int = 200;
    // var confirm = false;

    // // all player join slots.
    // var slot1:h2d.Text;
    // var slot2:h2d.Text;
    // var slot3:h2d.Text;
    // var slot4:h2d.Text;
    // var slot5:h2d.Text;
    // var slot6:h2d.Text;
    // var slot7:h2d.Text;

   
    override function init(){

        splashScne = new scenes.SplashScne();
        txtScne = new scenes.TextVersion();
        setScene(splashScne);
        splashScne.init();
        trace("help");

    //     //hxd.Window.getInstance().addEventTarget(assignSamurai);

    //     // common = deck.loadCommon();
    //     // lieut = deck.loadLieut();
    //     // boss = deck.loadBoss();

    //     // master = new Array();
    //     // roster = new Array();

    //     // daisuke.load(s2d);
    //     // gorobei.load(s2d);
    //     // heihachi.load(s2d);
    //     // kanbei.load(s2d);
    //     // katsushiro.load(s2d);
    //     // kikuchiyo.load(s2d);
    //     // kyuzo.load(s2d);

    

        

    //     //TODO: Select Game Mode(Graphical or Text)
    //     //TODO: create new scene and add it to the scene manager
    //     //TODO: create a scene manager

    //    //gameModeInput.text = "Type Graphics or Text for game mode";
    //     // if (gameModeInput.text == "graphics"){
    //     //     //TODO: Load Graphical Version GraphicGame.hx
    //     // }
    //     // else if (gameModeInput.text == "text"){
    //     //     //TODO: Load Text Game Version TextGame.hx
    //     // }

    }

    static function main() {
        hxd.Res.initEmbed(); //load resources
        //new SamuraiSpirit();
        trace("Start Game");
        //new SamuraiSpirit();
       SamuraiSpirit.instance;
    }

    override function update(dt:Float){
        splashScne.update(dt);

    //     // if(hxd.Key.isPressed(hxd.Key.ENTER)){
    //     //     trace(playerCount.text);
    //     //     distribute(getPlayerCount(playerCount.text), common, lieut, boss);
    //     // }
        
                
    //     // if (hxd.Key.isReleased(hxd.Key.UP)){
            
    //     //     if(rNum <= 0){
    //     //         rNum = 0;
    //     //     }

    //     //     else{
    //     //         rNum -= 1;
    //     //     }
    //     // }

    //     // else if(hxd.Key.isReleased(hxd.Key.DOWN)){
            
    //     //     if(rNum >= master.length - 1){
    //     //         rNum = master.length - 1;
    //     //     }
    //     //     else{
    //     //         rNum += 1;
    //     //     }
    //     // }
        
    //     // if(master[rNum] != null){
    //     //     t.text = master[rNum].getID();
    //     //     t.setPosition(x,y);
    //     //     }
    }
    
    // assigns to the player their chosen samurai
    // function clickOnSamurai(event: hxd.Event){
        //sam:Samurai, p:Player){
        // if (event.kind == ERelease && (hxd.Window.mouseX == sam1.x) && (hxd.Window.mouseY == sam1.y)){
        //     // samurai == object at mouse pos
        //     // playerSelectSamurai(something, something);

        // }
    
    // }

    // function playerSelectSamurai(sam: Samurai, p: Player){
    //     p.setSamurai(sam);
    // }

    // function shuffleCards(numCards:Int, arr:Array<Raider>) : Array<Raider>{
    //     var card:Raider;
    //     var cardPos:Int;
    //     var tempArr:Array<Raider> = [];
    //     trace(numCards);
    //     for (draw in 0 ... (numCards)){
    //         cardPos = Math.round(Math.random() * arr.length - 1);

    //         if(cardPos <= 0){
    //             cardPos = 0;
    //         };
          
    //         card = arr[cardPos];
    //         tempArr.push(card);
    //         arr.remove(card);
    //     }
   
    //     return tempArr;
    // }

    // divides the entire collection of raider cards into the master playing deck
    // cards are divided on type and based on the current round.
    // Round 1 sends a portion of common raiders to the master deck
    // Round 2 sends a portion of lieutenants to the master deck
    // Round 3 sends a portion of the bosses to the master deck
    // function distribute(playerCount:Int, c:Array<Raider>, l:Array<Raider>, b:Array<Raider>){
        
    //     for(round in 1 ... 4){
          
    //         // for round 1 a random selection of plunderer cards make a playing deck

    //         if (round == 1){           
    //             master = shuffleCards(playerCount * 7, c);              
    //         }

    //         // round 2 sees that lieutenent cards are added to the playing deck.
    //         else if (round == 2){
    //             master = master.concat(shuffleCards(playerCount, l));
    //             master = shuffleCards(master.length, master);   
    //         }

    //         else if (round == 3){
    //             master = master.concat(shuffleCards(playerCount, b));
    //             master = shuffleCards(master.length, master);
    //         }
    //     }

    // }

    // function getPlayerCount(players:String){

    //     var count:Int = 0;
    //     count = Std.parseInt(players);
    //     return count;

    // }

}