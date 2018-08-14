//
//  InputHandler.m
//  Maths
//
//  Created by Bennett on 2018-07-31.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import "InputHandler.h"

@implementation InputHandler


-(NSString *)getInput
{
    char inputCString[255];

    fgets(inputCString, 255, stdin);
    NSString *result = [NSString stringWithCString:inputCString
                                          encoding:NSUTF8StringEncoding];

    //trim the newline
    result = [result stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return result;
}
@end
