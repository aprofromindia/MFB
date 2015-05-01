//
//  MFBStationModel.m
//  MFB Test
//
//  Created by Apro on 27/04/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "MFBStationModel.h"

@implementation MFBStationModel

+ (JSONKeyMapper *)keyMapper{
    return [JSONKeyMapper mapperFromUnderscoreCaseToCamelCase];
}

@end
