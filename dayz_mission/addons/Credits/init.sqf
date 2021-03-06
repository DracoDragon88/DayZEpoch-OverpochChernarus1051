[] spawn { 
    if(isServer) exitWith {};
    private["_cat","_info","_color","_text","_time"];
    _time = 6; //how long one role should stay on screen. Use value from 0 to 10 where 0 is almost instant transition to next role
    //NOTE: Above value is not in seconds. It is percentage. Default: 6

    // ==== SCRIPT START ====
    waitUntil {!isNil "dayz_animalCheck"}; //remove this line completely to make it work in ArmA 3. Yes you read that correctly.
    sleep 10; //Wait in seconds before the credits start after player IS ingame
     
    DZE_SCROLLING_CREDITS = [
        ["Welcome to",["ErDuSurvivor - Chernarus Overpoch"],"#33b5e5"],
        ["Staff",["Malik", "Draco"],"#ff4444"],
        ["Server Mods",["Deployable Bike", "Self Bloodbag", "Tow/Lift", "Suicide", "Safe Zones", "and more!"],"#33b5e5"],
        ["Website",["Draconet.net"],"#33b5e5"],
        ["Teamspeak",["ts.draconet.net", "Private Rooms Available"],"#33b5e5"],
        ["Warning",["Vehicles left in trader cities through restarts are <t color='#ff4444'>DELETED</t>!","Mission vehicles do <t color='#ff4444'>NOT</t> save with server restarts!"],"#ff4444"]
    ];

    {
        sleep 2;
        _cat   = _x select 0;
        _info  = _x select 1;
        _color = _x select 2;
        _text  = format ["<t size='0.50' color='%2' align='right'>%1<br /></t>", _cat, _color];
        _text  = _text + "<t size='0.70' color='#ffffff' align='right'>";
        {_text = _text + format ["%1<br />", _x]} forEach _info;
        _text  = _text + "</t>";
        _time  = _time + (((count _info) - 1) * 0.5);
        [
            _text,
            [safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
            [safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
            _time,
            0.5
        ] spawn BIS_fnc_dynamicText;
        sleep (_time);
    } forEach DZE_SCROLLING_CREDITS;
};