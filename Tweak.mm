// Removes Accessory Connected
// TODO Add code to make it universal for iOS 4.x and 5.x

%hook IUAccessoryEventHandler

-(void)showSplashView:(BOOL)view
{
        return;
}


%end

%hook SpringBoard

-(BOOL)canShowNowPlayingControls
{
        return YES;
}

%end

%ctor
{
    
}