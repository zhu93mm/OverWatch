//
//  RequestPaths.h
//  GameLive
//
//  Created by minmin on 16/6/26.
//  Copyright © 2016年 minmin. All rights reserved.
//

#ifndef RequestPaths_h
#define RequestPaths_h

#define kBasePath @"http://www.quanmin.tv"

/** 直播栏目类型列表 */
#define kcategoriesPath @"/json/categories/list.json"

/** 某栏目房间列表 */
#define kCategoryRoomsPath @"/json/categories/%@/list%@.json"

/**直播房间列表*/
#define kRoomsPath @"/json/play/list%@.json"

/** 直播视频的网址 */
#define kVideoPath @"http://hls.quanmin.tv/live/%@/playlist.m3u8"

/** 英雄界面－英雄头像图片地址/英雄名字 */
#define kIconHeroPath @"http://avatar.anzogame.com/guide_osspic/swxf/%@.jpg"
#define kIconHeroArray @[@"xm-icon", @"symmetra", @"zenyatta", @"lucio", @"DVA-icon", @"575fd4f40d6be", @"roadhog", @"winston", @"cly-icon", @"bastion", @"reinhardt", @"hanzo", @"hbh-icon", @"reaper", @"torbjorn", @"junkrat", @"soldier-76", @"mccree", @"flzy-icon", @"genji", @"lk-icon"]
#define kNameHeroArray @[@"防御  美", @"支援  秩序之光", @"支援  禅雅塔", @"支援  卢西奥", @"重装  D.VA", @"支援  天使", @"重装  路霸", @"重装  温斯顿", @"重装  查莉娅", @"防御  堡垒", @"重装  莱因哈特", @"防御  半藏", @"防御  黑百合", @"突击  死神", @"防御  托比昂", @"防御  狂鼠", @"突击  士兵76", @"突击  麦克雷", @"突击  法老之鹰", @"突击  源氏", @"突击  猎空"]

//守望(推荐页)
#define kShouWangPath @"http://cache.tuwan.com/app/?appid=1&dtid=57067&appid=1&appver=2.1&start=%ld"

#endif /* RequestPaths_h */
