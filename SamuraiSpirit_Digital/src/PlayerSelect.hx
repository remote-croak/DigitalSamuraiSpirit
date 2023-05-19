
class PlayerSelect extends BaseScne{
    override function init(){
        
    }

}


var p1:Player = new Player("player1");
        
        var p2:Player = new Player("player2");
        var p3:Player = new Player("player3");
        var p4:Player = new Player("player4");
        var p5:Player = new Player("player5");
        var p6:Player = new Player("player6");
        var p7:Player = new Player("player7");

        var cp1:Player = new Player("com1");
        var cp2:Player = new Player("com2");
        var cp3:Player = new Player("com3");
        var cp4:Player = new Player("com4");
        var cp5:Player = new Player("com5");
        var cp6:Player = new Player("com6");
        var cp7:Player = new Player("com7");
    
        // load all samurai characters, their images, and make selectable.
      
        daisuke.load(s2d);
        gorobei.load(s2d);
        heihachi.load(s2d);
        kanbei.load(s2d);
        katsushiro.load(s2d);
        kikuchiyo.load(s2d);
        kyuzo.load(s2d);
        
        //TODO: assign samurai to player
        //TODO: Create and assign Player roster array.
    
        // There needs to be an eaiser way to assign samurai to the same player
        // Create function for each player that accepts a samurai as a parameter.
        //p1.set(daisuke.getBattleTrack());
        p1.setSamurai(daisuke);
        
        // player join slots at the correct postion. TODO: make it fit multiple screen sizes
        slot1 = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        slot1.text = "Player 1: press any key to join";
        slot1.setPosition(50, 343);
        slot1.scale(3);

        slot2 = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        slot2.text = "Player 2: press any key to join";
        slot2.setPosition(50, 686);
        slot2.scale(3);

        slot3 = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        slot3.text = "Player 3: press any key to join";
        slot3.setPosition(50, 1080);
        slot3.scale(3);

        slot4 = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        slot4.text = "Player 4: press any key to join";
        slot4.setPosition(974, 1080);
        slot4.scale(3);

        slot5 = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        slot5.text = "Player 5: press any key to join";
        slot5.setPosition(1898, 1080);
        slot5.scale(3);

        slot6 = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        slot6.text = "Player 6: press any key to join";
        slot6.setPosition(1898, 686);
        slot6.scale(3);

        slot7 = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        slot7.text = "Player 7: press any key to join";
        slot7.setPosition(1898, 343);
        slot7.scale(3);

        // numPlayers = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        // numPlayers.text = "Number of Players";
        // numPlayers.setPosition(100, 100);
        // numPlayers.scale(4);

        // playerCount = new h2d.TextInput(hxd.res.DefaultFont.get(), s2d);
        // playerCount.text = "E";
        // playerCount.setPosition(650, 100);
        // playerCount.scale(4);

        //Add players to array.
        // If CPU allowed to make selections to fill out the roster. let the player set the option.
        // This should be togglable. 
        // player roster
         // Create For loop for Players where selected samurai are connected to players.
            // How to make this a simulataneous Selection
         
        //Input Samurai Select here with images
        // selectChar = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        // selectChar.text = "Select Your Samurai";
        // selectChar.setPosition(x,y);
        // selectChar.scale(4);
        
        t = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        t.setPosition(x,y);
        t.scale(4);


        //hxd.Window.getInstance().addEventTarget(playerSelect);
