///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBFILESWriteMode.h"
#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"

#pragma mark - API Object

@implementation DBFILESWriteMode

@synthesize update = _update;

#pragma mark - Constructors

- (instancetype)initWithAdd {
  self = [super init];
  if (self) {
    _tag = DBFILESWriteModeAdd;
  }
  return self;
}

- (instancetype)initWithOverwrite {
  self = [super init];
  if (self) {
    _tag = DBFILESWriteModeOverwrite;
  }
  return self;
}

- (instancetype)initWithUpdate:(NSString *)update {
  self = [super init];
  if (self) {
    _tag = DBFILESWriteModeUpdate;
    _update = update;
  }
  return self;
}

#pragma mark - Instance field accessors

- (NSString *)update {
  if (![self isUpdate]) {
    [NSException raise:@"IllegalStateException"
                format:@"Invalid tag: required DBFILESWriteModeUpdate, but was %@.", [self tagName]];
  }
  return _update;
}

#pragma mark - Tag state methods

- (BOOL)isAdd {
  return _tag == DBFILESWriteModeAdd;
}

- (BOOL)isOverwrite {
  return _tag == DBFILESWriteModeOverwrite;
}

- (BOOL)isUpdate {
  return _tag == DBFILESWriteModeUpdate;
}

- (NSString *)tagName {
  switch (_tag) {
  case DBFILESWriteModeAdd:
    return @"DBFILESWriteModeAdd";
  case DBFILESWriteModeOverwrite:
    return @"DBFILESWriteModeOverwrite";
  case DBFILESWriteModeUpdate:
    return @"DBFILESWriteModeUpdate";
  }

  @throw([NSException exceptionWithName:@"InvalidTag" reason:@"Tag has an unknown value." userInfo:nil]);
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBFILESWriteModeSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBFILESWriteModeSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBFILESWriteModeSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBFILESWriteModeSerializer

+ (NSDictionary *)serialize:(DBFILESWriteMode *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  if ([valueObj isAdd]) {
    jsonDict[@".tag"] = @"add";
  } else if ([valueObj isOverwrite]) {
    jsonDict[@".tag"] = @"overwrite";
  } else if ([valueObj isUpdate]) {
    jsonDict[@"update"] = valueObj.update;
    jsonDict[@".tag"] = @"update";
  } else {
    @throw([NSException exceptionWithName:@"InvalidTag"
                                   reason:@"Object not properly initialized. Tag has an unknown value."
                                 userInfo:nil]);
  }

  return jsonDict;
}

+ (DBFILESWriteMode *)deserialize:(NSDictionary *)valueDict {
  NSString *tag = valueDict[@".tag"];

  if ([tag isEqualToString:@"add"]) {
    return [[DBFILESWriteMode alloc] initWithAdd];
  } else if ([tag isEqualToString:@"overwrite"]) {
    return [[DBFILESWriteMode alloc] initWithOverwrite];
  } else if ([tag isEqualToString:@"update"]) {
    NSString *update = valueDict[@"update"];
    return [[DBFILESWriteMode alloc] initWithUpdate:update];
  }

  @throw([NSException
      exceptionWithName:@"InvalidTag"
                 reason:[NSString stringWithFormat:@"Tag has an invalid value: \"%@\".", valueDict[@".tag"]]
               userInfo:nil]);
}

@end
