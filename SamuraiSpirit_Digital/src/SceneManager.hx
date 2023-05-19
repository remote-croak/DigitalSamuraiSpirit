
// This makes the scene array hierarchy global and accessible to every scene.
// Reducing the repeated coade.
// Based on scene events new scenes can be added, or removed from the array, set
// need to determine if setScene or setCurrent is more beneficial
// setCurrent gives access to update
// set setScene allows a switch.
class SamuraiSpirit extends hxd.App{
    public static var instance(get, null):SamuraiSpirit;
    
    // private var txtScne:h2d.Scene;
    // private var splashScne:h2d.Scene = new scenes.SplashScne();

    private static function get_instance():SamuraiSpirit{
        if (instance == null){
            instance = new SamuraiSpirit();
        }
        return instance;
    }

    private function new(){
        super();
        //setScene(splashScne);
    }

    override function init(){
    }

    override function update(dt:Float){
    }

    public function changeScne(){
    
    }





}