class Katshushiro extends Samurai{
    public override function init(){
        this.name = "Katsushiro";
        this.battleTrack = 10;
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