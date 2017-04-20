///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBFILESInvalidPropertyGroupError;
@class DBFILESLookupError;

#pragma mark - API Object

///
/// The `InvalidPropertyGroupError` union.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBFILESInvalidPropertyGroupError : NSObject <DBSerializable>

#pragma mark - Instance fields

/// The `DBFILESInvalidPropertyGroupErrorTag` enum type represents the possible
/// tag states with which the `DBFILESInvalidPropertyGroupError` union can
/// exist.
typedef NS_ENUM(NSInteger, DBFILESInvalidPropertyGroupErrorTag) {
  /// Property template does not exist for given identifier.
  DBFILESInvalidPropertyGroupErrorTemplateNotFound,

  /// You do not have the permissions to modify this property template.
  DBFILESInvalidPropertyGroupErrorRestrictedContent,

  /// (no description).
  DBFILESInvalidPropertyGroupErrorOther,

  /// (no description).
  DBFILESInvalidPropertyGroupErrorPath,

  /// A field value in this property group is too large.
  DBFILESInvalidPropertyGroupErrorPropertyFieldTooLarge,

  /// The property group specified does not conform to the property template.
  DBFILESInvalidPropertyGroupErrorDoesNotFitTemplate,

};

/// Represents the union's current tag state.
@property (nonatomic, readonly) DBFILESInvalidPropertyGroupErrorTag tag;

/// Property template does not exist for given identifier. @note Ensure the
/// `isTemplateNotFound` method returns true before accessing, otherwise a
/// runtime exception will be raised.
@property (nonatomic, readonly, copy) NSString * _Nonnull templateNotFound;

/// (no description). @note Ensure the `isPath` method returns true before
/// accessing, otherwise a runtime exception will be raised.
@property (nonatomic, readonly) DBFILESLookupError * _Nonnull path;

#pragma mark - Constructors

///
/// Initializes union class with tag state of "template_not_found".
///
/// Description of the "template_not_found" tag state: Property template does
/// not exist for given identifier.
///
/// @param templateNotFound Property template does not exist for given
/// identifier.
///
/// @return An initialized instance.
///
- (nonnull instancetype)initWithTemplateNotFound:(NSString * _Nonnull)templateNotFound;

///
/// Initializes union class with tag state of "restricted_content".
///
/// Description of the "restricted_content" tag state: You do not have the
/// permissions to modify this property template.
///
/// @return An initialized instance.
///
- (nonnull instancetype)initWithRestrictedContent;

///
/// Initializes union class with tag state of "other".
///
/// @return An initialized instance.
///
- (nonnull instancetype)initWithOther;

///
/// Initializes union class with tag state of "path".
///
/// @param path (no description).
///
/// @return An initialized instance.
///
- (nonnull instancetype)initWithPath:(DBFILESLookupError * _Nonnull)path;

///
/// Initializes union class with tag state of "property_field_too_large".
///
/// Description of the "property_field_too_large" tag state: A field value in
/// this property group is too large.
///
/// @return An initialized instance.
///
- (nonnull instancetype)initWithPropertyFieldTooLarge;

///
/// Initializes union class with tag state of "does_not_fit_template".
///
/// Description of the "does_not_fit_template" tag state: The property group
/// specified does not conform to the property template.
///
/// @return An initialized instance.
///
- (nonnull instancetype)initWithDoesNotFitTemplate;

#pragma mark - Tag state methods

///
/// Retrieves whether the union's current tag state has value
/// "template_not_found".
///
/// @note Call this method and ensure it returns true before accessing the
/// `templateNotFound` property, otherwise a runtime exception will be thrown.
///
/// @return Whether the union's current tag state has value
/// "template_not_found".
///
- (BOOL)isTemplateNotFound;

///
/// Retrieves whether the union's current tag state has value
/// "restricted_content".
///
/// @return Whether the union's current tag state has value
/// "restricted_content".
///
- (BOOL)isRestrictedContent;

///
/// Retrieves whether the union's current tag state has value "other".
///
/// @return Whether the union's current tag state has value "other".
///
- (BOOL)isOther;

///
/// Retrieves whether the union's current tag state has value "path".
///
/// @note Call this method and ensure it returns true before accessing the
/// `path` property, otherwise a runtime exception will be thrown.
///
/// @return Whether the union's current tag state has value "path".
///
- (BOOL)isPath;

///
/// Retrieves whether the union's current tag state has value
/// "property_field_too_large".
///
/// @return Whether the union's current tag state has value
/// "property_field_too_large".
///
- (BOOL)isPropertyFieldTooLarge;

///
/// Retrieves whether the union's current tag state has value
/// "does_not_fit_template".
///
/// @return Whether the union's current tag state has value
/// "does_not_fit_template".
///
- (BOOL)isDoesNotFitTemplate;

///
/// Retrieves string value of union's current tag state.
///
/// @return A human-readable string representing the union's current tag state.
///
- (NSString * _Nonnull)tagName;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `DBFILESInvalidPropertyGroupError` union.
///
@interface DBFILESInvalidPropertyGroupErrorSerializer : NSObject

///
/// Serializes `DBFILESInvalidPropertyGroupError` instances.
///
/// @param instance An instance of the `DBFILESInvalidPropertyGroupError` API
/// object.
///
/// @return A json-compatible dictionary representation of the
/// `DBFILESInvalidPropertyGroupError` API object.
///
+ (NSDictionary * _Nonnull)serialize:(DBFILESInvalidPropertyGroupError * _Nonnull)instance;

///
/// Deserializes `DBFILESInvalidPropertyGroupError` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBFILESInvalidPropertyGroupError` API object.
///
/// @return An instantiation of the `DBFILESInvalidPropertyGroupError` object.
///
+ (DBFILESInvalidPropertyGroupError * _Nonnull)deserialize:(NSDictionary * _Nonnull)dict;

@end
