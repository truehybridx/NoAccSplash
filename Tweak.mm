// Removes Accessory Connected
#define kCFVersionFor5 675.00
#define kCFVersionFor4 550.32
#define kPrefsPath @"/var/mobile/Library/Preferences/com.truehybridx.noaccsplash.plist"



// Experimental for Pandora

%hook IDVehicleMonitorBCL

// Maybe if it doesnt get notifications, it wont show the splash?
- (void)enableAccessoryDidConnectNotification
{

}

- (void)enableAccessoryDidDisconnectNotification
{
	
}

%end

// Hook non-SpringBoard Apps
%group notSB

// Removes "Displaying on External Display" Splash
%hook UIScreen

+ (NSArray *)screens {
	
	NSDictionary * prefs = [NSDictionary dictionaryWithContentsOfFile:kPrefsPath];
    BOOL masterEnabled = [[prefs objectForKey:@"videoEnable"] boolValue];
    
    if (masterEnabled)
    	return [NSArray arrayWithObject:[self mainScreen]];
    else
    	return %orig;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	
	NSDictionary * prefs = [NSDictionary dictionaryWithContentsOfFile:kPrefsPath];
    BOOL masterEnabled = [[prefs objectForKey:@"videoEnable"] boolValue];
    
    if (masterEnabled) {
    	if (self == [UIScreen mainScreen])
			%orig;
    } else {
    	%orig;
    }
}

%end
%end




// Group for hooking iOS 5.x only functions
%group ios5x

%hook IUAccessoryEventHandler

-(void)showSplashView:(BOOL)view
{
    NSDictionary * prefs = [NSDictionary dictionaryWithContentsOfFile:kPrefsPath];
    BOOL masterEnabled = [[prefs objectForKey:@"masterEnabled"] boolValue];
    
    if (masterEnabled)
    	return;
    else
    	%orig(view);
}

%end
%end


// Group for hooking iOS 5.x iPad only functions -_- damnit apple
%group ipadios5

%hook MusicApplication

-(void)_showSplashView:(BOOL)view
{
    NSDictionary * prefs = [NSDictionary dictionaryWithContentsOfFile:kPrefsPath];
    BOOL masterEnabled = [[prefs objectForKey:@"masterEnabled"] boolValue];
    
    if (masterEnabled)
    	return;
    else
    	%orig;
}

%end

%end



// Group for hooking iOS 4.x only functions
%group ios4x

%hook AccessoryEventHandler

-(void)showSplashView:(BOOL)view
{
	NSDictionary * prefs = [NSDictionary dictionaryWithContentsOfFile:kPrefsPath];
    BOOL masterEnabled = [[prefs objectForKey:@"masterEnabled"] boolValue];
    
    if (masterEnabled)
    	return;
    else
    	%orig;
}

%end

%end






// Ungrouped
%hook SpringBoard

-(BOOL)canShowNowPlayingControls
{
    NSDictionary * prefs = [NSDictionary dictionaryWithContentsOfFile:kPrefsPath];
    BOOL masterEnabled = [[prefs objectForKey:@"masterEnabled"] boolValue];
    
    if (masterEnabled)
    	return YES;
    else
    	return %orig;
    
}

%end

%hook UIApplication

- (id)init
{
    id object = %orig;
    
    // Check for iOS 5
    if (kCFCoreFoundationVersionNumber < kCFVersionFor5 && kCFCoreFoundationVersionNumber >= kCFVersionFor4 ) {
        // Running iOS 4.x
        %init(ios4x);
    } else if (kCFCoreFoundationVersionNumber >= kCFVersionFor5) {
        // Running iOS 5.x
        %init(ios5x);
        
        // Check for iPad on iOS 5.x
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            %init(ipadios5);
        
    }
        
    // Check if not springboard on all FW
    if (![[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"])
        %init(notSB);
            
    return object;
}

%end


// ctor
%ctor
{
    %init;
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	// Create default preferences if they do not exist. YES DOING IT THE LAZY WAY
	if (![[NSFileManager defaultManager] fileExistsAtPath:kPrefsPath]) {
        NSDictionary *defaultPrefs = [NSDictionary dictionaryWithObjectsAndKeys:
        								[NSNumber numberWithBool:YES], @"masterEnabled", 
        								[NSNumber numberWithBool:YES], @"videoEnable", 
        								nil];
        [defaultPrefs writeToFile:kPrefsPath atomically:YES];
    }
    
    [pool release];
}



