Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F52EA00
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 20:18:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tCb30TgJzDqVJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 04:18:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tCX43yqGzDqBK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 04:16:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44tCX42JCzz8t30
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 04:16:04 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44tCX41q7Hz9s9N; Tue, 30 Apr 2019 04:16:04 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mahesh@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44tCX34p3Pz9s4V
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Apr 2019 04:16:03 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3TIDLv2118456
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Apr 2019 14:16:01 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2s669r86x7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Apr 2019 14:16:01 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <mahesh@linux.vnet.ibm.com>;
 Mon, 29 Apr 2019 19:15:59 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 29 Apr 2019 19:15:58 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3TIFve956557592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Apr 2019 18:15:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6314211C052;
 Mon, 29 Apr 2019 18:15:57 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F96711C04C;
 Mon, 29 Apr 2019 18:15:56 +0000 (GMT)
Received: from [192.168.0.2] (unknown [9.102.3.52])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 29 Apr 2019 18:15:56 +0000 (GMT)
Subject: [PATCH v3 2/3] powernv/mce: Print correct severity for mce error.
From: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Mon, 29 Apr 2019 23:45:55 +0530
In-Reply-To: <155656174872.20636.6539465047019566013.stgit@jupiter>
References: <155656174872.20636.6539465047019566013.stgit@jupiter>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19042918-0020-0000-0000-0000033792AD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19042918-0021-0000-0000-0000218A0D6B
Message-Id: <155656175558.20636.10280528660118429391.stgit@jupiter>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-29_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904290124
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently all machine check errors are printed as severe errors which isn't
correct. Print soft errors as warning instead of severe errors.

Signed-off-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
---
change in v2:
- Use kernel types i.e. u8, u64 etc.
- Define sync_error as bool.
---
 arch/powerpc/include/asm/mce.h        |   86 ++++++++++----------
 arch/powerpc/kernel/mce.c             |    5 +
 arch/powerpc/kernel/mce_power.c       |  144 +++++++++++++++++----------------
 arch/powerpc/platforms/powernv/opal.c |    2 
 4 files changed, 123 insertions(+), 114 deletions(-)

diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index 8d0b1c24c636..b1f4bf863c95 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -31,7 +31,7 @@ enum MCE_Version {
 enum MCE_Severity {
 	MCE_SEV_NO_ERROR = 0,
 	MCE_SEV_WARNING = 1,
-	MCE_SEV_ERROR_SYNC = 2,
+	MCE_SEV_SEVERE = 2,
 	MCE_SEV_FATAL = 3,
 };
 
@@ -110,73 +110,74 @@ enum MCE_LinkErrorType {
 };
 
 struct machine_check_event {
-	enum MCE_Version	version:8;	/* 0x00 */
-	uint8_t			in_use;		/* 0x01 */
-	enum MCE_Severity	severity:8;	/* 0x02 */
-	enum MCE_Initiator	initiator:8;	/* 0x03 */
-	enum MCE_ErrorType	error_type:8;	/* 0x04 */
-	enum MCE_Disposition	disposition:8;	/* 0x05 */
-	uint16_t		cpu;		/* 0x06 */
-	uint64_t		gpr3;		/* 0x08 */
-	uint64_t		srr0;		/* 0x10 */
-	uint64_t		srr1;		/* 0x18 */
-	union {					/* 0x20 */
+	enum MCE_Version	version:8;
+	u8			in_use;
+	enum MCE_Severity	severity:8;
+	enum MCE_Initiator	initiator:8;
+	enum MCE_ErrorType	error_type:8;
+	enum MCE_Disposition	disposition:8;
+	bool			sync_error;
+	u16			cpu;
+	u64			gpr3;
+	u64			srr0;
+	u64			srr1;
+	union {
 		struct {
 			enum MCE_UeErrorType ue_error_type:8;
-			uint8_t		effective_address_provided;
-			uint8_t		physical_address_provided;
-			uint8_t		reserved_1[5];
-			uint64_t	effective_address;
-			uint64_t	physical_address;
-			uint8_t		reserved_2[8];
+			u8		effective_address_provided;
+			u8		physical_address_provided;
+			u8		reserved_1[5];
+			u64		effective_address;
+			u64		physical_address;
+			u8		reserved_2[8];
 		} ue_error;
 
 		struct {
 			enum MCE_SlbErrorType slb_error_type:8;
-			uint8_t		effective_address_provided;
-			uint8_t		reserved_1[6];
-			uint64_t	effective_address;
-			uint8_t		reserved_2[16];
+			u8		effective_address_provided;
+			u8		reserved_1[6];
+			u64		effective_address;
+			u8		reserved_2[16];
 		} slb_error;
 
 		struct {
 			enum MCE_EratErrorType erat_error_type:8;
-			uint8_t		effective_address_provided;
-			uint8_t		reserved_1[6];
-			uint64_t	effective_address;
-			uint8_t		reserved_2[16];
+			u8		effective_address_provided;
+			u8		reserved_1[6];
+			u64		effective_address;
+			u8		reserved_2[16];
 		} erat_error;
 
 		struct {
 			enum MCE_TlbErrorType tlb_error_type:8;
-			uint8_t		effective_address_provided;
-			uint8_t		reserved_1[6];
-			uint64_t	effective_address;
-			uint8_t		reserved_2[16];
+			u8		effective_address_provided;
+			u8		reserved_1[6];
+			u64		effective_address;
+			u8		reserved_2[16];
 		} tlb_error;
 
 		struct {
 			enum MCE_UserErrorType user_error_type:8;
-			uint8_t		effective_address_provided;
-			uint8_t		reserved_1[6];
-			uint64_t	effective_address;
-			uint8_t		reserved_2[16];
+			u8		effective_address_provided;
+			u8		reserved_1[6];
+			u64		effective_address;
+			u8		reserved_2[16];
 		} user_error;
 
 		struct {
 			enum MCE_RaErrorType ra_error_type:8;
-			uint8_t		effective_address_provided;
-			uint8_t		reserved_1[6];
-			uint64_t	effective_address;
-			uint8_t		reserved_2[16];
+			u8		effective_address_provided;
+			u8		reserved_1[6];
+			u64		effective_address;
+			u8		reserved_2[16];
 		} ra_error;
 
 		struct {
 			enum MCE_LinkErrorType link_error_type:8;
-			uint8_t		effective_address_provided;
-			uint8_t		reserved_1[6];
-			uint64_t	effective_address;
-			uint8_t		reserved_2[16];
+			u8		effective_address_provided;
+			u8		reserved_1[6];
+			u64		effective_address;
+			u8		reserved_2[16];
 		} link_error;
 	} u;
 };
@@ -194,6 +195,7 @@ struct mce_error_info {
 	} u;
 	enum MCE_Severity	severity:8;
 	enum MCE_Initiator	initiator:8;
+	bool			sync_error;
 };
 
 #define MAX_MC_EVT	100
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 25a8b20cbbdc..71d245a387ab 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -122,6 +122,7 @@ void save_mce_event(struct pt_regs *regs, long handled,
 
 	mce->initiator = mce_err->initiator;
 	mce->severity = mce_err->severity;
+	mce->sync_error = mce_err->sync_error;
 
 	/*
 	 * Populate the mce error_type and type-specific error_type.
@@ -376,9 +377,9 @@ void machine_check_print_event_info(struct machine_check_event *evt,
 		break;
 	case MCE_SEV_WARNING:
 		level = KERN_WARNING;
-		sevstr = "";
+		sevstr = "Warning";
 		break;
-	case MCE_SEV_ERROR_SYNC:
+	case MCE_SEV_SEVERE:
 		level = KERN_ERR;
 		sevstr = "Severe";
 		break;
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index 6b800eec31f2..606af87a4dda 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -133,106 +133,107 @@ struct mce_ierror_table {
 	unsigned int error_subtype;
 	unsigned int initiator;
 	unsigned int severity;
+	bool sync_error;
 };
 
 static const struct mce_ierror_table mce_p7_ierror_table[] = {
 { 0x00000000001c0000, 0x0000000000040000, true,
   MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_IFETCH,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000001c0000, 0x0000000000080000, true,
   MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_PARITY,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000001c0000, 0x00000000000c0000, true,
   MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_MULTIHIT,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
 { 0x00000000001c0000, 0x0000000000100000, true,
   MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_INDETERMINATE, /* BOTH */
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
 { 0x00000000001c0000, 0x0000000000140000, true,
   MCE_ERROR_TYPE_TLB, MCE_TLB_ERROR_MULTIHIT,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
 { 0x00000000001c0000, 0x0000000000180000, true,
   MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_PAGE_TABLE_WALK_IFETCH,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000001c0000, 0x00000000001c0000, true,
   MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_IFETCH,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
-{ 0, 0, 0, 0, 0, 0 } };
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
+{ 0, 0, 0, 0, 0, 0, 0 } };
 
 static const struct mce_ierror_table mce_p8_ierror_table[] = {
 { 0x00000000081c0000, 0x0000000000040000, true,
   MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_IFETCH,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x0000000000080000, true,
   MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_PARITY,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x00000000000c0000, true,
   MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_MULTIHIT,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
 { 0x00000000081c0000, 0x0000000000100000, true,
   MCE_ERROR_TYPE_ERAT,MCE_ERAT_ERROR_MULTIHIT,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
 { 0x00000000081c0000, 0x0000000000140000, true,
   MCE_ERROR_TYPE_TLB, MCE_TLB_ERROR_MULTIHIT,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
 { 0x00000000081c0000, 0x0000000000180000, true,
   MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_PAGE_TABLE_WALK_IFETCH,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x00000000001c0000, true,
   MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_IFETCH,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x0000000008000000, true,
   MCE_ERROR_TYPE_LINK,MCE_LINK_ERROR_IFETCH_TIMEOUT,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x0000000008040000, true,
   MCE_ERROR_TYPE_LINK,MCE_LINK_ERROR_PAGE_TABLE_WALK_IFETCH_TIMEOUT,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
-{ 0, 0, 0, 0, 0, 0 } };
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
+{ 0, 0, 0, 0, 0, 0, 0 } };
 
 static const struct mce_ierror_table mce_p9_ierror_table[] = {
 { 0x00000000081c0000, 0x0000000000040000, true,
   MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_IFETCH,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x0000000000080000, true,
   MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_PARITY,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x00000000000c0000, true,
   MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_MULTIHIT,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
 { 0x00000000081c0000, 0x0000000000100000, true,
   MCE_ERROR_TYPE_ERAT,MCE_ERAT_ERROR_MULTIHIT,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
 { 0x00000000081c0000, 0x0000000000140000, true,
   MCE_ERROR_TYPE_TLB, MCE_TLB_ERROR_MULTIHIT,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
 { 0x00000000081c0000, 0x0000000000180000, true,
   MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_PAGE_TABLE_WALK_IFETCH,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x00000000001c0000, true,
   MCE_ERROR_TYPE_RA,  MCE_RA_ERROR_IFETCH_FOREIGN,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x0000000008000000, true,
   MCE_ERROR_TYPE_LINK,MCE_LINK_ERROR_IFETCH_TIMEOUT,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x0000000008040000, true,
   MCE_ERROR_TYPE_LINK,MCE_LINK_ERROR_PAGE_TABLE_WALK_IFETCH_TIMEOUT,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x00000000080c0000, true,
   MCE_ERROR_TYPE_RA,  MCE_RA_ERROR_IFETCH,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x0000000008100000, true,
   MCE_ERROR_TYPE_RA,  MCE_RA_ERROR_PAGE_TABLE_WALK_IFETCH,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x0000000008140000, false,
   MCE_ERROR_TYPE_RA,  MCE_RA_ERROR_STORE,
-  MCE_INITIATOR_CPU,  MCE_SEV_FATAL, }, /* ASYNC is fatal */
+  MCE_INITIATOR_CPU,  MCE_SEV_FATAL, false }, /* ASYNC is fatal */
 { 0x00000000081c0000, 0x0000000008180000, false,
   MCE_ERROR_TYPE_LINK,MCE_LINK_ERROR_STORE_TIMEOUT,
-  MCE_INITIATOR_CPU,  MCE_SEV_FATAL, }, /* ASYNC is fatal */
+  MCE_INITIATOR_CPU,  MCE_SEV_FATAL, false }, /* ASYNC is fatal */
 { 0x00000000081c0000, 0x00000000081c0000, true,
   MCE_ERROR_TYPE_RA,  MCE_RA_ERROR_PAGE_TABLE_WALK_IFETCH_FOREIGN,
-  MCE_INITIATOR_CPU,  MCE_SEV_ERROR_SYNC, },
-{ 0, 0, 0, 0, 0, 0 } };
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
+{ 0, 0, 0, 0, 0, 0, 0 } };
 
 struct mce_derror_table {
 	unsigned long dsisr_value;
@@ -241,103 +242,104 @@ struct mce_derror_table {
 	unsigned int error_subtype;
 	unsigned int initiator;
 	unsigned int severity;
+	bool sync_error;
 };
 
 static const struct mce_derror_table mce_p7_derror_table[] = {
 { 0x00008000, false,
   MCE_ERROR_TYPE_UE,   MCE_UE_ERROR_LOAD_STORE,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00004000, true,
   MCE_ERROR_TYPE_UE,   MCE_UE_ERROR_PAGE_TABLE_WALK_LOAD_STORE,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00000800, true,
   MCE_ERROR_TYPE_ERAT, MCE_ERAT_ERROR_MULTIHIT,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000400, true,
   MCE_ERROR_TYPE_TLB,  MCE_TLB_ERROR_MULTIHIT,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000080, true,
   MCE_ERROR_TYPE_SLB,  MCE_SLB_ERROR_MULTIHIT,	/* Before PARITY */
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000100, true,
   MCE_ERROR_TYPE_SLB,  MCE_SLB_ERROR_PARITY,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00000040, true,
   MCE_ERROR_TYPE_SLB,  MCE_SLB_ERROR_INDETERMINATE, /* BOTH */
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
-{ 0, false, 0, 0, 0, 0 } };
+  MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
+{ 0, false, 0, 0, 0, 0, 0 } };
 
 static const struct mce_derror_table mce_p8_derror_table[] = {
 { 0x00008000, false,
   MCE_ERROR_TYPE_UE,   MCE_UE_ERROR_LOAD_STORE,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00004000, true,
   MCE_ERROR_TYPE_UE,   MCE_UE_ERROR_PAGE_TABLE_WALK_LOAD_STORE,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00002000, true,
   MCE_ERROR_TYPE_LINK, MCE_LINK_ERROR_LOAD_TIMEOUT,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00001000, true,
   MCE_ERROR_TYPE_LINK, MCE_LINK_ERROR_PAGE_TABLE_WALK_LOAD_STORE_TIMEOUT,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00000800, true,
   MCE_ERROR_TYPE_ERAT, MCE_ERAT_ERROR_MULTIHIT,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000400, true,
   MCE_ERROR_TYPE_TLB,  MCE_TLB_ERROR_MULTIHIT,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000200, true,
   MCE_ERROR_TYPE_ERAT, MCE_ERAT_ERROR_MULTIHIT, /* SECONDARY ERAT */
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000080, true,
   MCE_ERROR_TYPE_SLB,  MCE_SLB_ERROR_MULTIHIT,	/* Before PARITY */
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000100, true,
   MCE_ERROR_TYPE_SLB,  MCE_SLB_ERROR_PARITY,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
-{ 0, false, 0, 0, 0, 0 } };
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
+{ 0, false, 0, 0, 0, 0, 0 } };
 
 static const struct mce_derror_table mce_p9_derror_table[] = {
 { 0x00008000, false,
   MCE_ERROR_TYPE_UE,   MCE_UE_ERROR_LOAD_STORE,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00004000, true,
   MCE_ERROR_TYPE_UE,   MCE_UE_ERROR_PAGE_TABLE_WALK_LOAD_STORE,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00002000, true,
   MCE_ERROR_TYPE_LINK, MCE_LINK_ERROR_LOAD_TIMEOUT,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00001000, true,
   MCE_ERROR_TYPE_LINK, MCE_LINK_ERROR_PAGE_TABLE_WALK_LOAD_STORE_TIMEOUT,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00000800, true,
   MCE_ERROR_TYPE_ERAT, MCE_ERAT_ERROR_MULTIHIT,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000400, true,
   MCE_ERROR_TYPE_TLB,  MCE_TLB_ERROR_MULTIHIT,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000200, false,
   MCE_ERROR_TYPE_USER, MCE_USER_ERROR_TLBIE,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000080, true,
   MCE_ERROR_TYPE_SLB,  MCE_SLB_ERROR_MULTIHIT,	/* Before PARITY */
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000100, true,
   MCE_ERROR_TYPE_SLB,  MCE_SLB_ERROR_PARITY,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00000040, true,
   MCE_ERROR_TYPE_RA,   MCE_RA_ERROR_LOAD,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00000020, false,
   MCE_ERROR_TYPE_RA,   MCE_RA_ERROR_PAGE_TABLE_WALK_LOAD_STORE,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00000010, false,
   MCE_ERROR_TYPE_RA,   MCE_RA_ERROR_PAGE_TABLE_WALK_LOAD_STORE_FOREIGN,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00000008, false,
   MCE_ERROR_TYPE_RA,   MCE_RA_ERROR_LOAD_STORE_FOREIGN,
-  MCE_INITIATOR_CPU,   MCE_SEV_ERROR_SYNC, },
-{ 0, false, 0, 0, 0, 0 } };
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
+{ 0, false, 0, 0, 0, 0, 0 } };
 
 static int mce_find_instr_ea_and_pfn(struct pt_regs *regs, uint64_t *addr,
 					uint64_t *phys_addr)
@@ -427,11 +429,12 @@ static int mce_handle_ierror(struct pt_regs *regs,
 			mce_err->u.link_error_type = table[i].error_subtype;
 			break;
 		}
+		mce_err->sync_error = table[i].sync_error;
 		mce_err->severity = table[i].severity;
 		mce_err->initiator = table[i].initiator;
 		if (table[i].nip_valid) {
 			*addr = regs->nip;
-			if (mce_err->severity == MCE_SEV_ERROR_SYNC &&
+			if (mce_err->sync_error &&
 				table[i].error_type == MCE_ERROR_TYPE_UE) {
 				unsigned long pfn;
 
@@ -448,8 +451,9 @@ static int mce_handle_ierror(struct pt_regs *regs,
 	}
 
 	mce_err->error_type = MCE_ERROR_TYPE_UNKNOWN;
-	mce_err->severity = MCE_SEV_ERROR_SYNC;
+	mce_err->severity = MCE_SEV_SEVERE;
 	mce_err->initiator = MCE_INITIATOR_CPU;
+	mce_err->sync_error = true;
 
 	return 0;
 }
@@ -519,11 +523,12 @@ static int mce_handle_derror(struct pt_regs *regs,
 			mce_err->u.link_error_type = table[i].error_subtype;
 			break;
 		}
+		mce_err->sync_error = table[i].sync_error;
 		mce_err->severity = table[i].severity;
 		mce_err->initiator = table[i].initiator;
 		if (table[i].dar_valid)
 			*addr = regs->dar;
-		else if (mce_err->severity == MCE_SEV_ERROR_SYNC &&
+		else if (mce_err->sync_error &&
 				table[i].error_type == MCE_ERROR_TYPE_UE) {
 			/*
 			 * We do a maximum of 4 nested MCE calls, see
@@ -539,8 +544,9 @@ static int mce_handle_derror(struct pt_regs *regs,
 		return handled;
 
 	mce_err->error_type = MCE_ERROR_TYPE_UNKNOWN;
-	mce_err->severity = MCE_SEV_ERROR_SYNC;
+	mce_err->severity = MCE_SEV_SEVERE;
 	mce_err->initiator = MCE_INITIATOR_CPU;
+	mce_err->sync_error = true;
 
 	return 0;
 }
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 77552e525e33..f2b063b027f0 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -505,7 +505,7 @@ static int opal_recover_mce(struct pt_regs *regs,
 		recovered = 0;
 	}
 
-	if (!recovered && evt->severity == MCE_SEV_ERROR_SYNC) {
+	if (!recovered && evt->sync_error) {
 		/*
 		 * Try to kill processes if we get a synchronous machine check
 		 * (e.g., one caused by execution of this instruction). This

