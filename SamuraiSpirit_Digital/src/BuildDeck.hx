
class BuildDeck {

    private var commonRaider:Array<Raider> = [];
    private var lieutRaider:Array<Raider> = [];
    private var bossRaider:Array<Raider> = [];

    private var type:String;
    private var isFlame:Bool;
    private var defSymbol:Array<String> = ["Hat", "Doll", "Farm", "None"];
    private var penalty:Array<String> = ["Fire", "Wound", "Ninja", "Cancel-Block", "Cancel-Support", "Pass-Left", "Pass-Right", "None"];
    private var bossPenalty:Array<String> = ["Demon", "Swords", "Meeple", "Discard"];
    private var hasSymbol:String;
    private var hasPenalty:String;
    private var hasBossPenalty:String;
    private var raid:RaiderDeckDetails;
    private var raider:Raider;
    private var id:String;
	
    public function new(){
        generateCards();
    }

    public function loadCommon(){
        return commonRaider;
    }

    public function loadLieut(){
        return lieutRaider;
    }

    public function loadBoss(){
        return bossRaider;
    }

    private function generateCards(){

        raid = new RaiderDeckDetails();

        for(raidLvl in 1 ... 7){
            createRaiders(raidLvl);
        }

        printRaiders();
    }

    private function createRaiders(raidLvl:Int){

        raid.setLevelDetails(raidLvl);
        isFlame = true;
        hasSymbol = "Hat";
        hasPenalty = "Fire";
        hasBossPenalty = "None";
        raid.setToggle(0);
        

        for(raiderCard in 1 ... raid.getCardNum()+1){

            //checks if current defsymbol can be applied to a raider.
            //If it cannot then the the symbol is switched and the flame boolean is reset
            
            if(raid.getHats() == 0){
                hasSymbol = defSymbol[1]; // switches hat to doll
                isFlame = true;
            }

            if(raid.getDolls() == 0){
                hasSymbol = defSymbol[2]; // switches doll to farm
                isFlame = true;
            }

            if(raid.getFarms() == 0){
                hasSymbol = defSymbol[3]; //switches farm to none
                isFlame = true;
            }

            //Checks if all available flames have been assigned to specific def symbols
            if(isFlame == true && raidLvl != 6){
                if(raid.getFlames() < 1){
                    isFlame = false;
                }

                if(hasSymbol == "Hat"){
                    if(raid.getHats() < 3 && raidLvl < 3){
                        isFlame = false;
                    }

                    else if(raid.getHats() < 2 && raidLvl <= 4){
                        isFlame = false;
                    }

                    else if(raid.getHats() < 2 && raidLvl == 5){
                        isFlame = false;
                    }

                    else{
                        raid.setFlames(raid.getFlames() - 1);
                    }
                }

                if(hasSymbol == "Doll"){
                    if(raid.getDolls() < 3){
                        isFlame = false;
                    }

                    else if(raid.getDolls() <= 3 && raidLvl > 2 && raidLvl < 5){
                        isFlame = false;
                    }

                    else if(raid.getDolls() < 1 && raidLvl == 5){
                        isFlame = false;
                    }

                    else{
                        raid.setFlames(raid.getFlames() - 1);
                    }
                }

                if(hasSymbol == "Farm"){
                    if(raid.getFarms() <= 2){
                        isFlame = false;
                    }

                    if(raid.getFarms() < 1 && raidLvl == 5){
                        isFlame = false;
                    }

                    else{
                        raid.setFlames(raid.getFlames() - 1);
                    }
                }
            }
            
            // sets Penalties for bosses and other 
            if(raidLvl == 6){
                type = "Boss";
                isFlame = true;
                raid.setToggle(0);
                hasPenalty = bossPenalties(hasSymbol, penalty, bossPenalty, raiderCard);
                raid.setToggle(1);
                hasBossPenalty = bossPenalties(hasSymbol, penalty, bossPenalty, raiderCard);
            }

            else{
                if(raidLvl == 5){
                    type = "Lieutenant";
                    
                }
                else if(raidLvl <= 4){
                    type = "Plunderer";
                }
                hasPenalty = commonPenalties(raidLvl, hasSymbol, isFlame, penalty);
                hasBossPenalty = "None";
            }

            id = generateID(type, Std.string(raidLvl), Std.string(raiderCard));
            raider = new Raider(id, type, raidLvl, raiderCard, hasSymbol, hasPenalty, hasBossPenalty, isFlame);
            
            if(raidLvl <= 4){
                commonRaider.push(raider);
            }

            else if(raidLvl == 5){
                lieutRaider.push(raider);
            }
            
            else
                bossRaider.push(raider);

            //decrements defSymbol count after being assigned.
            if(hasSymbol == "Hat" && raid.getHats() > 0){
                raid.setHats(raid.getHats() - 1);
            }

            if(hasSymbol == "Doll" && raid.getDolls() > 0){
                raid.setDolls(raid.getDolls() - 1);
            }

            if(hasSymbol == "Farm" && raid.getFarms() > 0){
                raid.setFarms(raid.getFarms() - 1);
            }
        } 
    }

    private function commonPenalties(level:Int, symbol:String, flame:Bool, penalties:Array<String>){
        
        var penalty:String = "";
        
        if(symbol == "Hat"){
            if(flame == true){
                penalty = flameHatPenalty(level, penalties);
            }
            else{
                penalty = plainHatPenalty(level, penalties);
            }
        }

        else if(symbol == "Doll"){
            if(flame == true){
                penalty = flameDollPenalty(level, penalties);
            }
            else{
                penalty = plainDollPenalty(level, penalties);
            }
        }

        else if(symbol == "Farm"){
            if(flame == true){
                penalty = flameFarmPenalty(level, penalties);
            }
            else{
                penalty = plainFarmPenalty(level, penalties);
            }
        }

        else if(symbol == "None"){
           
            if(flame == true){
                penalty = blankFlamePenalty(level, penalties);
            }
            else{
                penalty = blankPlainPenalty(level, penalties);
            }
           
        }

        return penalty;
    }

    private function blankFlamePenalty(level:Int, penalties:Array<String>){
        var penalty:String = "";

        if(raid.getToggle() == 0){
            raid.setToggle(1);
            
            if(level == 1 || level == 2 || level == 5){
                penalty = penalties[0];
            }
            else if(level == 3 || level == 4){
                penalty = penalties[4];
            }
        }

        else if(raid.getToggle() == 1){
            raid.setToggle(2);

            if(level == 5){
                penalty = penalties[1];
            }
        }

        else if(raid.getToggle() == 2){
            raid.setToggle(3);

            if(level == 5){
                penalty = penalties[2];
            }
        }

        else if(raid.getToggle() == 3){
            raid.setToggle(0);

            if(level == 5){
                penalty = penalties[4];
            }
        }
        return penalty;
    }

    private function blankPlainPenalty(level:Int, penalties:Array<String>){
        var penalty:String = "";

        if(raid.getToggle() == 0){
            raid.setToggle(1);

            if(level == 1 || level == 2){
                penalty = penalties[0];
            }
            else if(level == 3 || level == 4){
                penalty = penalties[1];
            }
        }
        return penalty;
    }

    private function flameFarmPenalty(level:Int, penalties:Array<String>){
        var penalty:String = "";
        
        if(raid.getToggle() == 0){
            raid.setToggle(1);

            if(level == 1 || level == 2 || level == 3 || level == 4){
                penalty = penalties[0];
            }
        }

        else if(raid.getToggle() == 1){
            raid.setToggle(0);

            if(level == 1 || level == 2 || level == 3 || level == 4){
                penalty = penalties[1];
            }
        }

        return penalty;
    }

    private function plainFarmPenalty(level:Int, penalties:Array<String>){
        var penalty:String = "";
        
        if(raid.getToggle() == 0){
            raid.setToggle(1);

            if(level == 1 || level == 2 || level == 3 || level == 4){
                penalty = penalties[4];
            }
            else if(level == 5){
                raid.setToggle(0);
                penalty = penalties[0];
            }
        }

        else if(raid.getToggle() == 1){
            raid.setToggle(0);

            if(level == 1 || level == 2){
                penalty = penalties[2];
            }
            else if(level == 3){
                penalty = penalties[5];
            }
            else if(level == 4){
                penalty = penalties[6];
            }
        }

        return penalty;
    }

    private function flameDollPenalty(level:Int, penalties:Array<String>){
        var penalty:String = "";

        if(raid.getToggle() == 0){
            raid.setToggle(1);

            if(level == 1 || level == 2 || level == 3 || level == 4){
                penalty = penalties[0];
            }
        }

        else{
            raid.setToggle(0);
            if(level == 1 || level == 2 || level == 3 || level == 4){
                penalty = penalties[1];
            }
        }

        return penalty;
    }

    private function plainDollPenalty(level:Int, penalties:Array<String>){
        var penalty:String = "";

        if(raid.getToggle() == 0){
            raid.setToggle(1);

            if(level == 1 || level == 2 || level == 3 || level == 4){
                penalty = penalties[7];
            }
        }

        else if(raid.getToggle() == 1){
            raid.setToggle(2);

            if(level == 1 || level == 2 || level == 5){
                penalty = penalties[2];
                raid.setToggle(0);
            }
            else if(level == 3 || level == 4){
                penalty = penalties[3];
            }
        }

        else{
            raid.setToggle(0);

            if(level == 3){
                penalty = penalties[5];
            }
            else if(level == 4){
                penalty = penalties[6];
            }
        }

        return penalty;
    }

    private function flameHatPenalty(level:Int, penalties:Array<String>){
        var penalty:String = "";

        if(raid.getToggle() == 0){
            raid.setToggle(1);

            if (level == 1 || level == 2){
                penalty = penalties[1];
            }
            else if(level == 3 || level == 4){
                penalty = penalties[0];
            }
        } 
        
        else{
            raid.setToggle(0);

            if(level == 1 || level == 2 || level == 3){
                penalty = penalties[7];
            }
            else if(level == 4){
                penalty = penalties[6];
            }
        }
        
        return penalty;
    }

    private function plainHatPenalty(level:Int, penalties:Array<String>){
        var penalty:String = "";

       
        if(raid.getToggle() == 0){
            raid.setToggle(1);

            if(level == 1 || level == 2){
                penalty = penalties[2];

            }
            else if(level == 3){
                penalty = penalties[5];
                raid.setToggle(0);
            }
            else if(level == 4){
                penalty = penalties[7];
                raid.setToggle(0);
            }
            else if(level == 5){
                penalty = penalties[1];
            }
        }

        else{
            raid.setToggle(0);
            
            if (level == 1 || level == 2){
                penalty = penalties[3];
            }
        }

        return penalty;
    }

    private function bossPenalties(symbol:String, penalties:Array<String>, bossPenalties:Array<String>, raider:Int){
        var penalty:String = "";

        if(symbol == "Hat"){
            penalty = penalties[2];
        }

        else if(symbol == "Doll"){
            if(raid.getToggle() == 0){
                penalty = penalties[7];
            }
            else{
                penalty = bossPenalties[2];
            }
        }

        else if(symbol == "Farm"){
            penalty = penalties[0];
        }

        else{
            if(raider == raid.getCardNum() - 3){
                if(raid.getToggle() == 0){
                    penalty = penalties[3];
                }
                else if(raid.getToggle() == 1){
                    penalty = bossPenalties[0];
                }
            }
            else if(raider == raid.getCardNum() - 2){
                if(raid.getToggle() == 0){
                    penalty = penalties[1];
                }
                else if(raid.getToggle() == 1){
                    penalty = bossPenalties[1];
                }
            }
            else if(raider == raid.getCardNum() - 1){
                if(raid.getToggle() == 0){
                    penalty = penalties[4];
                }
                else if(raid.getToggle() == 1){
                    penalty = penalties[1];
                }
            }
            else if(raider == raid.getCardNum()){
                if(raid.getToggle() == 0){
                    penalty = penalties[7];
                }
                else if(raid.getToggle() == 1){
                    penalty = bossPenalties[3];
                }
            }
        }

        return penalty;
    }

    private function generateID(type:String, level:String, setNum:String){
        var id:String;

        id = type + level + "-" + setNum;
      

        return id;
    }

    // print to a yaml file
    private function printRaiders(){

      
    }


}
