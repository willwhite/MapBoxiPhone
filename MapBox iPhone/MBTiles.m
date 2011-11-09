//
//  MBTiles.m
#import "MBTiles.h"
#import "FMDatabase.h"

@implementation MBTiles 

@synthesize callbackID;

-(void)getTile:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options  
{
    
    db = [[FMDatabase databaseWithPath:[tileSetURL relativePath]] retain];
    
    
    self.callbackID = [arguments pop];
    NSArray *tileCoord = [arguments objectAtIndex:0];    
    NSString* jsString = nil;
    jsString = [NSString stringWithFormat: @"2"];
    PluginResult* pluginResult = [PluginResult
        resultWithStatus:PGCommandStatus_OK messageAsString:
            [jsString
                  stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [super writeJavascript: [pluginResult toSuccessCallbackString:self.callbackID]];
}

// #pragma mark -
/*

@implementation RMMBTilesTileSource

- (id)initWithTileSetURL:(NSURL *)tileSetURL
{
	if ( ! [super init])
		return nil;
	
	tileProjection = [[RMFractalTileProjection alloc]
        initFromProjection:[self projection] 
        tileSideLength:kMBTilesDefaultTileSize 
        maxZoom:kMBTilesDefaultMaxTileZoom 
        minZoom:kMBTilesDefaultMinTileZoom];
	
    db = [[FMDatabase databaseWithPath:[tileSetURL relativePath]] retain];
    
    if ( ! [db open])
        return nil;
    
	return self;
}

- (void)dealloc
{
	[tileProjection release];
    
    [db close];
    [db release];
    
	[super dealloc];
}

- (int)tileSideLength
{
	return tileProjection.tileSideLength;
}

- (void)setTileSideLength:(NSUInteger)aTileSideLength
{
	[tileProjection setTileSideLength:aTileSideLength];
}

- (RMTileImage *)tileImage:(RMTile)tile
{
    NSAssert4(((tile.zoom >= self.minZoom) && (tile.zoom <= self.maxZoom)),
			  @"%@ tried to retrieve tile with zoomLevel %d, outside source's defined range %f to %f", 
			  self, tile.zoom, self.minZoom, self.maxZoom);
    
    NSInteger zoom = tile.zoom;
    NSInteger x    = tile.x;
    NSInteger y    = pow(2, zoom) - tile.y - 1;
    
    FMResultSet *results = [db executeQuery:@"select tile_data from tiles where zoom_level = ? and tile_column = ? and tile_row = ?", 
                            [NSNumber numberWithFloat:zoom], 
                            [NSNumber numberWithFloat:x], 
                            [NSNumber numberWithFloat:y]];
    
    if ([db hadError])
        return [RMTileImage dummyTile:tile];
    
    [results next];
    
    NSData *data = [results dataForColumn:@"tile_data"];
    
    RMTileImage *image;
    
    if (!data) {
        image = [RMTileImage dummyTile:tile];
    } else {
        image = [RMTileImage imageForTile:tile withData:data];
    }
    
    [results close];
    
    return image;
}

- (NSString *)tileURL:(RMTile)tile
{
    return nil;
}

- (NSString *)tileFile:(RMTile)tile
{
    return nil;
}

- (NSString *)tilePath
{
    return nil;
}

- (id <RMMercatorToTileProjection>)mercatorToTileProjection
{
	return [[tileProjection retain] autorelease];
}

- (RMProjection *)projection
{
	return [RMProjection googleProjection];
}

- (float)minZoom
{
    FMResultSet *results = [db executeQuery:@"select min(zoom_level) from tiles"];
    
    if ([db hadError]) {
        return kMBTilesDefaultMinTileZoom;
    }
    
    [results next];
    
    double minZoom = [results doubleForColumnIndex:0];
    
    [results close];
    
    return (float)minZoom;
}

- (float)maxZoom
{
    FMResultSet *results = [db executeQuery:@"select max(zoom_level) from tiles"];
    
    if ([db hadError]) {
        return kMBTilesDefaultMaxTileZoom;
    }
    
    [results next];
    
    double maxZoom = [results doubleForColumnIndex:0];
    
    [results close];
    
    return (float)maxZoom;
}

- (void)setMinZoom:(NSUInteger)aMinZoom
{
    [tileProjection setMinZoom:aMinZoom];
}

- (void)setMaxZoom:(NSUInteger)aMaxZoom
{
    [tileProjection setMaxZoom:aMaxZoom];
}

- (RMSphericalTrapezium)latitudeLongitudeBoundingBox
{
    return kMBTilesDefaultLatLonBoundingBox;
}

- (void)didReceiveMemoryWarning
{
    NSLog(@"*** didReceiveMemoryWarning in %@", [self class]);
}

- (NSString *)uniqueTilecacheKey
{
    return [NSString stringWithFormat:@"MBTiles%@", [[db databasePath] lastPathComponent]];
}

- (NSString *)shortName
{
    FMResultSet *results = [db executeQuery:@"select value from metadata where name = 'name'"];
    
    if ([db hadError])
        return @"Unknown MBTiles";
    
    [results next];
    
    NSString *shortName = [results stringForColumnIndex:0];
    
    [results close];
    
    return shortName;
}

- (NSString *)longDescription
{
    FMResultSet *results = [db executeQuery:@"select value"
        "from metadata where name = 'description'"];
    
    if ([db hadError]) {
        return @"Unknown MBTiles description";
    }
    
    [results next];
    
    NSString *description = [results stringForColumnIndex:0];
    
    [results close];
    
    return [NSString stringWithFormat:@"%@ - %@", [self shortName], description];
}

- (NSString *)shortAttribution
{
    FMResultSet *results = [db executeQuery:@"select value from metadata where name = 'attribution'"];
    
    if ([db hadError])
        return @"Unknown MBTiles attribution";
    
    [results next];
    
    NSString *attribution = [results stringForColumnIndex:0];
    
    [results close];
    
    return attribution;
}

- (NSString *)longAttribution
{
    return [NSString stringWithFormat:@"%@ - %@", [self shortName], [self shortAttribution]];
}

- (void)removeAllCachedImages
{
    NSLog(@"*** removeAllCachedImages in %@", [self class]);
}
*/

@end