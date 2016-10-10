#!/bin/bash
xcodebuild archive -project ProjectDescription.xcodeproj -scheme ProjectDescription -destination 'platform=OS X,arch=x86_64' -archivePath ./.build/archive
