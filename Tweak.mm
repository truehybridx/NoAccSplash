// Removes Accessory Connected
#define kCFVersionFor5 675.00
#define kCFVersionFor4 550.32

// Hook non-SpringBoard Apps
%group notSB

%hook UIScreen

+ (NSArray *)screens {
	return [NSArray arrayWithObject:[self mainScreen]];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	if (self == [UIScreen mainScreen])
		%orig;
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
%end


// Group for hooking iOS 5.x iPad only functions -_- damnit apple
%group ipadios5

%hook MusicApplication

-(void)_showSplashView:(BOOL)view
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






// Ungrouped
%hook SpringBoard

-(BOOL)canShowNowPlayingControls
{
    return YES;
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
}



