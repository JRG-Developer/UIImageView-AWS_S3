//
//  UIImagView+AWS_S3Tests.m
//  UIImageView+AWS_S3
//
//  Created by Joshua Greene on 7/20/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

// Test Class
#import "UIImageView+AWS_S3.h"

// Collaborators
#import <AFAmazonS3Client/AFAmazonS3Manager.h>

// Test Support
#import <XCTest/XCTest.h>

#define EXP_SHORTHAND YES
#import <Expecta/Expecta.h>

#import <OCMock/OCMock.h>

@interface UIImagView_AWS_S3Tests : XCTestCase
@end

@implementation UIImagView_AWS_S3Tests
{
  UIImageView *sut;
}

#pragma mark - Test Lifecycle

- (void)setUp
{
  [super setUp];
  sut = [[UIImageView alloc] init];
}

- (void)tearDown
{
  [super tearDown];
}

#pragma mark - Tests

@end