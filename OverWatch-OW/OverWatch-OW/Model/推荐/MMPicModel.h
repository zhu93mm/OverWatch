//
//  MMPicModel.h
//  OverWatch-OW
//
//  Created by minmin on 16/7/25.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MMPicRelevantModel, MMPicContentModel;
@interface MMPicModel : NSObject
//@property (nonatomic, strong) NSArray<Esarray *> *esArray;
//
//@end
//
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

//@property (nonatomic, strong) Infochild *infochild;

@property (nonatomic, copy) NSString *litpic;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, assign) NSInteger pictotal;

//@property (nonatomic, strong) NSArray<Showitem *> *showitem;

@property (nonatomic, copy) NSString *pubdate;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *murl;

@property (nonatomic, copy) NSString *banner;

@property (nonatomic, copy) NSString *zangs;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *timer;

@property (nonatomic, strong) NSArray<MMPicRelevantModel *> *relevant;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, strong) NSArray<MMPicContentModel *> *content;
//description -> desc
@property (nonatomic, copy) NSString *desc;

@end

//@interface Infochild : NSObject
//
//@property (nonatomic, copy) NSString *later;
//
//@property (nonatomic, copy) NSString *cn;
//
//@property (nonatomic, copy) NSString *facial;
//
//@property (nonatomic, copy) NSString *feature;
//
//@property (nonatomic, copy) NSString *role;
//
//@property (nonatomic, copy) NSString *shoot;
//
//@end

//@interface Showitem : NSObject
//
//@property (nonatomic, copy) NSString *pic;
//
//@property (nonatomic, copy) NSString *text;
//
//@property (nonatomic, strong) Info *info;
//
//@end
//
//@interface Info : NSObject
//
//@property (nonatomic, copy) NSString *width;
//
//@property (nonatomic, assign) NSInteger height;
//
//@end

@interface MMPicRelevantModel : NSObject
//description -> desc
@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *litpic;

@property (nonatomic, copy) NSString *pubdate;
//typename -> typeName
@property (nonatomic, copy) NSString *typeName;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *typechild;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *longtitle;

@end

@interface MMPicContentModel : NSObject

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *text;

//@property (nonatomic, strong) Info *info;

@end

//@interface Info : NSObject
//
//@property (nonatomic, copy) NSString *width;
//
//@property (nonatomic, assign) NSInteger height;
//
//@end

