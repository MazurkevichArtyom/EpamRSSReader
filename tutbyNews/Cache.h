//
//  Cache.h
//  tutbyNews
//
//  Created by Artyom Mazurkevich on 20/12/15.
//  Copyright © 2015 Artyom Mazurkevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Cache : NSObject

@property  NSMutableDictionary* cache;

+(NSString*) fileName;
+(NSMutableDictionary*) getDictionaryFromFile;

-(id) initWithCache:(NSMutableDictionary *) dict;
-(UIImage *) get:(NSString *) key;
-(void) put:(UIImage *) image : (NSString *) key;
-(void) clear;
-(void) save;

@end
