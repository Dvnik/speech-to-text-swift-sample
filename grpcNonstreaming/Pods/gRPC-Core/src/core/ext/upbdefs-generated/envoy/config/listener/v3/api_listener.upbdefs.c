/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     envoy/config/listener/v3/api_listener.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#if COCOAPODS==1
  #include  "third_party/upb/upb/def.h"
#else
  #include  "upb/def.h"
#endif
#if COCOAPODS==1
  #include  "src/core/ext/upbdefs-generated/envoy/config/listener/v3/api_listener.upbdefs.h"
#else
  #include  "envoy/config/listener/v3/api_listener.upbdefs.h"
#endif

extern upb_def_init google_protobuf_any_proto_upbdefinit;
extern upb_def_init udpa_annotations_status_proto_upbdefinit;
extern upb_def_init udpa_annotations_versioning_proto_upbdefinit;
extern const upb_msglayout envoy_config_listener_v3_ApiListener_msginit;

static const upb_msglayout *layouts[1] = {
  &envoy_config_listener_v3_ApiListener_msginit,
};

static const char descriptor[359] = {'\n', '+', 'e', 'n', 'v', 'o', 'y', '/', 'c', 'o', 'n', 'f', 'i', 'g', '/', 'l', 'i', 's', 't', 'e', 'n', 'e', 'r', '/', 'v', 
'3', '/', 'a', 'p', 'i', '_', 'l', 'i', 's', 't', 'e', 'n', 'e', 'r', '.', 'p', 'r', 'o', 't', 'o', '\022', '\030', 'e', 'n', 'v', 
'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'l', 'i', 's', 't', 'e', 'n', 'e', 'r', '.', 'v', '3', '\032', '\031', 'g', 'o', 
'o', 'g', 'l', 'e', '/', 'p', 'r', 'o', 't', 'o', 'b', 'u', 'f', '/', 'a', 'n', 'y', '.', 'p', 'r', 'o', 't', 'o', '\032', '\035', 
'u', 'd', 'p', 'a', '/', 'a', 'n', 'n', 'o', 't', 'a', 't', 'i', 'o', 'n', 's', '/', 's', 't', 'a', 't', 'u', 's', '.', 'p', 
'r', 'o', 't', 'o', '\032', '!', 'u', 'd', 'p', 'a', '/', 'a', 'n', 'n', 'o', 't', 'a', 't', 'i', 'o', 'n', 's', '/', 'v', 'e', 
'r', 's', 'i', 'o', 'n', 'i', 'n', 'g', '.', 'p', 'r', 'o', 't', 'o', '\"', 's', '\n', '\013', 'A', 'p', 'i', 'L', 'i', 's', 't', 
'e', 'n', 'e', 'r', '\022', '7', '\n', '\014', 'a', 'p', 'i', '_', 'l', 'i', 's', 't', 'e', 'n', 'e', 'r', '\030', '\001', ' ', '\001', '(', 
'\013', '2', '\024', '.', 'g', 'o', 'o', 'g', 'l', 'e', '.', 'p', 'r', 'o', 't', 'o', 'b', 'u', 'f', '.', 'A', 'n', 'y', 'R', '\013', 
'a', 'p', 'i', 'L', 'i', 's', 't', 'e', 'n', 'e', 'r', ':', '+', '\232', '\305', '\210', '\036', '&', '\n', '$', 'e', 'n', 'v', 'o', 'y', 
'.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'l', 'i', 's', 't', 'e', 'n', 'e', 'r', '.', 'v', '2', '.', 'A', 'p', 'i', 'L', 'i', 
's', 't', 'e', 'n', 'e', 'r', 'B', 'D', '\n', '&', 'i', 'o', '.', 'e', 'n', 'v', 'o', 'y', 'p', 'r', 'o', 'x', 'y', '.', 'e', 
'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'l', 'i', 's', 't', 'e', 'n', 'e', 'r', '.', 'v', '3', 'B', '\020', 
'A', 'p', 'i', 'L', 'i', 's', 't', 'e', 'n', 'e', 'r', 'P', 'r', 'o', 't', 'o', 'P', '\001', '\272', '\200', '\310', '\321', '\006', '\002', '\020', 
'\002', 'b', '\006', 'p', 'r', 'o', 't', 'o', '3', 
};

static upb_def_init *deps[4] = {
  &google_protobuf_any_proto_upbdefinit,
  &udpa_annotations_status_proto_upbdefinit,
  &udpa_annotations_versioning_proto_upbdefinit,
  NULL
};

upb_def_init envoy_config_listener_v3_api_listener_proto_upbdefinit = {
  deps,
  layouts,
  "envoy/config/listener/v3/api_listener.proto",
  UPB_STRVIEW_INIT(descriptor, 359)
};
