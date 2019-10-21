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