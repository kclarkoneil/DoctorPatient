//
//  Doctor.m
//  DoctorPatient
//
//  Created by Kit Clark-O'Neil on 2018-08-02.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import "Doctor.h"
#import "Patient.h"
#import "InputHandler.h"
@implementation Doctor
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSLog(@"New doctor name: ");
        InputHandler *inputName = [[InputHandler alloc] init];
        NSString *nameresult = [inputName getInput];
        
        NSLog(@"New doctor specialization: ");
        InputHandler *inputSpecialization = [[InputHandler alloc] init];
        NSString *specializationResult = [inputSpecialization getInput];
        
        _name = nameresult;
        _specialization = specializationResult;
    }
    return self;
}
-(NSString*)prescribeMedication:(NSString*) symptoms {
    NSUInteger symptomsLength = [symptoms length];
    NSString *prescription;
    int switchcase = (int) symptomsLength;
    
    if (switchcase < 7)
            {
            prescription = @"Methodone";
            }
            
    else if (switchcase >= 7 && switchcase < 11)
             {
            prescription = @"Put some ice on it";
             }
    
    else if (switchcase >= 11 && switchcase <15)
            {
            prescription = @"I can give you oxycontin!";
            }
    else {
        prescription = @"Sorry I can't help you with that right now";
    }
        [self.currentPatient.pastPrescriptions setObject:prescription forKey:self.name];
        return prescription;
    
}

@end
