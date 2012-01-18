// Removes Accessory Connected
#define kCFVersionFor5 675.00
#define kCFVersionFor4 550.32

// Group for hooking iOS 5.x iPad only functions -_- damnit apple
%group ipadios5

%hook MusicApplication

-(void)_showSplashView:(BOOL)view
{
    return;
}

%end

%end

// Group for hooking iOS 5.x only functions
%group ios5x

%hook IUAccessoryEventHandler

-(void)showSplashView:(BOOL)view
{
        return;
}

%end

// Only hook UIApplication to check iPad in iOS 5.x
%hook UIApplication

- (id)init
{
    id object = %orig;
    
    // Check for running on iPad
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        %init(ipadios5);
        
        return object;
}

%end

%end

// Group for hooking iOS 4.x only functions
%group ios4x

%hook AccessoryEventHandler

-(void)showSplashView:(BOOL)view
{
	return;
}

%end

%end

// Same for current iOS Versions (ungrouped hooks)
%hook SpringBoard

-(BOOL)canShowNowPlayingControls
{
    return YES;
}

%end





%ctor
{
    %init;
    if (kCFCoreFoundationVersionNumber < kCFVersionFor5 && kCFCoreFoundationVersionNumber >= kCFVersionFor4 ) {
        // Running iOS 4.x
        %init(ios4x);
    } else if (kCFCoreFoundationVersionNumber >= kCFVersionFor5) {
        // Running iOS 5.x
        %init(ios5x);
    }
}