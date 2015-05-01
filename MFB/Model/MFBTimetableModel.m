//
//  MFBArrivalsModel.m
//  MFB Test
//
//  Created by Apro on 27/04/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "MFBTimetableModel.h"

@implementation MFBTimetableModel

+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"timetable.arrivals": @"arrivals"}];
}

@end
