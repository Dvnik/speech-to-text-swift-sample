/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     envoy/service/route/v3/rds.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#if COCOAPODS==1
  #include  "third_party/upb/upb/def.h"
#else
  #include  "upb/def.h"
#endif
#if COCOAPODS==1
  #include  "src/core/ext/upbdefs-generated/envoy/service/route/v3/rds.upbdefs.h"
#else
  #include  "envoy/service/route/v3/rds.upbdefs.h"
#endif

extern upb_def_init envoy_service_discovery_v3_discovery_proto_upbdefinit;
extern upb_def_init google_api_annotations_proto_upbdefinit;
extern upb_def_init envoy_annotations_resource_proto_upbdefinit;
extern upb_def_init udpa_annotations_status_proto_upbdefinit;
extern upb_def_init udpa_annotations_versioning_proto_upbdefinit;
extern const upb_msglayout envoy_service_route_v3_RdsDummy_msginit;

static const upb_msglayout *layouts[1] = {
  &envoy_service_route_v3_RdsDummy_msginit,
};

static const char descriptor[1014] = {'\n', ' ', 'e', 'n', 'v', 'o', 'y', '/', 's', 'e', 'r', 'v', 'i', 'c', 'e', '/', 'r', 'o', 'u', 't', 'e', '/', 'v', '3', '/', 
'r', 'd', 's', '.', 'p', 'r', 'o', 't', 'o', '\022', '\026', 'e', 'n', 'v', 'o', 'y', '.', 's', 'e', 'r', 'v', 'i', 'c', 'e', '.', 
'r', 'o', 'u', 't', 'e', '.', 'v', '3', '\032', '*', 'e', 'n', 'v', 'o', 'y', '/', 's', 'e', 'r', 'v', 'i', 'c', 'e', '/', 'd', 
'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', '/', 'v', '3', '/', 'd', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', '.', 'p', 'r', 'o', 
't', 'o', '\032', '\034', 'g', 'o', 'o', 'g', 'l', 'e', '/', 'a', 'p', 'i', '/', 'a', 'n', 'n', 'o', 't', 'a', 't', 'i', 'o', 'n', 
's', '.', 'p', 'r', 'o', 't', 'o', '\032', ' ', 'e', 'n', 'v', 'o', 'y', '/', 'a', 'n', 'n', 'o', 't', 'a', 't', 'i', 'o', 'n', 
's', '/', 'r', 'e', 's', 'o', 'u', 'r', 'c', 'e', '.', 'p', 'r', 'o', 't', 'o', '\032', '\035', 'u', 'd', 'p', 'a', '/', 'a', 'n', 
'n', 'o', 't', 'a', 't', 'i', 'o', 'n', 's', '/', 's', 't', 'a', 't', 'u', 's', '.', 'p', 'r', 'o', 't', 'o', '\032', '!', 'u', 
'd', 'p', 'a', '/', 'a', 'n', 'n', 'o', 't', 'a', 't', 'i', 'o', 'n', 's', '/', 'v', 'e', 'r', 's', 'i', 'o', 'n', 'i', 'n', 
'g', '.', 'p', 'r', 'o', 't', 'o', '\"', '(', '\n', '\010', 'R', 'd', 's', 'D', 'u', 'm', 'm', 'y', ':', '\034', '\232', '\305', '\210', '\036', 
'\027', '\n', '\025', 'e', 'n', 'v', 'o', 'y', '.', 'a', 'p', 'i', '.', 'v', '2', '.', 'R', 'd', 's', 'D', 'u', 'm', 'm', 'y', '2', 
'\314', '\003', '\n', '\025', 'R', 'o', 'u', 't', 'e', 'D', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', 'S', 'e', 'r', 'v', 'i', 'c', 'e', 
'\022', 'q', '\n', '\014', 'S', 't', 'r', 'e', 'a', 'm', 'R', 'o', 'u', 't', 'e', 's', '\022', ',', '.', 'e', 'n', 'v', 'o', 'y', '.', 
's', 'e', 'r', 'v', 'i', 'c', 'e', '.', 'd', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', '.', 'v', '3', '.', 'D', 'i', 's', 'c', 
'o', 'v', 'e', 'r', 'y', 'R', 'e', 'q', 'u', 'e', 's', 't', '\032', '-', '.', 'e', 'n', 'v', 'o', 'y', '.', 's', 'e', 'r', 'v', 
'i', 'c', 'e', '.', 'd', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', '.', 'v', '3', '.', 'D', 'i', 's', 'c', 'o', 'v', 'e', 'r', 
'y', 'R', 'e', 's', 'p', 'o', 'n', 's', 'e', '\"', '\000', '(', '\001', '0', '\001', '\022', 'z', '\n', '\013', 'D', 'e', 'l', 't', 'a', 'R', 
'o', 'u', 't', 'e', 's', '\022', '1', '.', 'e', 'n', 'v', 'o', 'y', '.', 's', 'e', 'r', 'v', 'i', 'c', 'e', '.', 'd', 'i', 's', 
'c', 'o', 'v', 'e', 'r', 'y', '.', 'v', '3', '.', 'D', 'e', 'l', 't', 'a', 'D', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', 'R', 
'e', 'q', 'u', 'e', 's', 't', '\032', '2', '.', 'e', 'n', 'v', 'o', 'y', '.', 's', 'e', 'r', 'v', 'i', 'c', 'e', '.', 'd', 'i', 
's', 'c', 'o', 'v', 'e', 'r', 'y', '.', 'v', '3', '.', 'D', 'e', 'l', 't', 'a', 'D', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', 
'R', 'e', 's', 'p', 'o', 'n', 's', 'e', '\"', '\000', '(', '\001', '0', '\001', '\022', '\221', '\001', '\n', '\013', 'F', 'e', 't', 'c', 'h', 'R', 
'o', 'u', 't', 'e', 's', '\022', ',', '.', 'e', 'n', 'v', 'o', 'y', '.', 's', 'e', 'r', 'v', 'i', 'c', 'e', '.', 'd', 'i', 's', 
'c', 'o', 'v', 'e', 'r', 'y', '.', 'v', '3', '.', 'D', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', 'R', 'e', 'q', 'u', 'e', 's', 
't', '\032', '-', '.', 'e', 'n', 'v', 'o', 'y', '.', 's', 'e', 'r', 'v', 'i', 'c', 'e', '.', 'd', 'i', 's', 'c', 'o', 'v', 'e', 
'r', 'y', '.', 'v', '3', '.', 'D', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', 'R', 'e', 's', 'p', 'o', 'n', 's', 'e', '\"', '%', 
'\202', '\323', '\344', '\223', '\002', '\026', '\"', '\024', '/', 'v', '3', '/', 'd', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', ':', 'r', 'o', 'u', 
't', 'e', 's', '\202', '\323', '\344', '\223', '\002', '\003', ':', '\001', '*', '\032', '0', '\212', '\244', '\226', '\363', '\007', '*', '\n', '(', 'e', 'n', 'v', 
'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'r', 'o', 'u', 't', 'e', '.', 'v', '3', '.', 'R', 'o', 'u', 't', 'e', 'C', 
'o', 'n', 'f', 'i', 'g', 'u', 'r', 'a', 't', 'i', 'o', 'n', '2', '\313', '\001', '\n', '\033', 'V', 'i', 'r', 't', 'u', 'a', 'l', 'H', 
'o', 's', 't', 'D', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', 'S', 'e', 'r', 'v', 'i', 'c', 'e', '\022', '\200', '\001', '\n', '\021', 'D', 
'e', 'l', 't', 'a', 'V', 'i', 'r', 't', 'u', 'a', 'l', 'H', 'o', 's', 't', 's', '\022', '1', '.', 'e', 'n', 'v', 'o', 'y', '.', 
's', 'e', 'r', 'v', 'i', 'c', 'e', '.', 'd', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', '.', 'v', '3', '.', 'D', 'e', 'l', 't', 
'a', 'D', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', 'R', 'e', 'q', 'u', 'e', 's', 't', '\032', '2', '.', 'e', 'n', 'v', 'o', 'y', 
'.', 's', 'e', 'r', 'v', 'i', 'c', 'e', '.', 'd', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', '.', 'v', '3', '.', 'D', 'e', 'l', 
't', 'a', 'D', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', 'R', 'e', 's', 'p', 'o', 'n', 's', 'e', '\"', '\000', '(', '\001', '0', '\001', 
'\032', ')', '\212', '\244', '\226', '\363', '\007', '#', '\n', '!', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'r', 'o', 
'u', 't', 'e', '.', 'v', '3', '.', 'V', 'i', 'r', 't', 'u', 'a', 'l', 'H', 'o', 's', 't', 'B', '=', '\n', '$', 'i', 'o', '.', 
'e', 'n', 'v', 'o', 'y', 'p', 'r', 'o', 'x', 'y', '.', 'e', 'n', 'v', 'o', 'y', '.', 's', 'e', 'r', 'v', 'i', 'c', 'e', '.', 
'r', 'o', 'u', 't', 'e', '.', 'v', '3', 'B', '\010', 'R', 'd', 's', 'P', 'r', 'o', 't', 'o', 'P', '\001', '\210', '\001', '\001', '\272', '\200', 
'\310', '\321', '\006', '\002', '\020', '\002', 'b', '\006', 'p', 'r', 'o', 't', 'o', '3', 
};

static upb_def_init *deps[6] = {
  &envoy_service_discovery_v3_discovery_proto_upbdefinit,
  &google_api_annotations_proto_upbdefinit,
  &envoy_annotations_resource_proto_upbdefinit,
  &udpa_annotations_status_proto_upbdefinit,
  &udpa_annotations_versioning_proto_upbdefinit,
  NULL
};

upb_def_init envoy_service_route_v3_rds_proto_upbdefinit = {
  deps,
  layouts,
  "envoy/service/route/v3/rds.proto",
  UPB_STRVIEW_INIT(descriptor, 1014)
};
