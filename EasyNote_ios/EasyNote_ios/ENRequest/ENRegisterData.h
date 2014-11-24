//
//  ENRegisterData.h
//  EasyNote_ios
//
//  Created by shenqi329 on 14/11/22.
//  Copyright (c) 2014年 shenqi329. All rights reserved.
//

#import "EasyNoteData.h"

@interface ENRegisterForm : Jastor

@property(nonatomic,retain) NSString *id;
@property(nonatomic,retain) NSNumber *exist;
@property(nonatomic,retain) NSNumber *create;

@end

@interface ENRegisterDataResponsePost : EasyNoteData

@property(nonatomic,retain) ENRegisterForm *data;

@end
