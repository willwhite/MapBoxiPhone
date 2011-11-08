var MBTiles = {
    getTile: function(tile, success, fail) {
        return PhoneGap.exec(success, fail, 'MBTiles', 'getTile', []);
    }
};

function appReady() {
    var mm = com.modestmaps;
    var tilejson = 'http://d.tiles.mapbox.com/v2/mapbox.dc-bright.jsonp';
        wax.tilejson(tilejson, function(tj) {
        var m = new mm.Map('map',
        new wax.mm.connector(tj), null, [
            new mm.TouchHandler()
        ]);
        m.setCenterZoom(
            new mm.Location(tj.center[1], tj.center[0]),
                tj.center[2]);
    });
    MBTiles.getTile();
}

document.addEventListener('deviceready', appReady, false);
