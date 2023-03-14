package samuraiChar;

class Katsushiro extends Samurai{

    public override function load(scene:h2d.Scene){
        this.scene = scene;
        this.name = "Katsushiro";
        this.battleTrack = 10;
        this.xPos = scene.width/2 - 68;
        this.yPos = scene.height/2;

        this.portrait = hxd.Res.art.samurai5SM.toTile();
        
        this.setupCharSel();
    }

  
    public override function humanKiai(){
  
    }
  
    public override function beastKiai(){
  
    }
  
    public override function talent(){
  
    }
  
    public override function animorph(){
        
        if(beastForm == false){
            this.battleTrack = 13;
            this.beastForm = true;
        }
        else{
            this.battleTrack = 10;
            this.beastForm = false;
        }
  
    }
}