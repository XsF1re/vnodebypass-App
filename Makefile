TARGET = vnodebypass
ID = "kr.xsf1re.vnodebypass"
VERSION = $(shell defaults read $$PWD/$(TARGET)/Info.plist CFBundleVersion)

.PHONY: all clean

all: clean
	xcodebuild clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO PRODUCT_BUNDLE_IDENTIFIER=$(ID) -sdk iphoneos -configuration Debug
	ln -sf build/Debug-iphoneos Payload
	zip -r9 $(TARGET)-$(VERSION).ipa Payload/$(TARGET).app

clean:
	rm -rf build Payload ./*.ipa