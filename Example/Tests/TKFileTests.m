//
//  TKFileTests.m
//  TKDataStorage
//
//  Created by 云峰李 on 2017/8/29.
//  Copyright © 2017年 512869343@qq.com. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <TKDataStorage/NSFileManager+TKUtilities.h>

SPEC_BEGIN(TKFileUtiltisTets)

context(@"正常情况", ^{
    it(@"test for NSDocumentsFolder", ^{
        NSString* documentsFolder = TKDocumentsFolder();
        NSLog(@"document 目录为%@",documentsFolder);
        [[documentsFolder should] beNonNil];
    });
    
    it(@"test NSLibraryFolder", ^{
        NSString* libraryFolder = TKLibraryFolder();
        NSLog(@"library 目录为%@", libraryFolder);
        [[libraryFolder should] beNonNil];
    });
    
    it(@"test TKTmpFolder", ^{
        NSString* tmpFolder = TKTmpFolder();
        NSLog(@"tmp 目录为%@", tmpFolder);
        [[tmpFolder should] beNonNil];
    });
    
    it(@"test TKDCIMFolder", ^{
        NSString *dicimFolder = TKDCIMFolder();
        NSLog(@"dcim 目录为%@", dicimFolder);
        [[dicimFolder should] beNonNil];
    });
    
    it(@"test for pathForItemNamed:inFolder:", ^{
        NSString* filePath = [NSFileManager pathForItemNamed:@"test" inFolder:TKDocumentsFolder()];
        NSLog(@"获取的目录为:%@",filePath);
        [[filePath should] beNil];
    });
    
    it(@"test for pathForBundleDocumentNamed", ^{
        NSString* filePath = [NSFileManager pathForDocumentNamed:@"hjhahah"];
        NSLog(@"获取的目录为:%@",filePath);
        [[filePath should] beNil];
    });
    
    it(@"test for pathForBundleDocumentNamed", ^{
        NSString* filePath = [NSFileManager pathForBundleDocumentNamed:@"testaa"];
        NSLog(@"获取的目录为:%@",filePath);
        [[filePath should] beNil];
    });
    
    it(@"test for pathForFileName:inFolder:", ^{
        NSString* filePath = [NSFileManager pathForFileName:@"test" inFolder:TKDocumentsFolder()];
        NSLog(@"获取的目录为:%@",filePath);
        [[filePath should] beNonNil];
    });
    
    it(@"test for pathForDocumentFileNamed", ^{
        NSString* filePath = [NSFileManager pathForDocumentFileNamed:@"hjhahah"];
        NSLog(@"获取的目录为:%@",filePath);
        [[filePath should] beNonNil];
    });
    
    it(@"test for pathForBoundleFileNamed", ^{
        NSString* filePath = [NSFileManager pathForBoundleFileNamed:@"testaa"];
        NSLog(@"获取的目录为:%@",filePath);
        [[filePath should] beNonNil];
    });
    
    it(@"test for findOrCreateDirectoryPath", ^{
        NSString* filePath = [NSFileManager pathForDocumentFileNamed:@"create"];
        BOOL ret = [NSFileManager findOrCreateDirectoryPath:filePath];
        id obj = @(ret);
        [[obj should] equal:@(YES)];
    });
    
    it(@"test for has files filesInFolder", ^{
        NSString* filePath = [NSFileManager pathForDocumentNamed:@"create"];
        NSArray* files = [NSFileManager filesInFolder:filePath];
        [[files should] beNonNil];
    });
    
    it(@"test for no files filesInFolder", ^{
        NSString* tmpPath = TKTmpFolder();
        NSArray* files = [NSFileManager filesInFolder:tmpPath];
        XCTAssertTrue(files.count == 0);
    });
    
    it(@"test for pathsForBundleDocumentsMatchingExtension", ^{
        NSString* filePath = [NSFileManager pathForDocumentNamed:@"create"];
        NSArray* files = [NSFileManager pathsForItemsMatchingExtension:@"xml" inFolder:filePath];
        XCTAssertTrue(files.count > 0);
    });
    
    context(@"异常情况", ^{
        it(@"test for pathForFileName:folder:", ^{
            NSString* filePath = [NSFileManager pathForFileName:nil inFolder:TKDocumentsFolder()];
            [[filePath should] beNil];
        });
        
        it(@"test for pathForItemNamed", ^{
            NSString* filePath = [NSFileManager pathForItemNamed:nil inFolder:TKDocumentsFolder()];
            [[filePath should] beNil];
        });
        
        it(@"test for filesInFolder", ^{
            NSArray* files = [NSFileManager filesInFolder:nil];
            XCTAssertTrue(files.count == 0);
        });
        
        it(@"test for pathsForDocumentsMatchingExtension", ^{
            NSArray* files = [NSFileManager pathsForDocumentsMatchingExtension:nil];
            XCTAssertTrue(files.count == 0);
        });
        
        it(@"test for findOrCreateDirectoryPath", ^{
            BOOL ret = [NSFileManager findOrCreateDirectoryPath:nil];
            XCTAssertTrue(!ret);
        });
    });
});

SPEC_END

