THEOS_DEVICE_IP=localhost
THEOS_DEVICE_PORT=2224

include theos/makefiles/common.mk

TWEAK_NAME = NoAccSplash
NoAccSplash_FILES = Tweak.xm
NoAccSplash_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
