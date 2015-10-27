/*
 
 File: Reachability.h
 Abstract: Basic demonstration of how to use the SystemConfiguration Reachablity APIs.
 
 Version: 2.0.4ddg
 */

/*
 Significant additions made by Andrew W. Donoho, August 11, 2009.
 This is a derived work of Apple's Reachability v2.0 class.
 
 The below license is the new BSD license with the OSI recommended personalizations.
 <http://www.opensource.org/licenses/bsd-license.php>
 
 Extensions Copyright (C) 2009 Donoho Design Group, LLC. All Rights Reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:
 
 * Redistributions of source code must retain the above copyright notice,
 this list of conditions and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 
 * Neither the name of Andrew W. Donoho nor Donoho Design Group, L.L.C.
 may be used to endorse or promote products derived from this software
 without specific prior written permission.
 
*/

/*
 DDG extensions include:
 Each reachability object now has a copy of the key used to store it in a
 dictionary. This allows each observer to quickly determine if the event is
 important to them.
 
 -currentReachabilityStatus also has a significantly different decision criteria than 
 Apple's code.
 
 A multiple convenience test methods have been added.
 */

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <netinet/in.h>

#define USE_DDG_EXTENSIONS 1 // Use DDG's Extensions to test network criteria.
// Since NSAssert and NSCAssert are used in this code, 
// I recommend you set NS_BLOCK_ASSERTIONS=1 in the release versions of your projects.

enum {
	
	// DDG NetworkStatus Constant Names.
	kNotReachable = 0, // Apple's code depends upon 'NotReachable' being the same value as 'NO'.
	kReachableViaWWAN, // Switched order from Apple's enum. WWAN is active before WiFi.
	kReachableViaWiFi
	
};

typedef	uint32_t NetworkStatus;

enum {
	
	// Apple NetworkStatus Constant Names.
	NotReachable     = kNotReachable,
	ReachableViaWiFi = kReachableViaWiFi,
	ReachableViaWWAN = kReachableViaWWAN
	
};


extern NSString* const kInternetConnection;
extern NSString* const kLocalWiFiConnection;
extern NSString* const kReachabilityChangeNotification;

@interface Reachability: NSObject
{
	
@private
	NSString*					key_;
	SCNetworkReachabilityRef	reachabilityRef;

}

@property (copy) NSString* key; // Atomic because network operations are asynchronous.

// Designated Initializer.
- (Reachability*) initWithReachabilityRef: (SCNetworkReachabilityRef) ref;

// Use to check the reachability of a particular host name. 
+ (Reachability*) reachabilityWithHostName: (NSString*) hostName;

// Use to check the reachability of a particular IP address. 
+ (Reachability*) reachabilityWithAddress: (const struct sockaddr_in*) hostAddress;

// Use to check whether the default route is available.  
// Should be used to, at minimum, establish network connectivity.
+ (Reachability*) reachabilityForInternetConnection;

// Use to check whether a local wifi connection is available.
+ (Reachability*) reachabilityForLocalWiFi;

//Start listening for reachability notifications on the current run loop.
- (BOOL) startNotifier;
- (void) stopNotifier;

// Comparison routines to enable choosing actions in a notification.
- (BOOL) isEqual: (Reachability*) r;

// These are the status tests.
- (NetworkStatus) currentReachabilityStatus;

// The main direct test of reachability.
- (BOOL) isReachable;

// WWAN may be available, but not active until a connection has been established.
// WiFi may require a connection for VPN on Demand.
- (BOOL) isConnectionRequired; // Identical DDG variant.
- (BOOL) connectionRequired; // Apple's routine.

// Dynamic, on demand connection?
- (BOOL) isConnectionOnDemand;

// Is user intervention required?
- (BOOL) isInterventionRequired;

// Routines for specific connection testing by your app.
- (BOOL) isReachableViaWWAN;
- (BOOL) isReachableViaWiFi;

- (SCNetworkReachabilityFlags) reachabilityFlags;

@end
