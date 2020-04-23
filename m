Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CFC1B59D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 13:00:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497DqZ5HPqzDr0p
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 21:00:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497Dhz2qWhzDqt0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 20:54:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 497Dhz11Z6z9BL0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 20:54:59 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 497Dhz08h5z9sT2; Thu, 23 Apr 2020 20:54:59 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 497Dhy2xxnz9sSt
 for <linuxppc-dev@ozlabs.org>; Thu, 23 Apr 2020 20:54:58 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03NAXI2J049030
 for <linuxppc-dev@ozlabs.org>; Thu, 23 Apr 2020 06:54:56 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30jsput4jn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 23 Apr 2020 06:54:56 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <psampat@linux.ibm.com>;
 Thu, 23 Apr 2020 11:54:05 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 23 Apr 2020 11:54:02 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 03NArhSW62652870
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Apr 2020 10:53:43 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B08A42042;
 Thu, 23 Apr 2020 10:54:50 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE08E4203F;
 Thu, 23 Apr 2020 10:54:47 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.79.176.162])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 23 Apr 2020 10:54:47 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, mpe@ellerman.id.au, 
 skiboot@lists.ozlabs.org, oohall@gmail.com, ego@linux.vnet.ibm.com,
 linuxram@us.ibm.com, pratik.r.sampat@gmail.com, psampat@linux.ibm.com
Subject: [PATCH v8 2/3] API to verify the STOP API and image compatibility
Date: Thu, 23 Apr 2020 16:24:37 +0530
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200423105438.29034-1-psampat@linux.ibm.com>
References: <20200423105438.29034-1-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20042310-0016-0000-0000-00000309D1F0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042310-0017-0000-0000-0000336DF305
Message-Id: <20200423105438.29034-3-psampat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_07:2020-04-22,
 2020-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004230082
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Prem Shanker Jha <premjha2@in.ibm.com>

Commit defines a new API primarily intended for OPAL to determine
cpu register save API's compatibility with HOMER layout and
self save restore. It can help OPAL determine if version of
API integrated with OPAL is different from hostboot.

Change-Id: Ic0de45a336cfb8b6b6096a10ac1cd3ffbaa44fc0
Reviewed-on: http://rchgit01.rchland.ibm.com/gerrit1/77612
Tested-by: FSP CI Jenkins <fsp-CI-jenkins+hostboot@us.ibm.com>
Tested-by: Jenkins Server <pfd-jenkins+hostboot@us.ibm.com>
Tested-by: Hostboot CI <hostboot-ci+hostboot@us.ibm.com>
Reviewed-by: RANGANATHPRASAD G. BRAHMASAMUDRA <prasadbgr@in.ibm.com>
Reviewed-by: Gregory S Still <stillgs@us.ibm.com>
Reviewed-by: Jennifer A Stofer <stofer@us.ibm.com>
Reviewed-on: http://rchgit01.rchland.ibm.com/gerrit1/77614
Tested-by: Jenkins OP Build CI <op-jenkins+hostboot@us.ibm.com>
Tested-by: Jenkins OP HW <op-hw-jenkins+hostboot@us.ibm.com>
Reviewed-by: Daniel M Crowell <dcrowell@us.ibm.com>
Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
---
 include/p9_stop_api.H                    | 25 ++++++++++
 libpore/p9_cpu_reg_restore_instruction.H |  7 ++-
 libpore/p9_hcd_memmap_base.H             |  7 +++
 libpore/p9_stop_api.C                    | 58 +++++++++++++++++++++++-
 libpore/p9_stop_api.H                    | 26 ++++++++++-
 libpore/p9_stop_util.H                   | 20 ++++----
 6 files changed, 130 insertions(+), 13 deletions(-)

diff --git a/include/p9_stop_api.H b/include/p9_stop_api.H
index 9d3bc1e5..cb5ffd6f 100644
--- a/include/p9_stop_api.H
+++ b/include/p9_stop_api.H
@@ -107,6 +107,7 @@ typedef enum
     STOP_SAVE_FAIL                       = 14,  // for internal failure within firmware.
     STOP_SAVE_SPR_ENTRY_MISSING          =  15,
     STOP_SAVE_SPR_BIT_POS_RESERVE        =  16,
+    STOP_SAVE_API_IMG_INCOMPATIBLE       =  18,
 } StopReturnCode_t;
 
 /**
@@ -161,6 +162,14 @@ typedef enum
 
 } ScomSection_t;
 
+/**
+ * @brief   versions pertaining relvant to STOP API.
+ */
+typedef enum
+{
+    STOP_API_VER            =   0x00,
+    STOP_API_VER_CONTROL    =   0x02,
+} VersionList_t;
 
 
 /**
@@ -192,6 +201,14 @@ typedef enum
     BIT_POS_USPRG1      =   30,
 } SprBitPositionList_t;
 
+typedef enum
+{
+    SMF_SUPPORT_MISSING_IN_HOMER         =   0x01,
+    SELF_SUPPORT_MISSING_FOR_LE_HYP      =   0x02,
+    IPL_RUNTIME_CPU_SAVE_VER_MISMATCH    =   0x04,
+    SELF_RESTORE_VER_MISMATCH            =   0x08,
+} VersionIncompList_t;
+
 #ifdef __cplusplus
 extern "C" {
 #endif
@@ -230,6 +247,14 @@ StopReturnCode_t p9_stop_save_scom( void* const   i_pImage,
                                     const ScomOperation_t i_operation,
                                     const ScomSection_t i_section );
 
+/**
+ * @brief       verifies if API is compatible of current HOMER image.
+ * @param[in]   i_pImage        points to the start of HOMER image of P9 chip.
+ * @param[out]  o_inCompVector  list of incompatibilities found.
+ * @return      STOP_SAVE_SUCCESS if if API succeeds, error code otherwise.
+ */
+StopReturnCode_t proc_stop_api_discover_capability( void* const i_pImage, uint64_t* o_inCompVector );
+
 #ifdef __cplusplus
 } // extern "C"
 };  // namespace stopImageSection ends
diff --git a/libpore/p9_cpu_reg_restore_instruction.H b/libpore/p9_cpu_reg_restore_instruction.H
index d69a4212..5f168855 100644
--- a/libpore/p9_cpu_reg_restore_instruction.H
+++ b/libpore/p9_cpu_reg_restore_instruction.H
@@ -5,7 +5,7 @@
 /*                                                                        */
 /* OpenPOWER HostBoot Project                                             */
 /*                                                                        */
-/* Contributors Listed Below - COPYRIGHT 2015,2018                        */
+/* Contributors Listed Below - COPYRIGHT 2015,2020                        */
 /* [+] International Business Machines Corp.                              */
 /*                                                                        */
 /*                                                                        */
@@ -69,6 +69,11 @@ enum
     OPCODE_18           =   18,
     SELF_SAVE_FUNC_ADD  =   0x2300,
     SELF_SAVE_OFFSET    =   0x180,
+    SKIP_SPR_REST_INST  =   0x4800001c, //b . +0x01c
+    MFLR_R30            =   0x7fc802a6,
+    SKIP_SPR_SELF_SAVE  =   0x3bff0020, //addi r31 r31, 0x20
+    MTLR_INST           =   0x7fc803a6,  //mtlr r30
+    BRANCH_BE_INST      =   0x48000020,
 };
 
 #define MR_R0_TO_R10            0x7c0a0378UL //mr r10 r0
diff --git a/libpore/p9_hcd_memmap_base.H b/libpore/p9_hcd_memmap_base.H
index 000fafef..ddb56728 100644
--- a/libpore/p9_hcd_memmap_base.H
+++ b/libpore/p9_hcd_memmap_base.H
@@ -444,6 +444,13 @@ HCD_CONST(CME_QUAD_PSTATE_SIZE,                 HALF_KB)
 
 HCD_CONST(CME_REGION_SIZE,                      (64 * ONE_KB))
 
+
+// HOMER compatibility
+
+HCD_CONST(STOP_API_CPU_SAVE_VER,                0x02)
+HCD_CONST(SELF_SAVE_RESTORE_VER,                0x02)
+HCD_CONST(SMF_SUPPORT_SIGNATURE_OFFSET,         0x1300)
+HCD_CONST(SMF_SELF_SIGNATURE,                   (0x5f534d46))
 // Debug
 
 HCD_CONST(CPMR_TRACE_REGION_OFFSET,             (512 * ONE_KB))
diff --git a/libpore/p9_stop_api.C b/libpore/p9_stop_api.C
index 2d9bb549..10e050a1 100644
--- a/libpore/p9_stop_api.C
+++ b/libpore/p9_stop_api.C
@@ -5,7 +5,7 @@
 /*                                                                        */
 /* OpenPOWER HostBoot Project                                             */
 /*                                                                        */
-/* Contributors Listed Below - COPYRIGHT 2015,2018                        */
+/* Contributors Listed Below - COPYRIGHT 2015,2020                        */
 /* [+] International Business Machines Corp.                              */
 /*                                                                        */
 /*                                                                        */
@@ -1828,6 +1828,62 @@ StopReturnCode_t proc_stop_init_self_save(  void* const i_pImage, const uint32_t
     return l_rc;
 }
 
+StopReturnCode_t proc_stop_api_discover_capability( void* const i_pImage, uint64_t * o_inCompVector )
+{
+    StopReturnCode_t l_rc       =   STOP_SAVE_SUCCESS;
+    uint64_t l_incompVector     =   0;
+    uint32_t l_tempWord         =   0;
+    *o_inCompVector             =   0;
+
+    do
+    {
+        if( !i_pImage )
+        {
+            l_rc    =   STOP_SAVE_ARG_INVALID_IMG;
+            break;
+        }
+
+        l_tempWord      =
+                *(uint32_t*)((uint8_t*)i_pImage + CPMR_HOMER_OFFSET + SMF_SUPPORT_SIGNATURE_OFFSET);
+
+        if( l_tempWord != SWIZZLE_4_BYTE(SMF_SELF_SIGNATURE) )
+        {
+            l_incompVector  |=  SMF_SUPPORT_MISSING_IN_HOMER;
+        }
+
+        l_tempWord      =   *(uint32_t *)((uint8_t *)i_pImage + CPMR_HOMER_OFFSET + CPMR_HEADER_SIZE );
+
+        if( l_tempWord != SWIZZLE_4_BYTE(BRANCH_BE_INST) )
+        {
+            l_incompVector  |=  SELF_SUPPORT_MISSING_FOR_LE_HYP;
+        }
+
+        l_tempWord      =   *(uint8_t *)((uint8_t *)i_pImage + CPMR_HOMER_OFFSET + CPMR_SELF_RESTORE_VER_BYTE );
+
+        if( l_tempWord < SELF_SAVE_RESTORE_VER )
+        {
+            l_incompVector  |=  SELF_RESTORE_VER_MISMATCH;
+        }
+
+        l_tempWord      =   *(uint8_t *)((uint8_t *)i_pImage + CPMR_HOMER_OFFSET + CPMR_STOP_API_VER_BYTE );
+
+        if( l_tempWord < STOP_API_CPU_SAVE_VER )
+        {
+            l_incompVector  |=  IPL_RUNTIME_CPU_SAVE_VER_MISMATCH;
+        }
+
+        *o_inCompVector     =   l_incompVector;
+
+        if( l_incompVector )
+        {
+            l_rc    =  STOP_SAVE_API_IMG_INCOMPATIBLE;
+        }
+
+    }while(0);
+
+    return l_rc;
+}
+
 #ifdef __cplusplus
 } //namespace stopImageSection ends
 
diff --git a/libpore/p9_stop_api.H b/libpore/p9_stop_api.H
index 3f6420ff..983a3845 100644
--- a/libpore/p9_stop_api.H
+++ b/libpore/p9_stop_api.H
@@ -5,7 +5,7 @@
 /*                                                                        */
 /* OpenPOWER HostBoot Project                                             */
 /*                                                                        */
-/* Contributors Listed Below - COPYRIGHT 2015,2018                        */
+/* Contributors Listed Below - COPYRIGHT 2015,2020                        */
 /* [+] International Business Machines Corp.                              */
 /*                                                                        */
 /*                                                                        */
@@ -114,6 +114,7 @@ typedef enum
     STOP_SAVE_FAIL                       =  14,  // for internal failure within firmware.
     STOP_SAVE_SPR_ENTRY_MISSING          =  15,
     STOP_SAVE_SPR_BIT_POS_RESERVE        =  16,
+    STOP_SAVE_API_IMG_INCOMPATIBLE       =  18,
 } StopReturnCode_t;
 
 /**
@@ -198,6 +199,21 @@ typedef enum
     BIT_POS_USPRG1      =   30,
 } SprBitPositionList_t;
 
+/**
+ * @brief   List of major incompatibilities between API version.
+ * @note    STOP APIs assumes a specific HOMER layout, certain
+ * level of CME-SGPE hcode and certain version of self-save restore
+ * binary. A mismatch can break STOP function.
+ */
+
+typedef enum
+{
+    SMF_SUPPORT_MISSING_IN_HOMER         =   0x01,
+    SELF_SUPPORT_MISSING_FOR_LE_HYP      =   0x02,
+    IPL_RUNTIME_CPU_SAVE_VER_MISMATCH    =   0x04,
+    SELF_RESTORE_VER_MISMATCH            =   0x08,
+} VersionIncompList_t;
+
 
 #ifdef __cplusplus
 extern "C" {
@@ -341,6 +357,14 @@ StopReturnCode_t proc_stop_save_cpureg(  void* const i_pImage,
  */
 StopReturnCode_t proc_stop_init_self_save(  void* const i_pImage, const uint32_t i_corePos );
 
+/**
+ * @brief       verifies if API is compatible of current HOMER image.
+ * @param[in]   i_pImage        points to the start of HOMER image of P9 chip.
+ * @param[out]  o_inCompVector  list of incompatibilities found.
+ * @return      STOP_SAVE_SUCCESS if if API succeeds, error code otherwise.
+ */
+StopReturnCode_t proc_stop_api_discover_capability( void* const i_pImage, uint64_t* o_inCompVector );
+
 #ifdef __cplusplus
 } // extern "C"
 };  // namespace stopImageSection ends
diff --git a/libpore/p9_stop_util.H b/libpore/p9_stop_util.H
index 79b4e959..1328a54b 100644
--- a/libpore/p9_stop_util.H
+++ b/libpore/p9_stop_util.H
@@ -72,18 +72,18 @@ namespace stopImageSection
     ( (((WORD) >> 8) & 0x00FF) | (((WORD) << 8) & 0xFF00) )
 
 #define SWIZZLE_4_BYTE(WORD) \
-    ( (((WORD) >> 24) & 0x000000FF) | (((WORD) >>  8) & 0x0000FF00) | \
-      (((WORD) <<  8) & 0x00FF0000) | (((WORD) << 24) & 0xFF000000) )
+    ( (((WORD) & 0x000000FF) << 24) | (((WORD) & 0x0000FF00) <<  8) | \
+      (((WORD) & 0x00FF0000) >>  8) | (((WORD) & 0xFF000000) >> 24) )
 
 #define SWIZZLE_8_BYTE(WORD) \
-    ( (((WORD) >> 56) & 0x00000000000000FF) |  \
-      (((WORD) >> 40) & 0x000000000000FF00)| \
-      (((WORD) >> 24) & 0x0000000000FF0000) |  \
-      (((WORD) >>  8) & 0x00000000FF000000) |  \
-      (((WORD) <<  8) & 0x000000FF00000000) |  \
-      (((WORD) << 24) & 0x0000FF0000000000) | \
-      (((WORD) << 40) & 0x00FF000000000000) |  \
-      (((WORD) << 56) & 0xFF00000000000000) )
+    ( (((WORD) & 0x00000000000000ffULL) << 56) | \
+      (((WORD) & 0x000000000000ff00ULL) << 40) | \
+      (((WORD) & 0x0000000000ff0000ULL) << 24) | \
+      (((WORD) & 0x00000000ff000000ULL) <<  8) | \
+      (((WORD) & 0x000000ff00000000ULL) >>  8) | \
+      (((WORD) & 0x0000ff0000000000ULL) >> 24) | \
+      (((WORD) & 0x00ff000000000000ULL) >> 40) | \
+      (((WORD) & 0xff00000000000000ULL) >> 56) )
 #endif
 
 /**
-- 
2.25.1

