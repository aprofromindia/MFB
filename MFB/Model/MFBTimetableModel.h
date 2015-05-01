//
//  MFBArrivalsModel.h
//  MFB Test
//
//  Created by Apro on 27/04/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "JSONModel.h"
#import "MFBStationModel.h"

/*!
 @brief  TimeTable model
 */
@interface MFBTimetableModel : JSONModel

@property (nonatomic, copy) NSArray <MFBStationModel> *arrivals;

@end
