//
//  RESTClient.h
//  MFB Test
//
//  Created by Apro on 27/04/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MFBTimetableModel;

@interface RESTClient : NSObject

/*!
 @brief  Class method to access Singleton instance
 
 @return the singleton instance.
 */
+ (instancetype) sharedInstance;


/*!
 @brief  Method used to download Model data.
 
 @param handler The completion handler passed in.
 */
- (void) timeTablesWithHandler:(void(^)(MFBTimetableModel *timeTable)) handler;

@end
