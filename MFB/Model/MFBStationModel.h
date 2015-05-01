//
//  MFBStationModel.h
//  MFB Test
//
//  Created by Apro on 27/04/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "JSONModel.h"

@protocol MFBStationModel <NSObject>

@end

/*!
 @brief Station Model
 */

@interface MFBStationModel : JSONModel

@property(nonatomic, copy) NSString *throughTheStations;
@property(nonatomic, copy) NSString *lineCode;
@property(nonatomic, copy) NSString *direction;

@end
