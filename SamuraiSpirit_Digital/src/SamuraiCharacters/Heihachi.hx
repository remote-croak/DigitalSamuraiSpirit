class Heihachi extends Samurai{

    public override function init(){
        this.name = "Heihachi";
        this.battleTrack = 8;
    }
  
    public override function humanKiai(){
  
    }
  
    public override function beastKiai(){
  
    }
  
    public override function talent(){
  
    }
  
    public override function animorph(){
        if(beastForm = false){
            this.battleTrack = 11;
            this.beastForm = true;
        }
        else{
            this.battleTrack = 8;
            this.beastForm = false;
        }
  
    }
  }