//
//  MMVideoModel.h
//  OverWatch-OW
//
//  Created by minmin on 16/7/26.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MMVideoContentModel;
@interface MMVideoModel : NSObject

//@property (nonatomic, strong) NSArray<Esarray *> *esArray;
//
//@end
//@interface Esarray : NSObject
@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *showtype;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *typechild;

@property (nonatomic, copy) NSString *longtitle;
//typename -> typeName
@property (nonatomic, copy) NSString *typeName;

@property (nonatomic, copy) NSString *html5;

@property (nonatomic, copy) NSString *toutiao;

@property (nonatomic, copy) NSString *litpic;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *pubdate;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *murl;

@property (nonatomic, copy) NSString *banner;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *timer;

//@property (nonatomic, strong) NSArray<Relevant *> *relevant;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, strong) NSArray<MMVideoContentModel *> *content;
//description -> desc
@property (nonatomic, copy) NSString *desc;

@end

@interface MMVideoContentModel : NSObject

@property (nonatomic, copy) NSString *video;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *text;

@end

//@interface Relevant : NSObject
//
//@property (nonatomic, copy) NSString *description;
//
//@property (nonatomic, copy) NSString *litpic;
//
//@property (nonatomic, copy) NSString *pubdate;
//
//@property (nonatomic, copy) NSString *typename;
//
//@property (nonatomic, copy) NSString *click;
//
//@property (nonatomic, copy) NSString *timestamp;
//
//@property (nonatomic, copy) NSString *type;
//
//@property (nonatomic, copy) NSString *title;
//
//@property (nonatomic, copy) NSString *color;
//
//@property (nonatomic, copy) NSString *typechild;
//
//@property (nonatomic, copy) NSString *writer;
//
//@property (nonatomic, copy) NSString *aid;
//
//@property (nonatomic, copy) NSString *longtitle;
//
//@end

