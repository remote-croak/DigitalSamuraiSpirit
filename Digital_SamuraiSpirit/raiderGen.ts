// create individual cards and record as a single json file. Store in Raider Folder

// Generate Code for Plunderer
    // This is only applicable for Plunder level 1, Each new level requires a custom counter set.
// hat counter
// house counter
// doll counter
// Blank Def counter
// flames counter
// Penalty Counters
    // fire = 3
    // wound = 3
    // ninja = 3
    // cancel-block = 1
    // cancel-support = 1
    // pass-left = 1
    // pass-right = 1
    // blank penalty

// loop for 4 levels of Plunderer
// for i = 1; i <= 13 ; i++


// When generating a single plunderer only one Def Symbol can be applied
// Only one Penalty can be applied
// Flame can only trigger on. Easiest to implement accurate counter.
// An Einstein puzzle dealing with truth tables.

// for every card check if a statement is true
    // the statement changes for every new raider.

    // DEAL WITH THE LOWEST SUPPLY FIRST
    // ONLY TWO HATS CAN HAVE FLAMES, THE SAME IS TRUE IS FOR DOLLS AND HOUSES

    // if a raider has no def symbol then
        // if there are penalties available
        // if there are flames available

    // if a raider has a def symbol then
        // if there are penalties available
        // if there are flames available



// URGENT:: which raiders have flames and specific def symbols and specific penalties.

        // Generation Stages
// Set Raider Level
// Set Def Symbol
// Set Penalty
// Set Flames.
// function generate ID
// String Raider Type
// String Level
// concat Raider Type Level - Num_in_Set;
// String Num_in_Set

var card_array:Raider[];

interface Raider {
    id:string;
    type:string;
    level:number;
    setNum:number;
    defSymbol:string;
    penalty:string;
    bossPenalty?:string;
    flame:boolean;
}

class RaiderGeneration{

  private _hats:number;
  private _dolls:number;
  private _farms:number;
  private _flames:number;
  private _toggle:number;
  private _numCards:number;

  constructor(){
    this._hats = 0;
    this._dolls = 0;
    this._farms = 0;
    this._flames = 0;
    this._toggle = 0;
    this._numCards = 0;
  }


  setToggle(num:number){
    this._toggle = num;
  }

  getToggle(){
    return this._toggle;
  }

  setHats(num:number){
    this._hats = num;
  }

  getHats(){
    return this._hats;
  }

  setDolls(num:number){
    this._dolls = num;
  }

  getDolls(){
    return this._dolls;
  }

  setFarms(num:number){
    this._farms = num;
  }

  getFarms(){
    return this._farms;
  }

  setFlames(num:number){
    this._flames = num;
  }
  getFlames(){
    return this._flames;
  }

  setCardNum(num: number){
    this._numCards = num;
  }

  getCardNum(){
    return this._numCards;
  }
}

  generateCards();

  function getRandomInt(min:number, max:number) {
      min = Math.ceil(min);
      max = Math.floor(max);
      return Math.floor(Math.random() * (max - min) + min); //The maximum is exclusive and the minimum is inclusive
  }

  function generateCards(){


      card_array = [];
      buildRaider(5);

      printRaider();

  }

  // Switching to Farms is an issue and Flames are false after the initial two are set for hats.
  // This function needs to be separated into three different files. and called in the main code. Too much spagetti.
  function buildRaider(level:number){

      const raid = new RaiderGeneration();
      var raider_type:string[] = ["Plunderer", "Lieutenants", "Bosses"];
      var type:string;
      var isFlame:boolean = true;
      var defSymbol:string[] = ["hat", "doll", "farm", "none"];
      var penalty:string[] = ["Fire", "Wound", "Ninja", "Cancel-Block", "Cancel-Support", "Pass-Left", "Pass-Right", "None"];

      var setPenalty:string = penalty[0]; //PROBLEM: there is no set pattern to the penalties on a card
      var hasSymbol:string = defSymbol[0];
      var hasPenalty;
      var penaltyToggle:number = 0;
      var card_test = 0;

      // PROBLEM: Each level needs to be refactored into separte functions.
      type = setLevelDetail(level, raid);
          //Need to set specific card numbers according to level
          // loop that generates cards
        for(var r:number = 1; r <= raid.getCardNum(); r++){

            //check if def Symbol exists, switches symbol if not and resets flame boolean.
            if(raid.getHats() == 0){
                hasSymbol = defSymbol[1];
                isFlame = true;
            }

            if(raid.getDolls() == 0){
                hasSymbol = defSymbol[2];
                isFlame = true;

            }

            if(raid.getFarms() == 0){
                hasSymbol = defSymbol[3];

            }

            //REFACTOR into seperate function
            // Checks specific def symbols if all available flames have been assigned
            //console.log("flame: ", isFlame + "Hats: ", raid.getHats());
            console.log("\nBEFORE: numFlames: ", raid.getFlames());
            if(isFlame == true){
              if(raid.getFlames() == 0){
                  isFlame = false;
              }

              if(hasSymbol == "hat"){
                  if(raid.getHats() <= 2) {
                      isFlame = false;
                  }

                  else{
                    console.log("SUBTRACT");
                    raid.setFlames(raid.getFlames() - 1);
                  }
                }

              if(hasSymbol == 'doll'){
                  if(raid.getDolls() <= 2){
                      isFlame = false;
                  }

                  else{
                    console.log("SUBTRACT");
                    raid.setFlames(raid.getFlames() - 1);
                  }
                }

                //console.log("farms: ", raid.getFarms());
                //console.log("flames: ", isFlame);

               if(hasSymbol == "farm"){
                   if(raid.getFarms() <= 2){
                       isFlame = false;
                   }

                   else{
                     console.log("SUBTRACT");
                     raid.setFlames(raid.getFlames() - 1);
                   }
                }
            }

            console.log("AFTER: numFlames: ", raid.getFlames() + " flames: ", isFlame);

            // add penalty to cards
            //var penalty:string[] = ["Fire", "Wound", "Ninja", "Cancel-Block", "Support-Block", "Pass-Left", "Pass-Right", "None"];

            //hat penalties
            //REFACTOR: into seperate function
            hasPenalty = startLevelPenalties(level, hasSymbol, isFlame, penalty, raid);

            // assigns builds current raider card specifics
            let raider:Raider = {
                id: generateID(type, level.toString(), r.toString()),
                type: "Plunderer",
                level: level,
                setNum: r,
                flame: isFlame,
                defSymbol: hasSymbol,
                penalty: hasPenalty,
                bossPenalty: "none",

            };

            card_array.push(raider);

            // decrements the def symbol count after being assigned.
            if(hasSymbol == "hat" && raid.getHats() > 0){
                raid.setHats(raid.getHats() - 1);

             }

            if(hasSymbol == "doll" && raid.getDolls() > 0){
              raid.setDolls(raid.getDolls() - 1);
            }

            if(hasSymbol == "farm" && raid.getFarms() > 0){
                raid.setFarms(raid.getFarms() - 1);
            }
            //console.log("hats: ", raid.getHats() + " dolls: ", raid.getDolls() + " farms: ", raid.getFarms());
        }
    }

  // function addPenalties(){
  //   startLevelPenalties();
  //   level3Penalties();
  //   level4Penalties();
  //   lieutenantPenalties();
  //   bossPenalties();
  // }

  function setLevelDetail(level: number, raid: any){
    var type: string = "";

    if (level == 1 || level == 2){
      type = "P";
      raid.setHats(4);
      raid.setDolls(4);
      raid.setFarms(4);
      raid.setFlames(6);
      raid.setCardNum(13);
    }
    else if (level == 3 || level == 4){
      type = "P";
      raid.setHats(3);
      raid.setDolls(5);
      raid.setFarms(4);
      raid.setFlames(6);
      raid.setCardNum(13);

    }
    else if (level == 5){
      type = "L";
      raid.setHats(1);
      raid.setDolls(1);
      raid.setFarms(1);
      raid.setFlames(4);
      raid.setCardNum(7);
    }
    else if (level == 6){
      type = "B";
      raid.setHats(1);
      raid.setDolls(1);
      raid.setFarms(1);
      raid.setFlames(7);
      raid.setCardNum(7);
    }

    return type;
  }

  function startLevelPenalties(level:number, symbol:string, flame:boolean, penalties:string[], raid:any){
    var penalty: string = "";

    if(symbol == "hat"){
      if(flame == true){
        //console.log("toggle: ", raid.getToggle());
        penalty = flameHatPenalty(level, penalties, raid)
      }

      else{
        penalty = plainHatPenalty(level, penalties, raid)
      }
    }

    else if(symbol == "doll"){
      if(flame == true){
        penalty = flameDollPenalty(level, penalties, raid);
      }

      else{
        penalty = plainDollPenalty(level, penalties, raid);
      }
    }

    else if(symbol == "farm"){
      if(flame == true){
        penalty = flameFarmPenalty(level, penalties, raid);
      }

      else{
        penalty = plainFarmPenalty(level, penalties, raid);
      }
    }

    else if(symbol == "none"){
      if(flame == true){
        penalty = blankFlamePenalty(level, penalties, raid);
      }

      else{
        penalty = blankPlainPenalty(level, penalties, raid);
      }
    }

    return penalty;
    // addDollPenalties();
    // addFarmPenalties();
    // addBlankPenalties();
  }

  // function level3Penalties(){
  //   addHatPenalties(true, 0, 1);
  //   addDollPenalties();
  //   addFarmPenalties();
  //   addBlankPenalties();
  // }
  //
  // function level4Penalties(){
  //   addHatPenalties(true, 0, 1);
  //   addDollPenalties();
  //   addFarmPenalties();
  //   addBlankPenalties();
  // }
  //
  // function lieutenantPenalties(){
  //   addHatPenalties(true, 0, 1);
  //   addDollPenalties();
  //   addFarmPenalties();
  //   addBlankPenalties();
  // }
  //
  // // this should be unique
  // function bossPenalties(){
  //   addHatPenalties(true, 0, 1);
  //   addDollPenalties();
  //   addFarmPenalties();
  //   addBossPenalties();
  // }

  // Function Description: Add a penalty to a card with flames and no defensive symbols
  function blankFlamePenalty(level: number, penalty_array: string [], raid: any): string{
    var penalty: string = "";

    if(raid.getToggle() == 0){
      raid.setToggle(1);

      if(level == 1 || level == 2 || level == 5){
        penalty = penalty_array[0];
      }
      else if(level == 3 || level == 4){
        penalty = penalty_array[1];
      }
    }

    else if(raid.getToggle() == 1){
      raid.setToggle(2);
      if(level == 5){
        penalty = penalty_array[1]
      }

    else if(raid.getToggle() == 2)
      raid.setToggle(3);
      if(level == 5){
        penalty = penalty_array[2];
      }
    }

    else if(raid.getToggle() == 3){
      raid.setToggle(0);
      if(level == 5){
        penalty = penalty_array[4];
      }
    }

    return penalty;
  }

  // Function Description: Add a penalty to a card with no flame and no defensive symbols attached.
  function blankPlainPenalty(level: number, penalty_array: string[], raid: any): string{
    var penalty: string = "";

      if(raid.getToggle() == 0){
        raid.setToggle(1);

        if(level == 1 || level == 2){
          penalty = penalty_array[0];
        }

        else if(level == 3 || level == 4){
          penalty = penalty_array[1];
        }
      }

      return penalty
  }

  function flameFarmPenalty(level: number, penalty_array: string[], raid: any): string{
      var penalty: string = "";

      if(raid.getToggle() == 0){
        raid.setToggle(1);

        if(level == 1 || level == 2 || level == 3 || level == 4){
            penalty = penalty_array[0];
          }
      }

      else if(raid.getToggle() == 1){
        raid.setToggle(0);

        if (level == 1 || level == 2 || level == 3 || level == 4){
          penalty = penalty_array[1];
        }
      }

      return penalty;
  }

  function plainFarmPenalty(level: number, penalty_array: string[], raid: any): string{
    var penalty: string = "";

    if(raid.getToggle() == 0){
      raid.setToggle(1);

      if(level == 1 || level == 2 || level == 3 || level == 4){
        penalty = penalty_array[4];
      }
    }
    else if(raid.getToggle() == 1){
      raid.setToggle(0);

      if(level == 1 || level == 2){
        penalty = penalty_array[2]
      }

      else if(level == 3){
        penalty = penalty_array[5];
      }

      else if(level == 4){
        penalty = penalty_array[6];
      }
    }

    return penalty;
  }

  function flameDollPenalty(level: number, penalty_array: string[], raid: any): string{
    var penalty: string = "";

    if(raid.getToggle() == 0){
      raid.setToggle(1);

      if(level == 1 || level == 2 || level == 3 || level == 4){
        penalty = penalty_array[0];
      }
    }

    else{
      raid.setToggle(0);
      if (level == 1 || level == 2 || level == 3 || level == 4){
        penalty = penalty_array[1];
      }
    }
    return penalty;
  }

  // Description: Add penalties to a card with a doll def symbol and without a flame attached.
  // Parameters:
  function plainDollPenalty(level: number, penalty_array: string[], raid: any): string{
    var penalty: string = "";

    if(raid.getToggle() == 0){
      raid.setToggle(1);

      if(level == 1 || level == 2 || level == 3 || level == 4){
        penalty = penalty_array[7];
      }
    }

    else if(raid.getToggle() == 1){
      raid.setToggle(2);

      if(level == 1 || level == 2 || level == 5){
        penalty = penalty_array[2];
      }

      else if(level == 3 || level == 4){
        penalty = penalty_array[3];
      }
      raid.setToggle(0);
    }

    else{
      raid.setToggle(0);


      if(level == 3){
        penalty = penalty_array[5];
      }

      else if(level == 4){
        penalty = penalty_array[6];
      }
    }

    return penalty;
  }

  // Function description: Adds penalties associated with hat def symbols to cards judged accurate by a variety of parameters
  // Parameters:
  //              Flame: checks if a flame is present on the card
  //              p_toggle: which penalty in a defined set of 2 or 3 should be applied
  //              level: the level of the card
  //              penalty_array: the array of penalties that can be applied
  function flameHatPenalty(level: number, penalty_array: string[], raid: any): string{
    //var penalty_array:string[] = ["Fire", "Wound", "Ninja", "Cancel-Block", "Support-Block", "Pass-Left", "Pass-Right", "None"];

    var penalty: string = "";
    // if toggle is zero assign correct penalty
    if(raid.getToggle() == 0){
      raid.setToggle(1); // sets the secondary penalty on the next flame card

      if (level == 1 || level == 2){
        penalty = penalty_array[1]; // wound
      }

      else if (level == 3 || 4){
        penalty = penalty_array[0]; // fire
      }
    }

    // if p_toggle is not zero assign correct penalty
    else{
      raid.setToggle(0);

      if (level == 1 || level == 2 || level == 3){
        penalty = penalty_array[7]; // none
      }

      else if (level == 4){
        penalty = penalty_array[6]; // pass right
      }
    }

    return penalty;
  }

  function plainHatPenalty(level: number , penalty_array: string[], raid: any): string{

  // if Flame is false assign correct penalty
    var penalty: string = "";

    if(raid.getToggle() == 0){
      raid.setToggle(1); // sets the secondary penalty on the next flame card

      if (level == 1 || level == 2){
        penalty = penalty_array[2]; // ninja
      }

      else if (level == 3){
        penalty = penalty_array[5]; // pass left
      }

      else if (level == 4){
        penalty = penalty_array[7]; // none
      }

      else if (level == 5){
        penalty = penalty_array[1]; // wound
      }
    }

    else{
      raid.setToggle(0); // returns to the primary penalty for the next card

      if (level == 1 || level == 2){
        penalty = penalty_array[3]; // cancel-block
      }
    }

    return penalty;
  }

  // generates the correct string ID.
  // allows for expansion to lieutenant and boss levels.
  // NOT A GOOD STRING FUNCTION
  function getRaiderID(raid_type: string, raid_level: string, setNum: string){
      var raidID = "";

      var type:string = "";
      var level:string = "";
      var setNum:string = "";

      if (raid_type == "Plunderer"){
          type = "P";
          for(var j = 1; j <= 4; j++){

              level = j.toString();

              for(var i = 1; i <= 13; i++){
                  setNum = i.toString();
                  raidID = generateID(type, level, setNum);
                  console.log(raidID);
                  return raidID.toString();
              }
          }
      }

      else if (raid_type == "Lieutenants"){
          type = "L";
          for (var i = 1; i <= 7; i++){
              setNum = i.toString();
              raidID = generateID(type, "1", setNum);
              console.log(raidID);
              return raidID.toString();

          }
      }

      else{
          type = "B";
          for (var i = 1; i <= 7; i++){
              setNum = i.toString();
              raidID = generateID(type, "1", setNum);
              console.log(raidID);
              return raidID.toString();

          }

  }

      //console.log(type);
      //raidID = generateID(type, level, setNum);

  //     console.log( "test: " + raidID);

  }

  function generateID(type:string, level:string, setNum:string){
      var id:string = '';

      id = type + level + '-' + setNum;
      return id;
  }

  // print raider to file
  function printRaider(){
    card_array.forEach(function (raiders) {
      console.log(raiders);
    });

  }
