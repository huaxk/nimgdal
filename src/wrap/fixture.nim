proc OGR_L_SymDifference*(a1: OGRLayerH; a2: OGRLayerH; a3: OGRLayerH;
                         a4: cstringArray; a5: GDALProgressFunc; a6: pointer): OGRErr {.
    stdcall, importc: "OGR_L_SymDifference", dynlib: dynlibogr_api.}
proc OGR_L_Identity*(a1: OGRLayerH; a2: OGRLayerH; a3: OGRLayerH; a4: cstringArray;
                    a5: GDALProgressFunc; a6: pointer): OGRErr {.stdcall,
    importc: "OGR_L_Identity", dynlib: dynlibogr_api.}
proc OGR_L_Update*(a1: OGRLayerH; a2: OGRLayerH; a3: OGRLayerH; a4: cstringArray;
                  a5: GDALProgressFunc; a6: pointer): OGRErr {.stdcall,
    importc: "OGR_L_Update", dynlib: dynlibogr_api.}
proc OGR_L_Clip*(a1: OGRLayerH; a2: OGRLayerH; a3: OGRLayerH; a4: cstringArray;
                a5: GDALProgressFunc; a6: pointer): OGRErr {.stdcall,
    importc: "OGR_L_Clip", dynlib: dynlibogr_api.}
proc OGR_L_Erase*(a1: OGRLayerH; a2: OGRLayerH; a3: OGRLayerH; a4: cstringArray;
                 a5: GDALProgressFunc; a6: pointer): OGRErr {.stdcall,
    importc: "OGR_L_Erase", dynlib: dynlibogr_api.}
proc OGR_DS_Destroy*(a1: OGRDataSourceH) {.stdcall, importc: "OGR_DS_Destroy",
                                        dynlib: dynlibogr_api.}
proc OGR_DS_GetName*(a1: OGRDataSourceH): cstring {.stdcall,
    importc: "OGR_DS_GetName", dynlib: dynlibogr_api.}
proc OGR_DS_GetLayerCount*(a1: OGRDataSourceH): cint {.stdcall,
    importc: "OGR_DS_GetLayerCount", dynlib: dynlibogr_api.}
proc OGR_DS_GetLayer*(a1: OGRDataSourceH; a2: cint): OGRLayerH {.stdcall,
    importc: "OGR_DS_GetLayer", dynlib: dynlibogr_api.}
proc OGR_DS_GetLayerByName*(a1: OGRDataSourceH; a2: cstring): OGRLayerH {.stdcall,
    importc: "OGR_DS_GetLayerByName", dynlib: dynlibogr_api.}
proc OGR_DS_DeleteLayer*(a1: OGRDataSourceH; a2: cint): OGRErr {.stdcall,
    importc: "OGR_DS_DeleteLayer", dynlib: dynlibogr_api.}
proc OGR_DS_GetDriver*(a1: OGRDataSourceH): OGRSFDriverH {.stdcall,
    importc: "OGR_DS_GetDriver", dynlib: dynlibogr_api.}
proc OGR_DS_CreateLayer*(a1: OGRDataSourceH; a2: cstring; a3: OGRSpatialReferenceH;
                        a4: OGRwkbGeometryType; a5: cstringArray): OGRLayerH {.
    stdcall, importc: "OGR_DS_CreateLayer", dynlib: dynlibogr_api.}
proc OGR_DS_CopyLayer*(a1: OGRDataSourceH; a2: OGRLayerH; a3: cstring; a4: cstringArray): OGRLayerH {.
    stdcall, importc: "OGR_DS_CopyLayer", dynlib: dynlibogr_api.}
proc OGR_DS_TestCapability*(a1: OGRDataSourceH; a2: cstring): cint {.stdcall,
    importc: "OGR_DS_TestCapability", dynlib: dynlibogr_api.}
proc OGR_DS_ExecuteSQL*(a1: OGRDataSourceH; a2: cstring; a3: OGRGeometryH; a4: cstring): OGRLayerH {.
    stdcall, importc: "OGR_DS_ExecuteSQL", dynlib: dynlibogr_api.}
proc OGR_DS_ReleaseResultSet*(a1: OGRDataSourceH; a2: OGRLayerH) {.stdcall,
    importc: "OGR_DS_ReleaseResultSet", dynlib: dynlibogr_api.}
proc OGR_DS_Reference*(a1: OGRDataSourceH): cint {.stdcall,
    importc: "OGR_DS_Reference", dynlib: dynlibogr_api.}
proc OGR_DS_Dereference*(a1: OGRDataSourceH): cint {.stdcall,
    importc: "OGR_DS_Dereference", dynlib: dynlibogr_api.}
proc OGR_DS_GetRefCount*(a1: OGRDataSourceH): cint {.stdcall,
    importc: "OGR_DS_GetRefCount", dynlib: dynlibogr_api.}
proc OGR_DS_GetSummaryRefCount*(a1: OGRDataSourceH): cint {.stdcall,
    importc: "OGR_DS_GetSummaryRefCount", dynlib: dynlibogr_api.}
proc OGR_DS_SyncToDisk*(a1: OGRDataSourceH): OGRErr {.stdcall,
    importc: "OGR_DS_SyncToDisk", dynlib: dynlibogr_api.}
proc OGR_DS_GetStyleTable*(a1: OGRDataSourceH): OGRStyleTableH {.stdcall,
    importc: "OGR_DS_GetStyleTable", dynlib: dynlibogr_api.}
proc OGR_DS_SetStyleTableDirectly*(a1: OGRDataSourceH; a2: OGRStyleTableH) {.stdcall,
    importc: "OGR_DS_SetStyleTableDirectly", dynlib: dynlibogr_api.}
proc OGR_DS_SetStyleTable*(a1: OGRDataSourceH; a2: OGRStyleTableH) {.stdcall,
    importc: "OGR_DS_SetStyleTable", dynlib: dynlibogr_api.}
proc OGR_Dr_GetName*(a1: OGRSFDriverH): cstring {.stdcall, importc: "OGR_Dr_GetName",
    dynlib: dynlibogr_api.}
proc OGR_Dr_Open*(a1: OGRSFDriverH; a2: cstring; a3: cint): OGRDataSourceH {.stdcall,
    importc: "OGR_Dr_Open", dynlib: dynlibogr_api.}
proc OGR_Dr_TestCapability*(a1: OGRSFDriverH; a2: cstring): cint {.stdcall,
    importc: "OGR_Dr_TestCapability", dynlib: dynlibogr_api.}
proc OGR_Dr_CreateDataSource*(a1: OGRSFDriverH; a2: cstring; a3: cstringArray): OGRDataSourceH {.
    stdcall, importc: "OGR_Dr_CreateDataSource", dynlib: dynlibogr_api.}
proc OGR_Dr_CopyDataSource*(a1: OGRSFDriverH; a2: OGRDataSourceH; a3: cstring;
                           a4: cstringArray): OGRDataSourceH {.stdcall,
    importc: "OGR_Dr_CopyDataSource", dynlib: dynlibogr_api.}
proc OGR_Dr_DeleteDataSource*(a1: OGRSFDriverH; a2: cstring): OGRErr {.stdcall,
    importc: "OGR_Dr_DeleteDataSource", dynlib: dynlibogr_api.}
proc OGROpen*(a1: cstring; a2: cint; a3: ptr OGRSFDriverH): OGRDataSourceH {.stdcall,
    importc: "OGROpen", dynlib: dynlibogr_api.}
proc OGROpenShared*(a1: cstring; a2: cint; a3: ptr OGRSFDriverH): OGRDataSourceH {.
    stdcall, importc: "OGROpenShared", dynlib: dynlibogr_api.}
proc OGRReleaseDataSource*(a1: OGRDataSourceH): OGRErr {.stdcall,
    importc: "OGRReleaseDataSource", dynlib: dynlibogr_api.}
proc OGRRegisterDriver*(a1: OGRSFDriverH) {.stdcall, importc: "OGRRegisterDriver",
    dynlib: dynlibogr_api.}
proc OGRDeregisterDriver*(a1: OGRSFDriverH) {.stdcall,
    importc: "OGRDeregisterDriver", dynlib: dynlibogr_api.}
proc OGRGetDriverCount*(): cint {.stdcall, importc: "OGRGetDriverCount",
                               dynlib: dynlibogr_api.}