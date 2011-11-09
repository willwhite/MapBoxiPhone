var MBTiles = {
    getTile: function(tile, success, fail) {
        return PhoneGap.exec(success, fail, 'MBTiles', 'getTile', tile);
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
    var res = MBTiles.getTile([5,3,2],
        function() {
            alert('success');
        },
        function() {
            alert('failure');
        });
    alert(res);
}

document.addEventListener('deviceready', appReady, false);
