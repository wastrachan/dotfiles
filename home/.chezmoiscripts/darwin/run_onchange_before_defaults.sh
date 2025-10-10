#!/bin/sh

set -eux


#############
# dock
#############

# disable recent items in dock
defaults write com.apple.dock "show-recents" -bool "false"

# smaller dock icons
defaults write com.apple.dock "tilesize" -int "40"

# do not autohide the dock
defaults write com.apple.dock "autohide" -bool "false"


#############
# finder
#############

# show file extensions in finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"

# show hidden files in finder
defaults write com.apple.finder "AppleShowAllFiles" -bool "false"

# show pathbar in finder
defaults write com.apple.finder "ShowPathbar" -bool "true"

# sort folders on top in finder
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"

# disable file extension change warning
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false" &&


#############
# desktop
#############

# sort folders on top on desktop
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true"


#############
# misc
#############

# don't ask to use new disks for backup
defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool "true"

# disable apple intelligence
# defaults write com.apple.CloudSubscriptionFeatures.optIn "545129924" -bool "false"


killall Dock
killall Finder