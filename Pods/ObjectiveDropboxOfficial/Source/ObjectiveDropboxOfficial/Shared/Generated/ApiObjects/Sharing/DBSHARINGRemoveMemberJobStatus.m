///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBASYNCPollResultBase.h"
#import "DBSHARINGMemberAccessLevelResult.h"
#import "DBSHARINGRemoveFolderMemberError.h"
#import "DBSHARINGRemoveMemberJobStatus.h"
#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"

#pragma mark - API Object

@implementation DBSHARINGRemoveMemberJobStatus

@synthesize complete = _complete;
@synthesize failed = _failed;

#pragma mark - Constructors

- (instancetype)initWithInProgress {
  self = [super init];
  if (self) {
    _tag = DBSHARINGRemoveMemberJobStatusInProgress;
  }
  return self;
}

- (instancetype)initWithComplete:(DBSHARINGMemberAccessLevelResult *)complete {
  self = [super init];
  if (self) {
    _tag = DBSHARINGRemoveMemberJobStatusComplete;
    _complete = complete;
  }
  return self;
}

- (instancetype)initWithFailed:(DBSHARINGRemoveFolderMemberError *)failed {
  self = [super init];
  if (self) {
    _tag = DBSHARINGRemoveMemberJobStatusFailed;
    _failed = failed;
  }
  return self;
}

#pragma mark - Instance field accessors

- (DBSHARINGMemberAccessLevelResult *)complete {
  if (![self isComplete]) {
    [NSException raise:@"IllegalStateException"
                format:@"Invalid tag: required DBSHARINGRemoveMemberJobStatusComplete, but was %@.", [self tagName]];
  }
  return _complete;
}

- (DBSHARINGRemoveFolderMemberError *)failed {
  if (![self isFailed]) {
    [NSException raise:@"IllegalStateException"
                format:@"Invalid tag: required DBSHARINGRemoveMemberJobStatusFailed, but was %@.", [self tagName]];
  }
  return _failed;
}

#pragma mark - Tag state methods

- (BOOL)isInProgress {
  return _tag == DBSHARINGRemoveMemberJobStatusInProgress;
}

- (BOOL)isComplete {
  return _tag == DBSHARINGRemoveMemberJobStatusComplete;
}

- (BOOL)isFailed {
  return _tag == DBSHARINGRemoveMemberJobStatusFailed;
}

- (NSString *)tagName {
  switch (_tag) {
  case DBSHARINGRemoveMemberJobStatusInProgress:
    return @"DBSHARINGRemoveMemberJobStatusInProgress";
  case DBSHARINGRemoveMemberJobStatusComplete:
    return @"DBSHARINGRemoveMemberJobStatusComplete";
  case DBSHARINGRemoveMemberJobStatusFailed:
    return @"DBSHARINGRemoveMemberJobStatusFailed";
  }

  @throw([NSException exceptionWithName:@"InvalidTag" reason:@"Tag has an unknown value." userInfo:nil]);
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBSHARINGRemoveMemberJobStatusSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBSHARINGRemoveMemberJobStatusSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBSHARINGRemoveMemberJobStatusSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBSHARINGRemoveMemberJobStatusSerializer

+ (NSDictionary *)serialize:(DBSHARINGRemoveMemberJobStatus *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  if ([valueObj isInProgress]) {
    jsonDict[@".tag"] = @"in_progress";
  } else if ([valueObj isComplete]) {
    jsonDict[@"complete"] = [[DBSHARINGMemberAccessLevelResultSerializer serialize:valueObj.complete] mutableCopy];
    jsonDict[@".tag"] = @"complete";
  } else if ([valueObj isFailed]) {
    jsonDict[@"failed"] = [[DBSHARINGRemoveFolderMemberErrorSerializer serialize:valueObj.failed] mutableCopy];
    jsonDict[@".tag"] = @"failed";
  } else {
    @throw([NSException exceptionWithName:@"InvalidTag"
                                   reason:@"Object not properly initialized. Tag has an unknown value."
                                 userInfo:nil]);
  }

  return jsonDict;
}

+ (DBSHARINGRemoveMemberJobStatus *)deserialize:(NSDictionary *)valueDict {
  NSString *tag = valueDict[@".tag"];

  if ([tag isEqualToString:@"in_progress"]) {
    return [[DBSHARINGRemoveMemberJobStatus alloc] initWithInProgress];
  } else if ([tag isEqualToString:@"complete"]) {
    DBSHARINGMemberAccessLevelResult *complete = [DBSHARINGMemberAccessLevelResultSerializer deserialize:valueDict];
    return [[DBSHARINGRemoveMemberJobStatus alloc] initWithComplete:complete];
  } else if ([tag isEqualToString:@"failed"]) {
    DBSHARINGRemoveFolderMemberError *failed =
        [DBSHARINGRemoveFolderMemberErrorSerializer deserialize:valueDict[@"failed"]];
    return [[DBSHARINGRemoveMemberJobStatus alloc] initWithFailed:failed];
  }

  @throw([NSException
      exceptionWithName:@"InvalidTag"
                 reason:[NSString stringWithFormat:@"Tag has an invalid value: \"%@\".", valueDict[@".tag"]]
               userInfo:nil]);
}

@end
