//
//  AppDelegate.h
//  Tools
//
//  Created by 孙东日 on 2017/11/29.
//  Copyright © 2017年 孙东日. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

