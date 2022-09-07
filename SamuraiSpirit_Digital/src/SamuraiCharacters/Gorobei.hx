class Gorobei extends Samurai{

    public override function init(){
        this.name = "Gorobei";
        this.battleTrack = 9;
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