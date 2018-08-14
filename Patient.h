//
//  Patient.h
//  DoctorPatient
//
//  Created by Kit Clark-O'Neil on 2018-08-02.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Doctor.h"
@interface Patient : NSObject

@property NSMutableDictionary *pastPrescriptions;
@property NSString *name;
@property BOOL medicalCard;
@property int age;
@property Doctor *currentDoctor;
@property int weight;
-(void)attemptDoctorVisit: (Doctor*) doctor;
-(NSString*)requestMedicationFor: (NSString*) symptoms;
-(void)readPatientPrescriptions: (Patient*)toBeRead;
@end
