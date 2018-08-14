//
//  Patient.m
//  DoctorPatient
//
//  Created by Kit Clark-O'Neil on 2018-08-02.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import "Patient.h"
#import "InputHandler.h"

@implementation Patient


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSLog(@"New patient name: ");
        InputHandler *inputName1 = [[InputHandler alloc] init];
        NSString *nameresult = [inputName1 getInput];
        
        NSLog(@"New patient weight: ");
        InputHandler *inputWeight = [[InputHandler alloc] init];
        NSString *weightResult = [inputWeight getInput];
        int patientWeight = [weightResult intValue];
        
        NSLog(@"New patient age: ");
        InputHandler *inputName = [[InputHandler alloc] init];
        NSString *ageresult = [inputName getInput];
        int patientAge = [ageresult intValue];
        
        NSLog(@"Does new patient have Healthcare? YES/NO ");
        InputHandler *coverage = [[InputHandler alloc] init];
        NSString *hascoverage = [coverage getInput];
        
        BOOL patientHasMedicalCard;
        if ([hascoverage isEqualToString: @"YES"] == YES)
        {
            patientHasMedicalCard = YES;
        }
        else if ([hascoverage isEqualToString: @"NO"] == YES)
        {
            patientHasMedicalCard = NO;
        }
        else patientHasMedicalCard = NO;
        
            
        
        _name = nameresult;
        _age = patientAge;
        _weight = patientWeight;
        _medicalCard = patientHasMedicalCard;
        
    }
    return self;
}
-(void)attemptDoctorVisit:(Doctor *)doctor {
    if (self.medicalCard == YES)
    {
        self.currentDoctor = doctor;
        [doctor setCurrentPatient: self];
    }
    else NSLog(@"Cannot visit: the poor can treat themselves");
    
}
-(NSString*)requestMedicationFor:(NSString *)symptoms {
    
    [_currentDoctor prescribeMedication:symptoms];
    return symptoms;
}
-(void)readPatientPrescriptions: (Patient*)toBeRead {
    
    NSMutableString *pastPresciptions;
    for (Doctor *doctor in toBeRead.pastPrescriptions)
    {
        [pastPresciptions stringByAppendingString:doctor.name];
        [pastPresciptions stringByAppendingString:[toBeRead.pastPrescriptions objectForKey:doctor.name]];
    }
    NSLog (@"You past prescriptions have been %@", pastPresciptions);
}
@end
