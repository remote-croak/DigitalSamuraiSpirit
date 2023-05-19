package scenes;

class SplashScne extends BaseScne{
    var font: h2d.Font = hxd.res.DefaultFont.get();
    var splashText:h2d.Text;
    var txtScne:BaseScne;
    var timer:Float;

    override function init(){
        trace(getScene());
        txtScne = new scenes.TextVersion();
        splashText = new h2d.Text(font, getScene());
        splashText.text = "Implore Game Studios Creation";
        trace("SPLASH");
        //SamuraiSpirit.instance.changeScne(txtScne);
        //trace("change scene");
    }

    // aftser a short period of time(5 - 10 secs) the screen switches to the next in the chain.
    // in this instance the change is towards the text version of the game. 
    // the final chain should be a series of splash screens that include the details of the base technologies used, studio, title screen.
    // followed by main menu which lets you select the game type and options.
    // The splash screens can be skipped by pressing a button which jumps to the title screen or main menu 
    override function update(dt:Float){
       
        timer += dt;
        if(timer >= 2.0){
            trace("change scene");
            SamuraiSpirit.instance.changeScne(txtScne);
            trace("change scene");

        }
    }



    // public function update(dt:Float){
    //     // on button press or after timer
    //     //SamuraiSpirit.instance.changeScne(txtScne);

    //     splashText.text = "Implore Game Studios Creation";
        
    // }
  
}