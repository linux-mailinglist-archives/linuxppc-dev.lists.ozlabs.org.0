Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEFA1ABACA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 10:06:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492sJ54bmyzDrSc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 18:06:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492s1M4m8WzDqyb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 17:53:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 492s1L5h4vz9BYx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 17:53:58 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 492s1L1pXdz9sRN; Thu, 16 Apr 2020 17:53:58 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 492s1H3wZPz9sR4
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Apr 2020 17:53:55 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03G7i38j080549
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Apr 2020 03:53:53 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30ek7u88q8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Apr 2020 03:53:53 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <psampat@linux.ibm.com>;
 Thu, 16 Apr 2020 08:53:46 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 Apr 2020 08:53:42 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03G7rkOk50069570
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Apr 2020 07:53:46 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6390D42047;
 Thu, 16 Apr 2020 07:53:46 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46A6542045;
 Thu, 16 Apr 2020 07:53:44 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.79.182.109])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 Apr 2020 07:53:44 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, mpe@ellerman.id.au, 
 skiboot@lists.ozlabs.org, oohall@gmail.com, ego@linux.vnet.ibm.com,
 linuxram@us.ibm.com, pratik.r.sampat@gmail.com, psampat@linux.ibm.com
Subject: [PATCH v7 1/4] Self Save: Introducing Support for SPR Self Save
Date: Thu, 16 Apr 2020 13:23:38 +0530
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200416075341.75268-1-psampat@linux.ibm.com>
References: <20200416075341.75268-1-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20041607-0028-0000-0000-000003F92DFE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20041607-0029-0000-0000-000024BEE32E
Message-Id: <20200416075341.75268-2-psampat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-16_02:2020-04-14,
 2020-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004160050
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

The commit is a merger of commits that makes the following changes:
1. Commit fixes some issues with code found during integration test
  -  replacement of addi with xor instruction during self save API.
  -  fixing instruction generation for MFMSR during self save
  -  data struct updates in STOP API
  -  error RC updates for hcode image build
  -  HOMER parser updates.
  -  removed self save support for URMOR and HRMOR
  -  code changes for compilation with OPAL
  -  populating CME Image header with unsecure HOMER address.

Key_Cronus_Test=PM_REGRESS

Change-Id: I7cedcc466267c4245255d8d75c01ed695e316720
Reviewed-on: http://rchgit01.rchland.ibm.com/gerrit1/66580
Tested-by: FSP CI Jenkins <fsp-CI-jenkins+hostboot@us.ibm.com>
Tested-by: HWSV CI <hwsv-ci+hostboot@us.ibm.com>
Tested-by: PPE CI <ppe-ci+hostboot@us.ibm.com>
Tested-by: Jenkins Server <pfd-jenkins+hostboot@us.ibm.com>
Tested-by: Cronus HW CI <cronushw-ci+hostboot@us.ibm.com>
Tested-by: Hostboot CI <hostboot-ci+hostboot@us.ibm.com>
Reviewed-by: Gregory S. Still <stillgs@us.ibm.com>
Reviewed-by: RAHUL BATRA <rbatra@us.ibm.com>
Reviewed-by: Jennifer A. Stofer <stofer@us.ibm.com>
Reviewed-on: http://rchgit01.rchland.ibm.com/gerrit1/66587
Reviewed-by: Christian R. Geddes <crgeddes@us.ibm.com>
Signed-off-by: Prem Shanker Jha <premjha2@in.ibm.com>
Signed-off-by: Akshay Adiga <akshay.adiga@linux.vnet.ibm.com>
Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>

2. The commit also incorporates changes that make STOP API project
agnostic changes include defining wrapper functions which call legacy
API. It also adds duplicate enum members which start with prefix PROC
instead of P9.

Key_Cronus_Test=PM_REGRESS

Change-Id: If87970f3e8cf9b507f33eb1be249e03eb3836a5e
RTC: 201128
Reviewed-on: http://rchgit01.rchland.ibm.com/gerrit1/71307
Tested-by: FSP CI Jenkins <fsp-CI-jenkins+hostboot@us.ibm.com>
Tested-by: Jenkins Server <pfd-jenkins+hostboot@us.ibm.com>
Tested-by: Hostboot CI <hostboot-ci+hostboot@us.ibm.com>
Tested-by: Cronus HW CI <cronushw-ci+hostboot@us.ibm.com>
Reviewed-by: RANGANATHPRASAD G. BRAHMASAMUDRA <prasadbgr@in.ibm.com>
Reviewed-by: Gregory S. Still <stillgs@us.ibm.com>
Reviewed-by: Jennifer A Stofer <stofer@us.ibm.com>
Reviewed-on: http://rchgit01.rchland.ibm.com/gerrit1/71314
Tested-by: Jenkins OP Build CI <op-jenkins+hostboot@us.ibm.com>
Tested-by: Jenkins OP HW <op-hw-jenkins+hostboot@us.ibm.com>
Reviewed-by: Daniel M. Crowell <dcrowell@us.ibm.com>
Signed-off-by: Prem Shanker Jha <premjha2@in.ibm.com>
Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
---
 include/p9_stop_api.H                    |  79 +-
 libpore/p9_cpu_reg_restore_instruction.H |   4 +
 libpore/p9_stop_api.C                    | 954 +++++++++++++----------
 libpore/p9_stop_api.H                    | 115 ++-
 libpore/p9_stop_data_struct.H            |   4 +-
 libpore/p9_stop_util.H                   |   7 +-
 6 files changed, 721 insertions(+), 442 deletions(-)

diff --git a/include/p9_stop_api.H b/include/p9_stop_api.H
index 79abd000..9d3bc1e5 100644
--- a/include/p9_stop_api.H
+++ b/include/p9_stop_api.H
@@ -63,6 +63,26 @@ typedef enum
     P9_STOP_SPR_PMCR    =    884,   // core register
     P9_STOP_SPR_HID     =   1008,   // core register
     P9_STOP_SPR_MSR     =   2000,   // thread register
+
+    //enum members which are project agnostic
+    PROC_STOP_SPR_DAWR    =    180,   // thread register
+    PROC_STOP_SPR_CIABR   =    187,   // thread register
+    PROC_STOP_SPR_DAWRX   =    188,   // thread register
+    PROC_STOP_SPR_HSPRG0  =    304,   // thread register
+    PROC_STOP_SPR_HRMOR   =    313,   // core register
+    PROC_STOP_SPR_LPCR    =    318,   // thread register
+    PROC_STOP_SPR_HMEER   =    337,   // core register
+    PROC_STOP_SPR_PTCR    =    464,   // core register
+    PROC_STOP_SPR_USPRG0  =    496,   // thread register
+    PROC_STOP_SPR_USPRG1  =    497,   // thread register
+    PROC_STOP_SPR_URMOR   =    505,   // core register
+    PROC_STOP_SPR_SMFCTRL =    511,   // thread register
+    PROC_STOP_SPR_LDBAR   =    850,   // thread register
+    PROC_STOP_SPR_PSSCR   =    855,   // thread register
+    PROC_STOP_SPR_PMCR    =    884,   // core register
+    PROC_STOP_SPR_HID     =   1008,   // core register
+    PROC_STOP_SPR_MSR     =   2000,   // thread register
+
 } CpuReg_t;
 
 /**
@@ -85,6 +105,8 @@ typedef enum
     STOP_SAVE_SCOM_ENTRY_UPDATE_FAILED   = 12,
     STOP_SAVE_INVALID_FUSED_CORE_STATUS  = 13,
     STOP_SAVE_FAIL                       = 14,  // for internal failure within firmware.
+    STOP_SAVE_SPR_ENTRY_MISSING          =  15,
+    STOP_SAVE_SPR_BIT_POS_RESERVE        =  16,
 } StopReturnCode_t;
 
 /**
@@ -101,7 +123,20 @@ typedef enum
     P9_STOP_SCOM_RESET      = 6,
     P9_STOP_SCOM_OR_APPEND  = 7,
     P9_STOP_SCOM_AND_APPEND = 8,
-    P9_STOP_SCOM_OP_MAX     = 9
+    P9_STOP_SCOM_OP_MAX     = 9,
+
+    //enum members which are project agnostic
+    PROC_STOP_SCOM_OP_MIN     =   0,
+    PROC_STOP_SCOM_APPEND     =   1,
+    PROC_STOP_SCOM_REPLACE    =   2,
+    PROC_STOP_SCOM_OR         =   3,
+    PROC_STOP_SCOM_AND        =   4,
+    PROC_STOP_SCOM_NOOP       =   5,
+    PROC_STOP_SCOM_RESET      =   6,
+    PROC_STOP_SCOM_OR_APPEND  =   7,
+    PROC_STOP_SCOM_AND_APPEND =   8,
+    PROC_STOP_SCOM_OP_MAX     =   9,
+
 } ScomOperation_t;
 
 /**
@@ -114,9 +149,49 @@ typedef enum
     P9_STOP_SECTION_EQ_SCOM     = 2,
     P9_STOP_SECTION_L2          = 3,
     P9_STOP_SECTION_L3          = 4,
-    P9_STOP_SECTION_MAX         = 5
+    P9_STOP_SECTION_MAX         = 5,
+
+    //enum members which are project agnostic
+    PROC_STOP_SECTION_MIN         =   0,
+    PROC_STOP_SECTION_CORE_SCOM   =   1,
+    PROC_STOP_SECTION_EQ_SCOM     =   2,
+    PROC_STOP_SECTION_L2          =   3,
+    PROC_STOP_SECTION_L3          =   4,
+    PROC_STOP_SECTION_MAX         =   5,
+
 } ScomSection_t;
 
+
+
+/**
+ * @brief   List of major incompatibilities between API version.
+ * @note    STOP APIs assumes a specific HOMER layout, certain
+ * level of CME-SGPE hcode and certain version of self-save restore
+ * binary. A mismatch can break STOP function.
+ */
+
+/**
+ * @brief  Summarizes bit position allocated to SPRs in save bit mask vector.
+ */
+typedef enum
+{
+    BIT_POS_CIABR       =   0,
+    BIT_POS_DAWR        =   1,
+    BIT_POS_DAWRX       =   2,
+    BIT_POS_HSPRG0      =   3,
+    BIT_POS_LDBAR       =   4,
+    BIT_POS_LPCR        =   5,
+    BIT_POS_PSSCR       =   6,
+    BIT_POS_MSR         =   7,
+    BIT_POS_HID         =   21,
+    BIT_POS_HMEER       =   22,
+    BIT_POS_PMCR        =   23,
+    BIT_POS_PTCR        =   24,
+    BIT_POS_SMFCTRL     =   28,
+    BIT_POS_USPRG0      =   29,
+    BIT_POS_USPRG1      =   30,
+} SprBitPositionList_t;
+
 #ifdef __cplusplus
 extern "C" {
 #endif
diff --git a/libpore/p9_cpu_reg_restore_instruction.H b/libpore/p9_cpu_reg_restore_instruction.H
index cf00ff5e..d69a4212 100644
--- a/libpore/p9_cpu_reg_restore_instruction.H
+++ b/libpore/p9_cpu_reg_restore_instruction.H
@@ -62,6 +62,10 @@ enum
     MTSPR_CONST1        =   467,
     MTMSRD_CONST1       =   178,
     MFSPR_CONST         =   339,
+    BLR_INST            =   0x4e800020,
+    MTSPR_BASE_OPCODE   =   0x7c0003a6,
+    MFSPR_BASE_OPCODE   =   0x7c0002a6,
+    ATTN_OPCODE         =   0x00000200,
     OPCODE_18           =   18,
     SELF_SAVE_FUNC_ADD  =   0x2300,
     SELF_SAVE_OFFSET    =   0x180,
diff --git a/libpore/p9_stop_api.C b/libpore/p9_stop_api.C
index 33aaf788..2d9bb549 100644
--- a/libpore/p9_stop_api.C
+++ b/libpore/p9_stop_api.C
@@ -54,33 +54,33 @@ namespace stopImageSection
 
 const StopSprReg_t g_sprRegister[] =
 {
-    { P9_STOP_SPR_CIABR,     true,  0  },
-    { P9_STOP_SPR_DAWR,      true,  1  },
-    { P9_STOP_SPR_DAWRX,     true,  2  },
-    { P9_STOP_SPR_HSPRG0,    true,  3  },
-    { P9_STOP_SPR_LDBAR,     true,  4, },
-    { P9_STOP_SPR_LPCR,      true,  5  },
-    { P9_STOP_SPR_PSSCR,     true,  6  },
-    { P9_STOP_SPR_MSR,       true,  7  },
-    { P9_STOP_SPR_HRMOR,     false, 20 },
-    { P9_STOP_SPR_HID,       false, 21 },
-    { P9_STOP_SPR_HMEER,     false, 22 },
-    { P9_STOP_SPR_PMCR,      false, 23 },
-    { P9_STOP_SPR_PTCR,      false, 24 },
-    { P9_STOP_SPR_SMFCTRL,   true,  28 },
-    { P9_STOP_SPR_USPRG0,    true,  29 },
-    { P9_STOP_SPR_USPRG1,    true,  30 },
-    { P9_STOP_SPR_URMOR,     false, 31 },
+    { P9_STOP_SPR_CIABR,     true,  0   },
+    { P9_STOP_SPR_DAWR,      true,  1   },
+    { P9_STOP_SPR_DAWRX,     true,  2   },
+    { P9_STOP_SPR_HSPRG0,    true,  3   },
+    { P9_STOP_SPR_LDBAR,     true,  4,  },
+    { P9_STOP_SPR_LPCR,      true,  5   },
+    { P9_STOP_SPR_PSSCR,     true,  6   },
+    { P9_STOP_SPR_MSR,       true,  7   },
+    { P9_STOP_SPR_HRMOR,     false, 255 },
+    { P9_STOP_SPR_HID,       false, 21  },
+    { P9_STOP_SPR_HMEER,     false, 22  },
+    { P9_STOP_SPR_PMCR,      false, 23  },
+    { P9_STOP_SPR_PTCR,      false, 24  },
+    { P9_STOP_SPR_SMFCTRL,   true,  28  },
+    { P9_STOP_SPR_USPRG0,    true,  29  },
+    { P9_STOP_SPR_USPRG1,    true,  30  },
+    { P9_STOP_SPR_URMOR,     false, 255 },
 };
 
-const uint32_t MAX_SPR_SUPPORTED =  17;
+const uint32_t MAX_SPR_SUPPORTED            =   17;
 const uint32_t LEGACY_CORE_SCOM_SUPPORTED   =   15;
 const uint32_t LEGACY_QUAD_SCOM_SUPPORTED   =   63;
 
 //-----------------------------------------------------------------------------
 
 /**
- * @brief       vaildated input arguments passed to p9_stop_save_cpureg_control.
+ * @brief       validated input arguments passed to p9_stop_save_cpureg_control.
  * @param[in]   i_pImage            point to start of HOMER
  * @param[in]   i_coreId            id of the core
  * @param[in]   i_threadId          id of the thread
@@ -255,7 +255,7 @@ STATIC uint32_t getOriInstruction( const uint16_t i_Rs, const uint16_t i_Ra,
  */
 STATIC uint32_t genKeyForSprLookup( const CpuReg_t i_regId )
 {
-    return getOriInstruction( 0, 0, (uint16_t) i_regId );
+    return getOriInstruction( 24, 0, (uint16_t) i_regId );
 }
 
 //-----------------------------------------------------------------------------
@@ -330,7 +330,7 @@ STATIC uint32_t getMtsprInstruction( const uint16_t i_Rs, const uint16_t i_Spr )
  */
 STATIC uint32_t getMfmsrInstruction( const uint16_t i_Rt )
 {
-    uint32_t mfmsrInstOpcode  = ((OPCODE_31 << 26) | (i_Rt << 21) | (MFMSR_CONST));
+    uint32_t mfmsrInstOpcode  = ((OPCODE_31 << 26) | (i_Rt << 21) | ((MFMSR_CONST)<< 1));
 
     return SWIZZLE_4_BYTE(mfmsrInstOpcode);
 }
@@ -361,8 +361,13 @@ STATIC uint32_t getRldicrInstruction( const uint16_t i_Ra, const uint16_t i_Rs,
 
 STATIC uint32_t getMfsprInstruction( const uint16_t i_Rt, const uint16_t i_sprNum )
 {
-    uint32_t mfsprInstOpcode    =   0;
-    mfsprInstOpcode =  (( OPCODE_31 << 26 ) | ( i_Rt << 21 ) | ( i_sprNum << 11 ) | ( MFSPR_CONST << 1 ));
+    uint32_t mfsprInstOpcode = 0;
+    uint32_t temp = (( i_sprNum & 0x03FF ) << 11);
+    mfsprInstOpcode = (uint8_t)i_Rt << 21;
+    mfsprInstOpcode |= (( temp  & 0x0000F800 ) << 5);
+    mfsprInstOpcode |= (( temp  & 0x001F0000 ) >> 5);
+    mfsprInstOpcode |= MFSPR_BASE_OPCODE;
+
     return SWIZZLE_4_BYTE(mfsprInstOpcode);
 }
 
@@ -615,14 +620,14 @@ STATIC StopReturnCode_t getSprRegIndexAdjustment( const uint32_t i_saveMaskPos,
 
     do
     {
-        if( (( i_saveMaskPos >= SPR_BIT_POS_8 ) && ( i_saveMaskPos <= SPR_BIT_POS_19 )) ||
+        if( (( i_saveMaskPos >= SPR_BIT_POS_8 ) && ( i_saveMaskPos <= SPR_BIT_POS_20 )) ||
             (( i_saveMaskPos >= SPR_BIT_POS_25 ) && ( i_saveMaskPos <= SPR_BIT_POS_27 )) )
         {
             l_rc = STOP_SAVE_SPR_BIT_POS_RESERVE;
             break;
         }
 
-        if( (i_saveMaskPos > SPR_BIT_POS_19) && (i_saveMaskPos < SPR_BIT_POS_25 ) )
+        if( (i_saveMaskPos > SPR_BIT_POS_20) && (i_saveMaskPos < SPR_BIT_POS_25) )
         {
             *i_sprAdjIndex    =   12;
         }
@@ -646,138 +651,9 @@ StopReturnCode_t p9_stop_save_cpureg(  void* const i_pImage,
                                        const uint64_t  i_regData,
                                        const uint64_t  i_pir )
 {
-    StopReturnCode_t l_rc = STOP_SAVE_SUCCESS;    // procedure return code
-    HomerSection_t*     chipHomer       =    NULL;
-    SmfHomerSection_t*  smfChipHomer    =    NULL;
-
-    do
-    {
-        uint32_t threadId       =   0;
-        uint32_t coreId         =   0;
-        uint32_t lookUpKey      =   0;
-        void* pSprEntryLocation =   NULL;   // an offset w.r.t. to start of image
-        void* pThreadLocation   =   NULL;
-        bool threadScopeReg     =   false;
-        uint8_t l_urmorFix      =   false;
-        uint64_t  l_sprValue    =   0;
-        uint8_t l_selfRestVer   =   0;
-
-        MY_INF(">> p9_stop_save_cpureg" );
-
-        l_rc = getCoreAndThread( i_pImage, i_pir, &coreId, &threadId );
-
-        if( l_rc )
-        {
-            MY_ERR("Failed to determine Core Id and Thread Id from PIR 0x%016llx",
-                   i_pir);
-            break;
-        }
-
-        MY_INF( " PIR 0x%016llx coreId %d threadid %d "
-                " registerId %d", i_pir, coreId,
-                threadId, i_regId );
-
-        // First of all let us validate all input arguments.
-        l_rc =  validateSprImageInputs( i_pImage,
-                                        i_regId,
-                                        coreId,
-                                        &threadId,
-                                        &threadScopeReg );
-
-        if( l_rc )
-        {
-            // Error: bad argument traces out error code
-            MY_ERR("Bad input argument rc %d", l_rc );
-
-            break;
-        }
-
-        l_urmorFix      =   *(uint8_t*)((uint8_t*)i_pImage + CPMR_HOMER_OFFSET + CPMR_URMOR_FIX_BYTE);
-        l_selfRestVer   =   *(uint8_t *)((uint8_t *)i_pImage + CPMR_HOMER_OFFSET + CPMR_SELF_RESTORE_VER_BYTE );
-
-        if( l_selfRestVer )
-        {
-            smfChipHomer = ( SmfHomerSection_t*)i_pImage;
-
-            if( threadScopeReg )
-            {
-                pThreadLocation =
-                    &(smfChipHomer->iv_coreThreadRestore[coreId].iv_threadRestoreArea[threadId][0]);
-            }
-            else
-            {
-                pThreadLocation =
-                    &(smfChipHomer->iv_coreThreadRestore[coreId].iv_coreRestoreArea[0]);
-            }
-        }
-        else    //Old fips or OPAL release that doesn't support SMF
-        {
-            chipHomer = (HomerSection_t*)i_pImage;
-
-            if( threadScopeReg )
-            {
-                pThreadLocation =
-                    &(chipHomer->iv_coreThreadRestore[coreId][threadId].iv_threadArea[0]);
-            }
-            else
-            {
-                pThreadLocation =
-                    &(chipHomer->iv_coreThreadRestore[coreId][threadId].iv_coreArea[0]);
-            }
-        }
-
-        if( ( SWIZZLE_4_BYTE(BLR_INST) == *(uint32_t*)pThreadLocation ) ||
-            ( SWIZZLE_4_BYTE(ATTN_OPCODE) == *(uint32_t*) pThreadLocation ) )
-        {
-            // table for given core id doesn't exit. It needs to be
-            // defined.
-            pSprEntryLocation = pThreadLocation;
-        }
-        else
-        {
-            // an SPR restore section for given core already exists
-            lookUpKey = genKeyForSprLookup( i_regId );
-            l_rc = lookUpSprInImage( (uint32_t*)pThreadLocation,
-                                     lookUpKey,
-                                     threadScopeReg,
-                                     &pSprEntryLocation,
-                                     l_selfRestVer );
-        }
-
-        if( l_rc )
-        {
-            MY_ERR("Invalid or corrupt SPR entry. CoreId 0x%08x threadId ",
-                   "0x%08x regId 0x%08x lookUpKey 0x%08x pThreadLocation 0x%08x"
-                   , coreId, threadId, i_regId, lookUpKey, pThreadLocation );
-            break;
-        }
-
-        if( ( P9_STOP_SPR_URMOR == i_regId ) && ( l_urmorFix ) )
-        {
-            l_sprValue  =  i_regData - URMOR_CORRECTION;
-        }
-        else
-        {
-            l_sprValue  =  i_regData;
-        }
-
-        l_rc = updateSprEntryInImage( (uint32_t*) pSprEntryLocation,
-                                      i_regId,
-                                      l_sprValue,
-                                      UPDATE_SPR_ENTRY );
-
-        if( l_rc )
-        {
-            MY_ERR( " Failed to update the SPR entry of PIR 0x%08x reg"
-                    "0x%08x", i_pir, i_regId );
-            break;
-        }
-
-    }
-    while(0);
+    MY_INF(">> p9_stop_save_cpureg" );
 
-    MY_INF("<< p9_stop_save_cpureg" );
-    return l_rc;
+    return proc_stop_save_cpureg( i_pImage, i_regId, i_regData, i_pir );
 }
 
 //-----------------------------------------------------------------------------
@@ -1003,103 +879,334 @@ StopReturnCode_t p9_stop_save_scom( void* const   i_pImage,
                                     const ScomOperation_t i_operation,
                                     const ScomSection_t i_section )
 {
-    StopReturnCode_t l_rc = STOP_SAVE_SUCCESS;
-    uint32_t entryLimit =   0;
-    uint8_t chipletId   =   0;
-    uint32_t nopInst    =   0;
-    uint32_t index      =   0;
-    uint32_t imageVer   =   0;
-    uint32_t entrySwzHeader = 0;
-    uint32_t l_maxScomRestoreEntry = 0;
-    ScomEntry_t* pScomEntry      =  NULL;
-    ScomEntry_t* pEntryLocation  =  NULL;
-    ScomEntry_t* pNopLocation    =  NULL;
-    ScomEntry_t* pEditScomHeader =  NULL;
-    StopCacheSection_t* pStopCacheScomStart =   NULL;
-    ScomEntry_t* pTableEndLocationtable     =   NULL;
-    uint32_t swizzleAddr;
-    uint64_t swizzleData;
-    uint32_t swizzleAttn;
-    uint32_t swizzleBlr     =   SWIZZLE_4_BYTE(BLR_INST);
-    bool     cacheEntry     =   true;
-
     MY_INF(">> p9_stop_save_scom");
 
-    //Reads SGPE image version info from QPMR Header in HOMER
-    //For backward compatibility, for base version of SGPE Hcode,
-    //STOP API retains default behavior but adds version specific
-    //details in each entry in later versions.
-    imageVer       =  *(uint32_t*)((uint8_t*)i_pImage + QPMR_HOMER_OFFSET + QPMR_BUILD_VER_BYTE);
-    imageVer       =  SWIZZLE_4_BYTE(imageVer);
-
+    return proc_stop_save_scom( i_pImage, i_scomAddress,
+                                i_scomData, i_operation, i_section );
+}
 
-    do
-    {
-        chipletId   =   i_scomAddress >> 24;
-        chipletId   =   chipletId & 0x3F;
+//-----------------------------------------------------------------------------
 
-        l_rc        =   validateScomImageInputs( i_pImage, i_scomAddress, chipletId, i_operation, i_section );
+/**
+ * @brief   searches a self save entry of an SPR in self-save segment.
+ * @param[in]   i_sprBitPos         bit position associated with SPR in save mask vector.
+ * @param[in]   l_pSprSaveStart     start location of SPR save segment
+ * @param[in]   i_searchLength      length of SPR save segment
+ * @param[in]   i_pSaveSprLoc       start location of save entry for a given SPR.
+ * @return      STOP_SAVE_SUCCESS if look up succeeds, error code otherwise.
+ */
+STATIC StopReturnCode_t lookUpSelfSaveSpr( uint32_t i_sprBitPos, uint32_t* l_pSprSaveStart,
+                                    uint32_t  i_searchLength, uint32_t** i_pSaveSprLoc )
+{
+    int32_t l_saveWordLength    =   (int32_t)(i_searchLength >> 2);
+    uint32_t l_oriInst          =   getOriInstruction( 0, 0, i_sprBitPos );
+    StopReturnCode_t l_rc       =   STOP_SAVE_FAIL;
 
-        if( l_rc )
+    while( l_saveWordLength > 0 )
+    {
+        if( l_oriInst == *l_pSprSaveStart )
         {
-            MY_ERR( "invalid argument: aborting");
+            *i_pSaveSprLoc   =   l_pSprSaveStart;
+            l_rc             =   STOP_SAVE_SUCCESS;
             break;
         }
 
-        if( chipletId >= CORE_CHIPLET_ID_MIN )
-        {
-            // chiplet is core. So, let us find the start address of SCOM area
-            // pertaining to a core in STOP image.
-            l_maxScomRestoreEntry   =
-                *(uint32_t*)((uint8_t*)i_pImage + CPMR_HOMER_OFFSET + CPMR_MAX_SCOM_REST_PER_CORE_BYTE);
-            pScomEntry              =   CORE_ID_SCOM_START(i_pImage, chipletId )
-            cacheEntry              =   false;
+        l_pSprSaveStart++;
+        l_saveWordLength--;
+    }
 
-            if( !l_maxScomRestoreEntry )
-            {
-                //Old HB and new STOP API case. Retain legacy Number
-                l_maxScomRestoreEntry   =  SWIZZLE_4_BYTE(LEGACY_CORE_SCOM_SUPPORTED);
-            }
-        }
-        else
-        {
-            l_maxScomRestoreEntry   =
-                *(uint32_t*)((uint8_t*)i_pImage + QPMR_HOMER_OFFSET + QPMR_QUAD_MAX_SCOM_ENTRY_BYTE);
+    return l_rc;
+}
 
-            if( !l_maxScomRestoreEntry )
-            {
-                // Incase of a bad HOMER header initialization, fall back on legacy number.
-                l_maxScomRestoreEntry   =  SWIZZLE_4_BYTE(LEGACY_QUAD_SCOM_SUPPORTED);
-            }
-            // chiplet is a cache. let us find start address of cache section
-            // associated with given chiplet. A cache section associated with
-            // given chiplet is split in to L2, L3 and EQ area.
-            pStopCacheScomStart = CACHE_SECTN_START(i_pImage,
-                                                    chipletId);
-        }
+//-----------------------------------------------------------------------------
 
-        l_maxScomRestoreEntry   =   SWIZZLE_4_BYTE(l_maxScomRestoreEntry);
+/**
+ * @brief   searches a self save entry of an SPR in self-save segment.
+ * @param[in]   i_pSaveReg  start of editable location of a SPR save entry.
+ * @param[in]   i_sprNum    Id of the SPR for which entry needs to be edited.
+ * @return      STOP_SAVE_SUCCESS if look up succeeds, error code otherwise.
+ */
+STATIC StopReturnCode_t updateSelfSaveEntry( uint32_t* i_pSaveReg, uint16_t i_sprNum )
+{
+    StopReturnCode_t l_rc   =   STOP_SAVE_SUCCESS;
 
-        if(( !pStopCacheScomStart ) && ( !pScomEntry) )
+    do
+    {
+        if( !i_pSaveReg )
         {
-            //Error invalid pointer to SCOM entry in cache or core section
-            //of STOP image.
-            MY_ERR("invalid start location for chiplet %d",
-                   chipletId );
+            l_rc    =   STOP_SAVE_FAIL;
+            MY_ERR( "Failed to update self save area for SPR 0x%04x", i_sprNum );
             break;
         }
 
-        switch( i_section )
+        if( P9_STOP_SPR_MSR == i_sprNum )
         {
-            case P9_STOP_SECTION_EQ_SCOM:
-                pScomEntry = pStopCacheScomStart->nonCacheArea;
-                entryLimit = MAX_EQ_SCOM_ENTRIES;
-                break;
+            *i_pSaveReg     =    getMfmsrInstruction( 1 );
+        }
+        else
+        {
+            *i_pSaveReg     =   getMfsprInstruction( 1, i_sprNum );
+        }
 
-            case P9_STOP_SECTION_L2:
-                pScomEntry = pStopCacheScomStart->l2CacheArea;
-                entryLimit = MAX_L2_SCOM_ENTRIES;
-                break;
+        i_pSaveReg++;
+
+        *i_pSaveReg         =   getBranchLinkRegInstruction( );
+    }
+    while(0);
+
+    return l_rc;
+}
+
+//-----------------------------------------------------------------------------
+
+StopReturnCode_t p9_stop_save_cpureg_control(  void* i_pImage,
+        const uint64_t i_pir,
+        const uint32_t i_saveRegVector )
+{
+    MY_INF( ">> p9_stop_save_cpureg_control" );
+
+    return proc_stop_save_cpureg_control( i_pImage, i_pir, i_saveRegVector );
+}
+
+//-----------------------------------------------------------------------------------------------------
+
+StopReturnCode_t p9_stop_init_cpureg(  void* const i_pImage, const uint32_t i_corePos )
+{
+    MY_INF( ">> p9_stop_init_cpureg" );
+
+    return proc_stop_init_cpureg( i_pImage, i_corePos );
+}
+
+//-----------------------------------------------------------------------------------------------------
+
+StopReturnCode_t p9_stop_init_self_save(  void* const i_pImage, const uint32_t i_corePos )
+{
+    MY_INF( ">> p9_stop_init_self_save" );
+
+    return proc_stop_init_self_save( i_pImage, i_corePos );
+}
+
+//-----------------------------------------------------------------------------------------------------
+
+StopReturnCode_t proc_stop_init_cpureg(  void* const i_pImage, const uint32_t i_corePos )
+{
+
+    StopReturnCode_t    l_rc        =   STOP_SAVE_SUCCESS;
+    uint32_t* l_pRestoreStart       =   NULL;
+    void* l_pTempLoc                =   NULL;
+    SmfHomerSection_t* l_pHomer     =   NULL;
+    uint32_t l_threadPos            =   0;
+    uint32_t l_lookUpKey            =   0;
+    uint32_t l_sprIndex             =   0;
+    uint8_t l_selfRestVer           =   0;
+
+    MY_INF( ">> proc_stop_init_cpureg" );
+
+    do
+    {
+        if( !i_pImage )
+        {
+            l_rc    =   STOP_SAVE_ARG_INVALID_IMG;
+            break;
+        }
+
+        if( i_corePos > MAX_CORE_ID_SUPPORTED )
+        {
+            l_rc    =  STOP_SAVE_ARG_INVALID_CORE;
+            break;
+        }
+
+        l_pHomer        =   ( SmfHomerSection_t * ) i_pImage;
+        l_selfRestVer   =   *(uint8_t *)((uint8_t *)i_pImage + CPMR_HOMER_OFFSET + CPMR_SELF_RESTORE_VER_BYTE );
+
+        for( l_sprIndex = 0; l_sprIndex < MAX_SPR_SUPPORTED; l_sprIndex++ )
+        {
+            //Check if a given SPR needs to be self-saved each time on STOP entry
+
+            l_lookUpKey     =   genKeyForSprLookup( ( CpuReg_t )g_sprRegister[l_sprIndex].iv_sprId );
+
+            if( g_sprRegister[l_sprIndex].iv_isThreadScope )
+            {
+                for( l_threadPos = 0; l_threadPos < MAX_THREADS_PER_CORE; l_threadPos++ )
+                {
+                    l_pRestoreStart =
+                        (uint32_t*)&l_pHomer->iv_coreThreadRestore[i_corePos].iv_threadRestoreArea[l_threadPos][0];
+
+                    l_rc    =   lookUpSprInImage( (uint32_t*)l_pRestoreStart, l_lookUpKey,
+                                                  g_sprRegister[l_sprIndex].iv_isThreadScope,
+                                                  &l_pTempLoc,
+                                                  l_selfRestVer );
+
+                    if( l_rc )
+                    {
+                        MY_ERR( "Thread SPR lookup failed in p9_stop_init_cpureg SPR %d Core %d Thread %d Index %d",
+                                g_sprRegister[l_sprIndex].iv_sprId, i_corePos, l_threadPos, l_sprIndex );
+                        break;
+                    }
+
+                    l_rc = updateSprEntryInImage( (uint32_t*) l_pTempLoc,
+                                                  ( CpuReg_t )g_sprRegister[l_sprIndex].iv_sprId,
+                                                  0x00,
+                                                  INIT_SPR_REGION );
+
+                    if( l_rc )
+                    {
+                        MY_ERR( "Thread SPR region init failed. Core %d SPR Id %d",
+                                i_corePos, g_sprRegister[l_sprIndex].iv_sprId );
+                        break;
+                    }
+
+                }//end for thread
+
+                if( l_rc )
+                {
+                    break;
+                }
+
+            }//end if SPR threadscope
+            else
+            {
+                l_pRestoreStart     =   (uint32_t*)&l_pHomer->iv_coreThreadRestore[i_corePos].iv_coreRestoreArea[0];
+
+                l_rc                =   lookUpSprInImage( (uint32_t*)l_pRestoreStart, l_lookUpKey,
+                                        g_sprRegister[l_sprIndex].iv_isThreadScope,
+                                        &l_pTempLoc, l_selfRestVer );
+
+                if( l_rc )
+                {
+                    MY_ERR( "Core SPR lookup failed in p9_stop_init_cpureg" );
+                    break;
+                }
+
+                l_rc    =   updateSprEntryInImage( (uint32_t*) l_pTempLoc,
+                                                   ( CpuReg_t )g_sprRegister[l_sprIndex].iv_sprId,
+                                                   0x00,
+                                                   INIT_SPR_REGION );
+
+                if( l_rc )
+                {
+                    MY_ERR( "Core SPR region init failed. Core %d SPR Id %d SPR Index %d",
+                            i_corePos, g_sprRegister[l_sprIndex].iv_sprId, l_sprIndex );
+                    break;
+                }
+
+            }// end else
+
+        }// end for l_sprIndex
+
+    }
+    while(0);
+
+    MY_INF( "<< proc_stop_init_cpureg" );
+
+    return l_rc;
+}
+
+//-----------------------------------------------------------------------------------------------------
+
+StopReturnCode_t proc_stop_save_scom( void* const   i_pImage,
+                                      const uint32_t i_scomAddress,
+                                      const uint64_t i_scomData,
+                                      const ScomOperation_t i_operation,
+                                      const ScomSection_t i_section )
+{
+    StopReturnCode_t l_rc = STOP_SAVE_SUCCESS;
+    uint32_t entryLimit =   0;
+    uint8_t chipletId   =   0;
+    uint32_t nopInst    =   0;
+    uint32_t index      =   0;
+    uint32_t imageVer   =   0;
+    uint32_t entrySwzHeader = 0;
+    uint32_t l_maxScomRestoreEntry = 0;
+    ScomEntry_t* pScomEntry      =  NULL;
+    ScomEntry_t* pEntryLocation  =  NULL;
+    ScomEntry_t* pNopLocation    =  NULL;
+    ScomEntry_t* pEditScomHeader =  NULL;
+    StopCacheSection_t* pStopCacheScomStart =   NULL;
+    ScomEntry_t* pTableEndLocationtable     =   NULL;
+    uint32_t swizzleAddr;
+    uint64_t swizzleData;
+    uint32_t swizzleAttn;
+    uint32_t swizzleBlr     =   SWIZZLE_4_BYTE(BLR_INST);
+    bool     cacheEntry     =   true;
+
+    MY_INF( ">> proc_stop_save_scom" );
+
+    //Reads SGPE image version info from QPMR Header in HOMER
+    //For backward compatibility, for base version of SGPE Hcode,
+    //STOP API retains default behavior but adds version specific
+    //details in each entry in later versions.
+    imageVer       =  *(uint32_t*)((uint8_t*)i_pImage + QPMR_HOMER_OFFSET + QPMR_BUILD_VER_BYTE);
+    imageVer       =  SWIZZLE_4_BYTE(imageVer);
+
+
+    do
+    {
+        chipletId   =   i_scomAddress >> 24;
+        chipletId   =   chipletId & 0x3F;
+
+        l_rc        =   validateScomImageInputs( i_pImage, i_scomAddress, chipletId, i_operation, i_section );
+
+        if( l_rc )
+        {
+            MY_ERR( "invalid argument: aborting");
+            break;
+        }
+
+        if( chipletId >= CORE_CHIPLET_ID_MIN )
+        {
+            // chiplet is core. So, let us find the start address of SCOM area
+            // pertaining to a core in STOP image.
+            l_maxScomRestoreEntry   =
+                *(uint32_t*)((uint8_t*)i_pImage + CPMR_HOMER_OFFSET + CPMR_MAX_SCOM_REST_PER_CORE_BYTE);
+            pScomEntry              =   CORE_ID_SCOM_START(i_pImage, chipletId )
+            cacheEntry              =   false;
+
+            if( !l_maxScomRestoreEntry )
+            {
+                //Old HB and new STOP API case. Retain legacy Number
+                l_maxScomRestoreEntry   =  SWIZZLE_4_BYTE(LEGACY_CORE_SCOM_SUPPORTED);
+            }
+        }
+        else
+        {
+            l_maxScomRestoreEntry   =
+                *(uint32_t*)((uint8_t*)i_pImage + QPMR_HOMER_OFFSET + QPMR_QUAD_MAX_SCOM_ENTRY_BYTE);
+
+            if( !l_maxScomRestoreEntry )
+            {
+                // Incase of a bad HOMER header initialization, fall back on legacy number.
+                l_maxScomRestoreEntry   =  SWIZZLE_4_BYTE(LEGACY_QUAD_SCOM_SUPPORTED);
+            }
+            // chiplet is a cache. let us find start address of cache section
+            // associated with given chiplet. A cache section associated with
+            // given chiplet is split in to L2, L3 and EQ area.
+            pStopCacheScomStart = CACHE_SECTN_START(i_pImage,
+                                                    chipletId);
+        }
+
+        l_maxScomRestoreEntry   =   SWIZZLE_4_BYTE(l_maxScomRestoreEntry);
+
+        if(( !pStopCacheScomStart ) && ( !pScomEntry) )
+        {
+            //Error invalid pointer to SCOM entry in cache or core section
+            //of STOP image.
+            MY_ERR("invalid start location for chiplet %d",
+                   chipletId );
+            break;
+        }
+
+        switch( i_section )
+        {
+            case P9_STOP_SECTION_EQ_SCOM:
+                pScomEntry = pStopCacheScomStart->nonCacheArea;
+                entryLimit = MAX_EQ_SCOM_ENTRIES;
+                break;
+
+            case P9_STOP_SECTION_L2:
+                pScomEntry = pStopCacheScomStart->l2CacheArea;
+                entryLimit = MAX_L2_SCOM_ENTRIES;
+                break;
 
             case P9_STOP_SECTION_L3:
                 pScomEntry = pStopCacheScomStart->l3CacheArea;
@@ -1274,131 +1381,60 @@ StopReturnCode_t p9_stop_save_scom( void* const   i_pImage,
                     if( NULL == pEntryLocation )
                     {
                         editAppend = pTableEndLocationtable;
-                    }
-                    else
-                    {
-                        editAppend = pEntryLocation;
-
-                        if( P9_STOP_SCOM_OR_APPEND == i_operation )
-                        {
-                            tempOperation = P9_STOP_SCOM_OR;
-                        }
-                        else
-                        {
-                            tempOperation = P9_STOP_SCOM_AND;
-                        }
-                    }
-
-                    l_rc = editScomEntry( swizzleAddr,
-                                          swizzleData,
-                                          editAppend,
-                                          tempOperation );
-
-                    pEditScomHeader = editAppend;
-                }
-                break;
-
-            default:
-                l_rc = STOP_SAVE_SCOM_INVALID_OPERATION;
-                break;
-        }
-    }
-    while(0);
-
-    if( l_rc )
-    {
-        MY_ERR("SCOM image operation 0x%08x failed for chiplet 0x%08x addr"
-               "0x%08x", i_operation, chipletId ,
-               i_scomAddress );
-    }
-    else
-    {
-        //Update SCOM Restore entry with version and memory layout
-        //info
-        updateEntryHeader( pEditScomHeader, imageVer, l_maxScomRestoreEntry );
-    }
-
-    MY_INF("<< p9_stop_save_scom");
-    return l_rc;
-}
-
-//-----------------------------------------------------------------------------
-
-/**
- * @brief   searches a self save entry of an SPR in self-save segment.
- * @param[in]   i_sprBitPos         bit position associated with SPR in save mask vector.
- * @param[in]   l_pSprSaveStart     start location of SPR save segment
- * @param[in]   i_searchLength      length of SPR save segment
- * @param[in]   i_pSaveSprLoc       start location of save entry for a given SPR.
- * @return      STOP_SAVE_SUCCESS if look up succeeds, error code otherwise.
- */
-STATIC StopReturnCode_t lookUpSelfSaveSpr( uint32_t i_sprBitPos, uint32_t* l_pSprSaveStart,
-                                    uint32_t  i_searchLength, uint32_t** i_pSaveSprLoc )
-{
-    int32_t l_saveWordLength    =   (int32_t)(i_searchLength >> 2);
-    uint32_t l_oriInst          =   getOriInstruction( 0, 0, i_sprBitPos );
-    StopReturnCode_t l_rc       =   STOP_SAVE_FAIL;
-
-    while( l_saveWordLength > 0 )
-    {
-        if( l_oriInst == *l_pSprSaveStart )
-        {
-            *i_pSaveSprLoc   =   l_pSprSaveStart;
-            l_rc             =   STOP_SAVE_SUCCESS;
-            break;
-        }
-
-        l_pSprSaveStart++;
-        l_saveWordLength--;
-    }
-
-    return l_rc;
-}
-
-//-----------------------------------------------------------------------------
-
-/**
- * @brief   searches a self save entry of an SPR in self-save segment.
- * @param[in]   i_pSaveReg  start of editable location of a SPR save entry.
- * @param[in]   i_sprNum    Id of the SPR for which entry needs to be edited.
- * @return      STOP_SAVE_SUCCESS if look up succeeds, error code otherwise.
- */
-STATIC StopReturnCode_t updateSelfSaveEntry( uint32_t* i_pSaveReg, uint16_t i_sprNum )
-{
-    StopReturnCode_t l_rc   =   STOP_SAVE_SUCCESS;
-
-    do
-    {
-        if( !i_pSaveReg )
-        {
-            l_rc    =   STOP_SAVE_FAIL;
-            MY_ERR( "Failed to update self save area for SPR 0x%04x", i_sprNum );
-            break;
-        }
+                    }
+                    else
+                    {
+                        editAppend = pEntryLocation;
 
-        if( P9_STOP_SPR_MSR == i_sprNum )
-        {
-            *i_pSaveReg     =    getMfmsrInstruction( 1 );
-        }
-        else
-        {
-            *i_pSaveReg     =   getMfsprInstruction( 1, i_sprNum );
-        }
+                        if( P9_STOP_SCOM_OR_APPEND == i_operation )
+                        {
+                            tempOperation = P9_STOP_SCOM_OR;
+                        }
+                        else
+                        {
+                            tempOperation = P9_STOP_SCOM_AND;
+                        }
+                    }
 
-        i_pSaveReg++;
+                    l_rc = editScomEntry( swizzleAddr,
+                                          swizzleData,
+                                          editAppend,
+                                          tempOperation );
 
-        *i_pSaveReg         =   getBranchLinkRegInstruction( );
+                    pEditScomHeader = editAppend;
+                }
+                break;
+
+            default:
+                l_rc = STOP_SAVE_SCOM_INVALID_OPERATION;
+                break;
+        }
     }
     while(0);
 
+    if( l_rc )
+    {
+        MY_ERR("SCOM image operation 0x%08x failed for chiplet 0x%08x addr"
+               "0x%08x", i_operation, chipletId ,
+               i_scomAddress );
+    }
+    else
+    {
+        //Update SCOM Restore entry with version and memory layout
+        //info
+        updateEntryHeader( pEditScomHeader, imageVer, l_maxScomRestoreEntry );
+    }
+
+    MY_INF( "<< proc_stop_save_scom" );
+
     return l_rc;
 }
 
-//-----------------------------------------------------------------------------
+//-----------------------------------------------------------------------------------------------------
 
-StopReturnCode_t p9_stop_save_cpureg_control(  void* i_pImage,
-        const uint64_t i_pir,
-        const uint32_t i_saveRegVector )
+StopReturnCode_t proc_stop_save_cpureg_control(  void* i_pImage,
+                                                 const uint64_t i_pir,
+                                                 const uint32_t i_saveRegVector )
 {
     StopReturnCode_t l_rc   =   STOP_SAVE_SUCCESS;
     uint32_t l_coreId       =   0;
@@ -1411,8 +1447,10 @@ StopReturnCode_t p9_stop_save_cpureg_control(  void* i_pImage,
     uint32_t* l_pRestoreStart       =   NULL;
     uint32_t* l_pSprSave            =   NULL;
     void* l_pTempLoc                =   NULL;
+    uint32_t * l_pTempWord          =   NULL;
     SmfHomerSection_t* l_pHomer     =   NULL;
     uint8_t l_selfRestVer           =   0;
+    MY_INF(">> proc_stop_save_cpureg_control" );
 
     do
     {
@@ -1440,6 +1478,11 @@ StopReturnCode_t p9_stop_save_cpureg_control(  void* i_pImage,
         {
             l_sprPos    =    g_sprRegister[l_sprIndex].iv_saveMaskPos;
 
+            if( l_sprPos > MAX_SPR_BIT_POS )
+            {
+                continue;
+            }
+
             //Check if a given SPR needs to be self-saved each time on STOP entry
 
             if( i_saveRegVector & ( TEST_BIT_PATTERN >> l_sprPos ) )
@@ -1493,139 +1536,187 @@ StopReturnCode_t p9_stop_save_cpureg_control(  void* i_pImage,
                 //update specific instructions of self save region to enable saving for SPR
                 l_rc    =   updateSelfSaveEntry( l_pSprSave, g_sprRegister[l_sprIndex].iv_sprId );
 
+                if( l_rc )
+                {
+                    MY_ERR( "Failed to update self save instructions for 0x%08x",
+                            (uint32_t) g_sprRegister[l_sprIndex].iv_sprId );
+                }
+
+                if( l_pTempLoc )
+                {
+                    l_pTempWord      =   (uint32_t *)l_pTempLoc;
+                    l_pTempWord++;
+                    *l_pTempWord     =   getXorInstruction( 0, 0, 0 );
+                }
+
             }// end if( i_saveRegVector..)
         }// end for
     }
     while(0);
 
+    MY_INF("<< proc_stop_save_cpureg_control" );
+
     return l_rc;
+
 }
 
 //-----------------------------------------------------------------------------------------------------
 
-StopReturnCode_t p9_stop_init_cpureg(  void* const i_pImage, const uint32_t i_corePos )
+StopReturnCode_t proc_stop_save_cpureg(  void* const i_pImage,
+                                       const CpuReg_t  i_regId,
+                                       const uint64_t  i_regData,
+                                       const uint64_t  i_pir )
 {
-    StopReturnCode_t    l_rc        =   STOP_SAVE_SUCCESS;
-    uint32_t* l_pRestoreStart       =   NULL;
-    void* l_pTempLoc                =   NULL;
-    SmfHomerSection_t* l_pHomer     =   NULL;
-    uint32_t l_threadPos            =   0;
-    uint32_t l_lookUpKey            =   0;
-    uint32_t l_sprIndex             =   0;
-    uint8_t l_selfRestVer           =   0;
 
-    MY_INF( ">> p9_stop_init_cpureg" );
+    StopReturnCode_t l_rc = STOP_SAVE_SUCCESS;    // procedure return code
+    HomerSection_t*     chipHomer       =    NULL;
+    SmfHomerSection_t*  smfChipHomer    =    NULL;
+
+    MY_INF(">> proc_stop_save_cpureg" );
 
     do
     {
-        if( !i_pImage )
+        uint32_t threadId       =   0;
+        uint32_t coreId         =   0;
+        uint32_t lookUpKey      =   0;
+        void* pSprEntryLocation =   NULL;   // an offset w.r.t. to start of image
+        void* pThreadLocation   =   NULL;
+        bool threadScopeReg     =   false;
+        uint8_t l_urmorFix      =   false;
+        uint64_t  l_sprValue    =   0;
+        uint8_t l_selfRestVer   =   0;
+
+
+        l_rc = getCoreAndThread( i_pImage, i_pir, &coreId, &threadId );
+
+        if( l_rc )
         {
-            l_rc    =   STOP_SAVE_ARG_INVALID_IMG;
+            MY_ERR("Failed to determine Core Id and Thread Id from PIR 0x%016llx",
+                   i_pir);
             break;
         }
 
-        if( i_corePos > MAX_CORE_ID_SUPPORTED )
+        MY_INF( " PIR 0x%016llx coreId %d threadid %d "
+                " registerId %d", i_pir, coreId,
+                threadId, i_regId );
+
+        // First of all let us validate all input arguments.
+        l_rc =  validateSprImageInputs( i_pImage,
+                                        i_regId,
+                                        coreId,
+                                        &threadId,
+                                        &threadScopeReg );
+
+        if( l_rc )
         {
-            l_rc    =  STOP_SAVE_ARG_INVALID_CORE;
+            // Error: bad argument traces out error code
+            MY_ERR("Bad input argument rc %d", l_rc );
+
             break;
         }
 
-        l_pHomer        =   ( SmfHomerSection_t * ) i_pImage;
+        l_urmorFix      =   *(uint8_t*)((uint8_t*)i_pImage + CPMR_HOMER_OFFSET + CPMR_URMOR_FIX_BYTE);
         l_selfRestVer   =   *(uint8_t *)((uint8_t *)i_pImage + CPMR_HOMER_OFFSET + CPMR_SELF_RESTORE_VER_BYTE );
 
-        for( l_sprIndex = 0; l_sprIndex < MAX_SPR_SUPPORTED; l_sprIndex++ )
+        if( l_selfRestVer )
         {
-            //Check if a given SPR needs to be self-saved each time on STOP entry
-
-            l_lookUpKey     =   genKeyForSprLookup( ( CpuReg_t )g_sprRegister[l_sprIndex].iv_sprId );
+            smfChipHomer = ( SmfHomerSection_t*)i_pImage;
 
-            if( g_sprRegister[l_sprIndex].iv_isThreadScope )
+            if( threadScopeReg )
             {
-                for( l_threadPos = 0; l_threadPos < MAX_THREADS_PER_CORE; l_threadPos++ )
-                {
-                    l_pRestoreStart =
-                        (uint32_t*)&l_pHomer->iv_coreThreadRestore[i_corePos].iv_threadRestoreArea[l_threadPos][0];
-
-                    l_rc    =   lookUpSprInImage( (uint32_t*)l_pRestoreStart, l_lookUpKey,
-                                                  g_sprRegister[l_sprIndex].iv_isThreadScope,
-                                                  &l_pTempLoc,
-                                                  l_selfRestVer );
-
-                    if( l_rc )
-                    {
-                        MY_ERR( "Thread SPR lookup failed in p9_stop_init_cpureg SPR %d Core %d Thread %d Index %d",
-                                g_sprRegister[l_sprIndex].iv_sprId, i_corePos, l_threadPos, l_sprIndex );
-                        break;
-                    }
-
-                    l_rc = updateSprEntryInImage( (uint32_t*) l_pTempLoc,
-                                                  ( CpuReg_t )g_sprRegister[l_sprIndex].iv_sprId,
-                                                  0x00,
-                                                  INIT_SPR_REGION );
-
-                    if( l_rc )
-                    {
-                        MY_ERR( "Thread SPR region init failed. Core %d SPR Id %d",
-                                i_corePos, g_sprRegister[l_sprIndex].iv_sprId );
-                        break;
-                    }
-
-                }//end for thread
-
-                if( l_rc )
-                {
-                    break;
-                }
-
-            }//end if SPR threadscope
+                pThreadLocation =
+                    &(smfChipHomer->iv_coreThreadRestore[coreId].iv_threadRestoreArea[threadId][0]);
+            }
             else
             {
-                l_pRestoreStart     =   (uint32_t*)&l_pHomer->iv_coreThreadRestore[i_corePos].iv_coreRestoreArea[0];
+                pThreadLocation =
+                    &(smfChipHomer->iv_coreThreadRestore[coreId].iv_coreRestoreArea[0]);
+            }
+        }
+        else    //Old fips or OPAL release that doesn't support SMF
+        {
+            chipHomer = (HomerSection_t*)i_pImage;
 
-                l_rc                =   lookUpSprInImage( (uint32_t*)l_pRestoreStart, l_lookUpKey,
-                                        g_sprRegister[l_sprIndex].iv_isThreadScope,
-                                        &l_pTempLoc, l_selfRestVer );
+            if( threadScopeReg )
+            {
+                pThreadLocation =
+                    &(chipHomer->iv_coreThreadRestore[coreId][threadId].iv_threadArea[0]);
+            }
+            else
+            {
+                pThreadLocation =
+                    &(chipHomer->iv_coreThreadRestore[coreId][threadId].iv_coreArea[0]);
+            }
+        }
 
-                if( l_rc )
-                {
-                    MY_ERR( "Core SPR lookup failed in p9_stop_init_cpureg" );
-                    break;
-                }
+        if( ( SWIZZLE_4_BYTE(BLR_INST) == *(uint32_t*)pThreadLocation ) ||
+            ( SWIZZLE_4_BYTE(ATTN_OPCODE) == *(uint32_t*) pThreadLocation ) )
+        {
+            // table for given core id doesn't exit. It needs to be
+            // defined.
+            pSprEntryLocation = pThreadLocation;
+        }
+        else
+        {
+            // an SPR restore section for given core already exists
+            lookUpKey = genKeyForSprLookup( i_regId );
+            l_rc = lookUpSprInImage( (uint32_t*)pThreadLocation,
+                                     lookUpKey,
+                                     threadScopeReg,
+                                     &pSprEntryLocation,
+                                     l_selfRestVer );
+        }
 
-                l_rc    =   updateSprEntryInImage( (uint32_t*) l_pTempLoc,
-                                                   ( CpuReg_t )g_sprRegister[l_sprIndex].iv_sprId,
-                                                   0x00,
-                                                   INIT_SPR_REGION );
+        if( l_rc )
+        {
+            MY_ERR("Invalid or corrupt SPR entry. CoreId 0x%08x threadId ",
+                   "0x%08x regId 0x%08x lookUpKey 0x%08x pThreadLocation 0x%08x"
+                   , coreId, threadId, i_regId, lookUpKey, pThreadLocation );
+            break;
+        }
 
-                if( l_rc )
-                {
-                    MY_ERR( "Core SPR region init failed. Core %d SPR Id %d SPR Index %d",
-                            i_corePos, g_sprRegister[l_sprIndex].iv_sprId, l_sprIndex );
-                    break;
-                }
+        if( ( P9_STOP_SPR_URMOR == i_regId ) && ( l_urmorFix ) )
+        {
+            l_sprValue  =  i_regData - URMOR_CORRECTION;
+        }
+        else
+        {
+            l_sprValue  =  i_regData;
+        }
 
-            }// end else
+        l_rc = updateSprEntryInImage( (uint32_t*) pSprEntryLocation,
+                                      i_regId,
+                                      l_sprValue,
+                                      UPDATE_SPR_ENTRY );
 
-        }// end for l_sprIndex
+        if( l_rc )
+        {
+            MY_ERR( " Failed to update the SPR entry of PIR 0x%08x reg"
+                    "0x%08x", i_pir, i_regId );
+            break;
+        }
 
     }
     while(0);
 
-    MY_INF( "<< p9_stop_init_cpureg" );
+    MY_INF("<< proc_stop_save_cpureg" );
+
     return l_rc;
 }
 
 //-----------------------------------------------------------------------------------------------------
 
-StopReturnCode_t p9_stop_init_self_save(  void* const i_pImage, const uint32_t i_corePos )
+StopReturnCode_t proc_stop_init_self_save(  void* const i_pImage, const uint32_t i_corePos )
 {
+
     StopReturnCode_t    l_rc        =   STOP_SAVE_SUCCESS;
     uint32_t* l_pSaveStart          =   NULL;
     SmfHomerSection_t *  l_pHomer   =   NULL;
     uint32_t l_threadPos            =   0;
     uint32_t l_sprBitPos            =   0;
     uint32_t l_sprIndexAdj          =   0;
-    MY_INF( ">> p9_stop_init_self_save" );
+
+    MY_INF(">> proc_stop_init_self_save" );
 
     do
     {
@@ -1732,7 +1823,8 @@ StopReturnCode_t p9_stop_init_self_save(  void* const i_pImage, const uint32_t i
     }
     while(0);
 
-    MY_INF( "<< p9_stop_init_self_save" );
+    MY_INF("<< proc_stop_init_self_save" );
+
     return l_rc;
 }
 
diff --git a/libpore/p9_stop_api.H b/libpore/p9_stop_api.H
index 17caedb3..3f6420ff 100644
--- a/libpore/p9_stop_api.H
+++ b/libpore/p9_stop_api.H
@@ -70,6 +70,26 @@ typedef enum
     P9_STOP_SPR_PMCR    =    884,   // core register
     P9_STOP_SPR_HID     =   1008,   // core register
     P9_STOP_SPR_MSR     =   2000,   // thread register
+
+    //enum members which are project agnostic
+    PROC_STOP_SPR_DAWR    =    180,   // thread register
+    PROC_STOP_SPR_CIABR   =    187,   // thread register
+    PROC_STOP_SPR_DAWRX   =    188,   // thread register
+    PROC_STOP_SPR_HSPRG0  =    304,   // thread register
+    PROC_STOP_SPR_HRMOR   =    313,   // core register
+    PROC_STOP_SPR_LPCR    =    318,   // thread register
+    PROC_STOP_SPR_HMEER   =    337,   // core register
+    PROC_STOP_SPR_PTCR    =    464,   // core register
+    PROC_STOP_SPR_USPRG0  =    496,   // thread register
+    PROC_STOP_SPR_USPRG1  =    497,   // thread register
+    PROC_STOP_SPR_URMOR   =    505,   // core register
+    PROC_STOP_SPR_SMFCTRL =    511,   // thread register
+    PROC_STOP_SPR_LDBAR   =    850,   // thread register
+    PROC_STOP_SPR_PSSCR   =    855,   // thread register
+    PROC_STOP_SPR_PMCR    =    884,   // core register
+    PROC_STOP_SPR_HID     =   1008,   // core register
+    PROC_STOP_SPR_MSR     =   2000,   // thread register
+
 } CpuReg_t;
 
 /**
@@ -110,7 +130,20 @@ typedef enum
     P9_STOP_SCOM_RESET      =   6,
     P9_STOP_SCOM_OR_APPEND  =   7,
     P9_STOP_SCOM_AND_APPEND =   8,
-    P9_STOP_SCOM_OP_MAX     =   9
+    P9_STOP_SCOM_OP_MAX     =   9,
+
+    //enum members which are project agnostic
+    PROC_STOP_SCOM_OP_MIN     =   0,
+    PROC_STOP_SCOM_APPEND     =   1,
+    PROC_STOP_SCOM_REPLACE    =   2,
+    PROC_STOP_SCOM_OR         =   3,
+    PROC_STOP_SCOM_AND        =   4,
+    PROC_STOP_SCOM_NOOP       =   5,
+    PROC_STOP_SCOM_RESET      =   6,
+    PROC_STOP_SCOM_OR_APPEND  =   7,
+    PROC_STOP_SCOM_AND_APPEND =   8,
+    PROC_STOP_SCOM_OP_MAX     =   9,
+
 } ScomOperation_t;
 
 /**
@@ -123,7 +156,15 @@ typedef enum
     P9_STOP_SECTION_EQ_SCOM     =   2,
     P9_STOP_SECTION_L2          =   3,
     P9_STOP_SECTION_L3          =   4,
-    P9_STOP_SECTION_MAX         =   5
+    P9_STOP_SECTION_MAX         =   5,
+
+    //enum members which are project agnostic
+    PROC_STOP_SECTION_MIN         =   0,
+    PROC_STOP_SECTION_CORE_SCOM   =   1,
+    PROC_STOP_SECTION_EQ_SCOM     =   2,
+    PROC_STOP_SECTION_L2          =   3,
+    PROC_STOP_SECTION_L3          =   4,
+    PROC_STOP_SECTION_MAX         =   5,
 } ScomSection_t;
 
 /**
@@ -148,7 +189,6 @@ typedef enum
     BIT_POS_LPCR        =   5,
     BIT_POS_PSSCR       =   6,
     BIT_POS_MSR         =   7,
-    BIT_POS_HRMOR       =   20,
     BIT_POS_HID         =   21,
     BIT_POS_HMEER       =   22,
     BIT_POS_PMCR        =   23,
@@ -156,7 +196,6 @@ typedef enum
     BIT_POS_SMFCTRL     =   28,
     BIT_POS_USPRG0      =   29,
     BIT_POS_USPRG1      =   30,
-    BIT_POS_URMOR       =   31,
 } SprBitPositionList_t;
 
 
@@ -229,13 +268,79 @@ p9_stop_save_cpureg_control( void* i_pImage, const uint64_t i_pir,
  * @brief       initializes self-save region with specific instruction.
  * @param[in]   i_pImage    start address of homer image of P9 chip.
  * @param[in]   i_corePos   physical core's relative position within processor chip.
- * @return      STOP_SAVE_SUCCESS SUCCESS if self-save is initialized successfully,
+ * @return      STOP_SAVE_SUCCESS  if self-save is initialized successfully,
  *              error code otherwise.
  * @note        API is intended only for use case of HOMER build. There is no explicit
  *              effort to support any other use case.
  */
 StopReturnCode_t p9_stop_init_self_save(  void* const i_pImage, const uint32_t i_corePos );
 
+/**
+ * @brief   creates SCOM restore entry for a given scom adress in HOMER.
+ * @param   i_pImage        points to start address of HOMER image.
+ * @param   i_scomAddress   address associated with SCOM restore entry.
+ * @param   i_scomData      data associated with SCOM restore entry.
+ * @param   i_operation     operation type requested for API.
+ * @param   i_section       section of HOMER in which restore entry needs to be created.
+ * @return  STOP_SAVE_SUCCESS if API succeeds, error code otherwise.
+ * @note    It is an API for creating SCOM restore entry in HOMER. It is agnostic to
+ *          generation of POWER processor.
+ */
+
+StopReturnCode_t proc_stop_save_scom( void* const   i_pImage,
+                                      const uint32_t i_scomAddress,
+                                      const uint64_t i_scomData,
+                                      const ScomOperation_t i_operation,
+                                      const ScomSection_t i_section );
+
+/**
+ * @brief       initializes self save restore region of HOMER.
+ * @param[in]   i_pImage    points to base of HOMER image.
+ * @param[in]   i_corePos   position of the physical core.
+ * @return      STOP_SAVE_SUCCESS if API succeeds, error code otherwise.
+ * @note        It is an API for initializing self restore region in HOMER. It is agnostic to
+ *              generation of POWER processor.
+ */
+StopReturnCode_t proc_stop_init_cpureg(  void* const i_pImage, const uint32_t i_corePos );
+
+/**
+ * @brief       enables self save for a given set of SPRs
+ * @param[in]   i_pImage        points to start address of HOMER image.
+ * @param[in]   i_pir           PIR value associated with core and thread.
+ * @param[in]   i_saveRegVector bit vector representing the SPRs that needs to be self saved.
+ * @return      STOP_SAVE_SUCCESS if API succeeds, error code otherwise.
+ * @note        It is an API for enabling self save of SPRs  and it is agnostic to
+ *              generation of POWER processor.
+ */
+StopReturnCode_t proc_stop_save_cpureg_control(  void* i_pImage,
+        const uint64_t i_pir,
+        const uint32_t i_saveRegVector );
+
+/**
+ * @brief       creates an SPR restore entry in HOMER
+ * @param[in]   i_pImage        points to start address of HOMER image.
+ * @param[in]   i_pir           PIR value associated with core and thread.
+ * @param[in]   i_saveRegVector bit vector representing the SPRs that needs to be self saved.
+ * @return      STOP_SAVE_SUCCESS if API succeeds, error code otherwise.
+ * @note        It is an API for enabling self save of SPRs  and it is agnostic to
+ *              generation of POWER processor.
+ */
+StopReturnCode_t proc_stop_save_cpureg(  void* const i_pImage,
+        const CpuReg_t  i_regId,
+        const uint64_t  i_regData,
+        const uint64_t  i_pir );
+
+/**
+ * @brief       initializes self-save region with specific instruction.
+ * @param[in]   i_pImage    start address of homer image.
+ * @param[in]   i_corePos   physical core's relative position within processor chip.
+ * @return      STOP_SAVE_SUCCESS  if self-save is initialized successfully,
+ *              error code otherwise.
+ * @note        API is project agnostic and is intended only for use case of HOMER build.
+ *              There is no explicit effort to support any other use case.
+ */
+StopReturnCode_t proc_stop_init_self_save(  void* const i_pImage, const uint32_t i_corePos );
+
 #ifdef __cplusplus
 } // extern "C"
 };  // namespace stopImageSection ends
diff --git a/libpore/p9_stop_data_struct.H b/libpore/p9_stop_data_struct.H
index 1e9721e0..4e73aab5 100644
--- a/libpore/p9_stop_data_struct.H
+++ b/libpore/p9_stop_data_struct.H
@@ -67,9 +67,9 @@ enum
     SIZE_PER_SPR_RESTORE_INST   =   ((4 * sizeof(uint8_t)) / sizeof(uint32_t)),
     MAX_THREAD_LEVEL_SPRS       =   11,
     MAX_CORE_LEVEL_SPRS         =   6,
-    MAX_SPR_BIT_POS             =   31,
+    MAX_SPR_BIT_POS             =   30,
     SPR_BIT_POS_8               =    8,
-    SPR_BIT_POS_19              =   19,
+    SPR_BIT_POS_20              =   20,
     SPR_BIT_POS_25              =   25,
     SPR_BIT_POS_27              =   27,
 };
diff --git a/libpore/p9_stop_util.H b/libpore/p9_stop_util.H
index 3266fdef..79b4e959 100644
--- a/libpore/p9_stop_util.H
+++ b/libpore/p9_stop_util.H
@@ -5,7 +5,7 @@
 /*                                                                        */
 /* OpenPOWER HostBoot Project                                             */
 /*                                                                        */
-/* Contributors Listed Below - COPYRIGHT 2016,2017                        */
+/* Contributors Listed Below - COPYRIGHT 2016,2018                        */
 /* [+] International Business Machines Corp.                              */
 /*                                                                        */
 /*                                                                        */
@@ -95,7 +95,10 @@ typedef struct
     uint64_t cpmrMagicWord;
     uint32_t buildDate;
     uint32_t version;
-    uint8_t  reserve1[7];
+    uint8_t  reserve1[4];
+    uint8_t  selfRestoreVer;
+    uint8_t  stopApiVer;
+    uint8_t  urmorFix;
     uint8_t  fusedModeStatus;
     uint32_t cmeImgOffset;
     uint32_t cmeImgLength;
-- 
2.25.1

