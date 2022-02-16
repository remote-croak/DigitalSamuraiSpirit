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

var hats_count:number = 0;
var dolls_count:number = 0;
var farms_count:number = 0;
var flames_count:number = 0;
var card_array:Raider[];

interface Raider {
    id:string ;
    type:string;
    level:number;
    setNum:number;
    defSymbol:string;
    penalty:string;
    bossPenalty:string;
    flame:boolean;
}


main();

function main(){

    generateCards();
}

function getRandomInt(min:number, max:number) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min) + min); //The maximum is exclusive and the minimum is inclusive
}

function generateCards(){



    buildRaider();
    //level 1
    //level 2
    //level 3
    //level 4
    //level 5
    //level 6

}

// Switching to Farms is an issue and Flames are false after the initial two are set for hats.
// This function needs to be separated intoi three different files. and called in the main code. Too much spagetti.
function buildRaider(){
    var raider_type:string[] = ["Plunderer", "Lieutenants", "Bosses"];
    var type:string;
    var level:number = 1;
    var isFlame:boolean = true;
    var defSymbol:string[] = ["hat", "doll", "farm", "none"];
    var penalty:string[] = ["Fire", "Wound", "Ninja", "Cancel-Block", "Support-Block", "Pass-Left", "Pass-Right", "None"];

    var setPenalty:string = penalty[0]; //PROBLEM: there is no set pattern to the penalties on a card
    var hasSymbol:string = defSymbol[0];
    var hasPenalty:string = penalty[0];
    var penaltyToggle:number = 0;


    // PROBLEM: Each level needs to be refactored into separte functions.
    if (level == 1 || level == 2){
        type = "P";
        hats_count = 4;
        dolls_count = 4;
        farms_count = 4;
        flames_count = 6;
        //penalty_count = 0;

        console.log("BEGIN");

        for(var p:number = 1; p <= 13; p++){
          console.log(p);

            //check if def Symbol exists, switches symbol if not and resets flame boolean.
            if(hats_count == 0){
                hasSymbol = defSymbol[1];
                isFlame = true;
            }

            if(dolls_count == 0){
                hasSymbol = defSymbol[2];
                isFlame = true;

            }

            if(farms_count == 0){
                hasSymbol = defSymbol[3];

            }
            //REFACTOR into seperate function
            // Checks specific def symbols if all available flames have been assigned
            if(isFlame == true){

                if(hasSymbol == "hat"){
                    if(hats_count <= 2) {
                        isFlame = false;
                    }
                    else{
                      flames_count--;
                    }
                }
                if (hasSymbol == 'doll'){
                    if(dolls_count <= 2){
                        isFlame = false;
                    }
                    else{
                      flames_count--;
                    }
                }
                 if(hasSymbol == "farm"){
                     if(farms_count <= 2){
                         isFlame = false;
                     }
                     else{
                       flames_count--;
                     }
                }
                if(flames_count == 0){
                    isFlame = false;
                }
            }

            // add penalty to cards
            //var penalty:string[] = ["Fire", "Wound", "Ninja", "Cancel-Block", "Support-Block", "Pass-Left", "Pass-Right", "None"];

            //hat penalties
            //REFACTOR: into seperate function
            if(hasSymbol == "hat" && isFlame == true){
                if(penaltyToggle == 0){
                  hasPenalty = penalty[0];
                  penaltyToggle = 1;

                }
                else{
                  hasPenalty = penalty[7];
                }

            }
            else if(hasSymbol == "hat" && isFlame == false){
              if(penaltyToggle == 0){
                hasPenalty = penalty[0];
                penaltyToggle = 1;
              }
              else{
                penaltyToggle = 0;
              }

            }

            if(hasSymbol == "doll" && isFlame == true){
              if(penaltyToggle == 0){
                hasPenalty = penalty[0];
                penaltyToggle = 1;
              }
              else{
                penaltyToggle = 0;
              }

            }
            else if(hasSymbol == "doll" && isFlame == false){
              if(penaltyToggle == 0){
                hasPenalty = penalty[0];
                penaltyToggle = 1;
              }
              else{
                penaltyToggle = 0;
              }

            }

            if(hasSymbol == "farm" && isFlame == true){
              if(penaltyToggle == 0){
                hasPenalty = penalty[0];
                penaltyToggle = 1;
              }
              else{
                penaltyToggle = 0;
              }

            }
            else if(hasSymbol == "farm" && isFlame == false){
              if(penaltyToggle == 0){
                hasPenalty = penalty[0];
                penaltyToggle = 1;
              }
              else{
                penaltyToggle = 0;
              }

            }

            if(hasSymbol == "none"){
              hasPenalty = penalty[0];
              penaltyToggle = 0;
            }

            // assigns builds current raider card specifics
            let raider:Raider = {
                id: generateID(type, level.toString(), p.toString()),
                type: "Plunderer",
                level: level,
                setNum: p,
                flame: isFlame,
                defSymbol: hasSymbol,
                penalty: hasPenalty,
                bossPenalty: "none",

            };
            printRaider(raider);

            //console.log("Flame? " + isFlame);
            // decrements the def symbol count after being assigned.
            if(hasSymbol == "hat" && hats_count > 0){
                hats_count--;

             }
            if(hasSymbol == "doll" && dolls_count > 0){

                dolls_count--;

            }

            if(hasSymbol == "farm" && farms_count > 0){
                farms_count--;

            }

            // console.log("Hats: " + hats_count + " " + "Dolls: " + dolls_count + " " + "Farms: " + farms_count);
            // console.log(hasSymbol);
            //console.log("Flame? " + isFlame);
            //console.log("Card Info\n" + hasSymbol, hasPenalty, );
            // ADD CURRENT RAIDER TO CARD ARRAY


            // console.log("\nID: " + raider.id +
            //             "\nTYPE: " + raider.type +
            //             "\nSETNUM: " + raider.setNum +
            //             "\nFLAME: " + raider.flame +
            //             "\nDEFSYMBOL: " + raider.defSymbol +
            //             "\nPENALTY: " + raider.penalty +
            //             "\nBOSSPENALTY: " + raider.bossPenalty +
            //             "\nRAIDER BUILT\n");


        }

        level++;
    }

    if (level == 3){
        hats_count = 3;
        dolls_count = 5;
        farms_count = 4;
        flames_count = 6;

        level++;
    }

    if (level == 4){
        hats_count = 3;
        dolls_count = 5;
        farms_count = 4;
        flames_count = 6;

        level++;
    }

    if (level == 5){
        hats_count = 1;
        dolls_count = 1;
        farms_count = 1;
        flames_count = 4;

        level++;
    }

    if (level == 6){
        hats_count = 1;
        dolls_count = 1;
        farms_count = 1;
        flames_count = 7;

    }

}

// generates the correct string ID.
// allows for expansion to lieutenant and boss levels.
// NOT A GOOD STRING FUNCTION
function getRaiderID(raid_type:string, raid_level:string, setNum:string){
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
function printRaider(raider: Raider){

  console.log("\nID: " + raider.id +
              "\nTYPE: " + raider.type +
              "\nSETNUM: " + raider.setNum +
              "\nFLAME: " + raider.flame +
              "\nDEFSYMBOL: " + raider.defSymbol +
              "\nPENALTY: " + raider.penalty +
              "\nBOSSPENALTY: " + raider.bossPenalty +
              "\n\nRAIDER BUILT\n");
}
