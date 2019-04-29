Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16370EA04
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 20:20:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tCcq35ByzDqS6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 04:20:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tCXP5WqxzDqSj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 04:16:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44tCXP4x1wz8t30
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 04:16:21 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44tCXP4CHBz9s5c; Tue, 30 Apr 2019 04:16:21 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mahesh@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44tCXP0yzHz9s4V
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Apr 2019 04:16:20 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3TICO0D007754
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Apr 2019 14:16:19 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s655g33xy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Apr 2019 14:16:18 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <mahesh@linux.vnet.ibm.com>;
 Mon, 29 Apr 2019 19:16:16 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 29 Apr 2019 19:16:15 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3TIGEBL57671806
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Apr 2019 18:16:14 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7058C42047;
 Mon, 29 Apr 2019 18:16:14 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EE3042041;
 Mon, 29 Apr 2019 18:16:13 +0000 (GMT)
Received: from [192.168.0.2] (unknown [9.102.3.52])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 29 Apr 2019 18:16:13 +0000 (GMT)
Subject: [PATCH v3 3/3] powernv/mce: print additional information about mce
 error.
From: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Mon, 29 Apr 2019 23:46:02 +0530
In-Reply-To: <155656174872.20636.6539465047019566013.stgit@jupiter>
References: <155656174872.20636.6539465047019566013.stgit@jupiter>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19042918-0008-0000-0000-000002E19073
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19042918-0009-0000-0000-0000224DF592
Message-Id: <155656176257.20636.407844415270841825.stgit@jupiter>
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

Print more information about mce error whether it is an hardware or
software error.

Some of the mce errors can be easily categorized as hardware or software
errors e.g. UEs are due to hardware error, where as error triggered due to
invalid usage of tlbie is a pure software bug. But not all the mce errors
can be easily categorize into either software or hardware. There are errors
like multihit errors which are usually result of a software bug, but in
some rare cases a hardware failure can cause a multihit error. In past, we
have seen case where after replacing faulty chip, multihit errors stopped
occurring. Same with parity errors, which are usually due to faulty hardware
but there are chances where multihit can also cause an parity error. Such
errors are difficult to determine what really caused it. Hence this patch
classifies mce errors into following four categorize:
	1. Hardware error:
		UE and Link timeout failure errors.
	2. Probable hardware error (some chance of software cause)
		SLB/ERAT/TLB Parity errors.
	3. Software error
		Invalid tlbie form.
	4. Probable software error (some chance of hardware cause)
		SLB/ERAT/TLB Multihit errors.

Sample o/p:

[ 1289.447571] MCE: CPU80: machine check (Warning) Guest SLB Multihit DAR: 000001001b6e0320 [Recovered]
[ 1289.447615] MCE: CPU80: PID: 24765 Comm: qemu-system-ppc Guest NIP: [00007fffa309dc60]
[ 1289.447634] MCE: CPU80: Probable Software error (some chance of hardware cause)

Signed-off-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
---
Change in v2:
- Rephrase the wording for error class as suggested by Michael.
---
 arch/powerpc/include/asm/mce.h  |   10 ++++
 arch/powerpc/kernel/mce.c       |   12 ++++
 arch/powerpc/kernel/mce_power.c |  107 +++++++++++++++++++++++----------------
 3 files changed, 86 insertions(+), 43 deletions(-)

diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index b1f4bf863c95..8741f4c21a1a 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -56,6 +56,14 @@ enum MCE_ErrorType {
 	MCE_ERROR_TYPE_LINK = 7,
 };
 
+enum MCE_ErrorClass {
+	MCE_ECLASS_UNKNOWN = 0,
+	MCE_ECLASS_HARDWARE,
+	MCE_ECLASS_HARD_INDETERMINATE,
+	MCE_ECLASS_SOFTWARE,
+	MCE_ECLASS_SOFT_INDETERMINATE,
+};
+
 enum MCE_UeErrorType {
 	MCE_UE_ERROR_INDETERMINATE = 0,
 	MCE_UE_ERROR_IFETCH = 1,
@@ -115,6 +123,7 @@ struct machine_check_event {
 	enum MCE_Severity	severity:8;
 	enum MCE_Initiator	initiator:8;
 	enum MCE_ErrorType	error_type:8;
+	enum MCE_ErrorClass	error_class:8;
 	enum MCE_Disposition	disposition:8;
 	bool			sync_error;
 	u16			cpu;
@@ -195,6 +204,7 @@ struct mce_error_info {
 	} u;
 	enum MCE_Severity	severity:8;
 	enum MCE_Initiator	initiator:8;
+	enum MCE_ErrorClass	error_class:8;
 	bool			sync_error;
 };
 
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 71d245a387ab..4581377cfc98 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -123,6 +123,7 @@ void save_mce_event(struct pt_regs *regs, long handled,
 	mce->initiator = mce_err->initiator;
 	mce->severity = mce_err->severity;
 	mce->sync_error = mce_err->sync_error;
+	mce->error_class = mce_err->error_class;
 
 	/*
 	 * Populate the mce error_type and type-specific error_type.
@@ -363,6 +364,13 @@ void machine_check_print_event_info(struct machine_check_event *evt,
 		"Store (timeout)",
 		"Page table walk Load/Store (timeout)",
 	};
+	static const char *mc_error_class[] = {
+		"Unknown",
+		"Hardware error",
+		"Probable Hardware error (some chance of software cause)",
+		"Software error",
+		"Probable Software error (some chance of hardware cause)",
+	};
 
 	/* Print things out */
 	if (evt->version != MCE_V1) {
@@ -487,6 +495,10 @@ void machine_check_print_event_info(struct machine_check_event *evt,
 		printk("%sMCE: CPU%d: NIP: [%016llx] %pS%s\n",
 			level, evt->cpu, evt->srr0, (void *)evt->srr0, pa_str);
 	}
+
+	subtype = evt->error_class < ARRAY_SIZE(mc_error_class) ?
+		mc_error_class[evt->error_class] : "Unknown";
+	printk("%sMCE: CPU%d: %s\n", level, evt->cpu, subtype);
 }
 EXPORT_SYMBOL_GPL(machine_check_print_event_info);
 
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index 606af87a4dda..3658af85e48a 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -131,6 +131,7 @@ struct mce_ierror_table {
 	bool nip_valid; /* nip is a valid indicator of faulting address */
 	unsigned int error_type;
 	unsigned int error_subtype;
+	unsigned int error_class;
 	unsigned int initiator;
 	unsigned int severity;
 	bool sync_error;
@@ -138,99 +139,103 @@ struct mce_ierror_table {
 
 static const struct mce_ierror_table mce_p7_ierror_table[] = {
 { 0x00000000001c0000, 0x0000000000040000, true,
-  MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_IFETCH,
+  MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_IFETCH, MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000001c0000, 0x0000000000080000, true,
-  MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_PARITY,
+  MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_PARITY, MCE_ECLASS_HARD_INDETERMINATE,
   MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000001c0000, 0x00000000000c0000, true,
-  MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_MULTIHIT,
+  MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_MULTIHIT, MCE_ECLASS_SOFT_INDETERMINATE,
   MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
 { 0x00000000001c0000, 0x0000000000100000, true,
   MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_INDETERMINATE, /* BOTH */
+  MCE_ECLASS_SOFT_INDETERMINATE,
   MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
 { 0x00000000001c0000, 0x0000000000140000, true,
-  MCE_ERROR_TYPE_TLB, MCE_TLB_ERROR_MULTIHIT,
+  MCE_ERROR_TYPE_TLB, MCE_TLB_ERROR_MULTIHIT, MCE_ECLASS_SOFT_INDETERMINATE,
   MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
 { 0x00000000001c0000, 0x0000000000180000, true,
-  MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_PAGE_TABLE_WALK_IFETCH,
+  MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_PAGE_TABLE_WALK_IFETCH, MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000001c0000, 0x00000000001c0000, true,
-  MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_IFETCH,
+  MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_IFETCH, MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0, 0, 0, 0, 0, 0, 0 } };
 
 static const struct mce_ierror_table mce_p8_ierror_table[] = {
 { 0x00000000081c0000, 0x0000000000040000, true,
-  MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_IFETCH,
+  MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_IFETCH, MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x0000000000080000, true,
-  MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_PARITY,
+  MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_PARITY, MCE_ECLASS_HARD_INDETERMINATE,
   MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x00000000000c0000, true,
-  MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_MULTIHIT,
+  MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_MULTIHIT, MCE_ECLASS_SOFT_INDETERMINATE,
   MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
 { 0x00000000081c0000, 0x0000000000100000, true,
-  MCE_ERROR_TYPE_ERAT,MCE_ERAT_ERROR_MULTIHIT,
+  MCE_ERROR_TYPE_ERAT, MCE_ERAT_ERROR_MULTIHIT, MCE_ECLASS_SOFT_INDETERMINATE,
   MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
 { 0x00000000081c0000, 0x0000000000140000, true,
-  MCE_ERROR_TYPE_TLB, MCE_TLB_ERROR_MULTIHIT,
+  MCE_ERROR_TYPE_TLB, MCE_TLB_ERROR_MULTIHIT, MCE_ECLASS_SOFT_INDETERMINATE,
   MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
 { 0x00000000081c0000, 0x0000000000180000, true,
   MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_PAGE_TABLE_WALK_IFETCH,
+  MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x00000000001c0000, true,
-  MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_IFETCH,
+  MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_IFETCH, MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x0000000008000000, true,
-  MCE_ERROR_TYPE_LINK,MCE_LINK_ERROR_IFETCH_TIMEOUT,
+  MCE_ERROR_TYPE_LINK, MCE_LINK_ERROR_IFETCH_TIMEOUT, MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x0000000008040000, true,
   MCE_ERROR_TYPE_LINK,MCE_LINK_ERROR_PAGE_TABLE_WALK_IFETCH_TIMEOUT,
+  MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0, 0, 0, 0, 0, 0, 0 } };
 
 static const struct mce_ierror_table mce_p9_ierror_table[] = {
 { 0x00000000081c0000, 0x0000000000040000, true,
-  MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_IFETCH,
+  MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_IFETCH, MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x0000000000080000, true,
-  MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_PARITY,
+  MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_PARITY, MCE_ECLASS_HARD_INDETERMINATE,
   MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x00000000000c0000, true,
-  MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_MULTIHIT,
+  MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_MULTIHIT, MCE_ECLASS_SOFT_INDETERMINATE,
   MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
 { 0x00000000081c0000, 0x0000000000100000, true,
-  MCE_ERROR_TYPE_ERAT,MCE_ERAT_ERROR_MULTIHIT,
+  MCE_ERROR_TYPE_ERAT, MCE_ERAT_ERROR_MULTIHIT, MCE_ECLASS_SOFT_INDETERMINATE,
   MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
 { 0x00000000081c0000, 0x0000000000140000, true,
-  MCE_ERROR_TYPE_TLB, MCE_TLB_ERROR_MULTIHIT,
+  MCE_ERROR_TYPE_TLB, MCE_TLB_ERROR_MULTIHIT, MCE_ECLASS_SOFT_INDETERMINATE,
   MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
 { 0x00000000081c0000, 0x0000000000180000, true,
-  MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_PAGE_TABLE_WALK_IFETCH,
+  MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_PAGE_TABLE_WALK_IFETCH, MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x00000000001c0000, true,
-  MCE_ERROR_TYPE_RA,  MCE_RA_ERROR_IFETCH_FOREIGN,
+  MCE_ERROR_TYPE_RA,  MCE_RA_ERROR_IFETCH_FOREIGN, MCE_ECLASS_SOFTWARE,
   MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x0000000008000000, true,
-  MCE_ERROR_TYPE_LINK,MCE_LINK_ERROR_IFETCH_TIMEOUT,
+  MCE_ERROR_TYPE_LINK, MCE_LINK_ERROR_IFETCH_TIMEOUT, MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x0000000008040000, true,
   MCE_ERROR_TYPE_LINK,MCE_LINK_ERROR_PAGE_TABLE_WALK_IFETCH_TIMEOUT,
+  MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x00000000080c0000, true,
-  MCE_ERROR_TYPE_RA,  MCE_RA_ERROR_IFETCH,
+  MCE_ERROR_TYPE_RA,  MCE_RA_ERROR_IFETCH, MCE_ECLASS_SOFTWARE,
   MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x0000000008100000, true,
-  MCE_ERROR_TYPE_RA,  MCE_RA_ERROR_PAGE_TABLE_WALK_IFETCH,
+  MCE_ERROR_TYPE_RA,  MCE_RA_ERROR_PAGE_TABLE_WALK_IFETCH, MCE_ECLASS_SOFTWARE,
   MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0x00000000081c0000, 0x0000000008140000, false,
-  MCE_ERROR_TYPE_RA,  MCE_RA_ERROR_STORE,
+  MCE_ERROR_TYPE_RA,  MCE_RA_ERROR_STORE, MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,  MCE_SEV_FATAL, false }, /* ASYNC is fatal */
 { 0x00000000081c0000, 0x0000000008180000, false,
   MCE_ERROR_TYPE_LINK,MCE_LINK_ERROR_STORE_TIMEOUT,
   MCE_INITIATOR_CPU,  MCE_SEV_FATAL, false }, /* ASYNC is fatal */
-{ 0x00000000081c0000, 0x00000000081c0000, true,
+{ 0x00000000081c0000, 0x00000000081c0000, true, MCE_ECLASS_HARDWARE,
   MCE_ERROR_TYPE_RA,  MCE_RA_ERROR_PAGE_TABLE_WALK_IFETCH_FOREIGN,
   MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0, 0, 0, 0, 0, 0, 0 } };
@@ -240,6 +245,7 @@ struct mce_derror_table {
 	bool dar_valid; /* dar is a valid indicator of faulting address */
 	unsigned int error_type;
 	unsigned int error_subtype;
+	unsigned int error_class;
 	unsigned int initiator;
 	unsigned int severity;
 	bool sync_error;
@@ -247,97 +253,108 @@ struct mce_derror_table {
 
 static const struct mce_derror_table mce_p7_derror_table[] = {
 { 0x00008000, false,
-  MCE_ERROR_TYPE_UE,   MCE_UE_ERROR_LOAD_STORE,
+  MCE_ERROR_TYPE_UE,   MCE_UE_ERROR_LOAD_STORE, MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00004000, true,
   MCE_ERROR_TYPE_UE,   MCE_UE_ERROR_PAGE_TABLE_WALK_LOAD_STORE,
+  MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00000800, true,
-  MCE_ERROR_TYPE_ERAT, MCE_ERAT_ERROR_MULTIHIT,
+  MCE_ERROR_TYPE_ERAT, MCE_ERAT_ERROR_MULTIHIT, MCE_ECLASS_SOFT_INDETERMINATE,
   MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000400, true,
-  MCE_ERROR_TYPE_TLB,  MCE_TLB_ERROR_MULTIHIT,
+  MCE_ERROR_TYPE_TLB,  MCE_TLB_ERROR_MULTIHIT, MCE_ECLASS_SOFT_INDETERMINATE,
   MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000080, true,
-  MCE_ERROR_TYPE_SLB,  MCE_SLB_ERROR_MULTIHIT,	/* Before PARITY */
+  MCE_ERROR_TYPE_SLB,  MCE_SLB_ERROR_MULTIHIT, MCE_ECLASS_SOFT_INDETERMINATE,
   MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000100, true,
-  MCE_ERROR_TYPE_SLB,  MCE_SLB_ERROR_PARITY,
+  MCE_ERROR_TYPE_SLB,  MCE_SLB_ERROR_PARITY, MCE_ECLASS_HARD_INDETERMINATE,
   MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00000040, true,
   MCE_ERROR_TYPE_SLB,  MCE_SLB_ERROR_INDETERMINATE, /* BOTH */
+  MCE_ECLASS_HARD_INDETERMINATE,
   MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0, false, 0, 0, 0, 0, 0 } };
 
 static const struct mce_derror_table mce_p8_derror_table[] = {
 { 0x00008000, false,
-  MCE_ERROR_TYPE_UE,   MCE_UE_ERROR_LOAD_STORE,
+  MCE_ERROR_TYPE_UE,   MCE_UE_ERROR_LOAD_STORE, MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00004000, true,
   MCE_ERROR_TYPE_UE,   MCE_UE_ERROR_PAGE_TABLE_WALK_LOAD_STORE,
+  MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00002000, true,
-  MCE_ERROR_TYPE_LINK, MCE_LINK_ERROR_LOAD_TIMEOUT,
+  MCE_ERROR_TYPE_LINK, MCE_LINK_ERROR_LOAD_TIMEOUT, MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00001000, true,
   MCE_ERROR_TYPE_LINK, MCE_LINK_ERROR_PAGE_TABLE_WALK_LOAD_STORE_TIMEOUT,
+  MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00000800, true,
-  MCE_ERROR_TYPE_ERAT, MCE_ERAT_ERROR_MULTIHIT,
+  MCE_ERROR_TYPE_ERAT, MCE_ERAT_ERROR_MULTIHIT, MCE_ECLASS_SOFT_INDETERMINATE,
   MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000400, true,
-  MCE_ERROR_TYPE_TLB,  MCE_TLB_ERROR_MULTIHIT,
+  MCE_ERROR_TYPE_TLB,  MCE_TLB_ERROR_MULTIHIT, MCE_ECLASS_SOFT_INDETERMINATE,
   MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000200, true,
   MCE_ERROR_TYPE_ERAT, MCE_ERAT_ERROR_MULTIHIT, /* SECONDARY ERAT */
+  MCE_ECLASS_SOFT_INDETERMINATE,
   MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000080, true,
   MCE_ERROR_TYPE_SLB,  MCE_SLB_ERROR_MULTIHIT,	/* Before PARITY */
+  MCE_ECLASS_SOFT_INDETERMINATE,
   MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000100, true,
-  MCE_ERROR_TYPE_SLB,  MCE_SLB_ERROR_PARITY,
+  MCE_ERROR_TYPE_SLB,  MCE_SLB_ERROR_PARITY, MCE_ECLASS_HARD_INDETERMINATE,
   MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0, false, 0, 0, 0, 0, 0 } };
 
 static const struct mce_derror_table mce_p9_derror_table[] = {
 { 0x00008000, false,
-  MCE_ERROR_TYPE_UE,   MCE_UE_ERROR_LOAD_STORE,
+  MCE_ERROR_TYPE_UE,   MCE_UE_ERROR_LOAD_STORE, MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00004000, true,
   MCE_ERROR_TYPE_UE,   MCE_UE_ERROR_PAGE_TABLE_WALK_LOAD_STORE,
+  MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00002000, true,
-  MCE_ERROR_TYPE_LINK, MCE_LINK_ERROR_LOAD_TIMEOUT,
+  MCE_ERROR_TYPE_LINK, MCE_LINK_ERROR_LOAD_TIMEOUT, MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00001000, true,
   MCE_ERROR_TYPE_LINK, MCE_LINK_ERROR_PAGE_TABLE_WALK_LOAD_STORE_TIMEOUT,
+  MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00000800, true,
-  MCE_ERROR_TYPE_ERAT, MCE_ERAT_ERROR_MULTIHIT,
+  MCE_ERROR_TYPE_ERAT, MCE_ERAT_ERROR_MULTIHIT, MCE_ECLASS_SOFT_INDETERMINATE,
   MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000400, true,
-  MCE_ERROR_TYPE_TLB,  MCE_TLB_ERROR_MULTIHIT,
+  MCE_ERROR_TYPE_TLB,  MCE_TLB_ERROR_MULTIHIT, MCE_ECLASS_SOFT_INDETERMINATE,
   MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000200, false,
-  MCE_ERROR_TYPE_USER, MCE_USER_ERROR_TLBIE,
+  MCE_ERROR_TYPE_USER, MCE_USER_ERROR_TLBIE, MCE_ECLASS_SOFTWARE,
   MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000080, true,
   MCE_ERROR_TYPE_SLB,  MCE_SLB_ERROR_MULTIHIT,	/* Before PARITY */
+  MCE_ECLASS_SOFT_INDETERMINATE,
   MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
 { 0x00000100, true,
-  MCE_ERROR_TYPE_SLB,  MCE_SLB_ERROR_PARITY,
+  MCE_ERROR_TYPE_SLB,  MCE_SLB_ERROR_PARITY, MCE_ECLASS_HARD_INDETERMINATE,
   MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00000040, true,
-  MCE_ERROR_TYPE_RA,   MCE_RA_ERROR_LOAD,
+  MCE_ERROR_TYPE_RA,   MCE_RA_ERROR_LOAD, MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00000020, false,
   MCE_ERROR_TYPE_RA,   MCE_RA_ERROR_PAGE_TABLE_WALK_LOAD_STORE,
+  MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00000010, false,
   MCE_ERROR_TYPE_RA,   MCE_RA_ERROR_PAGE_TABLE_WALK_LOAD_STORE_FOREIGN,
+  MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0x00000008, false,
-  MCE_ERROR_TYPE_RA,   MCE_RA_ERROR_LOAD_STORE_FOREIGN,
+  MCE_ERROR_TYPE_RA,   MCE_RA_ERROR_LOAD_STORE_FOREIGN, MCE_ECLASS_HARDWARE,
   MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0, false, 0, 0, 0, 0, 0 } };
 
@@ -406,6 +423,7 @@ static int mce_handle_ierror(struct pt_regs *regs,
 
 		/* now fill in mce_error_info */
 		mce_err->error_type = table[i].error_type;
+		mce_err->error_class = table[i].error_class;
 		switch (table[i].error_type) {
 		case MCE_ERROR_TYPE_UE:
 			mce_err->u.ue_error_type = table[i].error_subtype;
@@ -451,6 +469,7 @@ static int mce_handle_ierror(struct pt_regs *regs,
 	}
 
 	mce_err->error_type = MCE_ERROR_TYPE_UNKNOWN;
+	mce_err->error_class = MCE_ECLASS_UNKNOWN;
 	mce_err->severity = MCE_SEV_SEVERE;
 	mce_err->initiator = MCE_INITIATOR_CPU;
 	mce_err->sync_error = true;
@@ -500,6 +519,7 @@ static int mce_handle_derror(struct pt_regs *regs,
 
 		/* now fill in mce_error_info */
 		mce_err->error_type = table[i].error_type;
+		mce_err->error_class = table[i].error_class;
 		switch (table[i].error_type) {
 		case MCE_ERROR_TYPE_UE:
 			mce_err->u.ue_error_type = table[i].error_subtype;
@@ -544,6 +564,7 @@ static int mce_handle_derror(struct pt_regs *regs,
 		return handled;
 
 	mce_err->error_type = MCE_ERROR_TYPE_UNKNOWN;
+	mce_err->error_class = MCE_ECLASS_UNKNOWN;
 	mce_err->severity = MCE_SEV_SEVERE;
 	mce_err->initiator = MCE_INITIATOR_CPU;
 	mce_err->sync_error = true;

