///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"
#import "DBTEAMApiApp.h"
#import "DBTEAMMemberLinkedApps.h"

#pragma mark - API Object

@implementation DBTEAMMemberLinkedApps

#pragma mark - Constructors

- (instancetype)initWithTeamMemberId:(NSString *)teamMemberId linkedApiApps:(NSArray<DBTEAMApiApp *> *)linkedApiApps {
  [DBStoneValidators arrayValidator:nil maxItems:nil itemValidator:nil](linkedApiApps);

  self = [super init];
  if (self) {
    _teamMemberId = teamMemberId;
    _linkedApiApps = linkedApiApps;
  }
  return self;
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBTEAMMemberLinkedAppsSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBTEAMMemberLinkedAppsSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBTEAMMemberLinkedAppsSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBTEAMMemberLinkedAppsSerializer

+ (NSDictionary *)serialize:(DBTEAMMemberLinkedApps *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  jsonDict[@"team_member_id"] = valueObj.teamMemberId;
  jsonDict[@"linked_api_apps"] = [DBArraySerializer serialize:valueObj.linkedApiApps
                                                    withBlock:^id(id elem) {
                                                      return [DBTEAMApiAppSerializer serialize:elem];
                                                    }];

  return jsonDict;
}

+ (DBTEAMMemberLinkedApps *)deserialize:(NSDictionary *)valueDict {
  NSString *teamMemberId = valueDict[@"team_member_id"];
  NSArray<DBTEAMApiApp *> *linkedApiApps = [DBArraySerializer deserialize:valueDict[@"linked_api_apps"]
                                                                withBlock:^id(id elem) {
                                                                  return [DBTEAMApiAppSerializer deserialize:elem];
                                                                }];

  return [[DBTEAMMemberLinkedApps alloc] initWithTeamMemberId:teamMemberId linkedApiApps:linkedApiApps];
}

@end
