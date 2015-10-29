//
//  UIImage+FixOrientation.m
//  Sean Huang
//
//  Created by seanhuang on 15-02-06.
//  Copyright (c) 2015年 seanhuang. All rights reserved.
//

#import "UIImage+FixOrientation.h"
#import "UIImage+ResizeMagick.h"

@implementation UIImage (FixOrientation)

- (UIImage *)getImageAdaptSize:(CGSize)sizeNew {
    UIImage *imageJPEG = self;
    
    /**
     *
     */
    UIImage *imageResized;
    double ratioScreen = (sizeNew.width * 1.00) / sizeNew.height;
    ratioScreen = floor(ratioScreen * 100) / 100;
    double ratioImage = (imageJPEG.size.width * 1.00) / imageJPEG.size.height;
    ratioImage = floor(ratioImage * 100) / 100;
    
    /**
     *
     */
    UIImage *imageCroped;
    if (fabs(ratioImage - ratioScreen) < 1e-6) {
        imageResized = imageJPEG;
        imageCroped = imageResized;
    } else {
        if (ratioImage > ratioScreen) {
            // 更宽
            imageResized = [imageJPEG resizedImageByHeight:sizeNew.height * 2];
            CGRect rect = CGRectMake((imageResized.size.width - sizeNew.width * 2)/2, 0, sizeNew.width * 2, sizeNew.height * 2);
            imageCroped = [UIImage imageWithCGImage:CGImageCreateWithImageInRect([imageResized CGImage], rect)];
        } else {
            // 更高
            imageResized = [imageJPEG resizedImageByWidth:sizeNew.width * 2];
            CGRect rect = CGRectMake(0, (imageResized.size.height - sizeNew.height * 2)/2, sizeNew.width * 2, sizeNew.height * 2);
            imageCroped = [UIImage imageWithCGImage:CGImageCreateWithImageInRect([imageResized CGImage], rect)];
        }
    }
    
    return imageCroped;
}

#pragma mark - fixOrientation
- (UIImage *)fixOrientation {
    UIImage *aImage = self;
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

#pragma mark - imageWithColor
+ (UIImage *)imageWithColor:(UIColor *)color rect:(CGRect)rect
{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
