
class RaiderDeckDetails{

    private var _hats:Int;
    private var _dolls:Int;
    private var _farms:Int;
    private var _flames:Int;
    private var _toggle:Int;
    private var _numCards:Int;

    public function new(){
        this._hats = 0;
        this._dolls = 0;
        this._farms = 0;
        this._flames = 0;
        this._toggle = 0;
        this._numCards = 0;
    }

    public function setHats(num:Int){
        this._hats = num;
    }

    public function getHats(){
        return this._hats;
    }

    public function setDolls(num:Int){
        this._dolls = num;
    }

    public function getDolls(){
        return this._dolls;
    }

    public function setFarms(num:Int){
        this._farms = num;
    }

    public function getFarms(){
        return this._farms;
    }

    public function setFlames(num:Int){
        this._flames = num;
    }

    public function getFlames(){
        return this._flames;
    }

    public function setToggle(num:Int){
        this._toggle = num;
    }

    public function getToggle(){
        return this._toggle;
    }

    public function setCardNum(num:Int){
        this._numCards = num;
    }

    public function getCardNum(){
        return this._numCards;
    }


    public function setLevelDetails(level:Int){
        
        //var type:String;

        if(level == 1 || level == 2){
            //type = "P";
            this.setHats(4);
            this.setDolls(4);
            this.setFarms(4);
            this.setFlames(6);
            this.setCardNum(13);
        }

        else if (level == 3 || level  == 4){
            //type = "P";
            this.setHats(3);
            this.setDolls(5);
            this.setFarms(4);
            this.setFlames(6);
            this.setCardNum(13);
        }

        else if (level == 5){
            //type = "L";
            this.setHats(1);
            this.setDolls(1);
            this.setFarms(1);
            this.setFlames(4);
            this.setCardNum(7);
        }

        else if (level == 6){
            //type = "B";
            this.setHats(1);
            this.setDolls(1);
            this.setFarms(1);
            this.setFlames(7);
            this.setCardNum(7);
        }
        
    }
}