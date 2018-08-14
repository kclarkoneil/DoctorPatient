//
//  main.m
//  DoctorPatient
//
//  Created by Kit Clark-O'Neil on 2018-08-02.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"
#import "Doctor.h"
#import "InputHandler.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"Welcome to Doctor Patient Interactions!");
        NSLog(@"Type 'quit' to exit, 'New Doctor' to create new doctor, 'New Patient' to create new patient or 'Schedule Appointment' or if you're a doctor, type 'Read Patient Prescriptions' to setup an appointment");
       

        // Get the user input to trigger Interactions
        NSMutableArray *patients = [[NSMutableArray alloc] init];
        NSMutableArray *doctors = [[NSMutableArray alloc] init];
        NSString *useranswer;
        
        while (![useranswer isEqualToString:@"quit"]) {
        InputHandler *input = [[InputHandler alloc] init];
        useranswer = [input getInput];
        //Begin if else sequence to determine next step
        if ([useranswer isEqualToString:@"New Doctor"] == YES)
        
        {
            Doctor *newDoctor = [[Doctor alloc] init];
            [doctors addObject:newDoctor];
        }
            
        else if ([useranswer isEqualToString:@"New Patient"] == YES)
        {
            Patient *newPatient = [[Patient alloc] init];
            [patients addObject:newPatient];
        }
        else if ([useranswer isEqualToString:@"Read Patient Prescriptions"] == YES)
        {
            NSLog(@"Enter the name of the patient who records you would like to see");
            InputHandler *patientRecords = [[InputHandler alloc] init];
            NSString *chosenPatient = [patientRecords getInput];
            for (Patient *findOne in patients) {
                if ([findOne.name isEqualToString:chosenPatient])
                    [findOne readPatientPrescriptions:findOne];
                
                else NSLog(@"We can't find the Patient you're looking for");
                
            }
        }
        else if ([useranswer isEqualToString:@"Schedule Appointment"] == YES)
        {
            NSLog(@"Enter the name of the patient you would like to schedule an appointment for:");
            InputHandler *patientInput = [[InputHandler alloc] init];
            NSString *chosenName = [patientInput getInput];
            NSLog(@"Enter the name of the Doctor you would like to schedule and appointment for: ");
            InputHandler *doctorInput = [[InputHandler alloc] init];
            NSString *chosenDoctor = [doctorInput getInput];
        
            for (Patient *findOne in patients) {
                if ([findOne.name isEqualToString:chosenName]) {
                    for (Doctor *findOne2 in doctors) {
                        if ([findOne2.name isEqualToString:chosenDoctor]){
                            [findOne attemptDoctorVisit:findOne2];
                        
                            NSLog(@"Welcome to the Doctor's office, you can press 'Cancel' at any time to exit the appointment");
                        while (true)
                        {

                            
                        NSLog(@"Describe your symptoms or press Cancel to end the appointment:");
                        InputHandler *symptomsString = [[InputHandler alloc] init];
                        NSString *symptoms = [symptomsString getInput];
                        if ([symptoms isEqualToString:@"Cancel"])
                        {
                            findOne2.currentPatient = nil;
                            findOne.currentDoctor = nil;
                            break;
                        }
                            NSString *prescription = [findOne2 prescribeMedication:symptoms];
                            NSLog(@"%@, would you like another prescription?", prescription);
                        }
                        }
                    }
                }
            }
        }
         NSLog(@"Type 'quit' to exit, 'New Doctor' to create new doctor, 'New Patient' to create new patient or 'Schedule Appointment' or if you're a doctor, type 'Read Patient Prescriptions' to setup an appointment");
        }

    }
    return 0;
}
