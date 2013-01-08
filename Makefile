THEOS_DEVICE_IP=10.0.1.7
THEOS_DEVICE_PORT=22

include theos/makefiles/common.mk

TWEAK_NAME = NoAccSplash
NoAccSplash_FILES = Tweak.xm
NoAccSplash_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
