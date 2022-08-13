class Raider{
    private var _id:String;
    private var _type:String;
    private var _battleValue:Int;
    private var _setNum:Int;
    private var _defSymbol:String;
    private var _penalty:String;
    private var _bossPenalty:String;
    private var _flame:Bool;

    public function new(id:String, type:String, val:Int, setNum:Int, defSymbol:String, penalty:String, bossPenalty:String, flame:Bool){
        this._id = id;
        this._type = type;
        this._battleValue = val;
        this._setNum = setNum;
        this._defSymbol = defSymbol;
        this._penalty = penalty;
        this._bossPenalty = bossPenalty;
        this._flame = flame;
    }

    public function getID(){
        return (this._id + "\n" + "Flame: " + this._flame + "\n" + "DEF: " + this._defSymbol + "\n" + "Penalty: " + this._penalty + "\n" + "BossPen: " + this._bossPenalty);
    }



}
