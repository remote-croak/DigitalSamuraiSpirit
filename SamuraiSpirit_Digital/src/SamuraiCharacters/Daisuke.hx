class Daisuke extends Samurai{

    public override function init(){
        this.name = "Daisuke";
        this.battleTrack = 8;
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
        }

        else{
            this.battleTrack = 8; 
            this.beastForm = false;
        }
  
    }
  }