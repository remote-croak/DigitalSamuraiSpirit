package;
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

    var xPos:Float = 0;
    var yPos:Float = 0;

    var scene:h2d.Scene;
    var portrait:h2d.Tile;
    var portraitGraphics:h2d.Graphics;
    var portraitInteract:h2d.Interactive;

    public function new(){}

    public function load(scene:h2d.Scene){

    }

    private function setupCharSel(){
        this.loadGraphics();
        this.loadInteraction();
        this.menuSelect();
        trace(this.name + " is selectable");
    }

    private function loadGraphics(){

        this.portraitGraphics = new h2d.Graphics(this.scene);
        this.portraitGraphics.drawTile(this.xPos, this.yPos, this.portrait);
        this.loadInteraction();
    }

    private function loadInteraction(){
        this.portraitInteract = new h2d.Interactive(136,192, this.portraitGraphics);
        this.portraitInteract.x = this.xPos;
        this.portraitInteract.y = this.yPos;
    }

    private function menuSelect(){
        portraitInteract.onOver = function(event:hxd.Event){
            portraitGraphics.alpha = 0.5;

        }
        portraitInteract.onOut = function(event:hxd.Event){
            portraitGraphics.alpha = 1;
            
        }
    }

    public function getImage(){
        return portrait;
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
