//
//  TKBasicDataTests.m
//  TKDataStorage
//
//  Created by 云峰李 on 2017/8/29.
//  Copyright © 2017年 512869343@qq.com. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <TKDataStorage/TKBasicDataStorage.h>
#import <TKDataStorage/NSFileManager+TKUtilities.h>
#import <TKDataStorage/TKTargetDataStorage.h>

SPEC_BEGIN(BasicDataTests)

context(@"正常情况", ^{
    let(basic, ^id{
        return [TKBasicDataStorage new];
    });
    
    it(@"test for writeData", ^{
        NSString* string = @"111111";
        NSData* data = [string dataUsingEncoding:NSUTF8StringEncoding];
        NSString* filePath = [NSFileManager pathForDocumentFileNamed:@"file"];
        BOOL ret = [basic writeData:data
                  toFile:filePath
              atomically:YES
                   error:nil];
        XCTAssertTrue(ret);
    });
    
    it(@"test for readContentsOfFile", ^{
        NSString* filePath = [NSFileManager pathForDocumentFileNamed:@"file"];
        NSString* retData = [basic readContentsOfFile:filePath useClass:[NSString class] error:nil];
        [[[retData stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] should] equal:@"111111"];
    });
    
    it(@"test for saveData", ^{
        NSString* saveData = @"hhahahaha";
        [basic saveData:saveData forKey:@"test"];
        
        NSString* retData = [basic fetchData:@"test"];
        
        [[retData should] equal:saveData];
    });
    
    it(@"test for saveContentWithSecurity", ^{
        NSString* content = @"hahahahah";
        BOOL ret = [basic saveContentWithSecurity:content service:@"testa" key:@"test" error:nil];
        XCTAssertTrue(ret);
    });
    
    it(@"test for fetchContentWithService", ^{
        NSString* ret = [basic fetchContentWithService:@"testa" key:@"test" error:nil];
        [[ret should] equal:@"hahahahah"];
    });
    
    it(@"test for removeContentWithService", ^{
        NSString* content = @"hahahahah";
        BOOL ret = [basic saveContentWithSecurity:content service:@"test1" key:@"test" error:nil];
        if(ret){
            ret = [basic removeContentWithService:@"test1" key:@"test" error:nil];
            XCTAssertTrue(ret);
        }
    });
    
    it(@"test for targetAction", ^{
        TKTargetDataStorage* target = [TKTargetDataStorage new];
        NSString* targetPath = [target tkAction_documentsFolder:nil];
        [[targetPath should] beNonNil];
    });
});

SPEC_END
