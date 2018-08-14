//
//  Doctor.h
//  DoctorPatient
//
//  Created by Kit Clark-O'Neil on 2018-08-02.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Patient;
@interface Doctor : NSObject

@property NSMutableDictionary *patientRecords;
@property NSString *name;
@property NSString *specialization;
@property Patient *currentPatient;

@property BOOL *isAcceptingPatients;
-(NSString*)prescribeMedication:(NSString*) symptoms;


@end
