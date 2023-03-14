package samuraiChar;

class Kanbei extends Samurai{

    public override function load(scene:h2d.Scene){
        this.scene = scene;
        this.name = "Kanbei";
        this.battleTrack = 9;
        this.xPos = scene.width/2 - (136 + 68);
        this.yPos = scene.height/2;

        this.portrait = hxd.Res.art.samurai4SM.toTile();

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
            this.battleTrack = 12;
            this.beastForm = true;
        }
        else{
            this.battleTrack = 9;
            this.beastForm = false;
        }
  
    }
}