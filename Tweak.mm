// Removes Accessory Connected
// TODO Add code to make it universal for iOS 4.x and 5.x
#define kCFVersionFor5 675.00
#define kCFVersionFor4 550.32


// Group for hooking iOS 5.x only functions
%group ios5x

%hook IUAccessoryEventHandler

-(void)showSplashView:(BOOL)view
{
        return;
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

// Same for current iOS Versions
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