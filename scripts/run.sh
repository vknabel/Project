#!/bin/bash
swift -F .build/archive.xcarchive/Products/Library/Frameworks -target x86_64-macosx10.12 Project/Project.swift $@
