

// This will contain player actions in the Samurai Spirit Boardgame
// actions like:    claiming and positioning raiders on a player board/section of the screen
//                  ending turns
//                  using powers and activating Kiai forms(flipping boards over)
//                  drawing cards from the raider deck
//
 class Player{
    var samName:String; // the name of the samurai the player selected
    var selectedSam:Samurai; // the samurai class object that the player selected
    var playerName:String;
    var health: Int;

    public function new(pName:String){
        
        this.playerName = pName;
        this.health = 0;
        this.selectedSam;
        this.samName = " ";
    }

    // when the samurai transforms health needs to be updated to new battleTrack
    public function updateHealth(){
        this.health = selectedSam.getBattleTrack();
    }
    public function getHealth(){
        return this.health;
    }

    public function setSamurai(sam:Samurai){
        this.selectedSam = sam;
        this.samName = sam.getName();
        this.health = sam.getBattleTrack();
    }

    // access selected samurai abilities and forms
    public function getSamurai(){
        return this.selectedSam;
    }



//     public function nameChange(pName: String){
//         this.playerName;
//     }
}