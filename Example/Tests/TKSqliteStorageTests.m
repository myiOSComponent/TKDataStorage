//
//  TKSqliteStorageTests.m
//  TKDataStorage
//
//  Created by 云峰李 on 2017/8/29.
//  Copyright © 2017年 512869343@qq.com. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <TKDataStorage/TKSqliteDataStorage.h>
#import "TKTestObject.h"

SPEC_BEGIN(sqliteDataStorageTests)

context(@"普通操作", ^{
    let(sqlite, ^id{
        return [TKSqliteDataStorage sqliteDataStorage:[TKTestObject class]];
    });
    
    it(@"test for sqliteDataStorage", ^{
        TKSqliteDataStorage * sqlite = [TKSqliteDataStorage sqliteDataStorage:[TKTestObject class]];
        [[sqlite should] beNonNil];
    });
    
    it(@"test for createTableIFNotExits", ^{
        __block NSError* aError = nil;
        __block BOOL status = NO;
        [sqlite createTableIFNotExits:[TKTestObject class] hander:^(BOOL status, NSError * error) {
            status = status;
            aError = error;
        }];
        
        [[expectFutureValue(aError) shouldEventually] beNil];
    });
    
    it(@"test for addData", ^{
        TKTestObject* testObj = [TKTestObject new];
        testObj.test1 = 10;
        testObj.test2 = @"jajaj";
        __block NSError* aError = nil;
        [sqlite addData:testObj hander:^(BOOL status, NSError * error) {
            aError = error;
        }];
    });
    
    it(@"test for update", ^{
        TKTestObject* testObj = [TKTestObject new];
        testObj.test1 = 11;
        testObj.test2 = @"jajajaa";
        __block NSError* aError = nil;
        [sqlite updateData:testObj hander:^(BOOL status, NSError * error) {
            aError = error;
        }];
        [[expectFutureValue(aError) shouldEventually] beNil];
        
        [sqlite updateData:testObj hander:^(BOOL status, NSError * error) {
            aError = error;
        }];
        [[expectFutureValue(aError) shouldEventually] beNil];
    });
    
    it(@"test for deleteData", ^{
        TKTestObject* testObj = [TKTestObject new];
        testObj.test1 = 11;
        testObj.test2 = @"jajajaa";
         __block NSError* aError = nil;
        [sqlite deleteData:testObj hander:^(BOOL status, NSError * error) {
            aError = error;
        }];
        [[expectFutureValue(aError) shouldEventually] beNil];
        
        [sqlite deleteData:testObj hander:^(BOOL status, NSError * error) {
            aError = error;
        }];
        [[expectFutureValue(aError) shouldEventually] beNil];
    });
    
    it(@"test for fetchDataWithParams", ^{
        __block NSArray* retObj = nil;
        [sqlite fetchDataWithParams:nil class:[TKTestObject class] hander:^(id ret, NSError *error) {
            retObj = ret;
        }];
        
        [[expectFutureValue(retObj) shouldEventually] beNonNil];
    });
});

SPEC_END
