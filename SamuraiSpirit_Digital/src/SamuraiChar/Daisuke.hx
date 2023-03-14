package samuraiChar;

class Daisuke extends Samurai{

    public override function load(scene:h2d.Scene){
        this.scene = scene;
        this.name = "Daisuke";
        this.battleTrack = 8;
        this.xPos = scene.width/2 - 136;
        this.yPos = scene.height/2 - 192;
        this.portrait = hxd.Res.art.samurai1SM.toTile();
        
        this.setupCharSel();
        
    }

    public override function humanKiai(){
  
    }
  
    public override function beastKiai(){
  
    }
  
    public override function talent(){
  
    }
  
    public override function animorph(){
        if (beastForm = false){
            this.battleTrack = 11;
            this.beastForm = true;
            // this.card;
        }

        else{
            this.battleTrack = 8; 
            this.beastForm = false;
            // this.card;
        }
  
    }
}