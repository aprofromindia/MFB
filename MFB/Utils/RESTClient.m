//
//  RESTClient.m
//  MFB Test
//
//  Created by Apro on 27/04/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "RESTClient.h"
#import "MFBTimetableModel.h"

// App URLs
static NSString *const kBaseURL = @"http://api.mobile.staging.mfb.io";
static NSString *const kURLPath = @"/mobile/v1/network/station/1/timetable";

// authentication header key & param.
static NSString *const kAuthKey = @"X-Api-Authentication";
static NSString *const kAuthParam = @"DEV_TEST_TOKEN_STAGING";

// HTTP JSON mime type
static NSString *const kJSONMimeType = @"application/json";

// HTTP OK status code.
static const int kHTTPOK = 200;

@interface RESTClient (){
    /// URL session instance.
    NSURLSession *_urlSession;
    
    /// MFB URL request.
    NSMutableURLRequest *_urlRequest;
}

@end


@implementation RESTClient

+ (instancetype)sharedInstance{
    
    static RESTClient *sharedClient;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[self class] new];
        sharedClient->_urlSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
        sharedClient->_urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:[kBaseURL stringByAppendingString:kURLPath]]];
        sharedClient->_urlRequest.allHTTPHeaderFields = @{kAuthKey: kAuthParam};
        
    });
    return sharedClient;
}

- (void) get_TimeTablesWithHandler:(void(^)(MFBTimetableModel *timeTable)) handler;{
    [[_urlSession dataTaskWithRequest:_urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        
        if (!error && httpResponse.statusCode == kHTTPOK && [response.MIMEType isEqualToString:kJSONMimeType]) {
            
            NSError *jsonParseError;
            
            NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            MFBTimetableModel *timeTableModel = [[MFBTimetableModel alloc] initWithString:jsonString error:&jsonParseError];
            
            if (!jsonParseError) {
                handler(timeTableModel);
            }
        }
    }] resume];
}

@end
