%hook IUAccessoryEventHandler

-(void)showSplashView:(BOOL)view
{
	return;
}

-(void)tearDownSplashView
{
	return;
}

-(void)hideSplashView
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
