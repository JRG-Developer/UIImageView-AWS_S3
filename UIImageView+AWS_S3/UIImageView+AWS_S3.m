//
//  UIImageView+AWS_S3.m
//  UIImageView+AWS_S3
//
//  Created by Joshua Greene on 7/20/14.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "UIImageView+AWS_S3.h"

#import <AFNetworking/UIImageView+AFNetworking.h>
#import <AFAmazonS3Client/AFAmazonS3RequestSerializer.h>

static AFAmazonS3RequestSerializer *_amazonRequestSerializer;

@implementation UIImageView (AWS_S3)

#pragma mark - Class Methods

+ (void)setAmazonS3RequestSerializer:(AFAmazonS3RequestSerializer *)serializer
{
  _amazonRequestSerializer = serializer;
}

+ (NSURL *)urlForImageWithS3Path:(NSString *)path
{
    NSString *urlString = [self urlStringForImageWithS3Path:path];
    return [NSURL URLWithString:urlString];
}

+ (NSString *)urlStringForImageWithS3Path:(NSString *)path
{
    return [[_amazonRequestSerializer.endpointURL URLByAppendingPathComponent:path] absoluteString];
}

#pragma mark - Instance Methods

- (void)setImageWithS3Path:(NSString *)path
{
  [self setImageWithS3Path:path placeholderImage:nil success:nil failure:nil];
}

- (void)setImageWithS3Path:(NSString *)path
                placeholderImage:(UIImage *)placeholderImage
                         success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image))success
                         failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error))failure
{
  NSParameterAssert(_amazonRequestSerializer);
  
  NSString *urlString = [[self class  ]urlStringForImageWithS3Path:path];
  NSMutableURLRequest *request = [_amazonRequestSerializer requestWithMethod:@"GET"
                                                                   URLString:urlString
                                                                  parameters:nil
                                                                       error:nil];
  
  [self setImageWithURLRequest:request placeholderImage:placeholderImage success:success failure:failure];
}

@end
