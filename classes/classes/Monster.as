﻿package classes 
{
	import classes.GlobalFlags.kFLAGS;
	import classes.GlobalFlags.kGAMECLASS;
	import classes.Items.ArmorLib;
	import classes.Items.ConsumableLib;
	import classes.Items.UseableLib;
	import classes.Items.WeaponLib;
	import classes.Scenes.Dungeons.Factory.SecretarialSuccubus;
	import classes.Scenes.NPCs.Kiha;
	import classes.Scenes.Quests.UrtaQuest.MilkySuccubus;
	import classes.internals.ChainedDrop;
	import classes.internals.RandomDrop;
	import classes.internals.WeightedDrop;

	/**
	 * ...
	 * @author Yoffy, Fake-Name, aimozg
	 */
	public class Monster extends Creature 
	{

		protected final function get player():Player
		{
			return game.player;
		}
		protected final function outputText(text:String,clear:Boolean=false):void{
			game.outputText(text,clear);
		}
		protected final function combatRoundOver():void{
			game.combatRoundOver();
		}
		protected final function cleanupAfterCombat():void
		{
			game.cleanupAfterCombat();
		}
		protected static function showStatDown(a:String):void{
			kGAMECLASS.mainView.statsView.showStatDown(a);
		}
		protected final function statScreenRefresh():void {
			game.statScreenRefresh();
		}
		protected final function doNext(eventNo:*):void {
			game.doNext(eventNo);
		}
		protected final function combatMiss():Boolean {
			return game.combatMiss();
		}
		protected final function combatEvade():Boolean {
			return game.combatEvade();
		}
		protected final function combatFlexibility():Boolean {
			return game.combatFlexibility();
		}
		protected final function combatMisdirect():Boolean {
			return game.combatMisdirect();
		}
		protected function get consumables():ConsumableLib{
			return game.consumables;
		}
		protected function get useables():UseableLib{
			return game.useables;
		}
		protected function get weapons():WeaponLib{
			return game.weapons;
		}
		protected function get armors():ArmorLib{
			return game.armors;
		}
		//For enemies
		public var bonusHP:Number = 0;
		private var _long:String = "<b>You have encountered an unitialized  Please report this as a bug</b>.";
		public function get long():String
		{
			return _long;
		}
		public function set long(value:String):void
		{
			_long = value;
		}

		public function set armorDef(value:Number):void
		{
			setArmorDef(value);
		}

		//Is a creature a 'plural' encounter - mob, etc.
		public var plural:Boolean = false;
		public var imageName:String = "";
		
		//Lust vulnerability
		public var lustVuln:Number = 1;
		
		public static const TEMPERMENT_AVOID_GRAPPLES:int = 0;
		public static const TEMPERMENT_LUSTY_GRAPPLES:int = 1;
		public static const TEMPERMENT_RANDOM_GRAPPLES:int = 2;
		public static const TEMPERMENT_LOVE_GRAPPLES:int = 3;
		/**
		 * temperment - used for determining grapple behaviors
		 * 0 - avoid grapples/break grapple
		 * 1 - lust determines > 50 grapple
		 * 2 - random
		 * 3 - love grapples
		*/
		public var temperment:Number = TEMPERMENT_AVOID_GRAPPLES;
		
		//Used for special attacks.
		public var special1:* = 0;
		public var special2:* = 0;
		public var special3:* = 0;
		
		//he
		public var pronoun1:String = "";
		public function get Pronoun1():String{
			if (pronoun1=="") return "";
			return pronoun1.substr(0,1).toUpperCase()+pronoun1.substr(1);
		}
		//him
		public var pronoun2:String = "";
		public function get Pronoun2():String{
			if (pronoun2=="") return "";
			return pronoun2.substr(0,1).toUpperCase()+pronoun2.substr(1);
		}
		//3: Possessive his
		public var pronoun3:String = "";
		public function get Pronoun3():String{
			if (pronoun3=="") return "";
			return pronoun3.substr(0,1).toUpperCase()+pronoun3.substr(1);
		}

		public var drop:RandomDrop = new ChainedDrop();

		public function Monster()
		{
			// trace("Generic Monster Constructor!");
			this.gender = GENDER_NONE;

			//// INSTRUCTIONS
			//// Copy-paste remaining code to the new monster constructor
			//// Uncomment and replace placeholder values with your own
			//// If you wish to do some stuff by hand and don't want to use init<idx>XXXX, call skipInit(idx)
			////   or it will be considered as a bug
			//// See following examples and args&docs for init* functions

			// super(mainClassPtr);

			//// REQUIRED INIITIALIZERS (01-13)

			//// 1. Names and plural/singular
			//init01Names("a", "short", "imageName", "long", plural=false);

			//// 2. Gender and genitals
			//// 2.1. Genderless with customizable pronouns
			//init02Genderless();
			//init02Genderless("he","him","his");
			//// 2.2. Male with 1-10 cocks, customizable balls, and cum
			//init02Male(new Cock(len=5.5,thickness=1,type=HUMAN));
			//init02Male([new Cock(),new Cock());
			//init02Male(cocks=[new Cock(),new Cock()],balls=0,ballSize=0,cumMultiplier=1,hoursSinceCum=0);
			//// 2.3. Female with customizable vagina. Call twice to create second vagina.
			//init02Female();
			//init02Female(virgin=true,vaginalWetness=VAGINA_WETNESS_NORMAL,vaginalLooseness=VAGINA_LOOSENESS_TIGHT,bonusVCapacity=0);
			//// 2.4. To create a hermaphrodite, call both init2Male and init2Female.
			////      Pronouns (he/she) will be taken from last call

			//// 3. Breasts
			//// Each row is array of [size=0,nipplesPerBreast=1]
			//// Size could be number, name (see BREAST_CUP_NAMES), or short name
			//init03BreastRows([0,0]); // flat chest, no nipples
			//init03BreastRows(["flat"]); // manly chest with nipples
			//init03BreastRows(["DD+"],["DD"],["D"]); // 3 rows of breasts
			//init03BreastRows([10,2]); // huge boobs with 2 nipples per breasts
			//init03BreastRows(); // no breast rows

			//// 4. Ass
			//init04Ass(looseness=0,wetness=0,bonusACapacity=0)

			//// 5. Body
			//init05Body(tallness,hipRating=HIP_RATING_BOYISH,buttRating=BUTT_RATING_BUTTLESS,lowerBody=LOWER_BODY_TYPE_HUMAN,armType=ARM_TYPE_HUMAN)

			//// 6. Skin
			//init06Skin(skinTone,skinType=SKIN_TYPE_PLAIN,skinDesc="type-dependant if not specified",skinAdj="");
			//init06Skin("ebony"); // skinDesc = "skin"
			//init06Skin("red",SKIN_TYPE_SCALES); // skinDesc = "scales"
			//init06Skin("blue",SKIN_TYPE_GOO); // will also set skinAdj to "goopey"
			//init06Skin("white",SKIN_TYPE_FUR,"fluffy fur","spotted"); // maximum customization

			//// 7. Hair
			//init7Hair(hairColor="no",hairLength=0,hairType=HAIR_NORMAL);

			//// 8. Face
			//init08Face(faceType=FACE_HUMAN,earType=EARS_HUMAN,tongueType=TONGUE_HUMAN,eyeType=EYES_HUMAN);

			//// 9. Primary stats. No default values
			//init09PrimaryStats(str, tou, spe, inte, lib, sens, cor)

			//// 10. Weapon
			//init10Weapon(weaponName,weaponVerb,weaponAttack=0,weaponPerk="",weaponValue=0);

			//// 11. Armor
			//init11Armor(armorName,armorDef,armorPerk="",armorValue=0);

			//// 12. Combat
			//init12Combat(bonusHP=0,lust=0,lustVuln=1,fatigue=0);

			//// 13. Level
			//init13Level(level,gems,additionalXP);

			//// OPTIONAL INITIALIZERS

			//// Special attacks
			//initX_Specials(special1=0,special2=0,special3=0);

			//// Tail
			//initX_Tail(tailType=TAIL_TYPE_NONE,tailVenom=0,tailRecharge=0);

			//// Horns
			//initX_Horns(hornType=HORNS_NONE,horns=0);

			//// Wings. wingDesc=null means default desc for type
			//initX_Wings(wingType=WING_TYPE_NONE,wingDesc=null);

			//// Antennae.
			//initX_Antennae(antennae=ANTENNAE_NONE);
		}


		public function eMaxHP():Number 
		{
			return this.tou * 2 + 50 + this.bonusHP;
		}

		public function addHP(hp:Number):void{
			this.HP += hp;
			if (this.HP<0) this.HP = 0;
			else if (this.HP>eMaxHP()) this.HP = eMaxHP();
		}

		/**
		 * @return HP/eMaxHP()
		 */
		public function HPRatio():Number{
			return HP/eMaxHP();
		}

		/**
		 * @return damage not reduced by player stats
		 */
		public function eBaseDamage():Number {
			return str + weaponAttack;
		}

		/**
		 * @return randomized damage reduced by player stats
		 */
		public function calcDamage():int{
			return player.reduceDamage(eBaseDamage());
		}

		protected function totalXP(playerLevel:Number=-1):Number
		{
			if (playerLevel == -1) playerLevel = game.player.level;
			//
			// 1) Nerf xp gains by 20% per level after first two level difference
			// 2) No bonuses for underlevel!
			// 3) Super high level folks (over 10 levels) only get 1 xp!
			var difference:Number = playerLevel - this.level;
			if(difference <= 2) difference = 0;
			else difference -= 2;
			if(difference > 4) difference = 4;
			difference = (5 - difference) * 20.0 / 100.0;
			if(playerLevel - this.level > 10) return 1;
			return Math.round((this.baseXP() + this.bonusXP()) * difference);
		}
		protected function baseXP():Number 
		{
			return[200, 10, 20, 30, 40, 50, 55, 60, 66, 75,//0-9
				83, 85, 92, 100, 107, 115, 118, 121, 128, 135,//10-19
				145][Math.round(level)] || 200;
		}
		protected function bonusXP():Number 
		{
			return rand([200,10,20,30,40,50,55,58,66,75,
					83,85,85,86,92,94,96,98,99,101,
					107][Math.round(this.level)] || 130);
		}

		// MONSTER INITIALIZATION HELPER FUNCTIONS
		public var initsCalled:Array = new Array(14).map(function():*{return false});

		public function isFullyInit():Boolean {
			return initsCalled.indexOf(false)==-1;
		}

		/**
		 * Tells that skipping init<idx>Whatever is ok and you will initialize corresponding properties by hand
		 */
		protected function skipInit(idx:int):void{
			this.initsCalled[idx-1] = true;
		}

		/**
		 * Inits a, short, imageName, long, plural
		 */
		protected function init01Names(a:String, _short:String, imageName:String, _long:String, plural:Boolean = false):void
		{
			this.short = _short;
			this.imageName = imageName;
			this.long = _long;
			this.a = a;
			this.plural = plural;
			if (plural){
				this.pronoun1 = "they";
				this.pronoun2 = "them";
				this.pronoun3 = "their";
			}
			skipInit(1);
		}

		/**
		 * Inits gender, pronouns. Overrides gender and pronouns set by init2Male and init2Female. Does not override pronouns if plural
		 */
		protected function init02Genderless(pronoun1:String="it",pronoun2:String="it",pronoun3:String="its"):void
		{
			this.gender = GENDER_NONE;
            this.cocks = [];
            this.vaginas = [];
			if (!this.plural){
				this.pronoun1 = pronoun1;
				this.pronoun2 = pronoun2;
				this.pronoun3 = pronoun3;
			}
			skipInit(2);
		}

		/**
		 * Inits gender, pronouns. cocks, balls=0, ballSize=0, cumMultiplier=1, hoursSinceCum=0
		 * @param cocks new Cock(len,thick,type) or Array of new Cock(len,thick,type)
		 */
		protected function init02Male(cocks:*=null,balls:Number=0,ballSize:Number=0,cumMultiplier:Number=1,hoursSinceCum:Number=0):void
		{
			if (!this.plural){
				this.pronoun1 = "he";
				this.pronoun2 = "him";
				this.pronoun3 = "his";
			}
			if (cocks == null) cocks=[new Cock()];
			if (cocks is Cock) cocks=[cocks];
			else if (!(cocks is Array)) {
				trace(this.short+".init02Male("+typeof(cocks)+")");
				cocks = [new Cock()];
			}
			if (cocks.length==0){
				trace(this.short+".init02Male([])");
				cocks = [new Cock()];
			} else if (cocks.length>10){
				trace(this.short+".init02Male.cocks.length="+cocks.length);
				cocks = (cocks as Array).slice(10);
			}
			for (var i:int = 0; i<(cocks as Array).length; i++){
				var c:* = cocks[i];
				if (c is Cock) {
					createCock((c as Cock).cockLength, (c as Cock).cockThickness, (c as Cock).cockType);
				} else {
					trace(this.short+".init02Male.cocks["+i+"]="+typeof(c)+"");
				}
			}
			this.balls = balls;
			this.ballSize = ballSize;
			this.cumMultiplier = cumMultiplier;
			this.hoursSinceCum = hoursSinceCum;
			genderCheck();
			skipInit(2);
		}

		/**
		 * Inits gender, pronouns, 1 vagina. To add second vagina, call method twice. Usage of VAGINA_WETNESS_XXXX and VAGINA_LOOSENESS_XXXX constants is preferable
		 */
		protected function init02Female(vaginalWetness:Number = VAGINA_WETNESS_NORMAL, vaginalLooseness:Number = VAGINA_LOOSENESS_TIGHT, bonusVCapacity:Number = 0, virgin:Boolean = false):void
		{
			if (!this.plural){
				this.pronoun1 = "she";
				this.pronoun2 = "her";
				this.pronoun3 = "her";
			}
			if (this.vaginas.length<2) {
				createVagina(virgin,vaginalWetness,vaginalLooseness);
			} else {
				trace(this.short+".init2Female with "+this.vaginas.length+" vaginas");
			}
			if (bonusVCapacity >0){
				this.createStatusAffect(StatusAffects.BonusVCapacity,bonusVCapacity,0,0,0);
			}
			genderCheck();
			skipInit(2);
		}

		/**
		 * Each row is [size=0,nipplesPerBreast=1]
		 * Size could be number, name (see BREAST_CUP_NAMES), or short name like "A", "DD+"
		 * To create single row with 1 nipples per breast, you can call init3BreastRows(size)
		 */
		protected function init03BreastRows(... rows):void{
            this.breastRows = [];
			if (rows.length>0){
				if(! (rows[0] is Array)){
					rows = [rows];
				}
				for (var i:int = 0; i<rows.length; i++){
					var row:* = rows[i];
					if (!(row is Array)) row = [row,1];
					if (row.length==1) row.push(1);
					var size:Number;
					if (row[0] is Number) size = row[0];
					else if (row[0] is String) size = Appearance.breastCupInverse(row[0]);
					else {
						trace("init03BreastRows.size is "+typeof(row[0]));
						size = 0;
					}
					if (!(row[1] is Number)) {
						trace("init03BreastRows.nipplesPerBreast is "+typeof(row[1]));
						row[1] = 1;
					}
					createBreastRow(size,row[1]);
				}
			}
			skipInit(3);
		}

		/**
		 * Usage of ANAL_LOOSENESS_XXXX and ANAL_WETNESS_XXXX constants is preferrable
		 */
		protected function init04Ass(looseness:Number = 0, wetness:Number = 0, bonusACapacity:Number = 0):void{
			this.ass.analLooseness = looseness;
			this.ass.analWetness = wetness;
			if (bonusACapacity>0) this.createStatusAffect(StatusAffects.BonusACapacity,bonusACapacity,0,0,0);
			skipInit(4);
		}

		/**
		 * Tallness is in inches or string like "5'6" or "5.5'". Usage of constants HIP_RATING_XXXX, BUTT_RATING_XXXX, LOWER_BODY_XXXX is preferable.
		 */
		protected function init05Body(tallness:*,hipRating:Number=HIP_RATING_BOYISH,buttRating:int=BUTT_RATING_BUTTLESS,lowerBody:int=LOWER_BODY_TYPE_HUMAN,armType:int=ARM_TYPE_HUMAN):void{
			if (tallness is String){
				tallness = tallness.split("'");
				if (tallness.length==1){
					trace("init05Body.tallness=\""+tallness[0]+"\". Interpreted as inches");
				} else if (tallness.length==2){
					tallness = parseFloat(tallness[0])*12+parseFloat(tallness[1]);
				} else {
					trace("init05Body.tallness=\""+tallness.join("'")+"\". Defaulting to 5'");
					tallness = 5*12;
				}
			} else if(!(tallness is Number)){
				trace("init05Body.tallness is "+typeof(tallness));
				tallness = 5*12;
			}
			this.tallness = tallness;
			this.hipRating = hipRating;
			this.buttRating = buttRating;
			this.lowerBody = lowerBody;
			this.armType = armType;
			skipInit(5);
		}

		/**
		 * if skinDesc == null, sets default name for type ("skin"/"fur"/...).
		 * Also, for SKIN_TYPE_GOO if skinAdj=="" sets skinAdj="goopey"
		 */
		protected function init06Skin(skinTone:String,skinType:int=SKIN_TYPE_PLAIN,skinDesc:String=null,skinAdj:String=""):void{
			this.skinTone = skinTone;
			this.skinType = skinType;
			this.skinDesc = skinDesc || Appearance.DEFAULT_SKIN_DESCS[skinType];
			if (skinAdj == "" && skinType == SKIN_TYPE_GOO ) this.skinAdj = "goopey";
			else this.skinAdj = skinAdj;
			skipInit(6);
		}

		protected function init07Hair(hairColor:String="no",hairLength:Number=0,hairType:int=HAIR_NORMAL):void{
			this.hairColor = hairColor;
			this.hairLength = hairLength;
			this.hairType = hairType;
			skipInit(7);
		}

		protected function init08Face(faceType:int=FACE_HUMAN,earType:int=EARS_HUMAN,tongueType:int=TONUGE_HUMAN,eyeType:int=EYES_HUMAN):void{
			this.faceType = faceType;
			this.earType = earType;
			this.tongueType = tongueType;
			this.eyeType = eyeType;
			skipInit(8);
		}

		protected function init09PrimaryStats(str:Number, tou:Number, spe:Number, inte:Number, lib:Number, sens:Number, cor:Number):void
		{
			this.str = str;
			this.tou = tou;
			this.spe = spe;
			this.inte = inte;
			this.lib = lib;
			this.sens = sens;
			this.cor = cor;
			skipInit(9);
		}

		protected function init10Weapon(weaponName:String,weaponVerb:String,weaponAttack:Number=0,weaponPerk:String="",weaponValue:Number=0):void
		{
			setWeaponName(weaponName);
			setWeaponVerb(weaponVerb);
			setWeaponAttack(weaponAttack);
			setWeaponPerk(weaponPerk);
			setWeaponValue(weaponValue);
			skipInit(10);
		}

		protected function init11Armor(armorName:String,armorDef:Number=0,armorPerk:String="",armorValue:Number=0):void
		{
			setArmorName(armorName);
			setArmorDef(armorDef);
			setArmorPerk(armorPerk);
			setArmorValue(armorValue);
			skipInit(11);
		}

		// also sets up HP=eMaxHP()
		protected function init12Combat(bonusHP:Number=0,lust:Number=0,lustVuln:Number=1,temperment:int=TEMPERMENT_AVOID_GRAPPLES,fatigue:Number=0):void
		{
			this.bonusHP = bonusHP;
			this.lust = lust;
			this.lustVuln = lustVuln;
			this.temperment = temperment;
			this.fatigue = fatigue;
			this.HP = eMaxHP();
			skipInit(12);
		}


		// also sets up XP=totalXP()+additionalXP
		protected function init13Level(level:int,gems:int,additionalXP:int=0):void{
			this.level = level;
			this.gems = gems;
			this.XP=totalXP()+additionalXP;
			skipInit(13);
		}

		protected function init14FixedDrop(fixedDrop:ItemType=null):void
		{
			skipInit(14);
			this.drop = new WeightedDrop(fixedDrop,1);
		}

		protected function init14NoDrop():void
		{
			skipInit(14);
			this.drop = new WeightedDrop();
		}

		/**
		 * Initializes droplist as a weighted droplist. Call .add(item,weight) of the
		 * returned value to add them to list.
		 *
		 * Example:
		 * init14WeightedDrop()
		 * 		.add(A,2)
		 * 		.add(B,10)
		 * 		.add(C,1)
		 * 	will drop B 10 times more often than C, and 5 times more often than A.
		 * 	To be precise, \forall add(A_i,w_i): P(A_i)=w_i/\sum_j w_j
		 */
		protected function init14WeightedDrop():WeightedDrop
		{
			skipInit(14);
			this.drop = new WeightedDrop();
			return this.drop as WeightedDrop;
		}

		/**
		 * Initializes droplist as a chained-check droplist. Call .add(item,chance) of the
		 * returned value to add them to list. Call .elseDrop(item) or pass it as method arg to set
		 * default value (if all checks will fail).
		 *
		 * Example 1:
		 * init14ChainedDrop(A)
		 * 		.add(B,0.01)
		 * 		.add(C,0.5)
		 * 	will FIRST check B vs 0.01 chance,
		 * 	if it fails, C vs 0.5 chance,
		 * 	else A
		 *
		 * 	Example 2:
		 * 	init14ChainedDrop()
		 * 		.add(B,0.01)
		 * 		.add(C,0.5)
		 * 		.elseDrop(A)
		 * 	for same result
		 */
		protected function init14ChainedDrop(defaultDrop:ItemType=null):ChainedDrop
		{
			this.drop = new ChainedDrop(defaultDrop);
			skipInit(14);
			return this.drop as ChainedDrop;
		}

		protected function initX_Specials(special1:*=0,special2:*=0,special3:*=0):void
		{
			this.special1 = special1;
			this.special2 = special2;
			this.special3 = special3;
		}

		protected function initX_Tail(tailType:int=TAIL_TYPE_NONE,tailVenom:Number=0,tailRecharge:Number=5):void
		{
			this.tailType=tailType;
			this.tailVenom = tailVenom;
			this.tailRecharge = tailRecharge;
		}

		protected function initX_Horns(hornType:int=HORNS_NONE,horns:Number=0):void
		{
			this.hornType = hornType;
			this.horns = horns;
		}

		// wingDesc=null means default desc for type
		protected function initX_Wings(wingType:int=WING_TYPE_NONE,wingDesc:String=null):void
		{
			this.wingType = wingType;
			this.wingDesc = wingDesc || Appearance.DEFAULT_WING_DESCS[wingType];
		}

		//// Antennae.
		protected function initX_Antennae(antennae:int=ANTENNAE_NONE):void
		{
			this.antennae = antennae;
		}

		/**
		 * try to hit, apply damage
		 * @return damage
		 */
		public function eOneAttack():int
		{
            //Determine damage - str modified by enemy toughness!
            var damage:int = calcDamage();
            if (damage > 0) damage = player.takeDamage(damage);
            return damage;
		}

		/**
		 * return true if we land a hit
		 */
		protected function attackSucceeded():Boolean
		{
			var attack:Boolean = true;
			//Blind dodge change
			if (findStatusAffect(StatusAffects.Blind) >= 0) {
				attack &&= handleBlind();
			}
			attack &&= !playerDodged();
			return attack;
		}

		public function eAttack():void {
			var attacks:int = statusAffectv1(StatusAffects.Attacks);
			if (attacks == 0) attacks = 1;
			while (attacks>0){
				if (attackSucceeded()){
				    var damage:int = eOneAttack();
					outputAttack(damage);
					postAttack(damage);
					game.statScreenRefresh();
					outputText("\n", false);
				}
				if (statusAffectv1(StatusAffects.Attacks) >= 0) {
					addStatusValue(StatusAffects.Attacks, 1, -1);
				}
				attacks--;
			}
			removeStatusAffect(StatusAffects.Attacks);
			if (!game.combatRoundOver()) game.doNext(1);
		}

		/**
		 * Called no matter of success of the attack
		 * @param damage damage received by player
		 */
		protected function postAttack(damage:int):void
		{
			if (damage > 0) {
				if (lustVuln > 0 && player.armorName == "barely-decent bondage straps") {
					if (!plural) outputText("\n" + capitalA + short + " brushes against your exposed skin and jerks back in surprise, coloring slightly from seeing so much of you revealed.", false);
					else outputText("\n" + capitalA + short + " brush against your exposed skin and jerk back in surprise, coloring slightly from seeing so much of you revealed.", false);
					lust += 5 * lustVuln;
				}
			}
		}

		public function outputAttack(damage:int):void
		{
			if (damage <= 0) {
				//Due to toughness or amor...
				if (rand(player.armorDef + player.tou) < player.armorDef) outputText("You absorb and deflect every " + weaponVerb + " with your " + player.armorName + ".", false);
				else {
					if (plural) outputText("You deflect and block every " + weaponVerb + " " + a + short + " throw at you.", false);
					else outputText("You deflect and block every " + weaponVerb + " " + a + short + " throws at you.", false);
				}
			}
			else if (damage < 6) outputText("You are struck a glancing blow by " + a + short + "! (" + damage + ")", false);
			else if (damage < 11) {
				outputText(capitalA + short + " wound");
				if (!plural) outputText("s");
				outputText(" you! (" + damage + ")", false);
			}
			else if (damage < 21) {
				outputText(capitalA + short + " stagger");
				if (!plural) outputText("s");
				outputText(" you with the force of " + pronoun3 + " " + weaponVerb + "! (" + damage + ")", false);
			}
			else if (damage > 20) {
				outputText(capitalA + short + " <b>mutilate", false);
				if (!plural) outputText("s", false);
				outputText("</b> you with " + pronoun3 + " powerful " + weaponVerb + "! (" + damage + ")", false);
			}
		}

		/**
		 * @return true if continue with attack
		 */
		protected function handleBlind():Boolean
		{
			if (rand(3) < 2) {
				if (weaponVerb == "tongue-slap") outputText(capitalA + short + " completely misses you with a thrust from "+pronoun3+" tongue!\n", false);
				else outputText(capitalA + short + " completely misses you with a blind attack!\n", false);
				return false;
			}
			return true;
		}

		/**
		 * print something about how we miss the player
		 */
		protected function outputPlayerDodged(dodge:int):void
		{
			if (dodge==1) outputText("You narrowly avoid " + a + short + "'s " + weaponVerb + "!\n", false);
			else if (dodge==2) outputText("You dodge " + a + short + "'s " + weaponVerb + " with superior quickness!\n", false);
			else {
				outputText("You deftly avoid " + a + short);
				if (plural) outputText("'");
				else outputText("'s");
				outputText(" slow " + weaponVerb + ".\n", false);
			}
		}

		private function playerDodged():Boolean
		{
			//Determine if dodged!
			var dodge:int = player.speedDodge(this);
			if (dodge>0) {
				outputPlayerDodged(dodge);
				return true;
			}
			//Determine if evaded
			if (!(this is Kiha) && player.findPerk(PerkLib.Evade) >= 0 && rand(100) < 10) {
				outputText("Using your skills at evading attacks, you anticipate and sidestep " + a + short + "'");
				if (!plural) outputText("s");
				outputText(" attack.\n", false);
				return true;
			}
			//("Misdirection"
			if (player.findPerk(PerkLib.Misdirection) >= 0 && rand(100) < 10 && player.armorName == "red, high-society bodysuit") {
				outputText("Using Raphael's teachings, you anticipate and sidestep " + a + short + "' attacks.\n", false);
				return true;
			}
			//Determine if cat'ed
			if (player.findPerk(PerkLib.Flexibility) >= 0 && rand(100) < 6) {
				outputText("With your incredible flexibility, you squeeze out of the way of " + a + short + "", false);
				if (plural) outputText("' attacks.\n", false);
				else outputText("'s attack.\n", false);
				return true;
			}
			return false;
		}

		public function doAI():void
		{
			if (findStatusAffect(StatusAffects.Stunned) >= 0) {
				if (!handleStun()) return;
			}
			if (findStatusAffect(StatusAffects.Fear) >= 0) {
				if (!handleFear()) return;
			}
			//Exgartuan gets to do stuff!
			if (game.player.findStatusAffect(StatusAffects.Exgartuan) >= 0 && game.player.statusAffectv2(StatusAffects.Exgartuan) == 0 && rand(3) == 0) {
				if (game.exgartuan.exgartuanCombatUpdate()) game.outputText("\n\n", false);
			}
			if (findStatusAffect(StatusAffects.Constricted) >= 0) {
				if (!handleConstricted()) return;
			}
			//If grappling... TODO implement grappling
			if (game.gameState == 2) {
				game.gameState = 1;
				//temperment - used for determining grapple behaviors
				//0 - avoid grapples/break grapple
				//1 - lust determines > 50 grapple
				//2 - random
				//3 - love grapples
				/*
				 //		if(temperment == 0) eGrappleRetreat();
				 if (temperment == 1) {
				 //			if(lust < 50) eGrappleRetreat();
				 mainClassPtr.doNext(3);
				 return;
				 }
				 mainClassPtr.outputText("Lust Placeholder!!", false);
				 mainClassPtr.doNext(3);
				 return;*/
			}
			performCombatAction();
		}

		/**
		 * Called if monster is constricted. Should return true if constriction is ignored and need to proceed with ai
		 */
		protected function handleConstricted():Boolean
		{
			//Enemy struggles -
			game.outputText("Your prey pushes at your tail, twisting and writhing in an effort to escape from your tail's tight bonds.", false);
			if (statusAffectv1(StatusAffects.Constricted) <= 0) {
				game.outputText("  " + capitalA + short + " proves to be too much for your tail to handle, breaking free of your tightly bound coils.", false);
				removeStatusAffect(StatusAffects.Constricted);
			}
			addStatusValue(StatusAffects.Constricted, 1, -1);
			game.combatRoundOver();
			return false;
		}

		/**
		 * Called if monster is under fear. Should return true if fear ignored and need to proceed with ai
		 */
		protected function handleFear():Boolean
		{
			if (statusAffectv1(StatusAffects.Fear) == 0) {
				if (plural) {
					removeStatusAffect(StatusAffects.Fear);
					game.outputText("Your foes shake free of their fear and ready themselves for battle.", false);
				}
				else {
					removeStatusAffect(StatusAffects.Fear);
					game.outputText("Your foe shakes free of its fear and readies itself for battle.", false);
				}
			}
			else {
				addStatusValue(StatusAffects.Fear, 1, -1);
				if (plural) game.outputText(capitalA + short + " are too busy shivering with fear to fight.", false);
				else game.outputText(capitalA + short + " is too busy shivering with fear to fight.", false);
			}
			game.combatRoundOver();
			return false;
		}

		/**
		 * Called if monster is stunned. Should return true if stun is ignored and need to proceed with ai.
		 */
		protected function handleStun():Boolean
		{
			if (plural) game.outputText("Your foes are too dazed from your last hit to strike back!", false);
			else game.outputText("Your foe is too dazed from your last hit to strike back!", false);
			if (statusAffectv1(StatusAffects.Stunned) <= 0) removeStatusAffect(StatusAffects.Stunned);
			else addStatusValue(StatusAffects.Stunned, 1, -1);
			game.combatRoundOver();
			return false;
		}

		/**
		 * This method is called after all stun/fear/constricted checks.
		 * Default: Equal chance to do physical or special (if any) attack
		 */
		protected function performCombatAction():void
		{
			var actions:Array = [eAttack,special1,special2,special3].filter(
					function(special:*,idx:int,array:Array):Boolean{
						return special != 0 && special != null;
					}
			);
			var rando:int = int(Math.random() * (actions.length));
			var action:* = actions[rando];
			if (action is Number) game.eventParser(action);
			else if (action is Function) action();
			else trace("monster tried to do "+typeof(action));
		}

		/**
		 * All branches of this method and all subsequent scenes should end either with
         * 'cleanupAfterCombat', 'awardPlayer' or 'finishCombat'. The latter also displays
		 * default message like "you defeat %s" or "%s falls and starts masturbating"
		 */
		public function defeated(hpVictory:Boolean):void
		{
			game.finishCombat();
		}

		/**
		 * All branches of this method and all subsequent scenes should end with
         * 'cleanupAfterCombat'.
		 */
		public function won(hpVictory:Boolean,pcCameWorms:Boolean):void
		{
			if (hpVictory){
				player.HP = 1;
				outputText("Your wounds are too great to bear, and you fall unconscious.", true);
			} else {
				outputText("Your desire reaches uncontrollable levels, and you end up openly masturbating.\n\nThe lust and pleasure cause you to black out for hours on end.", true);
				player.lust = 0;
			}
			game.gameState = 0;
			game.clearStatuses(false);
			var temp:Number = rand(10) + 1;
			if(temp > player.gems) temp = player.gems;
			outputText("\n\nYou'll probably wake up in eight hours or so, missing " + temp + " gems.", false);
			player.gems -= temp;
			game.doNext(16);
		}

		/**
		 * Display tease reaction message. Then call applyTease() to increase lust.
		 * @param lustDelta value to be added to lust (already modified by lustVuln etc)
		 */
		public function teased(lustDelta:Number):void
		{
			outputDefaultTeaseReaction(lustDelta);
			if(lustDelta > 0) {
				//Imp mob uber interrupt!
			  	if(findStatusAffect(StatusAffects.ImpUber) >= 0) { // TODO move to proper class
					outputText("\nThe imps in the back stumble over their spell, their loincloths tenting obviously as your display interrupts their casting.  One of them spontaneously orgasms, having managed to have his spell backfire.  He falls over, weakly twitching as a growing puddle of whiteness surrounds his defeated form.", false);
					//(-5% of max enemy HP)
					HP -= bonusHP * .05;
					lust -= 15;
					removeStatusAffect(StatusAffects.ImpUber);
					createStatusAffect(StatusAffects.ImpSkip,0,0,0,0);
				}
			}
			applyTease(lustDelta);
		}

		protected function outputDefaultTeaseReaction(lustDelta:Number):void
		{
			if (plural) {
				if (lustDelta == 0) outputText("\n\n" + capitalA + short + " seem unimpressed.", false);
				if (lustDelta > 0 && lustDelta < 4) outputText("\n" + capitalA + short + " look intrigued by what " + pronoun1 + " see.", false);
				if (lustDelta >= 4 && lustDelta < 10) outputText("\n" + capitalA + short + " definitely seem to be enjoying the show.", false);
				if (lustDelta >= 10 && lustDelta < 15) outputText("\n" + capitalA + short + " openly stroke " + pronoun2 + "selves as " + pronoun1 + " watch you.", false);
				if (lustDelta >= 15 && lustDelta < 20) outputText("\n" + capitalA + short + " flush hotly with desire, " + pronoun3 + " eyes filled with longing.", false);
				if (lustDelta >= 20) outputText("\n" + capitalA + short + " lick " + pronoun3 + " lips in anticipation, " + pronoun3 + " hands idly stroking " + pronoun3 + " bodies.", false);
			}
			else {
				if (lustDelta == 0) outputText("\n" + capitalA + short + " seems unimpressed.", false);
				if (lustDelta > 0 && lustDelta < 4) {
					if (plural) outputText("\n" + capitalA + short + " looks intrigued by what " + pronoun1 + " see.", false);
					else outputText("\n" + capitalA + short + " looks intrigued by what " + pronoun1 + " sees.", false);
				}
				if (lustDelta >= 4 && lustDelta < 10) outputText("\n" + capitalA + short + " definitely seems to be enjoying the show.", false);
				if (lustDelta >= 10 && lustDelta < 15) {
					if (plural) outputText("\n" + capitalA + short + " openly strokes " + pronoun2 + "selves as " + pronoun1 + " watch you.", false);
					else outputText("\n" + capitalA + short + " openly strokes " + pronoun2 + "self as " + pronoun1 + " watches you.", false);
				}
				if (lustDelta >= 15 && lustDelta < 20) {
					if (plural) outputText("\n" + capitalA + short + " flush hotly with desire, " + pronoun3 + " eyes filling with longing.", false);
					else outputText("\n" + capitalA + short + " flushes hotly with desire, " + pronoun3 + " eyes filled with longing.", false);
				}
				if (lustDelta >= 20) {
					if (plural) outputText("\n" + capitalA + short + " licks " + pronoun3 + " lips in anticipation, " + pronoun3 + " hands idly stroking " + pronoun3 + " own bodies.", false);
					else outputText("\n" + capitalA + short + " licks " + pronoun3 + " lips in anticipation, " + pronoun3 + " hands idly stroking " + pronoun3 + " own body.", false);
				}
			}
		}

		protected function applyTease(lustDelta:Number):void{
			lust += lustDelta;
			lustDelta = Math.round(lustDelta * 10)/10;
			outputText(" (" + lustDelta + ")", false);
		}

		public function generateDebugDescription():String{
			var result:String;
			var be:String =plural?"are":"is";
			var have:String = plural ? "have" : "has";
			var Heis:String = Pronoun1+" "+be+" ";
			var Hehas:String = Pronoun1 + " " + have + " ";
			result = "You are inspecting "+a+short+" (imageName='"+imageName+"'). You are fighting "+pronoun2+".\n\n";
			result += Heis+(Appearance.DEFAULT_GENDER_NAMES[gender]||("gender#"+gender))+
					" with "+Appearance.numberOfThings(cocks.length,"cock") +
					", "+Appearance.numberOfThings(vaginas.length,"vagina")+
					" and "+Appearance.numberOfThings(breastRows.length,"breast row")+".\n\n";
			// APPEARANCE
			result +=Heis+Appearance.inchesAndFeetsAndInches(tallness)+" tall with "+
					Appearance.describeByScale(hipRating,Appearance.DEFAULT_HIP_RATING_SCALES,"thinner than","wider than")+" hips and "+
					Appearance.describeByScale(buttRating,Appearance.DEFAULT_BUTT_RATING_SCALES,"thinner than","wider than")+" butt.\n";
			result +=Pronoun3+" lower body is "+(Appearance.DEFAULT_LOWER_BODY_NAMES[lowerBody]||("lowerBody#"+lowerBody));
			result += ", "+pronoun3+" arms are "+(Appearance.DEFAULT_ARM_NAMES[armType]||("armType#"+armType));
			result += ", "+pronoun1+" "+have+" "+skinTone+" "+skinAdj+" "+skinDesc+" (type "+(Appearance.DEFAULT_SKIN_NAMES[skinType]||("skinType#"+skinType))+").\n";
			result += Hehas;
			if (hairLength>0){
				result += hairColor+" "+Appearance.inchesAndFeetsAndInches(hairLength)+" long "+(Appearance.DEFAULT_HAIR_NAMES[hairType]||("hairType#"+hairType))+" hair.\n";
			} else {
				result += "no hair.\n";
			}
			result += Hehas
					+(Appearance.DEFAULT_FACE_NAMES[faceType]||("faceType#"+faceType))+" face, "
					+(Appearance.DEFAULT_EARS_NAMES[earType]||("earType#"+earType))+" ears, "
					+(Appearance.DEFAULT_TONGUE_NAMES[tongueType]||("tongueType#"+tongueType))+" tongue and "
					+(Appearance.DEFAULT_EYES_NAMES[eyeType]||("eyeType#"+eyeType))+" eyes.\n";
			result += Hehas;
			if (tailType == TAIL_TYPE_NONE) result += "no tail, ";
			else result+=(Appearance.DEFAULT_TAIL_NAMES[tailType]||("tailType#"+tailType))+" tail with venom="+tailVenom+" and recharge="+tailRecharge+", ";
			if (hornType == HORNS_NONE) result += "no horns, ";
			else result += horns+" "+(Appearance.DEFAULT_HORNS_NAMES[hornType]||("hornType#"+hornType))+" horns, ";
			if (wingType == WING_TYPE_NONE) result += "no wings, ";
			else result += wingDesc+" wings (type "+(Appearance.DEFAULT_WING_NAMES[wingType]||("wingType#"+wingType))+"), ";
			if (antennae == ANTENNAE_NONE) result += "no antennae.\n\n";
			else result += (Appearance.DEFAULT_ANTENNAE_NAMES[antennae]||("antennaeType#"+antennae))+" antennae.\n\n";

			// GENITALS AND BREASTS
			for (var i:int = 0; i<cocks.length; i++){
				var cock:Cock = (cocks[i] as Cock);
				result += Pronoun3+(i>0?(" #"+(i+1)):"")+" "+cock.cockType.toString().toLowerCase()+" cock is ";
				result += Appearance.inchesAndFeetsAndInches(cock.cockLength)+" long and "+cock.cockThickness+"\" thick";
				if (cock.isPierced) result+= ", pierced with "+cock.pLongDesc;
				if (cock.knotMultiplier!=1) result += ", with knot of size "+cock.knotMultiplier;
				result+=".\n";
			}
			if (balls>0 || ballSize>0) result += Hehas+Appearance.numberOfThings(balls,"ball")+" of size "+ballSize+".\n";
			if (cumMultiplier!=1 || cocks.length>0) result += Pronoun1+" "+have+" cum multiplier "+cumMultiplier+". ";
			if (hoursSinceCum>0 || cocks.length>0) result += "It were "+hoursSinceCum+" hours since "+pronoun1+" came.\n\n";
			for (i = 0; i<vaginas.length; i++){
				var vagina:VaginaClass = (vaginas[i] as VaginaClass);
				result += Pronoun3+ (i>0?(" #"+(i+1)):"")+" "+(Appearance.DEFAULT_VAGINA_TYPE_NAMES[vagina.type]||("vaginaType#"+vagina.type))+(vagina.virgin?" ":" non-")+"virgin vagina is ";
				result += Appearance.describeByScale(vagina.vaginalLooseness,Appearance.DEFAULT_VAGINA_LOOSENESS_SCALES,"tighter than","looser than");
				result += ", "+Appearance.describeByScale(vagina.vaginalWetness,Appearance.DEFAULT_VAGINA_WETNESS_SCALES,"drier than","wetter than");
				if (vagina.labiaPierced) result += ". Labia are pierced with "+vagina.labiaPLong;
				if (vagina.clitPierced) result += ". Clit is pierced with "+vagina.clitPLong;
				if (statusAffectv1(StatusAffects.BonusVCapacity)>0){
					result+="; vaginal capacity is increased by "+statusAffectv1(StatusAffects.BonusVCapacity);
				}
				result+=".\n";
			}
			if (breastRows.length>0){
				var nipple:String = nippleLength+"\" ";
				if (nipplesPierced) nipple+="pierced by "+nipplesPLong;
				for (i = 0; i < breastRows.length; i++) {
					var row:BreastRowClass = (breastRows[i] as BreastRowClass);
					result += Pronoun3+(i>0?(" #"+(i+1)):"") + " breast row has " + row.breasts;
					result += " " + row.breastRating.toFixed(2) + "-size (" + Appearance.breastCup(row.breastRating) + ") breasts with ";
					result += Appearance.numberOfThings(row.nipplesPerBreast, nipple+(row.fuckable ? "fuckable nipple" : "unfuckable nipple")) + " on each.\n";
				}
			}
			result += Pronoun3+" ass is "+Appearance.describeByScale(ass.analLooseness,Appearance.DEFAULT_ANAL_LOOSENESS_SCALES,"tighter than","looser than")+", "+Appearance.describeByScale(ass.analWetness,Appearance.DEFAULT_ANAL_WETNESS_SCALES,"drier than","wetter than");
			if (statusAffectv1(StatusAffects.BonusACapacity)>0){
				result += "; anal capacity is increased by "+statusAffectv1(StatusAffects.BonusACapacity);
			}
			result +=".\n\n";

			// COMBAT AND OTHER STATS
			result+=Hehas+"str="+str+", tou="+tou+", spe="+spe+", inte="+inte+", lib="+lib+", sens="+sens+", cor="+cor+".\n";
			result += Pronoun1+" could "+weaponVerb+" you with  "+weaponPerk+" "+weaponName+" (attack "+weaponAttack+", value "+weaponValue+").\n";
			result += Pronoun1 +" is guarded with "+armorPerk+" "+armorName+" (defense "+armorDef+", value "+armorValue+").\n";
			result += Hehas+HP+"/"+eMaxHP()+" HP, "+lust+"/100 lust, "+fatigue+"/100 fatigue. "+Pronoun3+" bonus HP="+bonusHP+", and lust vulnerability="+lustVuln+".\n";
			result += Heis+"level "+level+" and "+have+" "+gems+" gems. You will be awarded "+XP+" XP.\n";
			if (special1 || special2 || special3){
				result+=Hehas+[special1,special2,special3]
								.filter(function(x:*,index:int,array:Array):Boolean{return x>0})
								.length
						+" special attacks.\n"
			} else {
				result+=Hehas+"no special attacks.\n";
			}

			return result;
		}

		protected function clearOutput():void
		{
			game.clearOutput();
		}

		public function dropLoot():ItemType
		{
			return drop.roll() as ItemType;
		}

		public function combatRoundUpdate():void
		{
			if(findStatusAffect(StatusAffects.MilkyUrta) >= 0) {
				game.urtaQuest.milkyUrtaTic();
			}
			//Countdown
			if(findStatusAffect(StatusAffects.TentacleCoolDown) >= 0) {
				addStatusValue(StatusAffects.TentacleCoolDown,1,-1);
				if(statusAffect(findStatusAffect(StatusAffects.TentacleCoolDown)).value1 == 0) {
					removeStatusAffect(StatusAffects.TentacleCoolDown);
				}
			}
			if(findStatusAffect(StatusAffects.CoonWhip) >= 0) {
				if(statusAffectv2(StatusAffects.CoonWhip) <= 0) {
					armorDef += statusAffectv1(StatusAffects.CoonWhip);
					outputText("<b>Tail whip wears off!</b>\n\n");
					removeStatusAffect(StatusAffects.CoonWhip);
				}
				else {
					addStatusValue(StatusAffects.CoonWhip,2,-1);
					outputText("<b>Tail whip is currently reducing your foe");
					if(plural) outputText("s'");
					else outputText("'s");
					outputText(" armor by " + statusAffectv1(StatusAffects.CoonWhip) + ".</b>\n\n")
				}
			}
			if(findStatusAffect(StatusAffects.Blind) >= 0) {
				addStatusValue(StatusAffects.Blind,1,-1);
				if(statusAffectv1(StatusAffects.Blind) <= 0) {
					outputText("<b>" + capitalA + short + " is no longer blind!</b>\n\n", false);
					removeStatusAffect(StatusAffects.Blind);
				}
				else outputText("<b>" + capitalA + short + " is currently blind!</b>\n\n", false);
			}
			if(findStatusAffect(StatusAffects.Earthshield) >= 0) {
				outputText("<b>" + capitalA + short + " is protected by a shield of rocks!</b>\n\n");
			}
			if(findStatusAffect(StatusAffects.Sandstorm) >= 0) {
				//Blinded:
				if(player.findStatusAffect(StatusAffects.Blind) >= 0) {
					outputText("<b>You blink the sand from your eyes, but you're sure that more will get you if you don't end it soon!</b>\n\n");
					player.removeStatusAffect(StatusAffects.Blind);
				}
				else {
					if(statusAffectv1(StatusAffects.Sandstorm) == 0 || statusAffectv1(StatusAffects.Sandstorm) % 4 == 0) {
						player.createStatusAffect(StatusAffects.Blind,0,0,0,0);
						outputText("<b>The sand is in your eyes!  You're blinded this turn!</b>\n\n");
					}
					else {
						outputText("<b>The grainy mess cuts at any exposed flesh and gets into every crack and crevice of your armor.");
						var temp:Number = player.takeDamage(1 + rand(2));
						outputText(" (" + temp + ")");
						outputText("</b>\n\n");
					}
				}
				addStatusValue(StatusAffects.Sandstorm,1,1);
			}
			if(findStatusAffect(StatusAffects.Stunned) >= 0) {
				outputText("<b>" + capitalA + short + " is still stunned!</b>\n\n", false);
			}
			if(findStatusAffect(StatusAffects.Shell) >= 0) {
				if(statusAffectv1(StatusAffects.Shell) >= 0) {
					outputText("<b>A wall of many hues shimmers around " + a + short + ".</b>\n\n");
					addStatusValue(StatusAffects.Shell,1,-1);
				}
				else {
					outputText("<b>The magical barrier " + a + short + " erected fades away to nothing at last.</b>\n\n");
					removeStatusAffect(StatusAffects.Shell);
				}
			}
			if(findStatusAffect(StatusAffects.IzmaBleed) >= 0) {
				//Countdown to heal
				addStatusValue(StatusAffects.IzmaBleed,1,-1);
				//Heal wounds
				if(statusAffectv1(StatusAffects.IzmaBleed) <= 0) {
					outputText("The wounds you left on " + a + short + " stop bleeding so profusely.\n\n", false);
					removeStatusAffect(StatusAffects.IzmaBleed);
				}
				//Deal damage if still wounded.
				else {
					var store:Number = eMaxHP() * (3 + rand(4))/100;
					store = game.doDamage(store);
					if(plural) outputText(capitalA + short + " bleed profusely from the jagged wounds your weapon left behind. (" + store + ")\n\n", false);
					else outputText(capitalA + short + " bleeds profusely from the jagged wounds your weapon left behind. (" + store + ")\n\n", false);
				}
			}
			if(findStatusAffect(StatusAffects.Timer) >= 0) {
				if(statusAffectv1(StatusAffects.Timer) <= 0)
					removeStatusAffect(StatusAffects.Timer);
				addStatusValue(StatusAffects.Timer,1,-1);
			}
			if(findStatusAffect(StatusAffects.LustStick) >= 0) {
				//LoT Effect Messages:
				switch(statusAffectv1(StatusAffects.LustStick)) {
					//First:
					case 1:
						if(plural) outputText("One of " + a + short + " pants and crosses " + mf("his","her") + " eyes for a moment.  " + mf("His","Her") + " dick flexes and bulges, twitching as " + mf("he","she") + " loses himself in a lipstick-fueled fantasy.  When " + mf("he","she") + " recovers, you lick your lips and watch " + mf("his","her") + " blush spread.\n\n", false);
						else outputText(capitalA + short + " pants and crosses " + pronoun3 + " eyes for a moment.  " + mf("His","Her") + " dick flexes and bulges, twitching as " + pronoun1 + " loses himself in a lipstick-fueled fantasy.  When " + pronoun1 + " recovers, you lick your lips and watch " + mf("his","her") + " blush spread.\n\n", false);
						break;
					//Second:
					case 2:
						if(plural) outputText(capitalA + short + " moan out loud, " + pronoun3 + " dicks leaking and dribbling while " + pronoun1 + " struggle not to touch it.\n\n", false);
						else outputText(capitalA + short + " moans out loud, " + pronoun3 + " dick leaking and dribbling while " + pronoun1 + " struggles not to touch it.\n\n", false);
						break;
					//Third:
					case 3:
						if(plural) outputText(capitalA + short + " pump " + pronoun3 + " hips futilely, air-humping non-existent partners.  Clearly your lipstick is getting to " + pronoun2 + ".\n\n", false);
						else outputText(capitalA + short + " pumps " + pronoun3 + " hips futilely, air-humping a non-existent partner.  Clearly your lipstick is getting to " + pronoun2 + ".\n\n", false);
						break;
					//Fourth:
					case 4:
						if(plural) outputText(capitalA + short + " close " + pronoun2 + " eyes and grunt, " + pronoun3 + " cocks twitching, bouncing, and leaking pre-cum.\n\n", false);
						else outputText(capitalA + short + " closes " + pronoun2 + " eyes and grunts, " + pronoun3 + " cock twitching, bouncing, and leaking pre-cum.\n\n", false);
						break;
					//Fifth and repeat:
					default:
						if(plural) outputText("Drops of pre-cum roll steadily out of their dicks.  It's a marvel " + pronoun1 + " haven't given in to " + pronoun3 + " lusts yet.\n\n", false);
						else outputText("Drops of pre-cum roll steadily out of " + a + short + "'s dick.  It's a marvel " + pronoun1 + " hasn't given in to " + pronoun3 + " lust yet.\n\n", false);
						break;
				}
				addStatusValue(StatusAffects.LustStick,1,1);
				//Damage = 5 + bonus score minus
				//Reduced by lust vuln of course
				lust += Math.round(lustVuln * (5 + statusAffectv2(StatusAffects.LustStick)));
			}
			if(findStatusAffect(StatusAffects.PCTailTangle) >= 0) {
				//when Entwined
				outputText("You are bound tightly in the kitsune's tails.  <b>The only thing you can do is try to struggle free!</b>\n\n");
				outputText("Stimulated by the coils of fur, you find yourself growing more and more aroused...\n\n");
				game.dynStats("lus", 5+player.sens/10);
			}
			if(player.findStatusAffect(StatusAffects.Blind) >= 0 && findStatusAffect(StatusAffects.Sandstorm) < 0) {
				if(player.findStatusAffect(StatusAffects.SheilaOil) >= 0) {
					if(player.statusAffectv1(StatusAffects.Blind) <= 0) {
						outputText("<b>You finish wiping the demon's tainted oils away from your eyes; though the smell lingers, you can at least see.  Sheila actually seems happy to once again be under your gaze.</b>\n\n", false);
						player.removeStatusAffect(StatusAffects.Blind);
					}
					else {
						outputText("<b>You scrub at the oily secretion with the back of your hand and wipe some of it away, but only smear the remainder out more thinly.  You can hear the demon giggling at your discomfort.</b>\n\n", false);
						player.addStatusValue(StatusAffects.Blind,1,-1);
					}
				}
				else {
					//Remove blind if countdown to 0
					if(player.statusAffectv1(StatusAffects.Blind) == 0) {
						player.removeStatusAffect(StatusAffects.Blind);
						//Alert PC that blind is gone if no more stacks are there.
						if(player.findStatusAffect(StatusAffects.Blind) < 0) {
							outputText("<b>Your eyes have cleared and you are no longer blind!</b>\n\n", false);
						}
						else outputText("<b>You are blind, and many physical attacks will miss much more often.</b>\n\n", false);
					}
					else {
						player.addStatusValue(StatusAffects.Blind,1,-1);
						outputText("<b>You are blind, and many physical attacks will miss much more often.</b>\n\n", false);
					}
				}
			}
			if(findStatusAffect(StatusAffects.QueenBind) >= 0) {
				outputText("You're utterly restrained by the Harpy Queen's magical ropes!\n\n");
				if(flags[kFLAGS.PC_FETISH] >= 2) game.dynStats("lus", 3);
			}
			if(this is SecretarialSuccubus || this is MilkySuccubus) {
				if(player.lust < 45) outputText("There is something in the air around your opponent that makes you feel warm.\n\n", false);
				if(player.lust >= 45 && player.lust < 70) outputText("You aren't sure why but you have difficulty keeping your eyes off your opponent's lewd form.\n\n", false);
				if(player.lust >= 70 && player.lust < 90) outputText("You blush when you catch yourself staring at your foe's rack, watching it wobble with every step she takes.\n\n", false);
				if(player.lust >= 90) outputText("You have trouble keeping your greedy hands away from your groin.  It would be so easy to just lay down and masturbate to the sight of your curvy enemy.  The succubus looks at you with a sexy, knowing expression.\n\n", false);
				game.dynStats("lus", 1+rand(8));
			}
			//[LUST GAINED PER ROUND] - Omnibus
			if(findStatusAffect(StatusAffects.LustAura) >= 0) {
				if(player.lust < 33) outputText("Your groin tingles warmly.  The demon's aura is starting to get to you.\n\n", false);
		 		if(player.lust >= 33 && player.lust < 66) outputText("You blush as the demon's aura seeps into you, arousing you more and more.\n\n", false);
		  		if(player.lust >= 66) {
					outputText("You flush bright red with desire as the lust in the air worms its way inside you.  ", false);
					temp = rand(4);
					if(temp == 0) outputText("You have a hard time not dropping to your knees to service her right now.\n\n", false);
					if(temp == 2) outputText("The urge to bury your face in her breasts and suckle her pink nipples nearly overwhelms you.\n\n", false);
					if(temp == 1) outputText("You swoon and lick your lips, tasting the scent of the demon's pussy in the air.\n\n", false);
					if(temp == 3) outputText("She winks at you and licks her lips, and you can't help but imagine her tongue sliding all over your body.  You regain composure moments before throwing yourself at her.  That was close.\n\n", false);
				}
				game.dynStats("lus", (3 + int(player.lib/20 + player.cor/30)));
			}
		}
	}
}