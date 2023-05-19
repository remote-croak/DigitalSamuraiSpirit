//TODO: Load Game
//TODO: Load deck
//TODO: Load Characters
package scenes;

class TextVersion extends BaseScne{

    var font:h2d.Font = hxd.res.DefaultFont.get();
    var testMsg:h2d.Text;

    var common:Array<Raider>;
    var lieut:Array<Raider>;
    var boss:Array<Raider>;

    var master:Array<Raider>; // contains the combined cards from common, lieut, boss that players will draw cards from.
    var turnOrder:Array<Player> = []; // contains player data like chosen samurai and cards.
    var deck:BuildDeck = new BuildDeck();

    override function init(){
        trace("scene changed");
        trace(getScene());
        testMsg = new h2d.Text(font, getScene());
        testMsg.text = "Welcome to the Text Game";

        //TODO: add player selections
    }

    override function update(dt:Float){
    }

    
}
