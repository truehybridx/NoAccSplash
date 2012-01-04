#define PATH @"/var/mobile/Library/Preferences/com.truehybridx.noaccsplash.plist"

%hook IUAccessoryEventHandler

-(void)showSplashView:(BOOL)view
{
    BOOL val = [[[NSDictionary dictionaryWithContentsOfFile:PATH] objectForKey:@"enabled"] boolValue];
    if (val) {
        return;
    } else {
        return %orig;
    }
            
}

-(void)tearDownSplashView
{
    BOOL val = [[[NSDictionary dictionaryWithContentsOfFile:PATH] objectForKey:@"enabled"] boolValue];
    if (val) {
        return;
    } else {
        return %orig;
    }
}

-(void)hideSplashView
{
    BOOL val = [[[NSDictionary dictionaryWithContentsOfFile:PATH] objectForKey:@"enabled"] boolValue];
    if (val) {
        return;
    } else {
        return %orig;
    }
}

%end

%hook SpringBoard

-(BOOL)canShowNowPlayingControls
{
    BOOL val = [[[NSDictionary dictionaryWithContentsOfFile:PATH] objectForKey:@"enabled"] boolValue];
    if (val) {
        return YES;
    } else {
        return %orig;
    }
}

%end
