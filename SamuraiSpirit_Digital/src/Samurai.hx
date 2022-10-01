// samurai name
// samurai battle track
// samurai ability
// left side array
// right side array

class Samurai{

    var leftArray:Array<Raider> = []; // pos0: farm, pos1: hat, pos2: doll maximunm size is 3
    var rightArray:Array<Raider> = []; // maximum size is variable
    var name:String;
    var battleTrack:Int = 0;
    var beastForm:Bool;

    public function new(){
        this.name = "";
        this.battleTrack = 0;
        this.beastForm = false;
    }

    public function init(){
    }

    public function humanKiai(){

    }

    public function beastKiai(){

    }

    public function talent(){

    }

    public function animorph(){
        // Changes the card image, the battletrack number,
        // and sets the beastform to either true or false
        //IMPLEMENT: Card image change

    }

    public function setBattleTrack(){
    
    }

    public function getBattleTrack(){
        return this.battleTrack;
    }

    public function getName(){
        return this.name;
    }
}
