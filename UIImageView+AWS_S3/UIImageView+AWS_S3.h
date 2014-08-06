//
//  UIImageView+AWS_S3.h
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

#import <UIKit/UIKit.h>

@class AFAmazonS3RequestSerializer;

/**
 *  `UIImageView+AWS_S3` makes it easy to set an image from an Amazon S3 resource path.
 *
 *  @warning You must create and set the `amazonS3RequestSerializer` (making sure to set an `accessKeyID`, `secret`, and optional `bucket`) prior to calling `setImageWithAmazonS3Path:~` or a runtime exception will be thrown. 
 */
@interface UIImageView (AWS_S3)

///--------------------------------------------------------------
/// @name Amazon S3 Request Serializer
///--------------------------------------------------------------

/**
 *  Use this method to set the shared Amazon S3 request serializer.
 *
 *  @param serializer The serializer to be set as the shared Amazon S3 request serializer
 */
+ (void)setAmazonS3RequestSerializer:(AFAmazonS3RequestSerializer *)serializer;

/**
 *  Use this method to set the image using an Amazon S3 path.
 *
 *  @discussion If you do *not* set the `bucket` on the `amazonS3RequestSerializer`, you must pass in a path of the form
 *  "bucketname/imageName"
 *
 *  @param path The path to the image relative to the `bucket` on the `amazonS3RequestSerializer`
 */
- (void)setImageWithS3Path:(NSString *)path;

/**
 *  This method returns an URL for a given S3 image path.
 *
 *  @param path The S3 image path
 *
 *  @return The URL for the S3 image path
 */
- (NSURL *)urlForImageWithS3Path:(NSString *)path;

/**
 *  Uset this method to set the image using an Amazon S3 path, placeholder image, success block, and failure block.
 *
 *  @discussion If you do *not* set the `bucket` on the `amazonS3RequestSerializer`, you must pass in a path of the form
 *  "bucketname/imageName"
 *
 *  @param path             The path to the image relative to the `bucket` on the `amazonS3RequestSerializer`
 *  @param placeholderImage The placeholder image
 *  @param success          The success block
 *  @param failure          The failure block
 */
- (void)setImageWithS3Path:(NSString *)path
                placeholderImage:(UIImage *)placeholderImage
                         success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image))success
                         failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error))failure;

@end
