//
//  Cache.m
//  tutbyNews
//
//  Created by Artyom Mazurkevich on 20/12/15.
//  Copyright © 2015 Artyom Mazurkevich. All rights reserved.
//

#include "Cache.h"

@implementation Cache

+(NSString *)fileName {
    
    return @"tutbyappcache";
}

+(NSMutableDictionary *)getDictionaryFromFile {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:[Cache fileName]];
    
    return [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
}

-(id)init{
    
    self.cache = [NSMutableDictionary new];
    return [super init];
}

-(id)initWithCache:(NSMutableDictionary *)dict{
    
    self.cache = dict;
    return [super init];
}

-(UIImage *)get:(NSString *)key{
    
    return [UIImage imageWithData: [self.cache objectForKey:key]];
    return  nil;
}

-(void)put:(UIImage *)image :(NSString *)key{
    
    [self.cache setObject:UIImagePNGRepresentation(image) forKey:key];
    [self save];
}

-(void)clear {
    
    [self.cache removeAllObjects];
    [self save];
}

-(void)save{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:[Cache fileName]];
    
    [self.cache writeToFile:filePath atomically:YES];
   
}

@end