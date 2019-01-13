//
//  AppDelegate.h
//  one-app
//
//  Created by jiyou xu on 2019-01-06.
//  Copyright © 2019 xujiyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end
