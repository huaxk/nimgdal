
{.passC: "-Id:/sources/nim-gdal/src/include".}
# Overriding stat stat64 stat64 VSIStatBuf tm OGRGeomFieldDefnHS OGRGeomFieldDefnH OGRField OGREnvelope
# Importing d:/sources/nim-gdal/src/include/gdal.h
# Generated at 2019-10-10T17:24:14+08:00
# Command line:
#   C:\Users\hxk\.nimble\pkgs\nimterop-0.1.0\nimterop\toast.exe --preprocess --recurse --includeDirs+=d:/sources/nim-gdal/src/include --pnim --dynlib=dyngdal --symOverride=stat,stat64,stat64,VSIStatBuf,tm,OGRGeomFieldDefnHS,OGRGeomFieldDefnH,OGRField,OGREnvelope --nim:D:\nim-1.0.0\bin\nim.exe --pluginSourcePath=C:\Users\hxk\AppData\Local\Temp\nimterop_2973064977.nim d:/sources/nim-gdal/src/include/gdal.h

{.hint[ConvFromXtoItselfNotNeeded]: off.}

import nimterop/types



# ! @endcond
# *********************************************************************
#  * $Id: cpl_error.h 36675 2016-12-04 11:10:10Z rouault $
#  *
#  * Name:     cpl_error.h
#  * Project:  CPL - Common Portability Library
#  * Purpose:  CPL Error handling
#  * Author:   Daniel Morissette, danmo@videotron.ca
#  *
#  **********************************************************************
#  * Copyright (c) 1998, Daniel Morissette
#  *
#  * Permission is hereby granted, free of charge, to any person obtaining a
#  * copy of this software and associated documentation files (the "Software"),
#  * to deal in the Software without restriction, including without limitation
#  * the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  * and/or sell copies of the Software, and to permit persons to whom the
#  * Software is furnished to do so, subject to the following conditions:
#  *
#  * The above copyright notice and this permission notice shall be included
#  * in all copies or substantial portions of the Software.
#  *
#  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
#  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  * DEALINGS IN THE SOFTWARE.
#  ***************************************************************************
# *****************************************************************************
#  * $Id: cpl_port.h 38517 2017-05-20 11:35:37Z rouault $
#  *
#  * Project:  CPL - Common Portability Library
#  * Author:   Frank Warmerdam, warmerdam@pobox.com
#  * Purpose:  Include file providing low level portability services for CPL.
#  *           This should be the first include file for any CPL based code.
#  *
#  ******************************************************************************
#  * Copyright (c) 1998, 2005, Frank Warmerdam <warmerdam@pobox.com>
#  * Copyright (c) 2008-2013, Even Rouault <even dot rouault at mines-paris dot org>
#  *
#  * Permission is hereby granted, free of charge, to any person obtaining a
#  * copy of this software and associated documentation files (the "Software"),
#  * to deal in the Software without restriction, including without limitation
#  * the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  * and/or sell copies of the Software, and to permit persons to whom the
#  * Software is furnished to do so, subject to the following conditions:
#  *
#  * The above copyright notice and this permission notice shall be included
#  * in all copies or substantial portions of the Software.
#  *
#  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
#  * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  * DEALINGS IN THE SOFTWARE.
#  ***************************************************************************
# =====================================================================
#                    Error handling functions (cpl_error.c)
#  =====================================================================
# *
#  * \file cpl_error.h
#  *
#  * CPL error handling services.
# 
# * Error category
defineEnum(CPLErr)

# * Range status
defineEnum(VSIRangeStatus)

# * Access mode of a virtual memory mapping.
defineEnum(CPLVirtualMemAccessMode)

# *********************************************************************
#  * $Id: cpl_minixml.h 35921 2016-10-25 02:28:29Z goatbar $
#  *
#  * Project:  CPL - Common Portability Library
#  * Purpose:  Declarations for MiniXML Handler.
#  * Author:   Frank Warmerdam, warmerdam@pobox.com
#  *
#  **********************************************************************
#  * Copyright (c) 2001, Frank Warmerdam
#  *
#  * Permission is hereby granted, free of charge, to any person obtaining a
#  * copy of this software and associated documentation files (the "Software"),
#  * to deal in the Software without restriction, including without limitation
#  * the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  * and/or sell copies of the Software, and to permit persons to whom the
#  * Software is furnished to do so, subject to the following conditions:
#  *
#  * The above copyright notice and this permission notice shall be included
#  * in all copies or substantial portions of the Software.
#  *
#  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
#  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  * DEALINGS IN THE SOFTWARE.
#  ***************************************************************************
# *****************************************************************************
#  * $Id: cpl_port.h 38517 2017-05-20 11:35:37Z rouault $
#  *
#  * Project:  CPL - Common Portability Library
#  * Author:   Frank Warmerdam, warmerdam@pobox.com
#  * Purpose:  Include file providing low level portability services for CPL.
#  *           This should be the first include file for any CPL based code.
#  *
#  ******************************************************************************
#  * Copyright (c) 1998, 2005, Frank Warmerdam <warmerdam@pobox.com>
#  * Copyright (c) 2008-2013, Even Rouault <even dot rouault at mines-paris dot org>
#  *
#  * Permission is hereby granted, free of charge, to any person obtaining a
#  * copy of this software and associated documentation files (the "Software"),
#  * to deal in the Software without restriction, including without limitation
#  * the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  * and/or sell copies of the Software, and to permit persons to whom the
#  * Software is furnished to do so, subject to the following conditions:
#  *
#  * The above copyright notice and this permission notice shall be included
#  * in all copies or substantial portions of the Software.
#  *
#  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
#  * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  * DEALINGS IN THE SOFTWARE.
#  ***************************************************************************
# *
#  * \file cpl_minixml.h
#  *
#  * Definitions for CPL mini XML Parser/Serializer.
# 
# * XML node type
defineEnum(CPLXMLNodeType)

#  --------------------------------------------------------------------
#       ogr_geometry.h related definitions.
#  --------------------------------------------------------------------
# *
#  * List of well known binary geometry types.  These are used within the BLOBs
#  * but are also returned from OGRGeometry::getGeometryType() to identify the
#  * type of a geometry object.
# 
defineEnum(OGRwkbGeometryType)

# *
#  * Output variants of WKB we support.
#  *
#  * 99-402 was a short-lived extension to SFSQL 1.1 that used a high-bit flag
#  * to indicate the presence of Z coordinates in a WKB geometry.
#  *
#  * SQL/MM Part 3 and SFSQL 1.2 use offsets of 1000 (Z), 2000 (M) and 3000 (ZM)
#  * to indicate the present of higher dimensional coordinates in a WKB geometry.
#  * Reference: <a href="https:portal.opengeospatial.org/files/?artifact_id=320243">
#  * 09-009_Committee_Draft_ISOIEC_CD_13249-3_SQLMM_Spatial.pdf</a>,
#  * ISO/IEC JTC 1/SC 32 N 1820, ISO/IEC CD 13249-3:201x(E), Date: 2009-01-16.
#  * The codes are also found in §8.2.3 of <a href="http:portal.opengeospatial.org/files/?artifact_id=25355">
#  * OGC 06-103r4 "OpenGIS® Implementation Standard for Geographic information - Simple feature access - Part 1: Common architecture", v1.2.1</a>
# 
defineEnum(OGRwkbVariant)

# * Enumeration to describe byte order
defineEnum(OGRwkbByteOrder)

# * Enable all validation tests (except OGR_F_VAL_ALLOW_DIFFERENT_GEOM_DIM)
#  * Used by OGR_F_Validate().
#  * @since GDAL 2.0
# 
# **********************************************************************
#                   ogr_feature.h related definitions.
# **********************************************************************
# *
#  * List of feature field types.  This list is likely to be extended in the
#  * future ... avoid coding applications based on the assumption that all
#  * field types can be known.
# 
defineEnum(OGRFieldType)

# *
#  * List of field subtypes. A subtype represents a hint, a restriction of the
#  * main type, that is not strictly necessary to consult.
#  * This list is likely to be extended in the
#  * future ... avoid coding applications based on the assumption that all
#  * field types can be known.
#  * Most subtypes only make sense for a restricted set of main types.
#  * @since GDAL 2.0
# 
defineEnum(OGRFieldSubType)

# *
#  * Display justification for field values.
# 
defineEnum(OGRJustification)

#  --------------------------------------------------------------------
#       Constants from ogrsf_frmts.h for capabilities.
#  --------------------------------------------------------------------
#  --------------------------------------------------------------------
#       Layer metadata items.
#  --------------------------------------------------------------------
# * Capability set to YES as metadata on a layer that has features with
#   * 64 bit identifiers.
#   @since GDAL 2.0
# 
# **********************************************************************
#                   ogr_featurestyle.h related definitions.
# **********************************************************************
# *
#  * OGRStyleTool derived class types (returned by GetType()).
# 
defineEnum(ogr_style_tool_class_id)
type OGRSTClassId* = ogr_style_tool_class_id

# *
#  * List of units supported by OGRStyleTools.
# 
defineEnum(ogr_style_tool_units_id)
type OGRSTUnitId* = ogr_style_tool_units_id

# *
#  * List of parameters for use with OGRStylePen.
# 
defineEnum(ogr_style_tool_param_pen_id)
type OGRSTPenParam* = ogr_style_tool_param_pen_id

# *
#  * List of parameters for use with OGRStyleBrush.
# 
defineEnum(ogr_style_tool_param_brush_id)
type OGRSTBrushParam* = ogr_style_tool_param_brush_id

# *
#  * List of parameters for use with OGRStyleSymbol.
# 
defineEnum(ogr_style_tool_param_symbol_id)
type OGRSTSymbolParam* = ogr_style_tool_param_symbol_id

# *
#  * List of parameters for use with OGRStyleLabel.
# 
defineEnum(ogr_style_tool_param_label_id)
type OGRSTLabelParam* = ogr_style_tool_param_label_id

#  --------------------------------------------------------------------
#       Significant constants.
#  --------------------------------------------------------------------
# ! Pixel data types
defineEnum(GDALDataType)

# *
# * status of the asynchronous stream
# 
defineEnum(GDALAsyncStatusType)

# ! Flag indicating read/write, or read-only access to data.
defineEnum(GDALAccess)

# ! Read/Write flag for RasterIO() method
defineEnum(GDALRWFlag)

#  NOTE: values are selected to be consistent with GDALResampleAlg of alg/gdalwarper.h
# * RasterIO() resampling method.
#   * @since GDAL 2.0
# 
defineEnum(GDALRIOResampleAlg)

# * Macro to initialize an instance of GDALRasterIOExtraArg structure.
#   * @since GDAL 2.0
# 
# ! Types of color interpretation for raster bands.
defineEnum(GDALColorInterp)

# ! Types of color interpretations for a GDALColorTable.
defineEnum(GDALPaletteInterp)

#  ====================================================================
#       Raster Attribute Table
#  ====================================================================
# * Field type of raster attribute table
defineEnum(GDALRATFieldType)

# * Field usage of raster attribute table
defineEnum(GDALRATFieldUsage)

# *! Enumeration to describe the tile organization
defineEnum(GDALTileOrganization)

const

# *****************************************************************************
#  * $Id: gdal.h 39834 2017-08-16 12:20:23Z rouault $
#  *
#  * Project:  GDAL Core
#  * Purpose:  GDAL Core C/Public declarations.
#  * Author:   Frank Warmerdam, warmerdam@pobox.com
#  *
#  ******************************************************************************
#  * Copyright (c) 1998, 2002 Frank Warmerdam
#  * Copyright (c) 2007-2014, Even Rouault <even dot rouault at mines-paris dot org>
#  *
#  * Permission is hereby granted, free of charge, to any person obtaining a
#  * copy of this software and associated documentation files (the "Software"),
#  * to deal in the Software without restriction, including without limitation
#  * the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  * and/or sell copies of the Software, and to permit persons to whom the
#  * Software is furnished to do so, subject to the following conditions:
#  *
#  * The above copyright notice and this permission notice shall be included
#  * in all copies or substantial portions of the Software.
#  *
#  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
#  * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  * DEALINGS IN THE SOFTWARE.
#  ***************************************************************************
# *
#  * \file gdal.h
#  *
#  * Public (C callable) GDAL entry points.
# 
#  $Id: gdal_version.h 41865 2018-03-19 12:04:41Z rouault $
#  --------------------------------------------------------------------
#       GDAL Version Information.
#  --------------------------------------------------------------------
  GDAL_VERSION_MAJOR* = 2
  GDAL_VERSION_MINOR* = 2
  GDAL_VERSION_REV* = 4
  GDAL_VERSION_BUILD* = 0

#  GDAL_COMPUTE_VERSION macro introduced in GDAL 1.10
#  Must be used ONLY to compare with version numbers for GDAL >= 1.10
#  Note: the formula to compute GDAL_VERSION_NUM has changed in GDAL 1.10
  GDAL_RELEASE_DATE* = 20180319

# *****************************************************************************
#  * $Id: cpl_port.h 38517 2017-05-20 11:35:37Z rouault $
#  *
#  * Project:  CPL - Common Portability Library
#  * Author:   Frank Warmerdam, warmerdam@pobox.com
#  * Purpose:  Include file providing low level portability services for CPL.
#  *           This should be the first include file for any CPL based code.
#  *
#  ******************************************************************************
#  * Copyright (c) 1998, 2005, Frank Warmerdam <warmerdam@pobox.com>
#  * Copyright (c) 2008-2013, Even Rouault <even dot rouault at mines-paris dot org>
#  *
#  * Permission is hereby granted, free of charge, to any person obtaining a
#  * copy of this software and associated documentation files (the "Software"),
#  * to deal in the Software without restriction, including without limitation
#  * the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  * and/or sell copies of the Software, and to permit persons to whom the
#  * Software is furnished to do so, subject to the following conditions:
#  *
#  * The above copyright notice and this permission notice shall be included
#  * in all copies or substantial portions of the Software.
#  *
#  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
#  * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  * DEALINGS IN THE SOFTWARE.
#  ***************************************************************************
# *
#  * \file cpl_port.h
#  *
#  * Core portability definitions for CPL.
#  *
# 
#  ====================================================================
#       We will use WIN32 as a standard windows define.
#  ====================================================================
#  --------------------------------------------------------------------
#       The following apparently allow you to use strcpy() and other
#       functions judged "unsafe" by microsoft in VS 8 (2005).
#  --------------------------------------------------------------------
#  We define this here in general so that a VC++ build will publicly
#    declare STDCALL interfaces even if an application is built against it
#    using MinGW
#  Define if you don't have vprintf but do have _doprnt.
#  Define if you have the vprintf function.
  HAVE_VPRINTF* = 1
  HAVE_VSNPRINTF* = 1
  HAVE_SNPRINTF* = 1
  HAVE_GETCWD* = 1

#  gmt_notunix.h from GMT project also redefines getcwd. See #3138
#  Define if you have the ANSI C header files.
  STDC_HEADERS* = 1

#  Define to 1 if you have the <assert.h> header file.
  HAVE_ASSERT_H* = 1

#  Define to 1 if you have the <fcntl.h> header file.
  HAVE_FCNTL_H* = 1

#  Define if you have the <unistd.h> header file.
#  Define if you have the <stdint.h> header file.
#  Define to 1 if you have the <sys/types.h> header file.
  HAVE_SYS_TYPES_H* = 1

#  Define to 1 if you have the <locale.h> header file.
  HAVE_LOCALE_H* = 1
  HAVE_FLOAT_H* = 1
  HAVE_ERRNO_H* = 1
  HAVE_SEARCH_H* = 1

#  Define to 1 if you have the <direct.h> header file.
#  Define to 1 if you have the `localtime_r' function.
#  The size of a `int', as computed by sizeof.
  SIZEOF_INT* = 4

#  The size of a `long', as computed by sizeof.
  SIZEOF_LONG* = 4

#  The size of a `unsigned long', as computed by sizeof.
  SIZEOF_UNSIGNED_LONG* = 4

#  The size of `void*', as computed by sizeof.
  SIZEOF_VOIDP* = 8

#  Set the native cpu bit order
#  Define as 0 or 1 according to the floating point format supported by the
#    machine
  HAVE_IEEEFP* = 1

#  Define to `__inline__' or `__inline' if that's what the C compiler
#    calls it, or to nothing if 'inline' is not supported under any name.
#  VC6 doesn't known intptr_t
#  #define CPL_DISABLE_DLL
#  ====================================================================
#       A few sanity checks, mainly to detect problems that sometimes
#       arise with bad configured cross-compilation.
#  ====================================================================
#  ====================================================================
#       This will disable most WIN32 stuff in a Cygnus build which
#       defines unix to 1.
#  ====================================================================
# ! @cond Doxygen_Suppress
#  ====================================================================
#       If iconv() is available use extended recoding module.
#       Stub implementation is always compiled in, because it works
#       faster than iconv() for encodings it supports.
#  ====================================================================
# ! @endcond
#  ====================================================================
#       MinGW stuff
#  ====================================================================
#  We need __MSVCRT_VERSION__ >= 0x0700 to have "_aligned_malloc"
#  Latest versions of mingw32 define it, but with older ones,
#  we need to define it manually
  MSVCRT_VERSION* = 0x0700

#  Needed for std=c11 on Solaris to have strcasecmp()
#  ====================================================================
#       Standard include files.
#  ====================================================================
#  ====================================================================
#       Base portability stuff ... this stuff may need to be
#       modified for new platforms.
#  ====================================================================
#  --------------------------------------------------------------------
#       Which versions of C++ are available.
#  --------------------------------------------------------------------
  HAVE_CXX11* = 1

# * Printf formatting for GIntBig
# * Printf formatting for GUIntBig
# ! @cond Doxygen_Suppress
#  Workaround VC6 bug
# ! @endcond
# ! @cond Doxygen_Suppress
# ! @endcond
#  ====================================================================
#       Other standard services.
#  ====================================================================
# * Macro to start a block of C symbols
# * Macro to end a block of C symbols
# ! @cond Doxygen_Suppress
#  Should optional (normally private) interfaces be exported?
# ! @endcond
# ! @cond Doxygen_Suppress
# ! @endcond
# ! @cond Doxygen_Suppress
#  TODO : support for other compilers needed
# ! @endcond
# ! @cond Doxygen_Suppress
#  Define NULL_AS_NULLPTR together with -std=c++11 -Wzero-as-null-pointer-constant with GCC
#  to detect misuses of NULL
# ! @endcond
# * Macro to compute the minimum of 2 values
# * Macro to compute the maximum of 2 values
# * Macro to compute the absolute value
#  --------------------------------------------------------------------
#       Macro to test equality of two floating point values.
#       We use fabs() function instead of ABS() macro to avoid side
#       effects.
#  --------------------------------------------------------------------
# ! @cond Doxygen_Suppress
# ! @endcond
#  --------------------------------------------------------------------
#       Provide macros for case insensitive string comparisons.
#  --------------------------------------------------------------------
# * Alias for strncasecmp() == 0
# * Alias for strcasecmp() == 0
# ---------------------------------------------------------------------
#  * Does a string "a" start with string "b".  Search is case-sensitive or,
#  * with CI, it is a case-insensitive comparison.
#  *---------------------------------------------------------------------
# * Returns whether a starts with b
# * Returns whether a starts with b (case insensitive comparison)
# ! @cond Doxygen_Suppress
# ! @endcond
#  --------------------------------------------------------------------
#       Handle isnan() and isinf().  Note that isinf() and isnan()
#       are supposed to be macros according to C99, defined in math.h
#       Some systems (i.e. Tru64) don't have isinf() at all, so if
#       the macro is not defined we just assume nothing is infinite.
#       This may mean we have no real CPLIsInf() on systems with isinf()
#       function but no corresponding macro, but I can live with
#       that since it isn't that important a test.
#  --------------------------------------------------------------------
# * Byte-swap a 64 bit pointer
# * Return a 16bit word from a originally LSB ordered word
# * Return a 16bit word from a originally MSB ordered word
# * Return a 32bit word from a originally LSB ordered word
# * Return a 32bit word from a originally MSB ordered word
# * Byte-swap if necessary a 16bit word at the location pointed from a originally LSB ordered pointer
# * Byte-swap if necessary a 16bit word at the location pointed from a originally MSB ordered pointer
# * Byte-swap if necessary a 32bit word at the location pointed from a originally LSB ordered pointer
# * Byte-swap if necessary a 32bit word at the location pointed from a originally MSB ordered pointer
# * Byte-swap if necessary a 64bit word at the location pointed from a originally LSB ordered pointer
# * Byte-swap if necessary a 64bit word at the location pointed from a originally MSB ordered pointer
# * Return a Int16 from the 2 bytes ordered in LSB order at address x.
#  * @deprecated Use rather CPL_LSBSINT16PTR or CPL_LSBUINT16PTR for explicit
#  * signedness.
# * Return a Int32 from the 4 bytes ordered in LSB order at address x.
#  * @deprecated Use rather CPL_LSBSINT32PTR or CPL_LSBUINT32PTR for explicit
#  * signedness.
# * Return a signed Int16 from the 2 bytes ordered in LSB order at address x
# * Return a unsigned Int16 from the 2 bytes ordered in LSB order at address x
# * Return a signed Int32 from the 4 bytes ordered in LSB order at address x
# * Return a unsigned Int32 from the 4 bytes ordered in LSB order at address x
# ! @cond Doxygen_Suppress
#  Utility macro to explicitly mark intentionally unreferenced parameters.
# ! @endcond
# **********************************************************************
#  * Define CPL_CVSID() macro.  It can be disabled during a build by
#  * defining DISABLE_CVSID in the compiler options.
#  *
#  * The cvsid_aw() function is just there to prevent reports of cpl_cvsid()
#  * being unused.
# 
# ! @cond Doxygen_Suppress
# ! @endcond
#  We exclude mingw64 4.6 which seems to be broken regarding this
# * Null terminated variadic
# * Tag a function to have printf() formatting
# * Tag a function to have scanf() formatting
# * Macro into which to wrap the format argument of a printf-like function
# * Macro into which to wrap the format argument of a sscanf-like function.
# * Qualifier to warn when the return value of a function is not used
# * Qualifier for an argument that is unused
# * Qualifier for a function that does not return at all (terminates the process)
# ! @cond Doxygen_Suppress
#  Clang __has_attribute
# ! @endcond
# * Qualifier for a function that does not return NULL
# * restrict keyword to declare that pointers do not alias
# * To be used in public headers only. For non-public headers or .cpp files,
#  * use override directly.
# * C++11 final qualifier
# * Helper to remove the copy and assignment constructors so that the compiler
#    will not generate the default versions.
#    Must be placed in the private section of a class and should be at the end.
# 
# * Returns the size of C style arrays.
#  extern "C++"
# * Macro for fallthrough in a switch case construct
# ! @cond Doxygen_Suppress
#  Define DEBUG_BOOL to compile in "MSVC mode", ie error out when
#  a integer is assigned to a bool
#  WARNING: use only at compilation time, since it is know to not work
#   at runtime for unknown reasons (crash in MongoDB driver for example)
  FALSE* = 0
  TRUE* = 1
  CE_None* = (0).CPLErr
  CE_Debug* = (1).CPLErr
  CE_Warning* = (2).CPLErr
  CE_Failure* = (3).CPLErr
  CE_Fatal* = (4).CPLErr

# * No error
  CPLE_None* = 0

# * Application defined error
  CPLE_AppDefined* = 1

# * Out of memory error
  CPLE_OutOfMemory* = 2

# * File I/O error
  CPLE_FileIO* = 3

# * Open failed
  CPLE_OpenFailed* = 4

# * Illegal argument
  CPLE_IllegalArg* = 5

# * Not supported
  CPLE_NotSupported* = 6

# * Assertion failed
  CPLE_AssertionFailed* = 7

# * No write access
  CPLE_NoWriteAccess* = 8

# * User interrupted
  CPLE_UserInterrupt* = 9

# * NULL object
  CPLE_ObjectNull* = 10

# 
#  * Filesystem-specific errors
# 
# * HTTP response
  CPLE_HttpResponse* = 11

# * AWSBucketNotFound
  CPLE_AWSBucketNotFound* = 12

# * AWSObjectNotFound
  CPLE_AWSObjectNotFound* = 13

# * AWSAccessDenied
  CPLE_AWSAccessDenied* = 14

# * AWSInvalidCredentials
  CPLE_AWSInvalidCredentials* = 15

# * AWSSignatureDoesNotMatch
  CPLE_AWSSignatureDoesNotMatch* = 16
  VSI_RANGE_STATUS_UNKNOWN* = 0.VSIRangeStatus
  VSI_RANGE_STATUS_DATA* = 1.VSIRangeStatus
  VSI_RANGE_STATUS_HOLE* = 2.VSIRangeStatus

# * Flag provided to VSIStatExL() to test if the file exists
  VSI_STAT_EXISTS_FLAG* = 0x1

# * Flag provided to VSIStatExL() to query the nature (file/dir) of the file
  VSI_STAT_NATURE_FLAG* = 0x2

# * Flag provided to VSIStatExL() to query the file size
  VSI_STAT_SIZE_FLAG* = 0x4

# * Flag provided to VSIStatExL() to issue a VSIError in case of failure
  VSI_STAT_SET_ERROR_FLAG* = 0x8
  VIRTUALMEM_READONLY* = 0.CPLVirtualMemAccessMode
  VIRTUALMEM_READONLY_ENFORCED* = 1.CPLVirtualMemAccessMode
  VIRTUALMEM_READWRITE* = 2.CPLVirtualMemAccessMode
  CXT_Element* = (0).CPLXMLNodeType
  CXT_Text* = (1).CPLXMLNodeType
  CXT_Attribute* = (2).CPLXMLNodeType
  CXT_Comment* = (3).CPLXMLNodeType
  CXT_Literal* = (4).CPLXMLNodeType
  OGRERR_NONE* = 0
  OGRERR_NOT_ENOUGH_DATA* = 1
  OGRERR_NOT_ENOUGH_MEMORY* = 2
  OGRERR_UNSUPPORTED_GEOMETRY_TYPE* = 3
  OGRERR_UNSUPPORTED_OPERATION* = 4
  OGRERR_CORRUPT_DATA* = 5
  OGRERR_FAILURE* = 6
  OGRERR_UNSUPPORTED_SRS* = 7
  OGRERR_INVALID_HANDLE* = 8
  OGRERR_NON_EXISTING_FEATURE* = 9
  wkbUnknown* = (0).OGRwkbGeometryType
  wkbPoint* = (1).OGRwkbGeometryType
  wkbLineString* = (2).OGRwkbGeometryType
  wkbPolygon* = (3).OGRwkbGeometryType
  wkbMultiPoint* = (4).OGRwkbGeometryType
  wkbMultiLineString* = (5).OGRwkbGeometryType
  wkbMultiPolygon* = (6).OGRwkbGeometryType
  wkbGeometryCollection* = (7).OGRwkbGeometryType
  wkbCircularString* = (8).OGRwkbGeometryType
  wkbCompoundCurve* = (9).OGRwkbGeometryType
  wkbCurvePolygon* = (10).OGRwkbGeometryType
  wkbMultiCurve* = (11).OGRwkbGeometryType
  wkbMultiSurface* = (12).OGRwkbGeometryType
  wkbCurve* = (13).OGRwkbGeometryType
  wkbSurface* = (14).OGRwkbGeometryType
  wkbPolyhedralSurface* = (15).OGRwkbGeometryType
  wkbTIN* = (16).OGRwkbGeometryType
  wkbTriangle* = (17).OGRwkbGeometryType
  wkbNone* = (100).OGRwkbGeometryType
  wkbLinearRing* = (101).OGRwkbGeometryType
  wkbCircularStringZ* = (1008).OGRwkbGeometryType
  wkbCompoundCurveZ* = (1009).OGRwkbGeometryType
  wkbCurvePolygonZ* = (1010).OGRwkbGeometryType
  wkbMultiCurveZ* = (1011).OGRwkbGeometryType
  wkbMultiSurfaceZ* = (1012).OGRwkbGeometryType
  wkbCurveZ* = (1013).OGRwkbGeometryType
  wkbSurfaceZ* = (1014).OGRwkbGeometryType
  wkbPolyhedralSurfaceZ* = (1015).OGRwkbGeometryType
  wkbTINZ* = (1016).OGRwkbGeometryType
  wkbTriangleZ* = (1017).OGRwkbGeometryType
  wkbPointM* = (2001).OGRwkbGeometryType
  wkbLineStringM* = (2002).OGRwkbGeometryType
  wkbPolygonM* = (2003).OGRwkbGeometryType
  wkbMultiPointM* = (2004).OGRwkbGeometryType
  wkbMultiLineStringM* = (2005).OGRwkbGeometryType
  wkbMultiPolygonM* = (2006).OGRwkbGeometryType
  wkbGeometryCollectionM* = (2007).OGRwkbGeometryType
  wkbCircularStringM* = (2008).OGRwkbGeometryType
  wkbCompoundCurveM* = (2009).OGRwkbGeometryType
  wkbCurvePolygonM* = (2010).OGRwkbGeometryType
  wkbMultiCurveM* = (2011).OGRwkbGeometryType
  wkbMultiSurfaceM* = (2012).OGRwkbGeometryType
  wkbCurveM* = (2013).OGRwkbGeometryType
  wkbSurfaceM* = (2014).OGRwkbGeometryType
  wkbPolyhedralSurfaceM* = (2015).OGRwkbGeometryType
  wkbTINM* = (2016).OGRwkbGeometryType
  wkbTriangleM* = (2017).OGRwkbGeometryType
  wkbPointZM* = (3001).OGRwkbGeometryType
  wkbLineStringZM* = (3002).OGRwkbGeometryType
  wkbPolygonZM* = (3003).OGRwkbGeometryType
  wkbMultiPointZM* = (3004).OGRwkbGeometryType
  wkbMultiLineStringZM* = (3005).OGRwkbGeometryType
  wkbMultiPolygonZM* = (3006).OGRwkbGeometryType
  wkbGeometryCollectionZM* = (3007).OGRwkbGeometryType
  wkbCircularStringZM* = (3008).OGRwkbGeometryType
  wkbCompoundCurveZM* = (3009).OGRwkbGeometryType
  wkbCurvePolygonZM* = (3010).OGRwkbGeometryType
  wkbMultiCurveZM* = (3011).OGRwkbGeometryType
  wkbMultiSurfaceZM* = (3012).OGRwkbGeometryType
  wkbCurveZM* = (3013).OGRwkbGeometryType
  wkbSurfaceZM* = (3014).OGRwkbGeometryType
  wkbPolyhedralSurfaceZM* = (3015).OGRwkbGeometryType
  wkbTINZM* = (3016).OGRwkbGeometryType
  wkbTriangleZM* = (3017).OGRwkbGeometryType
  wkbPoint25D* = (0x80000001).OGRwkbGeometryType
  wkbLineString25D* = (0x80000002).OGRwkbGeometryType
  wkbPolygon25D* = (0x80000003).OGRwkbGeometryType
  wkbMultiPoint25D* = (0x80000004).OGRwkbGeometryType
  wkbMultiLineString25D* = (0x80000005).OGRwkbGeometryType
  wkbMultiPolygon25D* = (0x80000006).OGRwkbGeometryType
  wkbGeometryCollection25D* = (0x80000007).OGRwkbGeometryType
  wkbVariantOldOgc* = 0.OGRwkbVariant
  wkbVariantIso* = 1.OGRwkbVariant
  wkbVariantPostGIS1* = 2.OGRwkbVariant

# * @deprecated in GDAL 2.0. Use wkbHasZ() or wkbSetZ() instead
  wkb25DBit* = 0x80000000

# * Return the 2D geometry type corresponding to the specified geometry type
# * Return if the geometry type is a 3D geometry type
#   * @since GDAL 2.0
# 
# * Return the 3D geometry type corresponding to the specified geometry type.
#   * @since GDAL 2.0
# 
# * Return if the geometry type is a measured geometry type
#   * @since GDAL 2.1
# 
# * Return the measured geometry type corresponding to the specified geometry type.
#   * @since GDAL 2.1
# 
  ogrZMarker* = 0x21125711
  wkbXDR* = (0).OGRwkbByteOrder
  wkbNDR* = (1).OGRwkbByteOrder

# * Alter field name.
#  * Used by OGR_L_AlterFieldDefn().
# 
  ALTER_NAME_FLAG* = 0x1

# * Alter field type.
#  * Used by OGR_L_AlterFieldDefn().
# 
  ALTER_TYPE_FLAG* = 0x2

# * Alter field width and precision.
#  * Used by OGR_L_AlterFieldDefn().
# 
  ALTER_WIDTH_PRECISION_FLAG* = 0x4

# * Alter field NOT NULL constraint.
#  * Used by OGR_L_AlterFieldDefn().
#  * @since GDAL 2.0
# 
  ALTER_NULLABLE_FLAG* = 0x8

# * Alter field DEFAULT value.
#  * Used by OGR_L_AlterFieldDefn().
#  * @since GDAL 2.0
# 
  ALTER_DEFAULT_FLAG* = 0x10

# * Alter all parameters of field definition.
#  * Used by OGR_L_AlterFieldDefn().
# 
# * Validate that fields respect not-null constraints.
#  * Used by OGR_F_Validate().
#  * @since GDAL 2.0
# 
  OGR_F_VAL_NULL* = 0x00000001

# * Validate that geometries respect geometry column type.
#  * Used by OGR_F_Validate().
#  * @since GDAL 2.0
# 
  OGR_F_VAL_GEOM_TYPE* = 0x00000002

# * Validate that (string) fields respect field width.
#  * Used by OGR_F_Validate().
#  * @since GDAL 2.0
# 
  OGR_F_VAL_WIDTH* = 0x00000004

# * Allow fields that are null when there's an associated default value.
#  * This can be used for drivers where the low-level layers will automatically set the
#  * field value to the associated default value.
#  * This flag only makes sense if OGR_F_VAL_NULL is set too.
#  * Used by OGR_F_Validate().
#  * @since GDAL 2.0
# 
  OGR_F_VAL_ALLOW_NULL_WHEN_DEFAULT* = 0x00000008

# * Allow geometry fields to have a different coordinate dimension that their
#  * geometry column type.
#  * This flag only makes sense if OGR_F_VAL_GEOM_TYPE is set too.
#  * Used by OGR_F_Validate().
#  * @since GDAL 2.1
# 
  OGR_F_VAL_ALLOW_DIFFERENT_GEOM_DIM* = 0x00000010
  OFTInteger* = (0).OGRFieldType
  OFTIntegerList* = (1).OGRFieldType
  OFTReal* = (2).OGRFieldType
  OFTRealList* = (3).OGRFieldType
  OFTString* = (4).OGRFieldType
  OFTStringList* = (5).OGRFieldType
  OFTWideString* = (6).OGRFieldType
  OFTWideStringList* = (7).OGRFieldType
  OFTBinary* = (8).OGRFieldType
  OFTDate* = (9).OGRFieldType
  OFTTime* = (10).OGRFieldType
  OFTDateTime* = (11).OGRFieldType
  OFTInteger64* = (12).OGRFieldType
  OFTInteger64List* = (13).OGRFieldType
  OFTMaxType* = (13).OGRFieldType
  OFSTNone* = (0).OGRFieldSubType
  OFSTBoolean* = (1).OGRFieldSubType
  OFSTInt16* = (2).OGRFieldSubType
  OFSTFloat32* = (3).OGRFieldSubType
  OFSTMaxSubType* = (3).OGRFieldSubType
  OJUndefined* = (0).OGRJustification
  OJLeft* = (1).OGRJustification
  OJRight* = (2).OGRJustification

# * Special value for a unset FID
  OGRNullFID* = -1

# * Special value set in OGRField.Set.nMarker1, nMarker2 and nMarker3 for
#  *  a unset field.
#  *  Direct use of this value is strongly discouraged.
#  *  Use OGR_RawField_SetUnset() or OGR_RawField_IsUnset() instead.
# 
  OGRUnsetMarker* = -21121

# * Special value set in OGRField.Set.nMarker1, nMarker2 and nMarker3 for
#  *  a null field.
#  *  Direct use of this value is strongly discouraged.
#  *  Use OGR_RawField_SetNull() or OGR_RawField_IsNull() instead.
#  *  @since GDAL 2.2
# 
  OGRNullMarker* = -21122
  OGRSTCNone* = (0).ogr_style_tool_class_id
  OGRSTCPen* = (1).ogr_style_tool_class_id
  OGRSTCBrush* = (2).ogr_style_tool_class_id
  OGRSTCSymbol* = (3).ogr_style_tool_class_id
  OGRSTCLabel* = (4).ogr_style_tool_class_id
  OGRSTCVector* = (5).ogr_style_tool_class_id
  OGRSTUGround* = (0).ogr_style_tool_units_id
  OGRSTUPixel* = (1).ogr_style_tool_units_id
  OGRSTUPoints* = (2).ogr_style_tool_units_id
  OGRSTUMM* = (3).ogr_style_tool_units_id
  OGRSTUCM* = (4).ogr_style_tool_units_id
  OGRSTUInches* = (5).ogr_style_tool_units_id
  OGRSTPenColor* = (0).ogr_style_tool_param_pen_id
  OGRSTPenWidth* = (1).ogr_style_tool_param_pen_id
  OGRSTPenPattern* = (2).ogr_style_tool_param_pen_id
  OGRSTPenId* = (3).ogr_style_tool_param_pen_id
  OGRSTPenPerOffset* = (4).ogr_style_tool_param_pen_id
  OGRSTPenCap* = (5).ogr_style_tool_param_pen_id
  OGRSTPenJoin* = (6).ogr_style_tool_param_pen_id
  OGRSTPenPriority* = (7).ogr_style_tool_param_pen_id
  OGRSTPenLast* = (8).ogr_style_tool_param_pen_id
  OGRSTBrushFColor* = (0).ogr_style_tool_param_brush_id
  OGRSTBrushBColor* = (1).ogr_style_tool_param_brush_id
  OGRSTBrushId* = (2).ogr_style_tool_param_brush_id
  OGRSTBrushAngle* = (3).ogr_style_tool_param_brush_id
  OGRSTBrushSize* = (4).ogr_style_tool_param_brush_id
  OGRSTBrushDx* = (5).ogr_style_tool_param_brush_id
  OGRSTBrushDy* = (6).ogr_style_tool_param_brush_id
  OGRSTBrushPriority* = (7).ogr_style_tool_param_brush_id
  OGRSTBrushLast* = (8).ogr_style_tool_param_brush_id
  OGRSTSymbolId* = (0).ogr_style_tool_param_symbol_id
  OGRSTSymbolAngle* = (1).ogr_style_tool_param_symbol_id
  OGRSTSymbolColor* = (2).ogr_style_tool_param_symbol_id
  OGRSTSymbolSize* = (3).ogr_style_tool_param_symbol_id
  OGRSTSymbolDx* = (4).ogr_style_tool_param_symbol_id
  OGRSTSymbolDy* = (5).ogr_style_tool_param_symbol_id
  OGRSTSymbolStep* = (6).ogr_style_tool_param_symbol_id
  OGRSTSymbolPerp* = (7).ogr_style_tool_param_symbol_id
  OGRSTSymbolOffset* = (8).ogr_style_tool_param_symbol_id
  OGRSTSymbolPriority* = (9).ogr_style_tool_param_symbol_id
  OGRSTSymbolFontName* = (10).ogr_style_tool_param_symbol_id
  OGRSTSymbolOColor* = (11).ogr_style_tool_param_symbol_id
  OGRSTSymbolLast* = (12).ogr_style_tool_param_symbol_id
  OGRSTLabelFontName* = (0).ogr_style_tool_param_label_id
  OGRSTLabelSize* = (1).ogr_style_tool_param_label_id
  OGRSTLabelTextString* = (2).ogr_style_tool_param_label_id
  OGRSTLabelAngle* = (3).ogr_style_tool_param_label_id
  OGRSTLabelFColor* = (4).ogr_style_tool_param_label_id
  OGRSTLabelBColor* = (5).ogr_style_tool_param_label_id
  OGRSTLabelPlacement* = (6).ogr_style_tool_param_label_id
  OGRSTLabelAnchor* = (7).ogr_style_tool_param_label_id
  OGRSTLabelDx* = (8).ogr_style_tool_param_label_id
  OGRSTLabelDy* = (9).ogr_style_tool_param_label_id
  OGRSTLabelPerp* = (10).ogr_style_tool_param_label_id
  OGRSTLabelBold* = (11).ogr_style_tool_param_label_id
  OGRSTLabelItalic* = (12).ogr_style_tool_param_label_id
  OGRSTLabelUnderline* = (13).ogr_style_tool_param_label_id
  OGRSTLabelPriority* = (14).ogr_style_tool_param_label_id
  OGRSTLabelStrikeout* = (15).ogr_style_tool_param_label_id
  OGRSTLabelStretch* = (16).ogr_style_tool_param_label_id
  OGRSTLabelAdjHor* = (17).ogr_style_tool_param_label_id
  OGRSTLabelAdjVert* = (18).ogr_style_tool_param_label_id
  OGRSTLabelHColor* = (19).ogr_style_tool_param_label_id
  OGRSTLabelOColor* = (20).ogr_style_tool_param_label_id
  OGRSTLabelLast* = (21).ogr_style_tool_param_label_id
  GDT_Unknown* = (0).GDALDataType
  GDT_Byte* = (1).GDALDataType
  GDT_UInt16* = (2).GDALDataType
  GDT_Int16* = (3).GDALDataType
  GDT_UInt32* = (4).GDALDataType
  GDT_Int32* = (5).GDALDataType
  GDT_Float32* = (6).GDALDataType
  GDT_Float64* = (7).GDALDataType
  GDT_CInt16* = (8).GDALDataType
  GDT_CInt32* = (9).GDALDataType
  GDT_CFloat32* = (10).GDALDataType
  GDT_CFloat64* = (11).GDALDataType
  GDT_TypeCount* = (12).GDALDataType
  GARIO_PENDING* = (0).GDALAsyncStatusType
  GARIO_UPDATE* = (1).GDALAsyncStatusType
  GARIO_ERROR* = (2).GDALAsyncStatusType
  GARIO_COMPLETE* = (3).GDALAsyncStatusType
  GARIO_TypeCount* = (4).GDALAsyncStatusType
  GA_ReadOnly* = (0).GDALAccess
  GA_Update* = (1).GDALAccess
  GF_Read* = (0).GDALRWFlag
  GF_Write* = (1).GDALRWFlag
  GRIORA_NearestNeighbour* = (0).GDALRIOResampleAlg
  GRIORA_Bilinear* = (1).GDALRIOResampleAlg
  GRIORA_Cubic* = (2).GDALRIOResampleAlg
  GRIORA_CubicSpline* = (3).GDALRIOResampleAlg
  GRIORA_Lanczos* = (4).GDALRIOResampleAlg
  GRIORA_Average* = (5).GDALRIOResampleAlg
  GRIORA_Mode* = (6).GDALRIOResampleAlg
  GRIORA_Gauss* = (7).GDALRIOResampleAlg
  RASTERIO_EXTRA_ARG_CURRENT_VERSION* = 1
  GCI_Undefined* = (0).GDALColorInterp
  GCI_GrayIndex* = (1).GDALColorInterp
  GCI_PaletteIndex* = (2).GDALColorInterp
  GCI_RedBand* = (3).GDALColorInterp
  GCI_GreenBand* = (4).GDALColorInterp
  GCI_BlueBand* = (5).GDALColorInterp
  GCI_AlphaBand* = (6).GDALColorInterp
  GCI_HueBand* = (7).GDALColorInterp
  GCI_SaturationBand* = (8).GDALColorInterp
  GCI_LightnessBand* = (9).GDALColorInterp
  GCI_CyanBand* = (10).GDALColorInterp
  GCI_MagentaBand* = (11).GDALColorInterp
  GCI_YellowBand* = (12).GDALColorInterp
  GCI_BlackBand* = (13).GDALColorInterp
  GCI_YCbCr_YBand* = (14).GDALColorInterp
  GCI_YCbCr_CbBand* = (15).GDALColorInterp
  GCI_YCbCr_CrBand* = (16).GDALColorInterp
  GCI_Max* = (16).GDALColorInterp
  GPI_Gray* = (0).GDALPaletteInterp
  GPI_RGB* = (1).GDALPaletteInterp
  GPI_CMYK* = (2).GDALPaletteInterp
  GPI_HLS* = (3).GDALPaletteInterp

#  Note: we define GDAL_OF_READONLY and GDAL_OF_UPDATE to be on purpose
#  equals to GA_ReadOnly and GA_Update
# * Open in read-only mode.
#  * Used by GDALOpenEx().
#  * @since GDAL 2.0
# 
  GDAL_OF_READONLY* = 0x00

# * Open in update mode.
#  * Used by GDALOpenEx().
#  * @since GDAL 2.0
# 
  GDAL_OF_UPDATE* = 0x01

# * Allow raster and vector drivers to be used.
#  * Used by GDALOpenEx().
#  * @since GDAL 2.0
# 
  GDAL_OF_ALL* = 0x00

# * Allow raster drivers to be used.
#  * Used by GDALOpenEx().
#  * @since GDAL 2.0
# 
  GDAL_OF_RASTER* = 0x02

# * Allow vector drivers to be used.
#  * Used by GDALOpenEx().
#  * @since GDAL 2.0
# 
  GDAL_OF_VECTOR* = 0x04

# * Allow gnm drivers to be used.
#  * Used by GDALOpenEx().
#  * @since GDAL 2.1
# 
  GDAL_OF_GNM* = 0x08

#  Some space for GDAL 3.0 new types ;-)
# #define     GDAL_OF_OTHER_KIND1   0x08
# #define     GDAL_OF_OTHER_KIND2   0x10
# * Open in shared mode.
#  * Used by GDALOpenEx().
#  * @since GDAL 2.0
# 
  GDAL_OF_SHARED* = 0x20

# * Emit error message in case of failed open.
#  * Used by GDALOpenEx().
#  * @since GDAL 2.0
# 
  GDAL_OF_VERBOSE_ERROR* = 0x40

# * Open as internal dataset. Such dataset isn't registered in the global list
#  * of opened dataset. Cannot be used with GDAL_OF_SHARED.
#  *
#  * Used by GDALOpenEx().
#  * @since GDAL 2.0
# 
  GDAL_OF_INTERNAL* = 0x80

# * Let GDAL decide if a array-based or hashset-based storage strategy for
#  * cached blocks must be used.
#  *
#  * GDAL_OF_DEFAULT_BLOCK_ACCESS, GDAL_OF_ARRAY_BLOCK_ACCESS and
#  * GDAL_OF_HASHSET_BLOCK_ACCESS are mutually exclusive.
#  *
#  * Used by GDALOpenEx().
#  * @since GDAL 2.1
# 
  GDAL_OF_DEFAULT_BLOCK_ACCESS* = 0

# * Use a array-based storage strategy for cached blocks.
#  *
#  * GDAL_OF_DEFAULT_BLOCK_ACCESS, GDAL_OF_ARRAY_BLOCK_ACCESS and
#  * GDAL_OF_HASHSET_BLOCK_ACCESS are mutually exclusive.
#  *
#  * Used by GDALOpenEx().
#  * @since GDAL 2.1
# 
  GDAL_OF_ARRAY_BLOCK_ACCESS* = 0x100

# * Use a hashset-based storage strategy for cached blocks.
#  *
#  * GDAL_OF_DEFAULT_BLOCK_ACCESS, GDAL_OF_ARRAY_BLOCK_ACCESS and
#  * GDAL_OF_HASHSET_BLOCK_ACCESS are mutually exclusive.
#  *
#  * Used by GDALOpenEx().
#  * @since GDAL 2.1
# 
  GDAL_OF_HASHSET_BLOCK_ACCESS* = 0x200

#  Reserved for a potential future alternative to GDAL_OF_ARRAY_BLOCK_ACCESS
#  * and GDAL_OF_HASHSET_BLOCK_ACCESS
  GDAL_OF_RESERVED_1* = 0x300

# * Mask to detect the block access method
  GDAL_OF_BLOCK_ACCESS_MASK* = 0x300

# * Flag returned by GDALGetMaskFlags() to indicate that all pixels are valid
  GMF_ALL_VALID* = 0x01

# * Flag returned by GDALGetMaskFlags() to indicate that the mask band is
#  * valid for all bands
  GMF_PER_DATASET* = 0x02

# * Flag returned by GDALGetMaskFlags() to indicate that the mask band is
#  * an alpha band
  GMF_ALPHA* = 0x04

# * Flag returned by GDALGetMaskFlags() to indicate that the mask band is
#  * computed from nodata values
  GMF_NODATA* = 0x08

# * Flag returned by GDALGetDataCoverageStatus() when the driver does not
#  * implement GetDataCoverageStatus(). This flag should be returned together
#  * with GDAL_DATA_COVERAGE_STATUS_DATA
  GDAL_DATA_COVERAGE_STATUS_UNIMPLEMENTED* = 0x01

# * Flag returned by GDALGetDataCoverageStatus() when there is (potentially)
#  * data in the queried window. Can be combined with the binary or operator
#  * with GDAL_DATA_COVERAGE_STATUS_UNIMPLEMENTED or
#  * GDAL_DATA_COVERAGE_STATUS_EMPTY
  GDAL_DATA_COVERAGE_STATUS_DATA* = 0x02

# * Flag returned by GDALGetDataCoverageStatus() when there is nodata in the
#  * queried window. This is typically identified by the concept of missing block
#  * in formats that supports it.
#  * Can be combined with the binary or operator with
#  * GDAL_DATA_COVERAGE_STATUS_DATA
  GDAL_DATA_COVERAGE_STATUS_EMPTY* = 0x04
  GFT_Integer* = 0.GDALRATFieldType
  GFT_Real* = 1.GDALRATFieldType
  GFT_String* = 2.GDALRATFieldType
  GFU_Generic* = (0).GDALRATFieldUsage
  GFU_PixelCount* = (1).GDALRATFieldUsage
  GFU_Name* = (2).GDALRATFieldUsage
  GFU_Min* = (3).GDALRATFieldUsage
  GFU_Max* = (4).GDALRATFieldUsage
  GFU_MinMax* = (5).GDALRATFieldUsage
  GFU_Red* = (6).GDALRATFieldUsage
  GFU_Green* = (7).GDALRATFieldUsage
  GFU_Blue* = (8).GDALRATFieldUsage
  GFU_Alpha* = (9).GDALRATFieldUsage
  GFU_RedMin* = (10).GDALRATFieldUsage
  GFU_GreenMin* = (11).GDALRATFieldUsage
  GFU_BlueMin* = (12).GDALRATFieldUsage
  GFU_AlphaMin* = (13).GDALRATFieldUsage
  GFU_RedMax* = (14).GDALRATFieldUsage
  GFU_GreenMax* = (15).GDALRATFieldUsage
  GFU_BlueMax* = (16).GDALRATFieldUsage
  GFU_AlphaMax* = (17).GDALRATFieldUsage
  GFU_MaxCount* = 18.GDALRATFieldUsage
  GTO_TIP* = 0.GDALTileOrganization
  GTO_BIT* = 1.GDALTileOrganization
  GTO_BSQ* = 2.GDALTileOrganization

  dyngdal = when defined(windows):
    "libgdal.dll"
  elif defined(linux):
    "libgdal.so"
  elif defined(macosx):
    "libgdal.dylib"
  else:
    static: doAssert false

{.pragma: impgdal, importc.}
{.pragma: impgdalC, impgdal, cdecl, dynlib: dyngdal.}

type
  stat64* {.pure,final.} = object
  VSIStatBuf* = object
  tm* = object
  OGRGeomFieldDefnHS* = object
  OGRGeomFieldDefnH* = pointer
  OGRField* {.pure,final.} = object
  OGREnvelope* {.pure,final.} = object
    MinX: float
    MaxX: float
    MinY: float
    MaxY: float
  OGREnvelope3D* {.pure,final.} = object
    MinX: float
    MaxX: float
    MinY: float
    MaxY: float
    MinZ: float
    MaxZ: float
  

#  TODO(schwehr): What are the correct tests for C++ 14 and 17?
# ---------------------------------------------------------------------
#  *        types for 16 and 32 bits integers, etc...
#  *--------------------------------------------------------------------
# * Int32 type
  GInt32* {.impgdal.} = cint

# * Unsigned int32 type
  GUInt32* {.impgdal.} = cuint

# * Int16 type
  GInt16* {.impgdal.} = cshort

# * Unsigned int16 type
  GUInt16* {.impgdal.} = cushort

# * Unsigned byte type
  GByte* {.impgdal.} = cuchar

#  hack for PDF driver and poppler >= 0.15.0 that defines incompatible "typedef bool GBool"
#  in include/poppler/goo/gtypes.h
# ! @cond Doxygen_Suppress
# ! @endcond
# * Type for boolean values (alias to int)
  GBool* {.impgdal.} = cint

#  --------------------------------------------------------------------
#       64bit support
#  --------------------------------------------------------------------
#  NOTE: we don't really support such platforms ! Many things might break
  GIntBig* {.impgdal.} = clong
  GUIntBig* {.impgdal.} = culong

# * Integer type large enough to hold the difference between 2 addresses
  GPtrDiff_t* {.impgdal.} = GIntBig

#  ====================================================================
#       Well known error codes.
#  ====================================================================
# * Error number
  CPLErrorNum* {.impgdal.} = cint

# ! @endcond
# * Callback for a custom error handler
  CPLErrorHandler* {.impgdal.} = proc(a1: CPLErr, a2: CPLErrorNum, a3: cstring) {.cdecl.}

# * Assert on an expression. Only enabled in DEBUG mode
# ! @cond Doxygen_Suppress
# 
#  * Helper macros used for input parameters validation.
# 
# ! @endcond
# * Validate that a pointer is not NULL
# * Validate that a pointer is not NULL, and return rc if it is NULL
# *****************************************************************************
#  * $Id: cpl_progress.h 34518 2016-07-02 21:01:34Z goatbar $
#  *
#  * Project:  CPL - Common Portability Library
#  * Author:   Frank Warmerdam, warmerdam@pobox.com
#  * Purpose:  Prototypes and definitions for progress functions.
#  *
#  ******************************************************************************
#  * Copyright (c) 2013, Frank Warmerdam
#  *
#  * Permission is hereby granted, free of charge, to any person obtaining a
#  * copy of this software and associated documentation files (the "Software"),
#  * to deal in the Software without restriction, including without limitation
#  * the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  * and/or sell copies of the Software, and to permit persons to whom the
#  * Software is furnished to do so, subject to the following conditions:
#  *
#  * The above copyright notice and this permission notice shall be included
#  * in all copies or substantial portions of the Software.
#  *
#  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
#  * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  * DEALINGS IN THE SOFTWARE.
#  ***************************************************************************
# *****************************************************************************
#  * $Id: cpl_port.h 38517 2017-05-20 11:35:37Z rouault $
#  *
#  * Project:  CPL - Common Portability Library
#  * Author:   Frank Warmerdam, warmerdam@pobox.com
#  * Purpose:  Include file providing low level portability services for CPL.
#  *           This should be the first include file for any CPL based code.
#  *
#  ******************************************************************************
#  * Copyright (c) 1998, 2005, Frank Warmerdam <warmerdam@pobox.com>
#  * Copyright (c) 2008-2013, Even Rouault <even dot rouault at mines-paris dot org>
#  *
#  * Permission is hereby granted, free of charge, to any person obtaining a
#  * copy of this software and associated documentation files (the "Software"),
#  * to deal in the Software without restriction, including without limitation
#  * the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  * and/or sell copies of the Software, and to permit persons to whom the
#  * Software is furnished to do so, subject to the following conditions:
#  *
#  * The above copyright notice and this permission notice shall be included
#  * in all copies or substantial portions of the Software.
#  *
#  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
#  * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  * DEALINGS IN THE SOFTWARE.
#  ***************************************************************************
  GDALProgressFunc* {.impgdal.} = proc(dfComplete: cdouble, pszMessage: cstring, pProgressArg: pointer): cint {.cdecl.}

# ! @endcond
#  ====================================================================
#       64bit stdio file access functions.  If we have a big size
#       defined, then provide prototypes for the large file API,
#       otherwise redefine to use the regular api.
#  ====================================================================
# * Type for a file offset
  vsi_l_offset* {.impgdal.} = GUIntBig

# * Maximum value for a file offset
# ! @cond Doxygen_Suppress
#  Make VSIL_STRICT_ENFORCE active in DEBUG builds
# ! @endcond
# * Opaque type for a FILE that implements the VSIVirtualHandle API
  VSILFILE* {.impgdal.} = FILE

# * Type for VSIStatL()
  VSIStatBufL* {.impgdal.} = stat64

# * Callback used by VSIStdoutSetRedirection()
  VSIWriteFunction* {.impgdal.} = proc(`ptr`: pointer, size: cuint, nmemb: cuint, stream: ptr FILE): cuint {.cdecl.}

# ! @endcond
# ! @cond Doxygen_Suppress
#  --------------------------------------------------------------------
#       the following can be turned on for detailed logging of
#       almost all IO calls.
#  --------------------------------------------------------------------
# ! @endcond
# *
#  * \file cpl_virtualmem.h
#  *
#  * Virtual memory management.
#  *
#  * This file provides mechanism to define virtual memory mappings, whose content
#  * is allocated transparently and filled on-the-fly. Those virtual memory mappings
#  * can be much larger than the available RAM, but only parts of the virtual
#  * memory mapping, in the limit of the allowed the cache size, will actually be
#  * physically allocated.
#  *
#  * This exploits low-level mechanisms of the operating system (virtual memory
#  * allocation, page protection and handler of virtual memory exceptions).
#  *
#  * It is also possible to create a virtual memory mapping from a file or part
#  * of a file.
#  *
#  * The current implementation is Linux only.
# 
# * Opaque type that represents a virtual memory mapping.
  CPLVirtualMem* {.impgdal.} = object

# * Callback triggered when a still unmapped page of virtual memory is accessed.
#   * The callback has the responsibility of filling the page with relevant values
#   *
#   * @param ctxt virtual memory handle.
#   * @param nOffset offset of the page in the memory mapping.
#   * @param pPageToFill address of the page to fill. Note that the address might
#   *                    be a temporary location, and not at CPLVirtualMemGetAddr() + nOffset.
#   * @param nToFill number of bytes of the page.
#   * @param pUserData user data that was passed to CPLVirtualMemNew().
# 
  CPLVirtualMemCachePageCbk* {.impgdal.} = proc(ctxt: ptr CPLVirtualMem, nOffset: cuint, pPageToFill: pointer, nToFill: cuint, pUserData: pointer) {.cdecl.}

# * Callback triggered when a dirty mapped page is going to be freed.
#   * (saturation of cache, or termination of the virtual memory mapping).
#   *
#   * @param ctxt virtual memory handle.
#   * @param nOffset offset of the page in the memory mapping.
#   * @param pPageToBeEvicted address of the page that will be flushed. Note that the address might
#   *                    be a temporary location, and not at CPLVirtualMemGetAddr() + nOffset.
#   * @param nToBeEvicted number of bytes of the page.
#   * @param pUserData user data that was passed to CPLVirtualMemNew().
# 
  CPLVirtualMemUnCachePageCbk* {.impgdal.} = proc(ctxt: ptr CPLVirtualMem, nOffset: cuint, pPageToBeEvicted: pointer, nToBeEvicted: cuint, pUserData: pointer) {.cdecl.}

# * Callback triggered when a virtual memory mapping is destroyed.
#   * @param pUserData user data that was passed to CPLVirtualMemNew().
# 
  CPLVirtualMemFreeUserData* {.impgdal.} = proc(pUserData: pointer) {.cdecl.}

# *
#  * Document node structure.
#  *
#  * This C structure is used to hold a single text fragment representing a
#  * component of the document when parsed.   It should be allocated with the
#  * appropriate CPL function, and freed with CPLDestroyXMLNode().  The structure
#  * contents should not normally be altered by application code, but may be
#  * freely examined by application code.
#  *
#  * Using the psChild and psNext pointers, a hierarchical tree structure
#  * for a document can be represented as a tree of CPLXMLNode structures.
# 
  CPLXMLNode* {.importc: "struct CPLXMLNode", bycopy.} = object
    eType*: CPLXMLNodeType
    pszValue*: cstring
    psNext*: ptr CPLXMLNode
    psChild*: ptr CPLXMLNode

# ! @endcond
# * Type for a OGR error
  OGRErr* {.impgdal.} = cint

# * Type for a OGR boolean
  OGRBoolean* {.impgdal.} = cint

# * Helper macro for GDALCheckVersion
#  --------------------------------------------------------------------
#       Geometry related functions (ogr_geometry.h)
#  --------------------------------------------------------------------
# * Opaque type for a geometyr
  OGRGeometryH* {.impgdal.} = pointer

# ! @cond Doxygen_Suppress
# ! @endcond
# * Opaque type for a spatial reference system
  OGRSpatialReferenceH* {.impgdal.} = pointer

# * Opaque type for a coordinate transformation object
  OGRCoordinateTransformationH* {.impgdal.} = pointer

#  --------------------------------------------------------------------
#       Feature related (ogr_feature.h)
#  --------------------------------------------------------------------
# * Opaque type for a field definition (OGRFieldDefn)
  OGRFieldDefnH* {.impgdal.} = pointer

# * Opaque type for a feature definition (OGRFeatureDefn)
  OGRFeatureDefnH* {.impgdal.} = pointer

# * Opaque type for a feature (OGRFeature)
  OGRFeatureH* {.impgdal.} = pointer

# * Opaque type for a style table (OGRStyleTable)
  OGRStyleTableH* {.impgdal.} = pointer

#  --------------------------------------------------------------------
#       ogrsf_frmts.h
#  --------------------------------------------------------------------
# * Opaque type for a layer (OGRLayer)
  OGRLayerH* {.impgdal.} = pointer

# * Opaque type for a OGR datasource (OGRDataSource)
  OGRDataSourceH* {.impgdal.} = pointer

# * Opaque type for a OGR driver (OGRSFDriver)
  OGRSFDriverH* {.impgdal.} = pointer

#  --------------------------------------------------------------------
#       ogrsf_featurestyle.h
#  --------------------------------------------------------------------
# * Style manager opaque type
  OGRStyleMgrH* {.impgdal.} = pointer

# * Style tool opaque type
  OGRStyleToolH* {.impgdal.} = pointer

#  NOTE to developers: only add members, and if so edit INIT_RASTERIO_EXTRA_ARG
#  and INIT_RASTERIO_EXTRA_ARG
# * Structure to pass extra arguments to RasterIO() method
#   * @since GDAL 2.0
# 
  GDALRasterIOExtraArg* {.impgdal, bycopy.} = object
    nVersion*: cint
    eResampleAlg*: GDALRIOResampleAlg
    pfnProgress*: GDALProgressFunc
    pProgressData*: pointer
    bFloatingPointWindowValidity*: cint
    dfXOff*: cdouble
    dfYOff*: cdouble
    dfXSize*: cdouble
    dfYSize*: cdouble

#  "well known" metadata items.
# * Metadata item for dataset that indicates the spatial interpreation of a
#  *  pixel
# * Value for GDALMD_AREA_OR_POINT that indicates that a pixel represents an
#  * area
# * Value for GDALMD_AREA_OR_POINT that indicates that a pixel represents a
#  * point
#  --------------------------------------------------------------------
#       GDAL Specific error codes.
# 
#       error codes 100 to 299 reserved for GDAL.
#  --------------------------------------------------------------------
#  --------------------------------------------------------------------
#       Define handle types related to various internal classes.
#  --------------------------------------------------------------------
# * Opaque type used for the C bindings of the C++ GDALMajorObject class
  GDALMajorObjectH* {.impgdal.} = pointer

# * Opaque type used for the C bindings of the C++ GDALDataset class
  GDALDatasetH* {.impgdal.} = pointer

# * Opaque type used for the C bindings of the C++ GDALRasterBand class
  GDALRasterBandH* {.impgdal.} = pointer

# * Opaque type used for the C bindings of the C++ GDALDriver class
  GDALDriverH* {.impgdal.} = pointer

# * Opaque type used for the C bindings of the C++ GDALColorTable class
  GDALColorTableH* {.impgdal.} = pointer

# * Opaque type used for the C bindings of the C++ GDALRasterAttributeTable class
  GDALRasterAttributeTableH* {.impgdal.} = pointer

# * Opaque type used for the C bindings of the C++ GDALAsyncReader class
  GDALAsyncReaderH* {.impgdal.} = pointer

# * Type to express pixel, line or band spacing. Signed 64 bit integer.
  GSpacing* {.impgdal.} = GIntBig

#  ====================================================================
#       GDAL_GCP
#  ====================================================================
# * Ground Control Point
  GDAL_GCP* {.impgdal, bycopy.} = object
    pszId*: cstring
    pszInfo*: cstring
    dfGCPPixel*: cdouble
    dfGCPLine*: cdouble
    dfGCPX*: cdouble
    dfGCPY*: cdouble
    dfGCPZ*: cdouble

#  ====================================================================
#       GDALRasterBand ... one band/channel in a dataset.
#  ====================================================================
# *
#  * SRCVAL - Macro which may be used by pixel functions to obtain
#  *          a pixel from a source buffer.
# 
# * Type of functions to pass to GDALAddDerivedBandPixelFunc.
#  * @since GDAL 2.2
  GDALDerivedPixelFunc* {.impgdal.} = proc(papoSources: ptr pointer, nSources: cint, pData: pointer, nBufXSize: cint, nBufYSize: cint, eSrcType: GDALDataType, eBufType: GDALDataType, nPixelSpace: cint, nLineSpace: cint): CPLErr {.cdecl.}

#  Note to developers : please keep this section in sync with ogr_core.h
# * Strucutre to store Rational Polynomial Coefficients / Rigorous Projection
#  * Model. See http:geotiff.maptools.org/rpc_prop.html
  GDALRPCInfo* {.impgdal, bycopy.} = object
    dfLINE_OFF*: cdouble
    dfSAMP_OFF*: cdouble
    dfLAT_OFF*: cdouble
    dfLONG_OFF*: cdouble
    dfHEIGHT_OFF*: cdouble
    dfLINE_SCALE*: cdouble
    dfSAMP_SCALE*: cdouble
    dfLAT_SCALE*: cdouble
    dfLONG_SCALE*: cdouble
    dfHEIGHT_SCALE*: cdouble
    adfLINE_NUM_COEFF*: array[20, cdouble]
    adfLINE_DEN_COEFF*: array[20, cdouble]
    adfSAMP_NUM_COEFF*: array[20, cdouble]
    adfSAMP_DEN_COEFF*: array[20, cdouble]
    dfMIN_LONG*: cdouble
    dfMIN_LAT*: cdouble
    dfMAX_LONG*: cdouble
    dfMAX_LAT*: cdouble

#  ====================================================================
#       Color tables.
#  ====================================================================
# * Color tuple
  GDALColorEntry* {.impgdal, bycopy.} = object
    c1*: cshort
    c2*: cshort
    c3*: cshort
    c4*: cshort



#  100 - 299 reserved for GDAL
proc CPLError*(eErrClass: CPLErr, err_no: CPLErrorNum, fmt: cstring) {.impgdalC.}
proc CPLErrorV*(a1: CPLErr, a2: CPLErrorNum, a3: cstring, a4: va_list) {.impgdalC.}
proc CPLEmergencyError*(a1: cstring) {.impgdalC.}
proc CPLErrorReset*() {.impgdalC.}
proc CPLGetLastErrorNo*(): CPLErrorNum {.impgdalC.}
proc CPLGetLastErrorType*(): CPLErr {.impgdalC.}
proc CPLGetLastErrorMsg*(): cstring {.impgdalC.}
proc CPLGetErrorHandlerUserData*(): pointer {.impgdalC.}
proc CPLErrorSetState*(eErrClass: CPLErr, err_no: CPLErrorNum, pszMsg: cstring) {.impgdalC.}

# ! @cond Doxygen_Suppress
proc CPLCleanupErrorMutex*() {.impgdalC.}
proc CPLLoggingErrorHandler*(a1: CPLErr, a2: CPLErrorNum, a3: cstring) {.impgdalC.}
proc CPLDefaultErrorHandler*(a1: CPLErr, a2: CPLErrorNum, a3: cstring) {.impgdalC.}
proc CPLQuietErrorHandler*(a1: CPLErr, a2: CPLErrorNum, a3: cstring) {.impgdalC.}
proc CPLTurnFailureIntoWarning*(bOn: cint) {.impgdalC.}
proc CPLSetErrorHandler*(a1: CPLErrorHandler): CPLErrorHandler {.impgdalC.}
proc CPLSetErrorHandlerEx*(a1: CPLErrorHandler, a2: pointer): CPLErrorHandler {.impgdalC.}
proc CPLPushErrorHandler*(a1: CPLErrorHandler) {.impgdalC.}
proc CPLPushErrorHandlerEx*(a1: CPLErrorHandler, a2: pointer) {.impgdalC.}
proc CPLSetCurrentErrorHandlerCatchDebug*(bCatchDebug: cint) {.impgdalC.}
proc CPLPopErrorHandler*() {.impgdalC.}
proc CPLDebug*(a1: cstring, a2: cstring) {.impgdalC.}
proc CPLAssert*(a1: cstring, a2: cstring, a3: cint) {.importc: "_CPLAssert", cdecl, dynlib: dyngdal.}
proc GDALDummyProgress*(a1: cdouble, a2: cstring, a3: pointer): cint {.impgdalC.}
proc GDALTermProgress*(a1: cdouble, a2: cstring, a3: pointer): cint {.impgdalC.}
proc GDALScaledProgress*(a1: cdouble, a2: cstring, a3: pointer): cint {.impgdalC.}
proc GDALCreateScaledProgress*(a1: cdouble, a2: cdouble, a3: GDALProgressFunc, a4: pointer): pointer {.impgdalC.}
proc GDALDestroyScaledProgress*(a1: pointer) {.impgdalC.}

# *********************************************************************
#  * $Id: cpl_virtualmem.h 36485 2016-11-24 07:54:20Z goatbar $
#  *
#  * Name:     cpl_virtualmem.h
#  * Project:  CPL - Common Portability Library
#  * Purpose:  Virtual memory
#  * Author:   Even Rouault, <even dot rouault at mines dash paris dot org>
#  *
#  **********************************************************************
#  * Copyright (c) 2014, Even Rouault <even dot rouault at mines-paris dot org>
#  *
#  * Permission is hereby granted, free of charge, to any person obtaining a
#  * copy of this software and associated documentation files (the "Software"),
#  * to deal in the Software without restriction, including without limitation
#  * the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  * and/or sell copies of the Software, and to permit persons to whom the
#  * Software is furnished to do so, subject to the following conditions:
#  *
#  * The above copyright notice and this permission notice shall be included
#  * in all copies or substantial portions of the Software.
#  *
#  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
#  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  * DEALINGS IN THE SOFTWARE.
#  ***************************************************************************
# *****************************************************************************
#  * $Id: cpl_port.h 38517 2017-05-20 11:35:37Z rouault $
#  *
#  * Project:  CPL - Common Portability Library
#  * Author:   Frank Warmerdam, warmerdam@pobox.com
#  * Purpose:  Include file providing low level portability services for CPL.
#  *           This should be the first include file for any CPL based code.
#  *
#  ******************************************************************************
#  * Copyright (c) 1998, 2005, Frank Warmerdam <warmerdam@pobox.com>
#  * Copyright (c) 2008-2013, Even Rouault <even dot rouault at mines-paris dot org>
#  *
#  * Permission is hereby granted, free of charge, to any person obtaining a
#  * copy of this software and associated documentation files (the "Software"),
#  * to deal in the Software without restriction, including without limitation
#  * the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  * and/or sell copies of the Software, and to permit persons to whom the
#  * Software is furnished to do so, subject to the following conditions:
#  *
#  * The above copyright notice and this permission notice shall be included
#  * in all copies or substantial portions of the Software.
#  *
#  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
#  * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  * DEALINGS IN THE SOFTWARE.
#  ***************************************************************************
# *****************************************************************************
#  * $Id: cpl_vsi.h 39224 2017-06-21 08:50:19Z rouault $
#  *
#  * Project:  CPL - Common Portability Library
#  * Author:   Frank Warmerdam, warmerdam@pobox.com
#  * Purpose:  Include file defining Virtual File System (VSI) functions, a
#  *           layer over POSIX file and other system services.
#  *
#  ******************************************************************************
#  * Copyright (c) 1998, Frank Warmerdam
#  * Copyright (c) 2008-2014, Even Rouault <even dot rouault at mines-paris dot org>
#  *
#  * Permission is hereby granted, free of charge, to any person obtaining a
#  * copy of this software and associated documentation files (the "Software"),
#  * to deal in the Software without restriction, including without limitation
#  * the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  * and/or sell copies of the Software, and to permit persons to whom the
#  * Software is furnished to do so, subject to the following conditions:
#  *
#  * The above copyright notice and this permission notice shall be included
#  * in all copies or substantial portions of the Software.
#  *
#  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
#  * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  * DEALINGS IN THE SOFTWARE.
#  ***************************************************************************
# *****************************************************************************
#  * $Id: cpl_port.h 38517 2017-05-20 11:35:37Z rouault $
#  *
#  * Project:  CPL - Common Portability Library
#  * Author:   Frank Warmerdam, warmerdam@pobox.com
#  * Purpose:  Include file providing low level portability services for CPL.
#  *           This should be the first include file for any CPL based code.
#  *
#  ******************************************************************************
#  * Copyright (c) 1998, 2005, Frank Warmerdam <warmerdam@pobox.com>
#  * Copyright (c) 2008-2013, Even Rouault <even dot rouault at mines-paris dot org>
#  *
#  * Permission is hereby granted, free of charge, to any person obtaining a
#  * copy of this software and associated documentation files (the "Software"),
#  * to deal in the Software without restriction, including without limitation
#  * the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  * and/or sell copies of the Software, and to permit persons to whom the
#  * Software is furnished to do so, subject to the following conditions:
#  *
#  * The above copyright notice and this permission notice shall be included
#  * in all copies or substantial portions of the Software.
#  *
#  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
#  * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  * DEALINGS IN THE SOFTWARE.
#  ***************************************************************************
# *
#  * \file cpl_vsi.h
#  *
#  * Standard C Covers
#  *
#  * The VSI functions are intended to be hookable aliases for Standard C
#  * I/O, memory allocation and other system functions. They are intended
#  * to allow virtualization of disk I/O so that non file data sources
#  * can be made to appear as files, and so that additional error trapping
#  * and reporting can be interested.  The memory access API is aliased
#  * so that special application memory management services can be used.
#  *
#  * It is intended that each of these functions retains exactly the same
#  * calling pattern as the original Standard C functions they relate to.
#  * This means we don't have to provide custom documentation, and also means
#  * that the default implementation is very simple.
# 
#  --------------------------------------------------------------------
#       We need access to ``struct stat''.
#  --------------------------------------------------------------------
#  Unix
#  Windows
# ! @cond Doxygen_Suppress
# ! @endcond
#  ====================================================================
#       stdio file access functions.  These do not support large
#       files, and do not go through the virtualization API.
#  ====================================================================
# ! @cond Doxygen_Suppress
proc VSIFOpen*(a1: cstring, a2: cstring): ptr FILE {.impgdalC.}
proc VSIFClose*(a1: ptr FILE): cint {.impgdalC.}
proc VSIFSeek*(a1: ptr FILE, a2: clong, a3: cint): cint {.impgdalC.}
proc VSIFTell*(a1: ptr FILE): clong {.impgdalC.}
proc VSIRewind*(a1: ptr FILE) {.impgdalC.}
proc VSIFFlush*(a1: ptr FILE) {.impgdalC.}
proc VSIFRead*(a1: pointer, a2: cuint, a3: cuint, a4: ptr FILE): cuint {.impgdalC.}
proc VSIFWrite*(a1: pointer, a2: cuint, a3: cuint, a4: ptr FILE): cuint {.impgdalC.}
proc VSIFGets*(a1: cstring, a2: cint, a3: ptr FILE): cstring {.impgdalC.}
proc VSIFPuts*(a1: cstring, a2: ptr FILE): cint {.impgdalC.}
proc VSIFPrintf*(a1: ptr FILE, a2: cstring): cint {.impgdalC.}
proc VSIFGetc*(a1: ptr FILE): cint {.impgdalC.}
proc VSIFPutc*(a1: cint, a2: ptr FILE): cint {.impgdalC.}
proc VSIUngetc*(a1: cint, a2: ptr FILE): cint {.impgdalC.}
proc VSIFEof*(a1: ptr FILE): cint {.impgdalC.}

# ! @endcond
#  ====================================================================
#       VSIStat() related.
#  ====================================================================
# ! @cond Doxygen_Suppress
proc VSIStat*(a1: cstring, a2: ptr VSIStatBuf): cint {.impgdalC.}
proc VSIFOpenL*(a1: cstring, a2: cstring): ptr VSILFILE {.impgdalC.}
proc VSIFOpenExL*(a1: cstring, a2: cstring, a3: cint): ptr VSILFILE {.impgdalC.}
proc VSIFCloseL*(a1: ptr VSILFILE): cint {.impgdalC.}
proc VSIFSeekL*(a1: ptr VSILFILE, a2: vsi_l_offset, a3: cint): cint {.impgdalC.}
proc VSIFTellL*(a1: ptr VSILFILE): vsi_l_offset {.impgdalC.}
proc VSIRewindL*(a1: ptr VSILFILE) {.impgdalC.}
proc VSIFReadL*(a1: pointer, a2: cuint, a3: cuint, a4: ptr VSILFILE): cuint {.impgdalC.}
proc VSIFReadMultiRangeL*(nRanges: cint, ppData: ptr pointer, panOffsets: ptr vsi_l_offset, panSizes: ptr cuint, a1: ptr VSILFILE): cint {.impgdalC.}
proc VSIFWriteL*(a1: pointer, a2: cuint, a3: cuint, a4: ptr VSILFILE): cuint {.impgdalC.}
proc VSIFEofL*(a1: ptr VSILFILE): cint {.impgdalC.}
proc VSIFTruncateL*(a1: ptr VSILFILE, a2: vsi_l_offset): cint {.impgdalC.}
proc VSIFFlushL*(a1: ptr VSILFILE): cint {.impgdalC.}
proc VSIFPrintfL*(a1: ptr VSILFILE, a2: cstring): cint {.impgdalC.}
proc VSIFPutcL*(a1: cint, a2: ptr VSILFILE): cint {.impgdalC.}
proc VSIFGetRangeStatusL*(fp: ptr VSILFILE, nStart: vsi_l_offset, nLength: vsi_l_offset): VSIRangeStatus {.impgdalC.}
proc VSIIngestFile*(fp: ptr VSILFILE, pszFilename: cstring, ppabyRet: ptr ptr GByte, pnSize: ptr vsi_l_offset, nMaxSize: GIntBig): cint {.impgdalC.}
proc VSIStatL*(a1: cstring, a2: ptr VSIStatBufL): cint {.impgdalC.}
proc VSIStatExL*(pszFilename: cstring, psStatBuf: ptr VSIStatBufL, nFlags: cint): cint {.impgdalC.}
proc VSIIsCaseSensitiveFS*(pszFilename: cstring): cint {.impgdalC.}
proc VSISupportsSparseFiles*(pszPath: cstring): cint {.impgdalC.}
proc VSIFGetNativeFileDescriptorL*(a1: ptr VSILFILE): pointer {.impgdalC.}

#  ====================================================================
#       Memory allocation
#  ====================================================================
proc VSICalloc*(a1: cuint, a2: cuint): pointer {.impgdalC.}
proc VSIMalloc*(a1: cuint): pointer {.impgdalC.}
proc VSIFree*(a1: pointer) {.impgdalC.}
proc VSIRealloc*(a1: pointer, a2: cuint): pointer {.impgdalC.}
proc VSIStrdup*(a1: cstring): cstring {.impgdalC.}
proc VSIMallocAligned*(nAlignment: cuint, nSize: cuint): pointer {.impgdalC.}
proc VSIMallocAlignedAuto*(nSize: cuint): pointer {.impgdalC.}
proc VSIFreeAligned*(`ptr`: pointer) {.impgdalC.}
proc VSIMallocAlignedAutoVerbose*(nSize: cuint, pszFile: cstring, nLine: cint): pointer {.impgdalC.}

# * VSIMallocAlignedAutoVerbose() with FILE and LINE reporting
# *
#  VSIMalloc2 allocates (nSize1 * nSize2) bytes.
#  In case of overflow of the multiplication, or if memory allocation fails, a
#  NULL pointer is returned and a CE_Failure error is raised with CPLError().
#  If nSize1 == 0 || nSize2 == 0, a NULL pointer will also be returned.
#  CPLFree() or VSIFree() can be used to free memory allocated by this function.
# 
proc VSIMalloc2*(nSize1: cuint, nSize2: cuint): pointer {.impgdalC.}

# *
#  VSIMalloc3 allocates (nSize1 * nSize2 * nSize3) bytes.
#  In case of overflow of the multiplication, or if memory allocation fails, a
#  NULL pointer is returned and a CE_Failure error is raised with CPLError().
#  If nSize1 == 0 || nSize2 == 0 || nSize3 == 0, a NULL pointer will also be returned.
#  CPLFree() or VSIFree() can be used to free memory allocated by this function.
# 
proc VSIMalloc3*(nSize1: cuint, nSize2: cuint, nSize3: cuint): pointer {.impgdalC.}

# * VSIMallocVerbose
proc VSIMallocVerbose*(nSize: cuint, pszFile: cstring, nLine: cint): pointer {.impgdalC.}

# * VSI_MALLOC_VERBOSE
# * VSIMalloc2Verbose
proc VSIMalloc2Verbose*(nSize1: cuint, nSize2: cuint, pszFile: cstring, nLine: cint): pointer {.impgdalC.}

# * VSI_MALLOC2_VERBOSE
# * VSIMalloc3Verbose
proc VSIMalloc3Verbose*(nSize1: cuint, nSize2: cuint, nSize3: cuint, pszFile: cstring, nLine: cint): pointer {.impgdalC.}

# * VSI_MALLOC3_VERBOSE
# * VSICallocVerbose
proc VSICallocVerbose*(nCount: cuint, nSize: cuint, pszFile: cstring, nLine: cint): pointer {.impgdalC.}

# * VSI_CALLOC_VERBOSE
# * VSIReallocVerbose
proc VSIReallocVerbose*(pOldPtr: pointer, nNewSize: cuint, pszFile: cstring, nLine: cint): pointer {.impgdalC.}

# * VSI_REALLOC_VERBOSE
# * VSIStrdupVerbose
proc VSIStrdupVerbose*(pszStr: cstring, pszFile: cstring, nLine: cint): cstring {.impgdalC.}

# * VSI_STRDUP_VERBOSE
proc CPLGetPhysicalRAM*(): GIntBig {.impgdalC.}
proc CPLGetUsablePhysicalRAM*(): GIntBig {.impgdalC.}

#  ====================================================================
#       Other...
#  ====================================================================
# * Alias of VSIReadDir()
proc VSIReadDir*(a1: cstring): ptr cstring {.impgdalC.}
proc VSIReadDirRecursive*(pszPath: cstring): ptr cstring {.impgdalC.}
proc VSIReadDirEx*(pszPath: cstring, nMaxFiles: cint): ptr cstring {.impgdalC.}
proc VSIMkdir*(pathname: cstring, mode: clong): cint {.impgdalC.}
proc VSIRmdir*(pathname: cstring): cint {.impgdalC.}
proc VSIUnlink*(pathname: cstring): cint {.impgdalC.}
proc VSIRename*(oldpath: cstring, newpath: cstring): cint {.impgdalC.}
proc VSIStrerror*(a1: cint): cstring {.impgdalC.}
proc VSIGetDiskFreeSpace*(pszDirname: cstring): GIntBig {.impgdalC.}

#  ====================================================================
#       Install special file access handlers.
#  ====================================================================
proc VSIInstallMemFileHandler*() {.impgdalC.}

# ! @cond Doxygen_Suppress
proc VSIInstallLargeFileHandler*() {.impgdalC.}

# ! @endcond
proc VSIInstallSubFileHandler*() {.impgdalC.}
proc VSIInstallCurlFileHandler*() {.impgdalC.}
proc VSICurlClearCache*() {.impgdalC.}
proc VSIInstallCurlStreamingFileHandler*() {.impgdalC.}
proc VSIInstallS3FileHandler*() {.impgdalC.}
proc VSIInstallS3StreamingFileHandler*() {.impgdalC.}
proc VSIInstallGSFileHandler*() {.impgdalC.}
proc VSIInstallGSStreamingFileHandler*() {.impgdalC.}
proc VSIInstallGZipFileHandler*() {.impgdalC.}

#  No reason to export that
proc VSIInstallZipFileHandler*() {.impgdalC.}

#  No reason to export that
proc VSIInstallStdinHandler*() {.impgdalC.}

#  No reason to export that
proc VSIInstallStdoutHandler*() {.impgdalC.}

#  No reason to export that
proc VSIInstallSparseFileHandler*() {.impgdalC.}
proc VSIInstallTarFileHandler*() {.impgdalC.}

#  No reason to export that
proc VSIInstallCryptFileHandler*() {.impgdalC.}
proc VSISetCryptKey*(pabyKey: ptr GByte, nKeySize: cint) {.impgdalC.}

# ! @cond Doxygen_Suppress
proc VSICleanupFileManager*() {.impgdalC.}

# ! @endcond
proc VSIFileFromMemBuffer*(pszFilename: cstring, pabyData: ptr GByte, nDataLength: vsi_l_offset, bTakeOwnership: cint): ptr VSILFILE {.impgdalC.}
proc VSIGetMemFileBuffer*(pszFilename: cstring, pnDataLength: ptr vsi_l_offset, bUnlinkAndSeize: cint): ptr GByte {.impgdalC.}
proc VSIStdoutSetRedirection*(pFct: VSIWriteFunction, stream: ptr FILE) {.impgdalC.}

#  ====================================================================
#       Time querying.
#  ====================================================================
# ! @cond Doxygen_Suppress
proc VSITime*(a1: ptr culong): culong {.impgdalC.}
proc VSICTime*(a1: culong): cstring {.impgdalC.}
proc VSIGMTime*(pnTime: ptr time_t, poBrokenTime: ptr tm): ptr tm {.impgdalC.}
proc VSILocalTime*(pnTime: ptr time_t, poBrokenTime: ptr tm): ptr tm {.impgdalC.}

# * Return the size of a page of virtual memory.
#  *
#  * @return the page size.
#  *
#  * @since GDAL 1.11
# 
proc CPLGetPageSize*(): cuint {.impgdalC.}

# * Create a new virtual memory mapping.
#  *
#  * This will reserve an area of virtual memory of size nSize, whose size
#  * might be potentially much larger than the physical memory available. Initially,
#  * no physical memory will be allocated. As soon as memory pages will be accessed,
#  * they will be allocated transparently and filled with the pfnCachePage callback.
#  * When the allowed cache size is reached, the least recently used pages will
#  * be unallocated.
#  *
#  * On Linux AMD64 platforms, the maximum value for nSize is 128 TB.
#  * On Linux x86 platforms, the maximum value for nSize is 2 GB.
#  *
#  * Only supported on Linux for now.
#  *
#  * Note that on Linux, this function will install a SIGSEGV handler. The
#  * original handler will be restored by CPLVirtualMemManagerTerminate().
#  *
#  * @param nSize size in bytes of the virtual memory mapping.
#  * @param nCacheSize   size in bytes of the maximum memory that will be really
#  *                     allocated (must ideally fit into RAM).
#  * @param nPageSizeHint hint for the page size. Must be a multiple of the
#  *                      system page size, returned by CPLGetPageSize().
#  *                      Minimum value is generally 4096. Might be set to 0 to
#  *                      let the function determine a default page size.
#  * @param bSingleThreadUsage set to TRUE if there will be no concurrent threads
#  *                           that will access the virtual memory mapping. This can
#  *                           optimize performance a bit.
#  * @param eAccessMode permission to use for the virtual memory mapping.
#  * @param pfnCachePage callback triggered when a still unmapped page of virtual
#  *                     memory is accessed. The callback has the responsibility
#  *                     of filling the page with relevant values.
#  * @param pfnUnCachePage callback triggered when a dirty mapped page is going to
#  *                       be freed (saturation of cache, or termination of the
#  *                       virtual memory mapping). Might be NULL.
#  * @param pfnFreeUserData callback that can be used to free pCbkUserData. Might be
#  *                        NULL
#  * @param pCbkUserData user data passed to pfnCachePage and pfnUnCachePage.
#  *
#  * @return a virtual memory object that must be freed by CPLVirtualMemFree(),
#  *         or NULL in case of failure.
#  *
#  * @since GDAL 1.11
# 
proc CPLVirtualMemNew*(nSize: cuint, nCacheSize: cuint, nPageSizeHint: cuint, bSingleThreadUsage: cint, eAccessMode: CPLVirtualMemAccessMode, pfnCachePage: CPLVirtualMemCachePageCbk, pfnUnCachePage: CPLVirtualMemUnCachePageCbk, pfnFreeUserData: CPLVirtualMemFreeUserData, pCbkUserData: pointer): ptr CPLVirtualMem {.impgdalC.}

# * Return if virtual memory mapping of a file is available.
#  *
#  * @return TRUE if virtual memory mapping of a file is available.
#  * @since GDAL 1.11
# 
proc CPLIsVirtualMemFileMapAvailable*(): cint {.impgdalC.}

# * Create a new virtual memory mapping from a file.
#  *
#  * The file must be a "real" file recognized by the operating system, and not
#  * a VSI extended virtual file.
#  *
#  * In VIRTUALMEM_READWRITE mode, updates to the memory mapping will be written
#  * in the file.
#  *
#  * On Linux AMD64 platforms, the maximum value for nLength is 128 TB.
#  * On Linux x86 platforms, the maximum value for nLength is 2 GB.
#  *
#  * Supported on Linux only in GDAL <= 2.0, and all POSIX systems supporting
#  * mmap() in GDAL >= 2.1
#  *
#  * @param  fp       Virtual file handle.
#  * @param  nOffset  Offset in the file to start the mapping from.
#  * @param  nLength  Length of the portion of the file to map into memory.
#  * @param eAccessMode Permission to use for the virtual memory mapping. This must
#  *                    be consistent with how the file has been opened.
#  * @param pfnFreeUserData callback that is called when the object is destroyed.
#  * @param pCbkUserData user data passed to pfnFreeUserData.
#  * @return a virtual memory object that must be freed by CPLVirtualMemFree(),
#  *         or NULL in case of failure.
#  *
#  * @since GDAL 1.11
# 
proc CPLVirtualMemFileMapNew*(fp: ptr VSILFILE, nOffset: vsi_l_offset, nLength: vsi_l_offset, eAccessMode: CPLVirtualMemAccessMode, pfnFreeUserData: CPLVirtualMemFreeUserData, pCbkUserData: pointer): ptr CPLVirtualMem {.impgdalC.}

# * Create a new virtual memory mapping derived from an other virtual memory
#  *  mapping.
#  *
#  * This may be useful in case of creating mapping for pixel interleaved data.
#  *
#  * The new mapping takes a reference on the base mapping.
#  *
#  * @param pVMemBase Base virtual memory mapping
#  * @param nOffset   Offset in the base virtual memory mapping from which to start
#  *                  the new mapping.
#  * @param nSize     Size of the base virtual memory mapping to expose in the
#  *                  the new mapping.
#  * @param pfnFreeUserData callback that is called when the object is destroyed.
#  * @param pCbkUserData user data passed to pfnFreeUserData.
#  * @return a virtual memory object that must be freed by CPLVirtualMemFree(),
#  *         or NULL in case of failure.
#  *
#  * @since GDAL 1.11
# 
proc CPLVirtualMemDerivedNew*(pVMemBase: ptr CPLVirtualMem, nOffset: vsi_l_offset, nSize: vsi_l_offset, pfnFreeUserData: CPLVirtualMemFreeUserData, pCbkUserData: pointer): ptr CPLVirtualMem {.impgdalC.}

# * Free a virtual memory mapping.
#  *
#  * The pointer returned by CPLVirtualMemGetAddr() will no longer be valid.
#  * If the virtual memory mapping was created with read/write permissions and that
#  * they are dirty (i.e. modified) pages, they will be flushed through the
#  * pfnUnCachePage callback before being freed.
#  *
#  * @param ctxt context returned by CPLVirtualMemNew().
#  *
#  * @since GDAL 1.11
# 
proc CPLVirtualMemFree*(ctxt: ptr CPLVirtualMem) {.impgdalC.}

# * Return the pointer to the start of a virtual memory mapping.
#  *
#  * The bytes in the range [p:p+CPLVirtualMemGetSize()-1] where p is the pointer
#  * returned by this function will be valid, until CPLVirtualMemFree() is called.
#  *
#  * Note that if a range of bytes used as an argument of a system call
#  * (such as read() or write()) contains pages that have not been "realized", the
#  * system call will fail with EFAULT. CPLVirtualMemPin() can be used to work
#  * around this issue.
#  *
#  * @param ctxt context returned by CPLVirtualMemNew().
#  * @return the pointer to the start of a virtual memory mapping.
#  *
#  * @since GDAL 1.11
# 
proc CPLVirtualMemGetAddr*(ctxt: ptr CPLVirtualMem): pointer {.impgdalC.}

# * Return the size of the virtual memory mapping.
#  *
#  * @param ctxt context returned by CPLVirtualMemNew().
#  * @return the size of the virtual memory mapping.
#  *
#  * @since GDAL 1.11
# 
proc CPLVirtualMemGetSize*(ctxt: ptr CPLVirtualMem): cuint {.impgdalC.}

# * Return if the virtual memory mapping is a direct file mapping.
#  *
#  * @param ctxt context returned by CPLVirtualMemNew().
#  * @return TRUE if the virtual memory mapping is a direct file mapping.
#  *
#  * @since GDAL 1.11
# 
proc CPLVirtualMemIsFileMapping*(ctxt: ptr CPLVirtualMem): cint {.impgdalC.}

# * Return the access mode of the virtual memory mapping.
#  *
#  * @param ctxt context returned by CPLVirtualMemNew().
#  * @return the access mode of the virtual memory mapping.
#  *
#  * @since GDAL 1.11
# 
proc CPLVirtualMemGetAccessMode*(ctxt: ptr CPLVirtualMem): CPLVirtualMemAccessMode {.impgdalC.}

# * Return the page size associated to a virtual memory mapping.
#  *
#  * The value returned will be at least CPLGetPageSize(), but potentially
#  * larger.
#  *
#  * @param ctxt context returned by CPLVirtualMemNew().
#  * @return the page size
#  *
#  * @since GDAL 1.11
# 
proc CPLVirtualMemGetPageSize*(ctxt: ptr CPLVirtualMem): cuint {.impgdalC.}

# * Return TRUE if this memory mapping can be accessed safely from concurrent
#  *  threads.
#  *
#  * The situation that can cause problems is when several threads try to access
#  * a page of the mapping that is not yet mapped.
#  *
#  * The return value of this function depends on whether bSingleThreadUsage has
#  * been set of not in CPLVirtualMemNew() and/or the implementation.
#  *
#  * On Linux, this will always return TRUE if bSingleThreadUsage = FALSE.
#  *
#  * @param ctxt context returned by CPLVirtualMemNew().
#  * @return TRUE if this memory mapping can be accessed safely from concurrent
#  *         threads.
#  *
#  * @since GDAL 1.11
# 
proc CPLVirtualMemIsAccessThreadSafe*(ctxt: ptr CPLVirtualMem): cint {.impgdalC.}

# * Declare that a thread will access a virtual memory mapping.
#  *
#  * This function must be called by a thread that wants to access the
#  * content of a virtual memory mapping, except if the virtual memory mapping has
#  * been created with bSingleThreadUsage = TRUE.
#  *
#  * This function must be paired with CPLVirtualMemUnDeclareThread().
#  *
#  * @param ctxt context returned by CPLVirtualMemNew().
#  *
#  * @since GDAL 1.11
# 
proc CPLVirtualMemDeclareThread*(ctxt: ptr CPLVirtualMem) {.impgdalC.}

# * Declare that a thread will stop accessing a virtual memory mapping.
#  *
#  * This function must be called by a thread that will no longer access the
#  * content of a virtual memory mapping, except if the virtual memory mapping has
#  * been created with bSingleThreadUsage = TRUE.
#  *
#  * This function must be paired with CPLVirtualMemDeclareThread().
#  *
#  * @param ctxt context returned by CPLVirtualMemNew().
#  *
#  * @since GDAL 1.11
# 
proc CPLVirtualMemUnDeclareThread*(ctxt: ptr CPLVirtualMem) {.impgdalC.}

# * Make sure that a region of virtual memory will be realized.
#  *
#  * Calling this function is not required, but might be useful when debugging
#  * a process with tools like gdb or valgrind that do not naturally like
#  * segmentation fault signals.
#  *
#  * It is also needed when wanting to provide part of virtual memory mapping
#  * to a system call such as read() or write(). If read() or write() is called
#  * on a memory region not yet realized, the call will fail with EFAULT.
#  *
#  * @param ctxt context returned by CPLVirtualMemNew().
#  * @param pAddr the memory region to pin.
#  * @param nSize the size of the memory region.
#  * @param bWriteOp set to TRUE if the memory are will be accessed in write mode.
#  *
#  * @since GDAL 1.11
# 
proc CPLVirtualMemPin*(ctxt: ptr CPLVirtualMem, pAddr: pointer, nSize: cuint, bWriteOp: cint) {.impgdalC.}

# * Cleanup any resource and handlers related to virtual memory.
#  *
#  * This function must be called after the last CPLVirtualMem object has
#  * been freed.
#  *
#  * @since GDAL 2.0
# 
proc CPLVirtualMemManagerTerminate*() {.impgdalC.}
proc CPLParseXMLString*(a1: cstring): ptr CPLXMLNode {.impgdalC.}
proc CPLDestroyXMLNode*(a1: ptr CPLXMLNode) {.impgdalC.}
proc CPLGetXMLNode*(poRoot: ptr CPLXMLNode, pszPath: cstring): ptr CPLXMLNode {.impgdalC.}
proc CPLSearchXMLNode*(poRoot: ptr CPLXMLNode, pszTarget: cstring): ptr CPLXMLNode {.impgdalC.}
proc CPLGetXMLValue*(poRoot: ptr CPLXMLNode, pszPath: cstring, pszDefault: cstring): cstring {.impgdalC.}
proc CPLCreateXMLNode*(poParent: ptr CPLXMLNode, eType: CPLXMLNodeType, pszText: cstring): ptr CPLXMLNode {.impgdalC.}
proc CPLSerializeXMLTree*(psNode: ptr CPLXMLNode): cstring {.impgdalC.}
proc CPLAddXMLChild*(psParent: ptr CPLXMLNode, psChild: ptr CPLXMLNode) {.impgdalC.}
proc CPLRemoveXMLChild*(psParent: ptr CPLXMLNode, psChild: ptr CPLXMLNode): cint {.impgdalC.}
proc CPLAddXMLSibling*(psOlderSibling: ptr CPLXMLNode, psNewSibling: ptr CPLXMLNode) {.impgdalC.}
proc CPLCreateXMLElementAndValue*(psParent: ptr CPLXMLNode, pszName: cstring, pszValue: cstring): ptr CPLXMLNode {.impgdalC.}
proc CPLAddXMLAttributeAndValue*(psParent: ptr CPLXMLNode, pszName: cstring, pszValue: cstring) {.impgdalC.}
proc CPLCloneXMLTree*(psTree: ptr CPLXMLNode): ptr CPLXMLNode {.impgdalC.}
proc CPLSetXMLValue*(psRoot: ptr CPLXMLNode, pszPath: cstring, pszValue: cstring): cint {.impgdalC.}
proc CPLStripXMLNamespace*(psRoot: ptr CPLXMLNode, pszNameSpace: cstring, bRecurse: cint) {.impgdalC.}
proc CPLCleanXMLElementName*(a1: cstring) {.impgdalC.}
proc CPLParseXMLFile*(pszFilename: cstring): ptr CPLXMLNode {.impgdalC.}
proc CPLSerializeXMLTreeToFile*(psTree: ptr CPLXMLNode, pszFilename: cstring): cint {.impgdalC.}

# * Manage a tree of XML nodes so that all nodes are freed when the instance goes
#  * out of scope.  Only the top level node should be in a CPLXMLTreeCloser.
# 
# * Constructor
# * Destructor
# * Returns the node pointer/
#    * Modifying the contents pointed to by the return is allowed.
#    * @return the node pointer
# * Returns the node pointer/
#    * Modifying the contents pointed to by the return is allowed.
#    * @return the node pointer
# *****************************************************************************
#  * $Id: ogr_api.h 37371 2017-02-13 11:41:59Z rouault $
#  *
#  * Project:  OpenGIS Simple Features Reference Implementation
#  * Purpose:  C API for OGR Geometry, Feature, Layers, DataSource and drivers.
#  * Author:   Frank Warmerdam, warmerdam@pobox.com
#  *
#  ******************************************************************************
#  * Copyright (c) 2002, Frank Warmerdam
#  * Copyright (c) 2008-2013, Even Rouault <even dot rouault at mines-paris dot org>
#  *
#  * Permission is hereby granted, free of charge, to any person obtaining a
#  * copy of this software and associated documentation files (the "Software"),
#  * to deal in the Software without restriction, including without limitation
#  * the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  * and/or sell copies of the Software, and to permit persons to whom the
#  * Software is furnished to do so, subject to the following conditions:
#  *
#  * The above copyright notice and this permission notice shall be included
#  * in all copies or substantial portions of the Software.
#  *
#  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
#  * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  * DEALINGS IN THE SOFTWARE.
#  ***************************************************************************
# *
#  * \file ogr_api.h
#  *
#  * C API and defines for OGRFeature, OGRGeometry, and OGRDataSource
#  * related classes.
#  *
#  * See also: ogr_geometry.h, ogr_feature.h, ogrsf_frmts.h, ogr_featurestyle.h
# 
# *****************************************************************************
#  * $Id: cpl_progress.h 34518 2016-07-02 21:01:34Z goatbar $
#  *
#  * Project:  CPL - Common Portability Library
#  * Author:   Frank Warmerdam, warmerdam@pobox.com
#  * Purpose:  Prototypes and definitions for progress functions.
#  *
#  ******************************************************************************
#  * Copyright (c) 2013, Frank Warmerdam
#  *
#  * Permission is hereby granted, free of charge, to any person obtaining a
#  * copy of this software and associated documentation files (the "Software"),
#  * to deal in the Software without restriction, including without limitation
#  * the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  * and/or sell copies of the Software, and to permit persons to whom the
#  * Software is furnished to do so, subject to the following conditions:
#  *
#  * The above copyright notice and this permission notice shall be included
#  * in all copies or substantial portions of the Software.
#  *
#  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
#  * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  * DEALINGS IN THE SOFTWARE.
#  ***************************************************************************
# *********************************************************************
#  * $Id: cpl_minixml.h 35921 2016-10-25 02:28:29Z goatbar $
#  *
#  * Project:  CPL - Common Portability Library
#  * Purpose:  Declarations for MiniXML Handler.
#  * Author:   Frank Warmerdam, warmerdam@pobox.com
#  *
#  **********************************************************************
#  * Copyright (c) 2001, Frank Warmerdam
#  *
#  * Permission is hereby granted, free of charge, to any person obtaining a
#  * copy of this software and associated documentation files (the "Software"),
#  * to deal in the Software without restriction, including without limitation
#  * the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  * and/or sell copies of the Software, and to permit persons to whom the
#  * Software is furnished to do so, subject to the following conditions:
#  *
#  * The above copyright notice and this permission notice shall be included
#  * in all copies or substantial portions of the Software.
#  *
#  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
#  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  * DEALINGS IN THE SOFTWARE.
#  ***************************************************************************
# *****************************************************************************
#  * $Id: ogr_core.h 37856 2017-03-28 12:10:47Z rouault $
#  *
#  * Project:  OpenGIS Simple Features Reference Implementation
#  * Purpose:  Define some core portability services for cross-platform OGR code.
#  * Author:   Frank Warmerdam, warmerdam@pobox.com
#  *
#  ******************************************************************************
#  * Copyright (c) 1999, Frank Warmerdam
#  * Copyright (c) 2007-2014, Even Rouault <even dot rouault at mines-paris dot org>
#  *
#  * Permission is hereby granted, free of charge, to any person obtaining a
#  * copy of this software and associated documentation files (the "Software"),
#  * to deal in the Software without restriction, including without limitation
#  * the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  * and/or sell copies of the Software, and to permit persons to whom the
#  * Software is furnished to do so, subject to the following conditions:
#  *
#  * The above copyright notice and this permission notice shall be included
#  * in all copies or substantial portions of the Software.
#  *
#  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
#  * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  * DEALINGS IN THE SOFTWARE.
#  ***************************************************************************
# *****************************************************************************
#  * $Id: cpl_port.h 38517 2017-05-20 11:35:37Z rouault $
#  *
#  * Project:  CPL - Common Portability Library
#  * Author:   Frank Warmerdam, warmerdam@pobox.com
#  * Purpose:  Include file providing low level portability services for CPL.
#  *           This should be the first include file for any CPL based code.
#  *
#  ******************************************************************************
#  * Copyright (c) 1998, 2005, Frank Warmerdam <warmerdam@pobox.com>
#  * Copyright (c) 2008-2013, Even Rouault <even dot rouault at mines-paris dot org>
#  *
#  * Permission is hereby granted, free of charge, to any person obtaining a
#  * copy of this software and associated documentation files (the "Software"),
#  * to deal in the Software without restriction, including without limitation
#  * the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  * and/or sell copies of the Software, and to permit persons to whom the
#  * Software is furnished to do so, subject to the following conditions:
#  *
#  * The above copyright notice and this permission notice shall be included
#  * in all copies or substantial portions of the Software.
#  *
#  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
#  * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  * DEALINGS IN THE SOFTWARE.
#  ***************************************************************************
#  $Id: gdal_version.h 41865 2018-03-19 12:04:41Z rouault $
#  --------------------------------------------------------------------
#       GDAL Version Information.
#  --------------------------------------------------------------------
#  GDAL_COMPUTE_VERSION macro introduced in GDAL 1.10
#  Must be used ONLY to compare with version numbers for GDAL >= 1.10
#  Note: the formula to compute GDAL_VERSION_NUM has changed in GDAL 1.10
# *
#  * \file
#  *
#  * Core portability services for cross-platform OGR code.
# 
# *
#  * Simple container for a bounding region.
# 
# ! @cond Doxygen_Suppress
#  extern "C++"
# *
#  * Simple container for a bounding region in 3D.
# 
#  extern "C++"
# ! @endcond
# ! @cond Doxygen_Suppress
proc OGRMalloc*(a1: cuint): pointer {.impgdalC.}
proc OGRCalloc*(a1: cuint, a2: cuint): pointer {.impgdalC.}
proc OGRRealloc*(a1: pointer, a2: cuint): pointer {.impgdalC.}
proc OGRStrdup*(a1: cstring): cstring {.impgdalC.}
proc OGRFree*(a1: pointer) {.impgdalC.}
proc OGRGeometryTypeToName*(eType: OGRwkbGeometryType): cstring {.impgdalC.}
proc OGRMergeGeometryTypes*(eMain: OGRwkbGeometryType, eExtra: OGRwkbGeometryType): OGRwkbGeometryType {.impgdalC.}
proc OGRMergeGeometryTypesEx*(eMain: OGRwkbGeometryType, eExtra: OGRwkbGeometryType, bAllowPromotingToCurves: cint): OGRwkbGeometryType {.impgdalC.}
proc OGR_GT_Flatten*(eType: OGRwkbGeometryType): OGRwkbGeometryType {.impgdalC.}
proc OGR_GT_SetZ*(eType: OGRwkbGeometryType): OGRwkbGeometryType {.impgdalC.}
proc OGR_GT_SetM*(eType: OGRwkbGeometryType): OGRwkbGeometryType {.impgdalC.}
proc OGR_GT_SetModifier*(eType: OGRwkbGeometryType, bSetZ: cint, bSetM: cint): OGRwkbGeometryType {.impgdalC.}
proc OGR_GT_HasZ*(eType: OGRwkbGeometryType): cint {.impgdalC.}
proc OGR_GT_HasM*(eType: OGRwkbGeometryType): cint {.impgdalC.}
proc OGR_GT_IsSubClassOf*(eType: OGRwkbGeometryType, eSuperType: OGRwkbGeometryType): cint {.impgdalC.}
proc OGR_GT_IsCurve*(a1: OGRwkbGeometryType): cint {.impgdalC.}
proc OGR_GT_IsSurface*(a1: OGRwkbGeometryType): cint {.impgdalC.}
proc OGR_GT_IsNonLinear*(a1: OGRwkbGeometryType): cint {.impgdalC.}
proc OGR_GT_GetCollection*(eType: OGRwkbGeometryType): OGRwkbGeometryType {.impgdalC.}
proc OGR_GT_GetCurve*(eType: OGRwkbGeometryType): OGRwkbGeometryType {.impgdalC.}
proc OGR_GT_GetLinear*(eType: OGRwkbGeometryType): OGRwkbGeometryType {.impgdalC.}

# **********************************************************************
#                                OGRField
# **********************************************************************
# *
#  * OGRFeature field attribute value union.
# 
# * Return the number of milliseconds from a datetime with decimal seconds
proc OGRParseDate*(pszInput: cstring, psOutput: ptr OGRField, nOptions: cint): cint {.impgdalC.}

#  -------------------------------------------------------------------
#                         Version checking
#  --------------------------------------------------------------------
#  Note to developers : please keep this section in sync with gdal.h
proc GDALVersionInfo*(a1: cstring): cstring {.impgdalC.}

# * Return TRUE if GDAL library version at runtime matches nVersionMajor.nVersionMinor.
#     The purpose of this method is to ensure that calling code will run with the GDAL
#     version it is compiled for. It is primarily indented for external plugins.
#     @param nVersionMajor Major version to be tested against
#     @param nVersionMinor Minor version to be tested against
#     @param pszCallingComponentName If not NULL, in case of version mismatch, the method
#                                    will issue a failure mentioning the name of
#                                    the calling component.
# 
proc GDALCheckVersion*(nVersionMajor: cint, nVersionMinor: cint, pszCallingComponentName: cstring): cint {.impgdalC.}

#  From base OGRGeometry class
proc OGR_G_CreateFromWkb*(a1: ptr cuchar, a2: OGRSpatialReferenceH, a3: ptr OGRGeometryH, a4: cint): OGRErr {.impgdalC.}
proc OGR_G_CreateFromWkt*(a1: ptr cstring, a2: OGRSpatialReferenceH, a3: ptr OGRGeometryH): OGRErr {.impgdalC.}
proc OGR_G_CreateFromFgf*(a1: ptr cuchar, a2: OGRSpatialReferenceH, a3: ptr OGRGeometryH, a4: cint, a5: ptr cint): OGRErr {.impgdalC.}
proc OGR_G_DestroyGeometry*(a1: OGRGeometryH) {.impgdalC.}
proc OGR_G_CreateGeometry*(a1: OGRwkbGeometryType): OGRGeometryH {.impgdalC.}
proc OGR_G_ApproximateArcAngles*(dfCenterX: cdouble, dfCenterY: cdouble, dfZ: cdouble, dfPrimaryRadius: cdouble, dfSecondaryAxis: cdouble, dfRotation: cdouble, dfStartAngle: cdouble, dfEndAngle: cdouble, dfMaxAngleStepSizeDegrees: cdouble): OGRGeometryH {.impgdalC.}
proc OGR_G_ForceToPolygon*(a1: OGRGeometryH): OGRGeometryH {.impgdalC.}
proc OGR_G_ForceToLineString*(a1: OGRGeometryH): OGRGeometryH {.impgdalC.}
proc OGR_G_ForceToMultiPolygon*(a1: OGRGeometryH): OGRGeometryH {.impgdalC.}
proc OGR_G_ForceToMultiPoint*(a1: OGRGeometryH): OGRGeometryH {.impgdalC.}
proc OGR_G_ForceToMultiLineString*(a1: OGRGeometryH): OGRGeometryH {.impgdalC.}
proc OGR_G_ForceTo*(hGeom: OGRGeometryH, eTargetType: OGRwkbGeometryType, papszOptions: ptr cstring): OGRGeometryH {.impgdalC.}
proc OGR_G_GetDimension*(a1: OGRGeometryH): cint {.impgdalC.}
proc OGR_G_GetCoordinateDimension*(a1: OGRGeometryH): cint {.impgdalC.}
proc OGR_G_CoordinateDimension*(a1: OGRGeometryH): cint {.impgdalC.}
proc OGR_G_SetCoordinateDimension*(a1: OGRGeometryH, a2: cint) {.impgdalC.}
proc OGR_G_Is3D*(a1: OGRGeometryH): cint {.impgdalC.}
proc OGR_G_IsMeasured*(a1: OGRGeometryH): cint {.impgdalC.}
proc OGR_G_Set3D*(a1: OGRGeometryH, a2: cint) {.impgdalC.}
proc OGR_G_SetMeasured*(a1: OGRGeometryH, a2: cint) {.impgdalC.}
proc OGR_G_Clone*(a1: OGRGeometryH): OGRGeometryH {.impgdalC.}
proc OGR_G_GetEnvelope*(a1: OGRGeometryH, a2: ptr OGREnvelope) {.impgdalC.}
proc OGR_G_GetEnvelope3D*(a1: OGRGeometryH, a2: ptr OGREnvelope3D) {.impgdalC.}
proc OGR_G_ImportFromWkb*(a1: OGRGeometryH, a2: ptr cuchar, a3: cint): OGRErr {.impgdalC.}
proc OGR_G_ExportToWkb*(a1: OGRGeometryH, a2: OGRwkbByteOrder, a3: ptr cuchar): OGRErr {.impgdalC.}
proc OGR_G_ExportToIsoWkb*(a1: OGRGeometryH, a2: OGRwkbByteOrder, a3: ptr cuchar): OGRErr {.impgdalC.}
proc OGR_G_WkbSize*(hGeom: OGRGeometryH): cint {.impgdalC.}
proc OGR_G_ImportFromWkt*(a1: OGRGeometryH, a2: ptr cstring): OGRErr {.impgdalC.}
proc OGR_G_ExportToWkt*(a1: OGRGeometryH, a2: ptr cstring): OGRErr {.impgdalC.}
proc OGR_G_ExportToIsoWkt*(a1: OGRGeometryH, a2: ptr cstring): OGRErr {.impgdalC.}
proc OGR_G_GetGeometryType*(a1: OGRGeometryH): OGRwkbGeometryType {.impgdalC.}
proc OGR_G_GetGeometryName*(a1: OGRGeometryH): cstring {.impgdalC.}
proc OGR_G_DumpReadable*(a1: OGRGeometryH, a2: ptr FILE, a3: cstring) {.impgdalC.}
proc OGR_G_FlattenTo2D*(a1: OGRGeometryH) {.impgdalC.}
proc OGR_G_CloseRings*(a1: OGRGeometryH) {.impgdalC.}
proc OGR_G_CreateFromGML*(a1: cstring): OGRGeometryH {.impgdalC.}
proc OGR_G_ExportToGML*(a1: OGRGeometryH): cstring {.impgdalC.}
proc OGR_G_ExportToGMLEx*(a1: OGRGeometryH, papszOptions: ptr cstring): cstring {.impgdalC.}
proc OGR_G_CreateFromGMLTree*(a1: ptr CPLXMLNode): OGRGeometryH {.impgdalC.}
proc OGR_G_ExportToGMLTree*(a1: OGRGeometryH): ptr CPLXMLNode {.impgdalC.}
proc OGR_G_ExportEnvelopeToGMLTree*(a1: OGRGeometryH): ptr CPLXMLNode {.impgdalC.}
proc OGR_G_ExportToKML*(a1: OGRGeometryH, pszAltitudeMode: cstring): cstring {.impgdalC.}
proc OGR_G_ExportToJson*(a1: OGRGeometryH): cstring {.impgdalC.}
proc OGR_G_ExportToJsonEx*(a1: OGRGeometryH, papszOptions: ptr cstring): cstring {.impgdalC.}

# * Create a OGR geometry from a GeoJSON geometry object
proc OGR_G_CreateGeometryFromJson*(a1: cstring): OGRGeometryH {.impgdalC.}
proc OGR_G_AssignSpatialReference*(a1: OGRGeometryH, a2: OGRSpatialReferenceH) {.impgdalC.}
proc OGR_G_GetSpatialReference*(a1: OGRGeometryH): OGRSpatialReferenceH {.impgdalC.}
proc OGR_G_Transform*(a1: OGRGeometryH, a2: OGRCoordinateTransformationH): OGRErr {.impgdalC.}
proc OGR_G_TransformTo*(a1: OGRGeometryH, a2: OGRSpatialReferenceH): OGRErr {.impgdalC.}
proc OGR_G_Simplify*(hThis: OGRGeometryH, tolerance: cdouble): OGRGeometryH {.impgdalC.}
proc OGR_G_SimplifyPreserveTopology*(hThis: OGRGeometryH, tolerance: cdouble): OGRGeometryH {.impgdalC.}
proc OGR_G_DelaunayTriangulation*(hThis: OGRGeometryH, dfTolerance: cdouble, bOnlyEdges: cint): OGRGeometryH {.impgdalC.}
proc OGR_G_Segmentize*(hGeom: OGRGeometryH, dfMaxLength: cdouble) {.impgdalC.}
proc OGR_G_Intersects*(a1: OGRGeometryH, a2: OGRGeometryH): cint {.impgdalC.}
proc OGR_G_Equals*(a1: OGRGeometryH, a2: OGRGeometryH): cint {.impgdalC.}

# int    CPL_DLL OGR_G_EqualsExact( OGRGeometryH, OGRGeometryH, double );
proc OGR_G_Disjoint*(a1: OGRGeometryH, a2: OGRGeometryH): cint {.impgdalC.}
proc OGR_G_Touches*(a1: OGRGeometryH, a2: OGRGeometryH): cint {.impgdalC.}
proc OGR_G_Crosses*(a1: OGRGeometryH, a2: OGRGeometryH): cint {.impgdalC.}
proc OGR_G_Within*(a1: OGRGeometryH, a2: OGRGeometryH): cint {.impgdalC.}
proc OGR_G_Contains*(a1: OGRGeometryH, a2: OGRGeometryH): cint {.impgdalC.}
proc OGR_G_Overlaps*(a1: OGRGeometryH, a2: OGRGeometryH): cint {.impgdalC.}
proc OGR_G_Boundary*(a1: OGRGeometryH): OGRGeometryH {.impgdalC.}
proc OGR_G_ConvexHull*(a1: OGRGeometryH): OGRGeometryH {.impgdalC.}
proc OGR_G_Buffer*(a1: OGRGeometryH, a2: cdouble, a3: cint): OGRGeometryH {.impgdalC.}
proc OGR_G_Intersection*(a1: OGRGeometryH, a2: OGRGeometryH): OGRGeometryH {.impgdalC.}
proc OGR_G_Union*(a1: OGRGeometryH, a2: OGRGeometryH): OGRGeometryH {.impgdalC.}
proc OGR_G_UnionCascaded*(a1: OGRGeometryH): OGRGeometryH {.impgdalC.}
proc OGR_G_PointOnSurface*(a1: OGRGeometryH): OGRGeometryH {.impgdalC.}

# OGRGeometryH CPL_DLL OGR_G_Polygonize( OGRGeometryH *, int);
# OGRGeometryH CPL_DLL OGR_G_Polygonizer_getCutEdges( OGRGeometryH *, int);
# OGRGeometryH CPL_DLL OGR_G_LineMerge( OGRGeometryH );
proc OGR_G_Difference*(a1: OGRGeometryH, a2: OGRGeometryH): OGRGeometryH {.impgdalC.}
proc OGR_G_SymDifference*(a1: OGRGeometryH, a2: OGRGeometryH): OGRGeometryH {.impgdalC.}
proc OGR_G_Distance*(a1: OGRGeometryH, a2: OGRGeometryH): cdouble {.impgdalC.}
proc OGR_G_Distance3D*(a1: OGRGeometryH, a2: OGRGeometryH): cdouble {.impgdalC.}
proc OGR_G_Length*(a1: OGRGeometryH): cdouble {.impgdalC.}
proc OGR_G_Area*(a1: OGRGeometryH): cdouble {.impgdalC.}
proc OGR_G_Centroid*(a1: OGRGeometryH, a2: OGRGeometryH): cint {.impgdalC.}
proc OGR_G_Value*(a1: OGRGeometryH, dfDistance: cdouble): OGRGeometryH {.impgdalC.}
proc OGR_G_Empty*(a1: OGRGeometryH) {.impgdalC.}
proc OGR_G_IsEmpty*(a1: OGRGeometryH): cint {.impgdalC.}
proc OGR_G_IsValid*(a1: OGRGeometryH): cint {.impgdalC.}

# char    CPL_DLL *OGR_G_IsValidReason( OGRGeometryH );
proc OGR_G_IsSimple*(a1: OGRGeometryH): cint {.impgdalC.}
proc OGR_G_IsRing*(a1: OGRGeometryH): cint {.impgdalC.}
proc OGR_G_Polygonize*(a1: OGRGeometryH): OGRGeometryH {.impgdalC.}

# ! @cond Doxygen_Suppress
#  backward compatibility (non-standard methods)
proc OGR_G_Intersect*(a1: OGRGeometryH, a2: OGRGeometryH): cint {.impgdalC.}
proc OGR_G_Equal*(a1: OGRGeometryH, a2: OGRGeometryH): cint {.impgdalC.}
proc OGR_G_SymmetricDifference*(a1: OGRGeometryH, a2: OGRGeometryH): OGRGeometryH {.impgdalC.}
proc OGR_G_GetArea*(a1: OGRGeometryH): cdouble {.impgdalC.}
proc OGR_G_GetBoundary*(a1: OGRGeometryH): OGRGeometryH {.impgdalC.}

# ! @endcond
#  Methods for getting/setting vertices in points, line strings and rings
proc OGR_G_GetPointCount*(a1: OGRGeometryH): cint {.impgdalC.}
proc OGR_G_GetPoints*(hGeom: OGRGeometryH, pabyX: pointer, nXStride: cint, pabyY: pointer, nYStride: cint, pabyZ: pointer, nZStride: cint): cint {.impgdalC.}
proc OGR_G_GetPointsZM*(hGeom: OGRGeometryH, pabyX: pointer, nXStride: cint, pabyY: pointer, nYStride: cint, pabyZ: pointer, nZStride: cint, pabyM: pointer, nMStride: cint): cint {.impgdalC.}
proc OGR_G_GetX*(a1: OGRGeometryH, a2: cint): cdouble {.impgdalC.}
proc OGR_G_GetY*(a1: OGRGeometryH, a2: cint): cdouble {.impgdalC.}
proc OGR_G_GetZ*(a1: OGRGeometryH, a2: cint): cdouble {.impgdalC.}
proc OGR_G_GetM*(a1: OGRGeometryH, a2: cint): cdouble {.impgdalC.}
proc OGR_G_GetPoint*(a1: OGRGeometryH, iPoint: cint, a2: ptr cdouble, a3: ptr cdouble, a4: ptr cdouble) {.impgdalC.}
proc OGR_G_GetPointZM*(a1: OGRGeometryH, iPoint: cint, a2: ptr cdouble, a3: ptr cdouble, a4: ptr cdouble, a5: ptr cdouble) {.impgdalC.}
proc OGR_G_SetPointCount*(hGeom: OGRGeometryH, nNewPointCount: cint) {.impgdalC.}
proc OGR_G_SetPoint*(a1: OGRGeometryH, iPoint: cint, a2: cdouble, a3: cdouble, a4: cdouble) {.impgdalC.}
proc OGR_G_SetPoint_2D*(a1: OGRGeometryH, iPoint: cint, a2: cdouble, a3: cdouble) {.impgdalC.}
proc OGR_G_SetPointM*(a1: OGRGeometryH, iPoint: cint, a2: cdouble, a3: cdouble, a4: cdouble) {.impgdalC.}
proc OGR_G_SetPointZM*(a1: OGRGeometryH, iPoint: cint, a2: cdouble, a3: cdouble, a4: cdouble, a5: cdouble) {.impgdalC.}
proc OGR_G_AddPoint*(a1: OGRGeometryH, a2: cdouble, a3: cdouble, a4: cdouble) {.impgdalC.}
proc OGR_G_AddPoint_2D*(a1: OGRGeometryH, a2: cdouble, a3: cdouble) {.impgdalC.}
proc OGR_G_AddPointM*(a1: OGRGeometryH, a2: cdouble, a3: cdouble, a4: cdouble) {.impgdalC.}
proc OGR_G_AddPointZM*(a1: OGRGeometryH, a2: cdouble, a3: cdouble, a4: cdouble, a5: cdouble) {.impgdalC.}
proc OGR_G_SetPoints*(hGeom: OGRGeometryH, nPointsIn: cint, pabyX: pointer, nXStride: cint, pabyY: pointer, nYStride: cint, pabyZ: pointer, nZStride: cint) {.impgdalC.}
proc OGR_G_SetPointsZM*(hGeom: OGRGeometryH, nPointsIn: cint, pabyX: pointer, nXStride: cint, pabyY: pointer, nYStride: cint, pabyZ: pointer, nZStride: cint, pabyM: pointer, nMStride: cint) {.impgdalC.}

#  Methods for getting/setting rings and members collections
proc OGR_G_GetGeometryCount*(a1: OGRGeometryH): cint {.impgdalC.}
proc OGR_G_GetGeometryRef*(a1: OGRGeometryH, a2: cint): OGRGeometryH {.impgdalC.}
proc OGR_G_AddGeometry*(a1: OGRGeometryH, a2: OGRGeometryH): OGRErr {.impgdalC.}
proc OGR_G_AddGeometryDirectly*(a1: OGRGeometryH, a2: OGRGeometryH): OGRErr {.impgdalC.}
proc OGR_G_RemoveGeometry*(a1: OGRGeometryH, a2: cint, a3: cint): OGRErr {.impgdalC.}
proc OGR_G_HasCurveGeometry*(a1: OGRGeometryH, bLookForNonLinear: cint): cint {.impgdalC.}
proc OGR_G_GetLinearGeometry*(hGeom: OGRGeometryH, dfMaxAngleStepSizeDegrees: cdouble, papszOptions: ptr cstring): OGRGeometryH {.impgdalC.}
proc OGR_G_GetCurveGeometry*(hGeom: OGRGeometryH, papszOptions: ptr cstring): OGRGeometryH {.impgdalC.}
proc OGRBuildPolygonFromEdges*(hLinesAsCollection: OGRGeometryH, bBestEffort: cint, bAutoClose: cint, dfTolerance: cdouble, peErr: ptr OGRErr): OGRGeometryH {.impgdalC.}

# ! @cond Doxygen_Suppress
proc OGRSetGenerate_DB2_V72_BYTE_ORDER*(bGenerate_DB2_V72_BYTE_ORDER: cint): OGRErr {.impgdalC.}
proc OGRGetGenerate_DB2_V72_BYTE_ORDER*(): cint {.impgdalC.}

# ! @endcond
proc OGRSetNonLinearGeometriesEnabledFlag*(bFlag: cint) {.impgdalC.}
proc OGRGetNonLinearGeometriesEnabledFlag*(): cint {.impgdalC.}

# * Opaque type for a geometry field definition (OGRGeomFieldDefn)
#  OGRFieldDefn
proc OGR_Fld_Create*(a1: cstring, a2: OGRFieldType): OGRFieldDefnH {.impgdalC.}
proc OGR_Fld_Destroy*(a1: OGRFieldDefnH) {.impgdalC.}
proc OGR_Fld_SetName*(a1: OGRFieldDefnH, a2: cstring) {.impgdalC.}
proc OGR_Fld_GetNameRef*(a1: OGRFieldDefnH): cstring {.impgdalC.}
proc OGR_Fld_GetType*(a1: OGRFieldDefnH): OGRFieldType {.impgdalC.}
proc OGR_Fld_SetType*(a1: OGRFieldDefnH, a2: OGRFieldType) {.impgdalC.}
proc OGR_Fld_GetSubType*(a1: OGRFieldDefnH): OGRFieldSubType {.impgdalC.}
proc OGR_Fld_SetSubType*(a1: OGRFieldDefnH, a2: OGRFieldSubType) {.impgdalC.}
proc OGR_Fld_GetJustify*(a1: OGRFieldDefnH): OGRJustification {.impgdalC.}
proc OGR_Fld_SetJustify*(a1: OGRFieldDefnH, a2: OGRJustification) {.impgdalC.}
proc OGR_Fld_GetWidth*(a1: OGRFieldDefnH): cint {.impgdalC.}
proc OGR_Fld_SetWidth*(a1: OGRFieldDefnH, a2: cint) {.impgdalC.}
proc OGR_Fld_GetPrecision*(a1: OGRFieldDefnH): cint {.impgdalC.}
proc OGR_Fld_SetPrecision*(a1: OGRFieldDefnH, a2: cint) {.impgdalC.}
proc OGR_Fld_Set*(a1: OGRFieldDefnH, a2: cstring, a3: OGRFieldType, a4: cint, a5: cint, a6: OGRJustification) {.impgdalC.}
proc OGR_Fld_IsIgnored*(hDefn: OGRFieldDefnH): cint {.impgdalC.}
proc OGR_Fld_SetIgnored*(hDefn: OGRFieldDefnH, a1: cint) {.impgdalC.}
proc OGR_Fld_IsNullable*(hDefn: OGRFieldDefnH): cint {.impgdalC.}
proc OGR_Fld_SetNullable*(hDefn: OGRFieldDefnH, a1: cint) {.impgdalC.}
proc OGR_Fld_GetDefault*(hDefn: OGRFieldDefnH): cstring {.impgdalC.}
proc OGR_Fld_SetDefault*(hDefn: OGRFieldDefnH, a1: cstring) {.impgdalC.}
proc OGR_Fld_IsDefaultDriverSpecific*(hDefn: OGRFieldDefnH): cint {.impgdalC.}
proc OGR_GetFieldTypeName*(a1: OGRFieldType): cstring {.impgdalC.}
proc OGR_GetFieldSubTypeName*(a1: OGRFieldSubType): cstring {.impgdalC.}
proc OGR_AreTypeSubTypeCompatible*(eType: OGRFieldType, eSubType: OGRFieldSubType): cint {.impgdalC.}

#  OGRGeomFieldDefnH
proc OGR_GFld_Create*(a1: cstring, a2: OGRwkbGeometryType): OGRGeomFieldDefnH {.impgdalC.}
proc OGR_GFld_Destroy*(a1: OGRGeomFieldDefnH) {.impgdalC.}
proc OGR_GFld_SetName*(a1: OGRGeomFieldDefnH, a2: cstring) {.impgdalC.}
proc OGR_GFld_GetNameRef*(a1: OGRGeomFieldDefnH): cstring {.impgdalC.}
proc OGR_GFld_GetType*(a1: OGRGeomFieldDefnH): OGRwkbGeometryType {.impgdalC.}
proc OGR_GFld_SetType*(a1: OGRGeomFieldDefnH, a2: OGRwkbGeometryType) {.impgdalC.}
proc OGR_GFld_GetSpatialRef*(a1: OGRGeomFieldDefnH): OGRSpatialReferenceH {.impgdalC.}
proc OGR_GFld_SetSpatialRef*(a1: OGRGeomFieldDefnH, hSRS: OGRSpatialReferenceH) {.impgdalC.}
proc OGR_GFld_IsNullable*(hDefn: OGRGeomFieldDefnH): cint {.impgdalC.}
proc OGR_GFld_SetNullable*(hDefn: OGRGeomFieldDefnH, a1: cint) {.impgdalC.}
proc OGR_GFld_IsIgnored*(hDefn: OGRGeomFieldDefnH): cint {.impgdalC.}
proc OGR_GFld_SetIgnored*(hDefn: OGRGeomFieldDefnH, a1: cint) {.impgdalC.}

#  OGRFeatureDefn
proc OGR_FD_Create*(a1: cstring): OGRFeatureDefnH {.impgdalC.}
proc OGR_FD_Destroy*(a1: OGRFeatureDefnH) {.impgdalC.}
proc OGR_FD_Release*(a1: OGRFeatureDefnH) {.impgdalC.}
proc OGR_FD_GetName*(a1: OGRFeatureDefnH): cstring {.impgdalC.}
proc OGR_FD_GetFieldCount*(a1: OGRFeatureDefnH): cint {.impgdalC.}
proc OGR_FD_GetFieldDefn*(a1: OGRFeatureDefnH, a2: cint): OGRFieldDefnH {.impgdalC.}
proc OGR_FD_GetFieldIndex*(a1: OGRFeatureDefnH, a2: cstring): cint {.impgdalC.}
proc OGR_FD_AddFieldDefn*(a1: OGRFeatureDefnH, a2: OGRFieldDefnH) {.impgdalC.}
proc OGR_FD_DeleteFieldDefn*(hDefn: OGRFeatureDefnH, iField: cint): OGRErr {.impgdalC.}
proc OGR_FD_ReorderFieldDefns*(hDefn: OGRFeatureDefnH, panMap: ptr cint): OGRErr {.impgdalC.}
proc OGR_FD_GetGeomType*(a1: OGRFeatureDefnH): OGRwkbGeometryType {.impgdalC.}
proc OGR_FD_SetGeomType*(a1: OGRFeatureDefnH, a2: OGRwkbGeometryType) {.impgdalC.}
proc OGR_FD_IsGeometryIgnored*(a1: OGRFeatureDefnH): cint {.impgdalC.}
proc OGR_FD_SetGeometryIgnored*(a1: OGRFeatureDefnH, a2: cint) {.impgdalC.}
proc OGR_FD_IsStyleIgnored*(a1: OGRFeatureDefnH): cint {.impgdalC.}
proc OGR_FD_SetStyleIgnored*(a1: OGRFeatureDefnH, a2: cint) {.impgdalC.}
proc OGR_FD_Reference*(a1: OGRFeatureDefnH): cint {.impgdalC.}
proc OGR_FD_Dereference*(a1: OGRFeatureDefnH): cint {.impgdalC.}
proc OGR_FD_GetReferenceCount*(a1: OGRFeatureDefnH): cint {.impgdalC.}
proc OGR_FD_GetGeomFieldCount*(hFDefn: OGRFeatureDefnH): cint {.impgdalC.}
proc OGR_FD_GetGeomFieldDefn*(hFDefn: OGRFeatureDefnH, i: cint): OGRGeomFieldDefnH {.impgdalC.}
proc OGR_FD_GetGeomFieldIndex*(hFDefn: OGRFeatureDefnH, pszName: cstring): cint {.impgdalC.}
proc OGR_FD_AddGeomFieldDefn*(hFDefn: OGRFeatureDefnH, hGFldDefn: OGRGeomFieldDefnH) {.impgdalC.}
proc OGR_FD_DeleteGeomFieldDefn*(hFDefn: OGRFeatureDefnH, iGeomField: cint): OGRErr {.impgdalC.}
proc OGR_FD_IsSame*(hFDefn: OGRFeatureDefnH, hOtherFDefn: OGRFeatureDefnH): cint {.impgdalC.}

#  OGRFeature
proc OGR_F_Create*(a1: OGRFeatureDefnH): OGRFeatureH {.impgdalC.}
proc OGR_F_Destroy*(a1: OGRFeatureH) {.impgdalC.}
proc OGR_F_GetDefnRef*(a1: OGRFeatureH): OGRFeatureDefnH {.impgdalC.}
proc OGR_F_SetGeometryDirectly*(a1: OGRFeatureH, a2: OGRGeometryH): OGRErr {.impgdalC.}
proc OGR_F_SetGeometry*(a1: OGRFeatureH, a2: OGRGeometryH): OGRErr {.impgdalC.}
proc OGR_F_GetGeometryRef*(a1: OGRFeatureH): OGRGeometryH {.impgdalC.}
proc OGR_F_StealGeometry*(a1: OGRFeatureH): OGRGeometryH {.impgdalC.}
proc OGR_F_Clone*(a1: OGRFeatureH): OGRFeatureH {.impgdalC.}
proc OGR_F_Equal*(a1: OGRFeatureH, a2: OGRFeatureH): cint {.impgdalC.}
proc OGR_F_GetFieldCount*(a1: OGRFeatureH): cint {.impgdalC.}
proc OGR_F_GetFieldDefnRef*(a1: OGRFeatureH, a2: cint): OGRFieldDefnH {.impgdalC.}
proc OGR_F_GetFieldIndex*(a1: OGRFeatureH, a2: cstring): cint {.impgdalC.}
proc OGR_F_IsFieldSet*(a1: OGRFeatureH, a2: cint): cint {.impgdalC.}
proc OGR_F_UnsetField*(a1: OGRFeatureH, a2: cint) {.impgdalC.}
proc OGR_F_IsFieldNull*(a1: OGRFeatureH, a2: cint): cint {.impgdalC.}
proc OGR_F_IsFieldSetAndNotNull*(a1: OGRFeatureH, a2: cint): cint {.impgdalC.}
proc OGR_F_SetFieldNull*(a1: OGRFeatureH, a2: cint) {.impgdalC.}
proc OGR_F_GetRawFieldRef*(a1: OGRFeatureH, a2: cint): ptr OGRField {.impgdalC.}
proc OGR_RawField_IsUnset*(a1: ptr OGRField): cint {.impgdalC.}
proc OGR_RawField_IsNull*(a1: ptr OGRField): cint {.impgdalC.}
proc OGR_RawField_SetUnset*(a1: ptr OGRField) {.impgdalC.}
proc OGR_RawField_SetNull*(a1: ptr OGRField) {.impgdalC.}
proc OGR_F_GetFieldAsInteger*(a1: OGRFeatureH, a2: cint): cint {.impgdalC.}
proc OGR_F_GetFieldAsInteger64*(a1: OGRFeatureH, a2: cint): GIntBig {.impgdalC.}
proc OGR_F_GetFieldAsDouble*(a1: OGRFeatureH, a2: cint): cdouble {.impgdalC.}
proc OGR_F_GetFieldAsString*(a1: OGRFeatureH, a2: cint): cstring {.impgdalC.}
proc OGR_F_GetFieldAsIntegerList*(a1: OGRFeatureH, a2: cint, a3: ptr cint): ptr cint {.impgdalC.}
proc OGR_F_GetFieldAsInteger64List*(a1: OGRFeatureH, a2: cint, a3: ptr cint): ptr GIntBig {.impgdalC.}
proc OGR_F_GetFieldAsDoubleList*(a1: OGRFeatureH, a2: cint, a3: ptr cint): ptr cdouble {.impgdalC.}
proc OGR_F_GetFieldAsStringList*(a1: OGRFeatureH, a2: cint): ptr cstring {.impgdalC.}
proc OGR_F_GetFieldAsBinary*(a1: OGRFeatureH, a2: cint, a3: ptr cint): ptr GByte {.impgdalC.}
proc OGR_F_GetFieldAsDateTime*(a1: OGRFeatureH, a2: cint, a3: ptr cint, a4: ptr cint, a5: ptr cint, a6: ptr cint, a7: ptr cint, a8: ptr cint, a9: ptr cint): cint {.impgdalC.}
proc OGR_F_GetFieldAsDateTimeEx*(hFeat: OGRFeatureH, iField: cint, pnYear: ptr cint, pnMonth: ptr cint, pnDay: ptr cint, pnHour: ptr cint, pnMinute: ptr cint, pfSecond: ptr cfloat, pnTZFlag: ptr cint): cint {.impgdalC.}
proc OGR_F_SetFieldInteger*(a1: OGRFeatureH, a2: cint, a3: cint) {.impgdalC.}
proc OGR_F_SetFieldInteger64*(a1: OGRFeatureH, a2: cint, a3: GIntBig) {.impgdalC.}
proc OGR_F_SetFieldDouble*(a1: OGRFeatureH, a2: cint, a3: cdouble) {.impgdalC.}
proc OGR_F_SetFieldString*(a1: OGRFeatureH, a2: cint, a3: cstring) {.impgdalC.}
proc OGR_F_SetFieldIntegerList*(a1: OGRFeatureH, a2: cint, a3: cint, a4: ptr cint) {.impgdalC.}
proc OGR_F_SetFieldInteger64List*(a1: OGRFeatureH, a2: cint, a3: cint, a4: ptr GIntBig) {.impgdalC.}
proc OGR_F_SetFieldDoubleList*(a1: OGRFeatureH, a2: cint, a3: cint, a4: ptr cdouble) {.impgdalC.}
proc OGR_F_SetFieldStringList*(a1: OGRFeatureH, a2: cint, a3: ptr cstring) {.impgdalC.}
proc OGR_F_SetFieldRaw*(a1: OGRFeatureH, a2: cint, a3: ptr OGRField) {.impgdalC.}
proc OGR_F_SetFieldBinary*(a1: OGRFeatureH, a2: cint, a3: cint, a4: ptr GByte) {.impgdalC.}
proc OGR_F_SetFieldDateTime*(a1: OGRFeatureH, a2: cint, a3: cint, a4: cint, a5: cint, a6: cint, a7: cint, a8: cint, a9: cint) {.impgdalC.}
proc OGR_F_SetFieldDateTimeEx*(a1: OGRFeatureH, a2: cint, a3: cint, a4: cint, a5: cint, a6: cint, a7: cint, a8: cfloat, a9: cint) {.impgdalC.}
proc OGR_F_GetGeomFieldCount*(hFeat: OGRFeatureH): cint {.impgdalC.}
proc OGR_F_GetGeomFieldDefnRef*(hFeat: OGRFeatureH, iField: cint): OGRGeomFieldDefnH {.impgdalC.}
proc OGR_F_GetGeomFieldIndex*(hFeat: OGRFeatureH, pszName: cstring): cint {.impgdalC.}
proc OGR_F_GetGeomFieldRef*(hFeat: OGRFeatureH, iField: cint): OGRGeometryH {.impgdalC.}
proc OGR_F_SetGeomFieldDirectly*(hFeat: OGRFeatureH, iField: cint, hGeom: OGRGeometryH): OGRErr {.impgdalC.}
proc OGR_F_SetGeomField*(hFeat: OGRFeatureH, iField: cint, hGeom: OGRGeometryH): OGRErr {.impgdalC.}
proc OGR_F_GetFID*(a1: OGRFeatureH): GIntBig {.impgdalC.}
proc OGR_F_SetFID*(a1: OGRFeatureH, a2: GIntBig): OGRErr {.impgdalC.}
proc OGR_F_DumpReadable*(a1: OGRFeatureH, a2: ptr FILE) {.impgdalC.}
proc OGR_F_SetFrom*(a1: OGRFeatureH, a2: OGRFeatureH, a3: cint): OGRErr {.impgdalC.}
proc OGR_F_SetFromWithMap*(a1: OGRFeatureH, a2: OGRFeatureH, a3: cint, a4: ptr cint): OGRErr {.impgdalC.}
proc OGR_F_GetStyleString*(a1: OGRFeatureH): cstring {.impgdalC.}
proc OGR_F_SetStyleString*(a1: OGRFeatureH, a2: cstring) {.impgdalC.}
proc OGR_F_SetStyleStringDirectly*(a1: OGRFeatureH, a2: cstring) {.impgdalC.}

# * Return style table
proc OGR_F_GetStyleTable*(a1: OGRFeatureH): OGRStyleTableH {.impgdalC.}

# * Set style table and take ownership
proc OGR_F_SetStyleTableDirectly*(a1: OGRFeatureH, a2: OGRStyleTableH) {.impgdalC.}

# * Set style table
proc OGR_F_SetStyleTable*(a1: OGRFeatureH, a2: OGRStyleTableH) {.impgdalC.}
proc OGR_F_GetNativeData*(a1: OGRFeatureH): cstring {.impgdalC.}
proc OGR_F_SetNativeData*(a1: OGRFeatureH, a2: cstring) {.impgdalC.}
proc OGR_F_GetNativeMediaType*(a1: OGRFeatureH): cstring {.impgdalC.}
proc OGR_F_SetNativeMediaType*(a1: OGRFeatureH, a2: cstring) {.impgdalC.}
proc OGR_F_FillUnsetWithDefault*(hFeat: OGRFeatureH, bNotNullableOnly: cint, papszOptions: ptr cstring) {.impgdalC.}
proc OGR_F_Validate*(a1: OGRFeatureH, nValidateFlags: cint, bEmitError: cint): cint {.impgdalC.}

#  OGRLayer
proc OGR_L_GetName*(a1: OGRLayerH): cstring {.impgdalC.}
proc OGR_L_GetGeomType*(a1: OGRLayerH): OGRwkbGeometryType {.impgdalC.}
proc OGR_L_GetSpatialFilter*(a1: OGRLayerH): OGRGeometryH {.impgdalC.}
proc OGR_L_SetSpatialFilter*(a1: OGRLayerH, a2: OGRGeometryH) {.impgdalC.}
proc OGR_L_SetSpatialFilterRect*(a1: OGRLayerH, a2: cdouble, a3: cdouble, a4: cdouble, a5: cdouble) {.impgdalC.}
proc OGR_L_SetSpatialFilterEx*(a1: OGRLayerH, iGeomField: cint, hGeom: OGRGeometryH) {.impgdalC.}
proc OGR_L_SetSpatialFilterRectEx*(a1: OGRLayerH, iGeomField: cint, dfMinX: cdouble, dfMinY: cdouble, dfMaxX: cdouble, dfMaxY: cdouble) {.impgdalC.}
proc OGR_L_SetAttributeFilter*(a1: OGRLayerH, a2: cstring): OGRErr {.impgdalC.}
proc OGR_L_ResetReading*(a1: OGRLayerH) {.impgdalC.}
proc OGR_L_GetNextFeature*(a1: OGRLayerH): OGRFeatureH {.impgdalC.}
proc OGR_L_SetNextByIndex*(a1: OGRLayerH, a2: GIntBig): OGRErr {.impgdalC.}
proc OGR_L_GetFeature*(a1: OGRLayerH, a2: GIntBig): OGRFeatureH {.impgdalC.}
proc OGR_L_SetFeature*(a1: OGRLayerH, a2: OGRFeatureH): OGRErr {.impgdalC.}
proc OGR_L_CreateFeature*(a1: OGRLayerH, a2: OGRFeatureH): OGRErr {.impgdalC.}
proc OGR_L_DeleteFeature*(a1: OGRLayerH, a2: GIntBig): OGRErr {.impgdalC.}
proc OGR_L_GetLayerDefn*(a1: OGRLayerH): OGRFeatureDefnH {.impgdalC.}
proc OGR_L_GetSpatialRef*(a1: OGRLayerH): OGRSpatialReferenceH {.impgdalC.}
proc OGR_L_FindFieldIndex*(a1: OGRLayerH, a2: cstring, bExactMatch: cint): cint {.impgdalC.}
proc OGR_L_GetFeatureCount*(a1: OGRLayerH, a2: cint): GIntBig {.impgdalC.}
proc OGR_L_GetExtent*(a1: OGRLayerH, a2: ptr OGREnvelope, a3: cint): OGRErr {.impgdalC.}
proc OGR_L_GetExtentEx*(a1: OGRLayerH, iGeomField: cint, psExtent: ptr OGREnvelope, bForce: cint): OGRErr {.impgdalC.}
proc OGR_L_TestCapability*(a1: OGRLayerH, a2: cstring): cint {.impgdalC.}
proc OGR_L_CreateField*(a1: OGRLayerH, a2: OGRFieldDefnH, a3: cint): OGRErr {.impgdalC.}
proc OGR_L_CreateGeomField*(hLayer: OGRLayerH, hFieldDefn: OGRGeomFieldDefnH, bForce: cint): OGRErr {.impgdalC.}
proc OGR_L_DeleteField*(a1: OGRLayerH, iField: cint): OGRErr {.impgdalC.}
proc OGR_L_ReorderFields*(a1: OGRLayerH, panMap: ptr cint): OGRErr {.impgdalC.}
proc OGR_L_ReorderField*(a1: OGRLayerH, iOldFieldPos: cint, iNewFieldPos: cint): OGRErr {.impgdalC.}
proc OGR_L_AlterFieldDefn*(a1: OGRLayerH, iField: cint, hNewFieldDefn: OGRFieldDefnH, nFlags: cint): OGRErr {.impgdalC.}
proc OGR_L_StartTransaction*(a1: OGRLayerH): OGRErr {.impgdalC.}
proc OGR_L_CommitTransaction*(a1: OGRLayerH): OGRErr {.impgdalC.}
proc OGR_L_RollbackTransaction*(a1: OGRLayerH): OGRErr {.impgdalC.}

# ! @cond Doxygen_Suppress
proc OGR_L_Reference*(a1: OGRLayerH): cint {.impgdalC.}
proc OGR_L_Dereference*(a1: OGRLayerH): cint {.impgdalC.}
proc OGR_L_GetRefCount*(a1: OGRLayerH): cint {.impgdalC.}

# ! @endcond
proc OGR_L_SyncToDisk*(a1: OGRLayerH): OGRErr {.impgdalC.}

# ! @cond Doxygen_Suppress
proc OGR_L_GetFeaturesRead*(a1: OGRLayerH): GIntBig {.impgdalC.}

# ! @endcond
proc OGR_L_GetFIDColumn*(a1: OGRLayerH): cstring {.impgdalC.}
proc OGR_L_GetGeometryColumn*(a1: OGRLayerH): cstring {.impgdalC.}

# * Get style table
proc OGR_L_GetStyleTable*(a1: OGRLayerH): OGRStyleTableH {.impgdalC.}

# * Set style table (and take ownership)
proc OGR_L_SetStyleTableDirectly*(a1: OGRLayerH, a2: OGRStyleTableH) {.impgdalC.}

# * Set style table
proc OGR_L_SetStyleTable*(a1: OGRLayerH, a2: OGRStyleTableH) {.impgdalC.}
proc OGR_L_SetIgnoredFields*(a1: OGRLayerH, a2: ptr cstring): OGRErr {.impgdalC.}
proc OGR_L_Intersection*(a1: OGRLayerH, a2: OGRLayerH, a3: OGRLayerH, a4: ptr cstring, a5: GDALProgressFunc, a6: pointer): OGRErr {.impgdalC.}
proc OGR_L_Union*(a1: OGRLayerH, a2: OGRLayerH, a3: OGRLayerH, a4: ptr cstring, a5: GDALProgressFunc, a6: pointer): OGRErr {.impgdalC.}
proc OGR_L_SymDifference*(a1: OGRLayerH, a2: OGRLayerH, a3: OGRLayerH, a4: ptr cstring, a5: GDALProgressFunc, a6: pointer): OGRErr {.impgdalC.}
proc OGR_L_Identity*(a1: OGRLayerH, a2: OGRLayerH, a3: OGRLayerH, a4: ptr cstring, a5: GDALProgressFunc, a6: pointer): OGRErr {.impgdalC.}
proc OGR_L_Update*(a1: OGRLayerH, a2: OGRLayerH, a3: OGRLayerH, a4: ptr cstring, a5: GDALProgressFunc, a6: pointer): OGRErr {.impgdalC.}
proc OGR_L_Clip*(a1: OGRLayerH, a2: OGRLayerH, a3: OGRLayerH, a4: ptr cstring, a5: GDALProgressFunc, a6: pointer): OGRErr {.impgdalC.}
proc OGR_L_Erase*(a1: OGRLayerH, a2: OGRLayerH, a3: OGRLayerH, a4: ptr cstring, a5: GDALProgressFunc, a6: pointer): OGRErr {.impgdalC.}

#  OGRDataSource
proc OGR_DS_Destroy*(a1: OGRDataSourceH) {.impgdalC.}
proc OGR_DS_GetName*(a1: OGRDataSourceH): cstring {.impgdalC.}
proc OGR_DS_GetLayerCount*(a1: OGRDataSourceH): cint {.impgdalC.}
proc OGR_DS_GetLayer*(a1: OGRDataSourceH, a2: cint): OGRLayerH {.impgdalC.}
proc OGR_DS_GetLayerByName*(a1: OGRDataSourceH, a2: cstring): OGRLayerH {.impgdalC.}
proc OGR_DS_DeleteLayer*(a1: OGRDataSourceH, a2: cint): OGRErr {.impgdalC.}
proc OGR_DS_GetDriver*(a1: OGRDataSourceH): OGRSFDriverH {.impgdalC.}
proc OGR_DS_CreateLayer*(a1: OGRDataSourceH, a2: cstring, a3: OGRSpatialReferenceH, a4: OGRwkbGeometryType, a5: ptr cstring): OGRLayerH {.impgdalC.}
proc OGR_DS_CopyLayer*(a1: OGRDataSourceH, a2: OGRLayerH, a3: cstring, a4: ptr cstring): OGRLayerH {.impgdalC.}
proc OGR_DS_TestCapability*(a1: OGRDataSourceH, a2: cstring): cint {.impgdalC.}
proc OGR_DS_ExecuteSQL*(a1: OGRDataSourceH, a2: cstring, a3: OGRGeometryH, a4: cstring): OGRLayerH {.impgdalC.}
proc OGR_DS_ReleaseResultSet*(a1: OGRDataSourceH, a2: OGRLayerH) {.impgdalC.}

# ! @cond Doxygen_Suppress
proc OGR_DS_Reference*(a1: OGRDataSourceH): cint {.impgdalC.}
proc OGR_DS_Dereference*(a1: OGRDataSourceH): cint {.impgdalC.}
proc OGR_DS_GetRefCount*(a1: OGRDataSourceH): cint {.impgdalC.}
proc OGR_DS_GetSummaryRefCount*(a1: OGRDataSourceH): cint {.impgdalC.}

# ! @endcond
# * Flush pending changes to disk. See GDALDataset::FlushCache()
proc OGR_DS_SyncToDisk*(a1: OGRDataSourceH): OGRErr {.impgdalC.}

# * Get style table
proc OGR_DS_GetStyleTable*(a1: OGRDataSourceH): OGRStyleTableH {.impgdalC.}

# * Set style table (and take ownership)
proc OGR_DS_SetStyleTableDirectly*(a1: OGRDataSourceH, a2: OGRStyleTableH) {.impgdalC.}

# * Set style table
proc OGR_DS_SetStyleTable*(a1: OGRDataSourceH, a2: OGRStyleTableH) {.impgdalC.}

#  OGRSFDriver
proc OGR_Dr_GetName*(a1: OGRSFDriverH): cstring {.impgdalC.}
proc OGR_Dr_Open*(a1: OGRSFDriverH, a2: cstring, a3: cint): OGRDataSourceH {.impgdalC.}
proc OGR_Dr_TestCapability*(a1: OGRSFDriverH, a2: cstring): cint {.impgdalC.}
proc OGR_Dr_CreateDataSource*(a1: OGRSFDriverH, a2: cstring, a3: ptr cstring): OGRDataSourceH {.impgdalC.}
proc OGR_Dr_CopyDataSource*(a1: OGRSFDriverH, a2: OGRDataSourceH, a3: cstring, a4: ptr cstring): OGRDataSourceH {.impgdalC.}
proc OGR_Dr_DeleteDataSource*(a1: OGRSFDriverH, a2: cstring): OGRErr {.impgdalC.}

#  OGRSFDriverRegistrar
proc OGROpen*(a1: cstring, a2: cint, a3: ptr OGRSFDriverH): OGRDataSourceH {.impgdalC.}
proc OGROpenShared*(a1: cstring, a2: cint, a3: ptr OGRSFDriverH): OGRDataSourceH {.impgdalC.}
proc OGRReleaseDataSource*(a1: OGRDataSourceH): OGRErr {.impgdalC.}

# ! @cond Doxygen_Suppress
proc OGRRegisterDriver*(a1: OGRSFDriverH) {.impgdalC.}
proc OGRDeregisterDriver*(a1: OGRSFDriverH) {.impgdalC.}

# ! @endcond
proc OGRGetDriverCount*(): cint {.impgdalC.}
proc OGRGetDriver*(a1: cint): OGRSFDriverH {.impgdalC.}
proc OGRGetDriverByName*(a1: cstring): OGRSFDriverH {.impgdalC.}

# ! @cond Doxygen_Suppress
proc OGRGetOpenDSCount*(): cint {.impgdalC.}
proc OGRGetOpenDS*(iDS: cint): OGRDataSourceH {.impgdalC.}

# ! @endcond
#  note: this is also declared in ogrsf_frmts.h
proc OGRRegisterAll*() {.impgdalC.}

# * Clean-up all drivers (including raster ones starting with GDAL 2.0.
#  * See GDALDestroyDriverManager()
proc OGRCleanupAll*() {.impgdalC.}

#  OGRStyleMgr
proc OGR_SM_Create*(hStyleTable: OGRStyleTableH): OGRStyleMgrH {.impgdalC.}
proc OGR_SM_Destroy*(hSM: OGRStyleMgrH) {.impgdalC.}
proc OGR_SM_InitFromFeature*(hSM: OGRStyleMgrH, hFeat: OGRFeatureH): cstring {.impgdalC.}
proc OGR_SM_InitStyleString*(hSM: OGRStyleMgrH, pszStyleString: cstring): cint {.impgdalC.}
proc OGR_SM_GetPartCount*(hSM: OGRStyleMgrH, pszStyleString: cstring): cint {.impgdalC.}
proc OGR_SM_GetPart*(hSM: OGRStyleMgrH, nPartId: cint, pszStyleString: cstring): OGRStyleToolH {.impgdalC.}
proc OGR_SM_AddPart*(hSM: OGRStyleMgrH, hST: OGRStyleToolH): cint {.impgdalC.}
proc OGR_SM_AddStyle*(hSM: OGRStyleMgrH, pszStyleName: cstring, pszStyleString: cstring): cint {.impgdalC.}

#  OGRStyleTool
proc OGR_ST_Create*(eClassId: OGRSTClassId): OGRStyleToolH {.impgdalC.}
proc OGR_ST_Destroy*(hST: OGRStyleToolH) {.impgdalC.}
proc OGR_ST_GetType*(hST: OGRStyleToolH): OGRSTClassId {.impgdalC.}
proc OGR_ST_GetUnit*(hST: OGRStyleToolH): OGRSTUnitId {.impgdalC.}
proc OGR_ST_SetUnit*(hST: OGRStyleToolH, eUnit: OGRSTUnitId, dfGroundPaperScale: cdouble) {.impgdalC.}
proc OGR_ST_GetParamStr*(hST: OGRStyleToolH, eParam: cint, bValueIsNull: ptr cint): cstring {.impgdalC.}
proc OGR_ST_GetParamNum*(hST: OGRStyleToolH, eParam: cint, bValueIsNull: ptr cint): cint {.impgdalC.}
proc OGR_ST_GetParamDbl*(hST: OGRStyleToolH, eParam: cint, bValueIsNull: ptr cint): cdouble {.impgdalC.}
proc OGR_ST_SetParamStr*(hST: OGRStyleToolH, eParam: cint, pszValue: cstring) {.impgdalC.}
proc OGR_ST_SetParamNum*(hST: OGRStyleToolH, eParam: cint, nValue: cint) {.impgdalC.}
proc OGR_ST_SetParamDbl*(hST: OGRStyleToolH, eParam: cint, dfValue: cdouble) {.impgdalC.}
proc OGR_ST_GetStyleString*(hST: OGRStyleToolH): cstring {.impgdalC.}
proc OGR_ST_GetRGBFromString*(hST: OGRStyleToolH, pszColor: cstring, pnRed: ptr cint, pnGreen: ptr cint, pnBlue: ptr cint, pnAlpha: ptr cint): cint {.impgdalC.}

#  OGRStyleTable
proc OGR_STBL_Create*(): OGRStyleTableH {.impgdalC.}
proc OGR_STBL_Destroy*(hSTBL: OGRStyleTableH) {.impgdalC.}
proc OGR_STBL_AddStyle*(hStyleTable: OGRStyleTableH, pszName: cstring, pszStyleString: cstring): cint {.impgdalC.}
proc OGR_STBL_SaveStyleTable*(hStyleTable: OGRStyleTableH, pszFilename: cstring): cint {.impgdalC.}
proc OGR_STBL_LoadStyleTable*(hStyleTable: OGRStyleTableH, pszFilename: cstring): cint {.impgdalC.}
proc OGR_STBL_Find*(hStyleTable: OGRStyleTableH, pszName: cstring): cstring {.impgdalC.}
proc OGR_STBL_ResetStyleStringReading*(hStyleTable: OGRStyleTableH) {.impgdalC.}
proc OGR_STBL_GetNextStyle*(hStyleTable: OGRStyleTableH): cstring {.impgdalC.}
proc OGR_STBL_GetLastStyleName*(hStyleTable: OGRStyleTableH): cstring {.impgdalC.}
proc GDALGetDataTypeSize*(a1: GDALDataType): cint {.impgdalC.}

#  Deprecated.
proc GDALGetDataTypeSizeBits*(eDataType: GDALDataType): cint {.impgdalC.}
proc GDALGetDataTypeSizeBytes*(a1: GDALDataType): cint {.impgdalC.}
proc GDALDataTypeIsComplex*(a1: GDALDataType): cint {.impgdalC.}
proc GDALGetDataTypeName*(a1: GDALDataType): cstring {.impgdalC.}
proc GDALGetDataTypeByName*(a1: cstring): GDALDataType {.impgdalC.}
proc GDALDataTypeUnion*(a1: GDALDataType, a2: GDALDataType): GDALDataType {.impgdalC.}
proc GDALAdjustValueToDataType*(eDT: GDALDataType, dfValue: cdouble, pbClamped: ptr cint, pbRounded: ptr cint): cdouble {.impgdalC.}
proc GDALGetNonComplexDataType*(a1: GDALDataType): GDALDataType {.impgdalC.}
proc GDALGetAsyncStatusTypeName*(a1: GDALAsyncStatusType): cstring {.impgdalC.}
proc GDALGetAsyncStatusTypeByName*(a1: cstring): GDALAsyncStatusType {.impgdalC.}
proc GDALGetColorInterpretationName*(a1: GDALColorInterp): cstring {.impgdalC.}
proc GDALGetColorInterpretationByName*(pszName: cstring): GDALColorInterp {.impgdalC.}
proc GDALGetPaletteInterpretationName*(a1: GDALPaletteInterp): cstring {.impgdalC.}

#  ====================================================================
#       Registration/driver related.
#  ====================================================================
# * Long name of the driver
# * URL (relative to http:gdal.org/) to the help page of the driver
# * MIME type handled by the driver.
# * Extension handled by the driver.
# * Connection prefix to provide as the file name of the open function.
#  * Typically set for non-file based drivers. Generally used with open options.
#  * @since GDAL 2.0
# 
# * List of (space separated) extensions handled by the driver.
#  * @since GDAL 2.0
# 
# * XML snippet with creation options.
# * XML snippet with open options.
#  * @since GDAL 2.0
# 
# * List of (space separated) raster data types support by the Create()/CreateCopy() API.
# * List of (space separated) vector field types support by the CreateField() API.
#  * @since GDAL 2.0
#  *
# * Capability set by a driver that exposes Subdatasets.
# * Capability set by a driver that implements the Open() API.
# * Capability set by a driver that implements the Create() API.
# * Capability set by a driver that implements the CreateCopy() API.
# * Capability set by a driver that can read/create datasets through the VSI*L API.
# * Capability set by a driver having raster capability.
#  * @since GDAL 2.0
# 
# * Capability set by a driver having vector capability.
#  * @since GDAL 2.0
# 
# * Capability set by a driver having vector capability.
#  * @since GDAL 2.1
# 
# * Capability set by a driver that can create fields with NOT NULL constraint.
#  * @since GDAL 2.0
# 
# * Capability set by a driver that can create fields with DEFAULT values.
#  * @since GDAL 2.0
# 
# * Capability set by a driver that can create geometry fields with NOT NULL constraint.
#  * @since GDAL 2.0
# 
proc GDALAllRegister*() {.impgdalC.}
proc GDALCreate*(hDriver: GDALDriverH, a1: cstring, a2: cint, a3: cint, a4: cint, a5: GDALDataType, a6: ptr cstring): GDALDatasetH {.impgdalC.}
proc GDALCreateCopy*(a1: GDALDriverH, a2: cstring, a3: GDALDatasetH, a4: cint, a5: ptr cstring, a6: GDALProgressFunc, a7: pointer): GDALDatasetH {.impgdalC.}
proc GDALIdentifyDriver*(pszFilename: cstring, papszFileList: ptr cstring): GDALDriverH {.impgdalC.}
proc GDALIdentifyDriverEx*(pszFilename: cstring, nIdentifyFlags: cuint, papszAllowedDrivers: ptr cstring, papszFileList: ptr cstring): GDALDriverH {.impgdalC.}
proc GDALOpen*(pszFilename: cstring, eAccess: GDALAccess): GDALDatasetH {.impgdalC.}
proc GDALOpenShared*(a1: cstring, a2: GDALAccess): GDALDatasetH {.impgdalC.}
proc GDALOpenEx*(pszFilename: cstring, nOpenFlags: cuint, papszAllowedDrivers: ptr cstring, papszOpenOptions: ptr cstring, papszSiblingFiles: ptr cstring): GDALDatasetH {.impgdalC.}
proc GDALDumpOpenDatasets*(a1: ptr FILE): cint {.impgdalC.}
proc GDALGetDriverByName*(a1: cstring): GDALDriverH {.impgdalC.}
proc GDALGetDriverCount*(): cint {.impgdalC.}
proc GDALGetDriver*(a1: cint): GDALDriverH {.impgdalC.}
proc GDALCreateDriver*(): GDALDriverH {.impgdalC.}
proc GDALDestroyDriver*(a1: GDALDriverH) {.impgdalC.}
proc GDALRegisterDriver*(a1: GDALDriverH): cint {.impgdalC.}
proc GDALDeregisterDriver*(a1: GDALDriverH) {.impgdalC.}
proc GDALDestroyDriverManager*() {.impgdalC.}
proc GDALDestroy*() {.impgdalC.}
proc GDALDeleteDataset*(a1: GDALDriverH, a2: cstring): CPLErr {.impgdalC.}
proc GDALRenameDataset*(a1: GDALDriverH, pszNewName: cstring, pszOldName: cstring): CPLErr {.impgdalC.}
proc GDALCopyDatasetFiles*(a1: GDALDriverH, pszNewName: cstring, pszOldName: cstring): CPLErr {.impgdalC.}
proc GDALValidateCreationOptions*(a1: GDALDriverH, papszCreationOptions: ptr cstring): cint {.impgdalC.}

#  The following are deprecated
proc GDALGetDriverShortName*(a1: GDALDriverH): cstring {.impgdalC.}
proc GDALGetDriverLongName*(a1: GDALDriverH): cstring {.impgdalC.}
proc GDALGetDriverHelpTopic*(a1: GDALDriverH): cstring {.impgdalC.}
proc GDALGetDriverCreationOptionList*(a1: GDALDriverH): cstring {.impgdalC.}
proc GDALInitGCPs*(a1: cint, a2: ptr GDAL_GCP) {.impgdalC.}
proc GDALDeinitGCPs*(a1: cint, a2: ptr GDAL_GCP) {.impgdalC.}
proc GDALDuplicateGCPs*(a1: cint, a2: ptr GDAL_GCP): ptr GDAL_GCP {.impgdalC.}
proc GDALGCPsToGeoTransform*(nGCPCount: cint, pasGCPs: ptr GDAL_GCP, padfGeoTransform: ptr cdouble, bApproxOK: cint): cint {.impgdalC.}
proc GDALInvGeoTransform*(padfGeoTransformIn: ptr cdouble, padfInvGeoTransformOut: ptr cdouble): cint {.impgdalC.}
proc GDALApplyGeoTransform*(a1: ptr cdouble, a2: cdouble, a3: cdouble, a4: ptr cdouble, a5: ptr cdouble) {.impgdalC.}
proc GDALComposeGeoTransforms*(padfGeoTransform1: ptr cdouble, padfGeoTransform2: ptr cdouble, padfGeoTransformOut: ptr cdouble) {.impgdalC.}

#  ====================================================================
#       major objects (dataset, and, driver, drivermanager).
#  ====================================================================
proc GDALGetMetadataDomainList*(hObject: GDALMajorObjectH): ptr cstring {.impgdalC.}
proc GDALGetMetadata*(a1: GDALMajorObjectH, a2: cstring): ptr cstring {.impgdalC.}
proc GDALSetMetadata*(a1: GDALMajorObjectH, a2: ptr cstring, a3: cstring): CPLErr {.impgdalC.}
proc GDALGetMetadataItem*(a1: GDALMajorObjectH, a2: cstring, a3: cstring): cstring {.impgdalC.}
proc GDALSetMetadataItem*(a1: GDALMajorObjectH, a2: cstring, a3: cstring, a4: cstring): CPLErr {.impgdalC.}
proc GDALGetDescription*(a1: GDALMajorObjectH): cstring {.impgdalC.}
proc GDALSetDescription*(a1: GDALMajorObjectH, a2: cstring) {.impgdalC.}

#  ====================================================================
#       GDALDataset class ... normally this represents one file.
#  ====================================================================
# * Name of driver metadata item for layer creation option list
proc GDALGetDatasetDriver*(a1: GDALDatasetH): GDALDriverH {.impgdalC.}
proc GDALGetFileList*(a1: GDALDatasetH): ptr cstring {.impgdalC.}
proc GDALClose*(a1: GDALDatasetH) {.impgdalC.}
proc GDALGetRasterXSize*(a1: GDALDatasetH): cint {.impgdalC.}
proc GDALGetRasterYSize*(a1: GDALDatasetH): cint {.impgdalC.}
proc GDALGetRasterCount*(a1: GDALDatasetH): cint {.impgdalC.}
proc GDALGetRasterBand*(a1: GDALDatasetH, a2: cint): GDALRasterBandH {.impgdalC.}
proc GDALAddBand*(hDS: GDALDatasetH, eType: GDALDataType, papszOptions: ptr cstring): CPLErr {.impgdalC.}
proc GDALBeginAsyncReader*(hDS: GDALDatasetH, nXOff: cint, nYOff: cint, nXSize: cint, nYSize: cint, pBuf: pointer, nBufXSize: cint, nBufYSize: cint, eBufType: GDALDataType, nBandCount: cint, panBandMap: ptr cint, nPixelSpace: cint, nLineSpace: cint, nBandSpace: cint, papszOptions: ptr cstring): GDALAsyncReaderH {.impgdalC.}
proc GDALEndAsyncReader*(hDS: GDALDatasetH, hAsynchReaderH: GDALAsyncReaderH) {.impgdalC.}
proc GDALDatasetRasterIO*(hDS: GDALDatasetH, eRWFlag: GDALRWFlag, nDSXOff: cint, nDSYOff: cint, nDSXSize: cint, nDSYSize: cint, pBuffer: pointer, nBXSize: cint, nBYSize: cint, eBDataType: GDALDataType, nBandCount: cint, panBandCount: ptr cint, nPixelSpace: cint, nLineSpace: cint, nBandSpace: cint): CPLErr {.impgdalC.}
proc GDALDatasetRasterIOEx*(hDS: GDALDatasetH, eRWFlag: GDALRWFlag, nDSXOff: cint, nDSYOff: cint, nDSXSize: cint, nDSYSize: cint, pBuffer: pointer, nBXSize: cint, nBYSize: cint, eBDataType: GDALDataType, nBandCount: cint, panBandCount: ptr cint, nPixelSpace: GSpacing, nLineSpace: GSpacing, nBandSpace: GSpacing, psExtraArg: ptr GDALRasterIOExtraArg): CPLErr {.impgdalC.}
proc GDALDatasetAdviseRead*(hDS: GDALDatasetH, nDSXOff: cint, nDSYOff: cint, nDSXSize: cint, nDSYSize: cint, nBXSize: cint, nBYSize: cint, eBDataType: GDALDataType, nBandCount: cint, panBandCount: ptr cint, papszOptions: ptr cstring): CPLErr {.impgdalC.}
proc GDALGetProjectionRef*(a1: GDALDatasetH): cstring {.impgdalC.}
proc GDALSetProjection*(a1: GDALDatasetH, a2: cstring): CPLErr {.impgdalC.}
proc GDALGetGeoTransform*(a1: GDALDatasetH, a2: ptr cdouble): CPLErr {.impgdalC.}
proc GDALSetGeoTransform*(a1: GDALDatasetH, a2: ptr cdouble): CPLErr {.impgdalC.}
proc GDALGetGCPCount*(a1: GDALDatasetH): cint {.impgdalC.}
proc GDALGetGCPProjection*(a1: GDALDatasetH): cstring {.impgdalC.}
proc GDALGetGCPs*(a1: GDALDatasetH): ptr GDAL_GCP {.impgdalC.}
proc GDALSetGCPs*(a1: GDALDatasetH, a2: cint, a3: ptr GDAL_GCP, a4: cstring): CPLErr {.impgdalC.}
proc GDALGetInternalHandle*(a1: GDALDatasetH, a2: cstring): pointer {.impgdalC.}
proc GDALReferenceDataset*(a1: GDALDatasetH): cint {.impgdalC.}
proc GDALDereferenceDataset*(a1: GDALDatasetH): cint {.impgdalC.}
proc GDALReleaseDataset*(a1: GDALDatasetH): cint {.impgdalC.}
proc GDALBuildOverviews*(a1: GDALDatasetH, a2: cstring, a3: cint, a4: ptr cint, a5: cint, a6: ptr cint, a7: GDALProgressFunc, a8: pointer): CPLErr {.impgdalC.}
proc GDALGetOpenDatasets*(hDS: ptr ptr GDALDatasetH, pnCount: ptr cint) {.impgdalC.}
proc GDALGetAccess*(hDS: GDALDatasetH): cint {.impgdalC.}
proc GDALFlushCache*(hDS: GDALDatasetH) {.impgdalC.}
proc GDALCreateDatasetMaskBand*(hDS: GDALDatasetH, nFlags: cint): CPLErr {.impgdalC.}
proc GDALDatasetCopyWholeRaster*(hSrcDS: GDALDatasetH, hDstDS: GDALDatasetH, papszOptions: ptr cstring, pfnProgress: GDALProgressFunc, pProgressData: pointer): CPLErr {.impgdalC.}
proc GDALRasterBandCopyWholeRaster*(hSrcBand: GDALRasterBandH, hDstBand: GDALRasterBandH, constpapszOptions: ptr cstring, pfnProgress: GDALProgressFunc, pProgressData: pointer): CPLErr {.impgdalC.}
proc GDALRegenerateOverviews*(hSrcBand: GDALRasterBandH, nOverviewCount: cint, pahOverviewBands: ptr GDALRasterBandH, pszResampling: cstring, pfnProgress: GDALProgressFunc, pProgressData: pointer): CPLErr {.impgdalC.}
proc GDALDatasetGetLayerCount*(a1: GDALDatasetH): cint {.impgdalC.}
proc GDALDatasetGetLayer*(a1: GDALDatasetH, a2: cint): OGRLayerH {.impgdalC.}
proc GDALDatasetGetLayerByName*(a1: GDALDatasetH, a2: cstring): OGRLayerH {.impgdalC.}
proc GDALDatasetDeleteLayer*(a1: GDALDatasetH, a2: cint): OGRErr {.impgdalC.}
proc GDALDatasetCreateLayer*(a1: GDALDatasetH, a2: cstring, a3: OGRSpatialReferenceH, a4: OGRwkbGeometryType, a5: ptr cstring): OGRLayerH {.impgdalC.}
proc GDALDatasetCopyLayer*(a1: GDALDatasetH, a2: OGRLayerH, a3: cstring, a4: ptr cstring): OGRLayerH {.impgdalC.}
proc GDALDatasetResetReading*(a1: GDALDatasetH) {.impgdalC.}
proc GDALDatasetGetNextFeature*(hDS: GDALDatasetH, phBelongingLayer: ptr OGRLayerH, pdfProgressPct: ptr cdouble, pfnProgress: GDALProgressFunc, pProgressData: pointer): OGRFeatureH {.impgdalC.}
proc GDALDatasetTestCapability*(a1: GDALDatasetH, a2: cstring): cint {.impgdalC.}
proc GDALDatasetExecuteSQL*(a1: GDALDatasetH, a2: cstring, a3: OGRGeometryH, a4: cstring): OGRLayerH {.impgdalC.}
proc GDALDatasetReleaseResultSet*(a1: GDALDatasetH, a2: OGRLayerH) {.impgdalC.}
proc GDALDatasetGetStyleTable*(a1: GDALDatasetH): OGRStyleTableH {.impgdalC.}
proc GDALDatasetSetStyleTableDirectly*(a1: GDALDatasetH, a2: OGRStyleTableH) {.impgdalC.}
proc GDALDatasetSetStyleTable*(a1: GDALDatasetH, a2: OGRStyleTableH) {.impgdalC.}
proc GDALDatasetStartTransaction*(hDS: GDALDatasetH, bForce: cint): OGRErr {.impgdalC.}
proc GDALDatasetCommitTransaction*(hDS: GDALDatasetH): OGRErr {.impgdalC.}
proc GDALDatasetRollbackTransaction*(hDS: GDALDatasetH): OGRErr {.impgdalC.}
proc GDALGetRasterDataType*(a1: GDALRasterBandH): GDALDataType {.impgdalC.}
proc GDALGetBlockSize*(a1: GDALRasterBandH, pnXSize: ptr cint, pnYSize: ptr cint) {.impgdalC.}
proc GDALGetActualBlockSize*(a1: GDALRasterBandH, nXBlockOff: cint, nYBlockOff: cint, pnXValid: ptr cint, pnYValid: ptr cint): CPLErr {.impgdalC.}
proc GDALRasterAdviseRead*(hRB: GDALRasterBandH, nDSXOff: cint, nDSYOff: cint, nDSXSize: cint, nDSYSize: cint, nBXSize: cint, nBYSize: cint, eBDataType: GDALDataType, papszOptions: ptr cstring): CPLErr {.impgdalC.}
proc GDALRasterIO*(hRBand: GDALRasterBandH, eRWFlag: GDALRWFlag, nDSXOff: cint, nDSYOff: cint, nDSXSize: cint, nDSYSize: cint, pBuffer: pointer, nBXSize: cint, nBYSize: cint, eBDataType: GDALDataType, nPixelSpace: cint, nLineSpace: cint): CPLErr {.impgdalC.}
proc GDALRasterIOEx*(hRBand: GDALRasterBandH, eRWFlag: GDALRWFlag, nDSXOff: cint, nDSYOff: cint, nDSXSize: cint, nDSYSize: cint, pBuffer: pointer, nBXSize: cint, nBYSize: cint, eBDataType: GDALDataType, nPixelSpace: GSpacing, nLineSpace: GSpacing, psExtraArg: ptr GDALRasterIOExtraArg): CPLErr {.impgdalC.}
proc GDALReadBlock*(a1: GDALRasterBandH, a2: cint, a3: cint, a4: pointer): CPLErr {.impgdalC.}
proc GDALWriteBlock*(a1: GDALRasterBandH, a2: cint, a3: cint, a4: pointer): CPLErr {.impgdalC.}
proc GDALGetRasterBandXSize*(a1: GDALRasterBandH): cint {.impgdalC.}
proc GDALGetRasterBandYSize*(a1: GDALRasterBandH): cint {.impgdalC.}
proc GDALGetRasterAccess*(a1: GDALRasterBandH): GDALAccess {.impgdalC.}
proc GDALGetBandNumber*(a1: GDALRasterBandH): cint {.impgdalC.}
proc GDALGetBandDataset*(a1: GDALRasterBandH): GDALDatasetH {.impgdalC.}
proc GDALGetRasterColorInterpretation*(a1: GDALRasterBandH): GDALColorInterp {.impgdalC.}
proc GDALSetRasterColorInterpretation*(a1: GDALRasterBandH, a2: GDALColorInterp): CPLErr {.impgdalC.}
proc GDALGetRasterColorTable*(a1: GDALRasterBandH): GDALColorTableH {.impgdalC.}
proc GDALSetRasterColorTable*(a1: GDALRasterBandH, a2: GDALColorTableH): CPLErr {.impgdalC.}
proc GDALHasArbitraryOverviews*(a1: GDALRasterBandH): cint {.impgdalC.}
proc GDALGetOverviewCount*(a1: GDALRasterBandH): cint {.impgdalC.}
proc GDALGetOverview*(a1: GDALRasterBandH, a2: cint): GDALRasterBandH {.impgdalC.}
proc GDALGetRasterNoDataValue*(a1: GDALRasterBandH, a2: ptr cint): cdouble {.impgdalC.}
proc GDALSetRasterNoDataValue*(a1: GDALRasterBandH, a2: cdouble): CPLErr {.impgdalC.}
proc GDALDeleteRasterNoDataValue*(a1: GDALRasterBandH): CPLErr {.impgdalC.}
proc GDALGetRasterCategoryNames*(a1: GDALRasterBandH): ptr cstring {.impgdalC.}
proc GDALSetRasterCategoryNames*(a1: GDALRasterBandH, a2: ptr cstring): CPLErr {.impgdalC.}
proc GDALGetRasterMinimum*(a1: GDALRasterBandH, pbSuccess: ptr cint): cdouble {.impgdalC.}
proc GDALGetRasterMaximum*(a1: GDALRasterBandH, pbSuccess: ptr cint): cdouble {.impgdalC.}
proc GDALGetRasterStatistics*(a1: GDALRasterBandH, bApproxOK: cint, bForce: cint, pdfMin: ptr cdouble, pdfMax: ptr cdouble, pdfMean: ptr cdouble, pdfStdDev: ptr cdouble): CPLErr {.impgdalC.}
proc GDALComputeRasterStatistics*(a1: GDALRasterBandH, bApproxOK: cint, pdfMin: ptr cdouble, pdfMax: ptr cdouble, pdfMean: ptr cdouble, pdfStdDev: ptr cdouble, pfnProgress: GDALProgressFunc, pProgressData: pointer): CPLErr {.impgdalC.}
proc GDALSetRasterStatistics*(hBand: GDALRasterBandH, dfMin: cdouble, dfMax: cdouble, dfMean: cdouble, dfStdDev: cdouble): CPLErr {.impgdalC.}
proc GDALGetRasterUnitType*(a1: GDALRasterBandH): cstring {.impgdalC.}
proc GDALSetRasterUnitType*(hBand: GDALRasterBandH, pszNewValue: cstring): CPLErr {.impgdalC.}
proc GDALGetRasterOffset*(a1: GDALRasterBandH, pbSuccess: ptr cint): cdouble {.impgdalC.}
proc GDALSetRasterOffset*(hBand: GDALRasterBandH, dfNewOffset: cdouble): CPLErr {.impgdalC.}
proc GDALGetRasterScale*(a1: GDALRasterBandH, pbSuccess: ptr cint): cdouble {.impgdalC.}
proc GDALSetRasterScale*(hBand: GDALRasterBandH, dfNewOffset: cdouble): CPLErr {.impgdalC.}
proc GDALFlushRasterCache*(hBand: GDALRasterBandH): CPLErr {.impgdalC.}
proc GDALGetRasterHistogram*(hBand: GDALRasterBandH, dfMin: cdouble, dfMax: cdouble, nBuckets: cint, panHistogram: ptr cint, bIncludeOutOfRange: cint, bApproxOK: cint, pfnProgress: GDALProgressFunc, pProgressData: pointer): CPLErr {.impgdalC.}
proc GDALGetRasterHistogramEx*(hBand: GDALRasterBandH, dfMin: cdouble, dfMax: cdouble, nBuckets: cint, panHistogram: ptr GUIntBig, bIncludeOutOfRange: cint, bApproxOK: cint, pfnProgress: GDALProgressFunc, pProgressData: pointer): CPLErr {.impgdalC.}
proc GDALGetDefaultHistogram*(hBand: GDALRasterBandH, pdfMin: ptr cdouble, pdfMax: ptr cdouble, pnBuckets: ptr cint, ppanHistogram: ptr ptr cint, bForce: cint, pfnProgress: GDALProgressFunc, pProgressData: pointer): CPLErr {.impgdalC.}
proc GDALGetDefaultHistogramEx*(hBand: GDALRasterBandH, pdfMin: ptr cdouble, pdfMax: ptr cdouble, pnBuckets: ptr cint, ppanHistogram: ptr ptr GUIntBig, bForce: cint, pfnProgress: GDALProgressFunc, pProgressData: pointer): CPLErr {.impgdalC.}
proc GDALSetDefaultHistogram*(hBand: GDALRasterBandH, dfMin: cdouble, dfMax: cdouble, nBuckets: cint, panHistogram: ptr cint): CPLErr {.impgdalC.}
proc GDALSetDefaultHistogramEx*(hBand: GDALRasterBandH, dfMin: cdouble, dfMax: cdouble, nBuckets: cint, panHistogram: ptr GUIntBig): CPLErr {.impgdalC.}
proc GDALGetRandomRasterSample*(a1: GDALRasterBandH, a2: cint, a3: ptr cfloat): cint {.impgdalC.}
proc GDALGetRasterSampleOverview*(a1: GDALRasterBandH, a2: cint): GDALRasterBandH {.impgdalC.}
proc GDALGetRasterSampleOverviewEx*(a1: GDALRasterBandH, a2: GUIntBig): GDALRasterBandH {.impgdalC.}
proc GDALFillRaster*(hBand: GDALRasterBandH, dfRealValue: cdouble, dfImaginaryValue: cdouble): CPLErr {.impgdalC.}
proc GDALComputeBandStats*(hBand: GDALRasterBandH, nSampleStep: cint, pdfMean: ptr cdouble, pdfStdDev: ptr cdouble, pfnProgress: GDALProgressFunc, pProgressData: pointer): CPLErr {.impgdalC.}
proc GDALOverviewMagnitudeCorrection*(hBaseBand: GDALRasterBandH, nOverviewCount: cint, pahOverviews: ptr GDALRasterBandH, pfnProgress: GDALProgressFunc, pProgressData: pointer): CPLErr {.impgdalC.}
proc GDALGetDefaultRAT*(hBand: GDALRasterBandH): GDALRasterAttributeTableH {.impgdalC.}
proc GDALSetDefaultRAT*(a1: GDALRasterBandH, a2: GDALRasterAttributeTableH): CPLErr {.impgdalC.}
proc GDALAddDerivedBandPixelFunc*(pszName: cstring, pfnPixelFunc: GDALDerivedPixelFunc): CPLErr {.impgdalC.}
proc GDALGetMaskBand*(hBand: GDALRasterBandH): GDALRasterBandH {.impgdalC.}
proc GDALGetMaskFlags*(hBand: GDALRasterBandH): cint {.impgdalC.}
proc GDALCreateMaskBand*(hBand: GDALRasterBandH, nFlags: cint): CPLErr {.impgdalC.}
proc GDALGetDataCoverageStatus*(hBand: GDALRasterBandH, nXOff: cint, nYOff: cint, nXSize: cint, nYSize: cint, nMaskFlagStop: cint, pdfDataPct: ptr cdouble): cint {.impgdalC.}

#  ====================================================================
#      GDALAsyncReader
#  ====================================================================
proc GDALARGetNextUpdatedRegion*(hARIO: GDALAsyncReaderH, dfTimeout: cdouble, pnXBufOff: ptr cint, pnYBufOff: ptr cint, pnXBufSize: ptr cint, pnYBufSize: ptr cint): GDALAsyncStatusType {.impgdalC.}
proc GDALARLockBuffer*(hARIO: GDALAsyncReaderH, dfTimeout: cdouble): cint {.impgdalC.}
proc GDALARUnlockBuffer*(hARIO: GDALAsyncReaderH) {.impgdalC.}

#  --------------------------------------------------------------------
#       Helper functions.
#  --------------------------------------------------------------------
proc GDALSwapWords*(pData: pointer, nWordSize: cint, nWordCount: cint, nWordSkip: cint) {.impgdalC.}
proc GDALSwapWordsEx*(pData: pointer, nWordSize: cint, nWordCount: cuint, nWordSkip: cint) {.impgdalC.}
proc GDALCopyBits*(pabySrcData: ptr GByte, nSrcOffset: cint, nSrcStep: cint, pabyDstData: ptr GByte, nDstOffset: cint, nDstStep: cint, nBitCount: cint, nStepCount: cint) {.impgdalC.}
proc GDALLoadWorldFile*(a1: cstring, a2: ptr cdouble): cint {.impgdalC.}
proc GDALReadWorldFile*(a1: cstring, a2: cstring, a3: ptr cdouble): cint {.impgdalC.}
proc GDALWriteWorldFile*(a1: cstring, a2: cstring, a3: ptr cdouble): cint {.impgdalC.}
proc GDALLoadTabFile*(a1: cstring, a2: ptr cdouble, a3: ptr cstring, a4: ptr cint, a5: ptr ptr GDAL_GCP): cint {.impgdalC.}
proc GDALReadTabFile*(a1: cstring, a2: ptr cdouble, a3: ptr cstring, a4: ptr cint, a5: ptr ptr GDAL_GCP): cint {.impgdalC.}
proc GDALLoadOziMapFile*(a1: cstring, a2: ptr cdouble, a3: ptr cstring, a4: ptr cint, a5: ptr ptr GDAL_GCP): cint {.impgdalC.}
proc GDALReadOziMapFile*(a1: cstring, a2: ptr cdouble, a3: ptr cstring, a4: ptr cint, a5: ptr ptr GDAL_GCP): cint {.impgdalC.}
proc GDALDecToDMS*(a1: cdouble, a2: cstring, a3: cint): cstring {.impgdalC.}
proc GDALPackedDMSToDec*(a1: cdouble): cdouble {.impgdalC.}
proc GDALDecToPackedDMS*(a1: cdouble): cdouble {.impgdalC.}
proc GDALExtractRPCInfo*(a1: ptr cstring, a2: ptr GDALRPCInfo): cint {.impgdalC.}
proc GDALCreateColorTable*(a1: GDALPaletteInterp): GDALColorTableH {.impgdalC.}
proc GDALDestroyColorTable*(a1: GDALColorTableH) {.impgdalC.}
proc GDALCloneColorTable*(a1: GDALColorTableH): GDALColorTableH {.impgdalC.}
proc GDALGetPaletteInterpretation*(a1: GDALColorTableH): GDALPaletteInterp {.impgdalC.}
proc GDALGetColorEntryCount*(a1: GDALColorTableH): cint {.impgdalC.}
proc GDALGetColorEntry*(a1: GDALColorTableH, a2: cint): ptr GDALColorEntry {.impgdalC.}
proc GDALGetColorEntryAsRGB*(a1: GDALColorTableH, a2: cint, a3: ptr GDALColorEntry): cint {.impgdalC.}
proc GDALSetColorEntry*(a1: GDALColorTableH, a2: cint, a3: ptr GDALColorEntry) {.impgdalC.}
proc GDALCreateColorRamp*(hTable: GDALColorTableH, nStartIndex: cint, psStartColor: ptr GDALColorEntry, nEndIndex: cint, psEndColor: ptr GDALColorEntry) {.impgdalC.}
proc GDALCreateRasterAttributeTable*(): GDALRasterAttributeTableH {.impgdalC.}
proc GDALDestroyRasterAttributeTable*(a1: GDALRasterAttributeTableH) {.impgdalC.}
proc GDALRATGetColumnCount*(a1: GDALRasterAttributeTableH): cint {.impgdalC.}
proc GDALRATGetNameOfCol*(a1: GDALRasterAttributeTableH, a2: cint): cstring {.impgdalC.}
proc GDALRATGetUsageOfCol*(a1: GDALRasterAttributeTableH, a2: cint): GDALRATFieldUsage {.impgdalC.}
proc GDALRATGetTypeOfCol*(a1: GDALRasterAttributeTableH, a2: cint): GDALRATFieldType {.impgdalC.}
proc GDALRATGetColOfUsage*(a1: GDALRasterAttributeTableH, a2: GDALRATFieldUsage): cint {.impgdalC.}
proc GDALRATGetRowCount*(a1: GDALRasterAttributeTableH): cint {.impgdalC.}
proc GDALRATGetValueAsString*(a1: GDALRasterAttributeTableH, a2: cint, a3: cint): cstring {.impgdalC.}
proc GDALRATGetValueAsInt*(a1: GDALRasterAttributeTableH, a2: cint, a3: cint): cint {.impgdalC.}
proc GDALRATGetValueAsDouble*(a1: GDALRasterAttributeTableH, a2: cint, a3: cint): cdouble {.impgdalC.}
proc GDALRATSetValueAsString*(a1: GDALRasterAttributeTableH, a2: cint, a3: cint, a4: cstring) {.impgdalC.}
proc GDALRATSetValueAsInt*(a1: GDALRasterAttributeTableH, a2: cint, a3: cint, a4: cint) {.impgdalC.}
proc GDALRATSetValueAsDouble*(a1: GDALRasterAttributeTableH, a2: cint, a3: cint, a4: cdouble) {.impgdalC.}
proc GDALRATChangesAreWrittenToFile*(hRAT: GDALRasterAttributeTableH): cint {.impgdalC.}
proc GDALRATValuesIOAsDouble*(hRAT: GDALRasterAttributeTableH, eRWFlag: GDALRWFlag, iField: cint, iStartRow: cint, iLength: cint, pdfData: ptr cdouble): CPLErr {.impgdalC.}
proc GDALRATValuesIOAsInteger*(hRAT: GDALRasterAttributeTableH, eRWFlag: GDALRWFlag, iField: cint, iStartRow: cint, iLength: cint, pnData: ptr cint): CPLErr {.impgdalC.}
proc GDALRATValuesIOAsString*(hRAT: GDALRasterAttributeTableH, eRWFlag: GDALRWFlag, iField: cint, iStartRow: cint, iLength: cint, papszStrList: ptr cstring): CPLErr {.impgdalC.}
proc GDALRATSetRowCount*(a1: GDALRasterAttributeTableH, a2: cint) {.impgdalC.}
proc GDALRATCreateColumn*(a1: GDALRasterAttributeTableH, a2: cstring, a3: GDALRATFieldType, a4: GDALRATFieldUsage): CPLErr {.impgdalC.}
proc GDALRATSetLinearBinning*(a1: GDALRasterAttributeTableH, a2: cdouble, a3: cdouble): CPLErr {.impgdalC.}
proc GDALRATGetLinearBinning*(a1: GDALRasterAttributeTableH, a2: ptr cdouble, a3: ptr cdouble): cint {.impgdalC.}
proc GDALRATInitializeFromColorTable*(a1: GDALRasterAttributeTableH, a2: GDALColorTableH): CPLErr {.impgdalC.}
proc GDALRATTranslateToColorTable*(a1: GDALRasterAttributeTableH, nEntryCount: cint): GDALColorTableH {.impgdalC.}
proc GDALRATDumpReadable*(a1: GDALRasterAttributeTableH, a2: ptr FILE) {.impgdalC.}
proc GDALRATClone*(a1: GDALRasterAttributeTableH): GDALRasterAttributeTableH {.impgdalC.}
proc GDALRATSerializeJSON*(a1: GDALRasterAttributeTableH): pointer {.impgdalC.}
proc GDALRATGetRowOfValue*(a1: GDALRasterAttributeTableH, a2: cdouble): cint {.impgdalC.}

#  ====================================================================
#       GDAL Cache Management
#  ====================================================================
proc GDALSetCacheMax*(nBytes: cint) {.impgdalC.}
proc GDALGetCacheMax*(): cint {.impgdalC.}
proc GDALGetCacheUsed*(): cint {.impgdalC.}
proc GDALSetCacheMax64*(nBytes: GIntBig) {.impgdalC.}
proc GDALGetCacheMax64*(): GIntBig {.impgdalC.}
proc GDALGetCacheUsed64*(): GIntBig {.impgdalC.}
proc GDALFlushCacheBlock*(): cint {.impgdalC.}

#  ====================================================================
#       GDAL virtual memory
#  ====================================================================
proc GDALDatasetGetVirtualMem*(hDS: GDALDatasetH, eRWFlag: GDALRWFlag, nXOff: cint, nYOff: cint, nXSize: cint, nYSize: cint, nBufXSize: cint, nBufYSize: cint, eBufType: GDALDataType, nBandCount: cint, panBandMap: ptr cint, nPixelSpace: cint, nLineSpace: GIntBig, nBandSpace: GIntBig, nCacheSize: cuint, nPageSizeHint: cuint, bSingleThreadUsage: cint, papszOptions: ptr cstring): ptr CPLVirtualMem {.impgdalC.}
proc GDALRasterBandGetVirtualMem*(hBand: GDALRasterBandH, eRWFlag: GDALRWFlag, nXOff: cint, nYOff: cint, nXSize: cint, nYSize: cint, nBufXSize: cint, nBufYSize: cint, eBufType: GDALDataType, nPixelSpace: cint, nLineSpace: GIntBig, nCacheSize: cuint, nPageSizeHint: cuint, bSingleThreadUsage: cint, papszOptions: ptr cstring): ptr CPLVirtualMem {.impgdalC.}
proc GDALGetVirtualMemAuto*(hBand: GDALRasterBandH, eRWFlag: GDALRWFlag, pnPixelSpace: ptr cint, pnLineSpace: ptr GIntBig, papszOptions: ptr cstring): ptr CPLVirtualMem {.impgdalC.}
proc GDALDatasetGetTiledVirtualMem*(hDS: GDALDatasetH, eRWFlag: GDALRWFlag, nXOff: cint, nYOff: cint, nXSize: cint, nYSize: cint, nTileXSize: cint, nTileYSize: cint, eBufType: GDALDataType, nBandCount: cint, panBandMap: ptr cint, eTileOrganization: GDALTileOrganization, nCacheSize: cuint, bSingleThreadUsage: cint, papszOptions: ptr cstring): ptr CPLVirtualMem {.impgdalC.}
proc GDALRasterBandGetTiledVirtualMem*(hBand: GDALRasterBandH, eRWFlag: GDALRWFlag, nXOff: cint, nYOff: cint, nXSize: cint, nYSize: cint, nTileXSize: cint, nTileYSize: cint, eBufType: GDALDataType, nCacheSize: cuint, bSingleThreadUsage: cint, papszOptions: ptr cstring): ptr CPLVirtualMem {.impgdalC.}

#  ====================================================================
#       VRTPansharpenedDataset class.
#  ====================================================================
proc GDALCreatePansharpenedVRT*(pszXML: cstring, hPanchroBand: GDALRasterBandH, nInputSpectralBands: cint, pahInputSpectralBands: ptr GDALRasterBandH): GDALDatasetH {.impgdalC.}

#  ===================================================================
#       Misc API
#  ====================================================================
proc GDALGetJPEG2000Structure*(pszFilename: cstring, papszOptions: ptr cstring): ptr CPLXMLNode {.impgdalC.}


