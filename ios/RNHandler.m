
#import "RNHandler.h"
#import "NSData+Encryption.h"
@implementation RNHandler

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

//字符串加密
RCT_REMAP_METHOD(encryString,
                 string:(NSString*) str
                 resolver:(RCTPromiseResolveBlock)resolver
                 rejecter:(RCTPromiseRejectBlock)reject) {
    NSString *key = @"hshCustomerApp";
    NSData * tempData = [str dataUsingEncoding: NSUTF8StringEncoding];
    NSData * cipher = [tempData AES256EncryptWithKey: key];
    NSString * result = [cipher newStringInBase64FromData];
    
    resolver(result);
}

//字符串解密
RCT_REMAP_METHOD(dencryString,
                 dString:(NSString*) str
                 resolver:(RCTPromiseResolveBlock)resolver
                 rejecter:(RCTPromiseRejectBlock)reject) {
    NSString *key = @"hshCustomerApp";
    NSData *newJM = [[NSData alloc]initWithBase64EncodedString: str options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSData * tempData = [newJM AES256DecryptWithKey:key];
    NSString * result = [[NSString alloc] initWithData:tempData encoding:NSUTF8StringEncoding];
    resolver(result);
}

@end
  
