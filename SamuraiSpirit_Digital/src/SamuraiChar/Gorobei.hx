package samuraiChar;

class Gorobei extends Samurai{

    public override function load(scene:h2d.Scene){
        this.scene = scene;
        this.name = "Gorobei";
        this.battleTrack = 9;
        this.xPos = scene.width/2;
        this.yPos = scene.height/2 - 192;

        this.portrait = hxd.Res.art.samurai2SM.toTile();

        this.setupCharSel();

    }

  
  
    public override function humanKiai(){
  
    }
  
    public override function beastKiai(){
  
    }
  
    public override function talent(){
  
    }
  
    public override function animorph(){
        if (beastForm == true){
            this.battleTrack = 12;
            this.beastForm = true;
        }
        else{
            this.battleTrack = 9;
            this.beastForm = false;
        }
  
    }
}