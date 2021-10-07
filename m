Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAD3424E52
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 09:52:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ3Sd1MrSz2ymF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 18:52:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tWpLCZEj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tWpLCZEj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ3Rw5rrMz2xXh
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 18:51:40 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19766mDj028540; 
 Thu, 7 Oct 2021 03:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=UmIEUyIndsfzeMbxnKfOA5MbM+uXhQ9ZSnc6Zest7z8=;
 b=tWpLCZEj0C3K/P0/1Ms0ZVPxUfigSmGmjYtVHLLjHjo6xz8v680QTegfZnXU2NOqpD8o
 PyyeZbbJeg9XiR+PwVJ76VtybGRApa+FeR5QPfEwR2lIemKUt3TAwC32grO6azg5ql4h
 tbOZXVMixn+2RHCQDinjHt/MvLw7AMyFtxuRGla68gbsUBeAQBD2ONTx0WYbWU8+//nf
 Ms8Yge4+bkBa3LtxFRXXxhp55X6ngCtM+hgJjc5LV9hQ3XYliIi4VxV19/EaLKupbOgD
 vhybrBQVr/aw5qQWzdA/zmWLsk/qqJc6wHrfKDK/wkI1RB4O3ifjUgPpx6oOnHJvZfur qg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bhh5qecmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 03:51:35 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1977lMXm028684;
 Thu, 7 Oct 2021 07:51:32 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3bef2an9y1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 07:51:32 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1977pQcQ31588818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Oct 2021 07:51:26 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19CC552067;
 Thu,  7 Oct 2021 07:51:26 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.78.197.54])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id DF2645206B;
 Thu,  7 Oct 2021 07:51:23 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [V2] powerpc/perf: Fix cycles/instructions as PM_CYC/PM_INST_CMPL in
 power10
Date: Thu,  7 Oct 2021 13:21:21 +0530
Message-Id: <20211007075121.28497-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: THk2H1mSrZx7-f_VPDWXwMkAc2YjMdl4
X-Proofpoint-ORIG-GUID: THk2H1mSrZx7-f_VPDWXwMkAc2YjMdl4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-06_04,2021-10-07_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110070050
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
Cc: kjain@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Athira Rajeev <atrajeev@linux.vnet.ibm.cm>

In power9 and before platforms, the default event used for cyles and
instructions is PM_CYC (0x0001e) and PM_INST_CMPL (0x00002) respectively.
These events uses two programmable PMCs and by default will count
irrespective of the run latch state. But since it is using programmable
PMCs, these events will cause multiplexing with basic event set supported
by perf stat. Hence in power10, performance monitoring unit (PMU) driver
uses performance monitor counter 5 (PMC5) and performance monitor counter6
(PMC6) for counting instructions and cycles.

In power10, event used for cycles is PM_RUN_CYC (0x600F4) and instructions
is PM_RUN_INST_CMPL (0x500fa). But counting of these events in idle state
is controlled by the CC56RUN bit setting in Monitor Mode Control Register0
(MMCR0). If the CC56RUN bit is not set, PMC5/6 will not count when
CTRL[RUN] is zero. This could lead to miss some counts if a thread
is in idle state during system wide profiling.

Patch sets the CC56RUN bit in MMCR0 for power10 which makes PMC5 and
PMC6 count instructions and cycles regardless of the run bit. Since
this change make PMC5/6 count as PM_INST_CMPL/PM_CYC,  renamed event
code 0x600f4 as PM_CYC instead of PM_RUN_CYC and event code 0x500fa
as PM_INST_CMPL instead of PM_RUN_INST_CMPL. The changes are only for
PMC5/6 event codes and will not affect the  behaviour of
PM_RUN_CYC/PM_RUN_INST_CMPL if progammed in other PMC's.

Fixes: a64e697cef23 ("powerpc/perf: power10 Performance Monitoring support")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.cm>
Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog:
 Updated commit message to explain in detail on why and
 how it affects counting.

Notes on testing done for this change:
 Tested this patch change with a kernel module that
 turns off and turns on the runlatch. kernel module also
 reads the counter values for PMC5 and PMC6 during the
 period when runlatch is off.
 - Started PMU counters via "perf stat" and loaded the
   test module.
 - Checked the counter values captured from module during
   the runlatch off period.
 - Verified that counters were frozen without the patch and
   with the patch, observed counters were incrementing.

 arch/powerpc/perf/power10-events-list.h |  8 ++---
 arch/powerpc/perf/power10-pmu.c         | 44 +++++++++++++++++--------
 2 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/perf/power10-events-list.h b/arch/powerpc/perf/power10-events-list.h
index 93be7197d250..564f14097f07 100644
--- a/arch/powerpc/perf/power10-events-list.h
+++ b/arch/powerpc/perf/power10-events-list.h
@@ -9,10 +9,10 @@
 /*
  * Power10 event codes.
  */
-EVENT(PM_RUN_CYC,				0x600f4);
+EVENT(PM_CYC,				0x600f4);
 EVENT(PM_DISP_STALL_CYC,			0x100f8);
 EVENT(PM_EXEC_STALL,				0x30008);
-EVENT(PM_RUN_INST_CMPL,				0x500fa);
+EVENT(PM_INST_CMPL,				0x500fa);
 EVENT(PM_BR_CMPL,                               0x4d05e);
 EVENT(PM_BR_MPRED_CMPL,                         0x400f6);
 EVENT(PM_BR_FIN,				0x2f04a);
@@ -50,8 +50,8 @@ EVENT(PM_DTLB_MISS,				0x300fc);
 /* ITLB Reloaded */
 EVENT(PM_ITLB_MISS,				0x400fc);
 
-EVENT(PM_RUN_CYC_ALT,				0x0001e);
-EVENT(PM_RUN_INST_CMPL_ALT,			0x00002);
+EVENT(PM_CYC_ALT,				0x0001e);
+EVENT(PM_INST_CMPL_ALT,				0x00002);
 
 /*
  * Memory Access Events
diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index f9d64c63bb4a..9dd75f385837 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -91,8 +91,8 @@ extern u64 PERF_REG_EXTENDED_MASK;
 
 /* Table of alternatives, sorted by column 0 */
 static const unsigned int power10_event_alternatives[][MAX_ALT] = {
-	{ PM_RUN_CYC_ALT,		PM_RUN_CYC },
-	{ PM_RUN_INST_CMPL_ALT,		PM_RUN_INST_CMPL },
+	{ PM_CYC_ALT,			PM_CYC },
+	{ PM_INST_CMPL_ALT,		PM_INST_CMPL },
 };
 
 static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
@@ -118,8 +118,8 @@ static int power10_check_attr_config(struct perf_event *ev)
 	return 0;
 }
 
-GENERIC_EVENT_ATTR(cpu-cycles,			PM_RUN_CYC);
-GENERIC_EVENT_ATTR(instructions,		PM_RUN_INST_CMPL);
+GENERIC_EVENT_ATTR(cpu-cycles,			PM_CYC);
+GENERIC_EVENT_ATTR(instructions,		PM_INST_CMPL);
 GENERIC_EVENT_ATTR(branch-instructions,		PM_BR_CMPL);
 GENERIC_EVENT_ATTR(branch-misses,		PM_BR_MPRED_CMPL);
 GENERIC_EVENT_ATTR(cache-references,		PM_LD_REF_L1);
@@ -148,8 +148,8 @@ CACHE_EVENT_ATTR(dTLB-load-misses,		PM_DTLB_MISS);
 CACHE_EVENT_ATTR(iTLB-load-misses,		PM_ITLB_MISS);
 
 static struct attribute *power10_events_attr_dd1[] = {
-	GENERIC_EVENT_PTR(PM_RUN_CYC),
-	GENERIC_EVENT_PTR(PM_RUN_INST_CMPL),
+	GENERIC_EVENT_PTR(PM_CYC),
+	GENERIC_EVENT_PTR(PM_INST_CMPL),
 	GENERIC_EVENT_PTR(PM_BR_CMPL),
 	GENERIC_EVENT_PTR(PM_BR_MPRED_CMPL),
 	GENERIC_EVENT_PTR(PM_LD_REF_L1),
@@ -173,8 +173,8 @@ static struct attribute *power10_events_attr_dd1[] = {
 };
 
 static struct attribute *power10_events_attr[] = {
-	GENERIC_EVENT_PTR(PM_RUN_CYC),
-	GENERIC_EVENT_PTR(PM_RUN_INST_CMPL),
+	GENERIC_EVENT_PTR(PM_CYC),
+	GENERIC_EVENT_PTR(PM_INST_CMPL),
 	GENERIC_EVENT_PTR(PM_BR_FIN),
 	GENERIC_EVENT_PTR(PM_MPRED_BR_FIN),
 	GENERIC_EVENT_PTR(PM_LD_REF_L1),
@@ -271,8 +271,8 @@ static const struct attribute_group *power10_pmu_attr_groups[] = {
 };
 
 static int power10_generic_events_dd1[] = {
-	[PERF_COUNT_HW_CPU_CYCLES] =			PM_RUN_CYC,
-	[PERF_COUNT_HW_INSTRUCTIONS] =			PM_RUN_INST_CMPL,
+	[PERF_COUNT_HW_CPU_CYCLES] =			PM_CYC,
+	[PERF_COUNT_HW_INSTRUCTIONS] =			PM_INST_CMPL,
 	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS] =		PM_BR_CMPL,
 	[PERF_COUNT_HW_BRANCH_MISSES] =			PM_BR_MPRED_CMPL,
 	[PERF_COUNT_HW_CACHE_REFERENCES] =		PM_LD_REF_L1,
@@ -280,8 +280,8 @@ static int power10_generic_events_dd1[] = {
 };
 
 static int power10_generic_events[] = {
-	[PERF_COUNT_HW_CPU_CYCLES] =			PM_RUN_CYC,
-	[PERF_COUNT_HW_INSTRUCTIONS] =			PM_RUN_INST_CMPL,
+	[PERF_COUNT_HW_CPU_CYCLES] =			PM_CYC,
+	[PERF_COUNT_HW_INSTRUCTIONS] =			PM_INST_CMPL,
 	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS] =		PM_BR_FIN,
 	[PERF_COUNT_HW_BRANCH_MISSES] =			PM_MPRED_BR_FIN,
 	[PERF_COUNT_HW_CACHE_REFERENCES] =		PM_LD_REF_L1,
@@ -548,6 +548,24 @@ static u64 power10_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 
 #undef C
 
+/*
+ * Set the MMCR0[CC56RUN] bit to enable counting for
+ * PMC5 and PMC6 regardless of the state of CTRL[RUN],
+ * so that we can use counters 5 and 6 as PM_INST_CMPL and
+ * PM_CYC.
+ */
+static int power10_compute_mmcr(u64 event[], int n_ev,
+				unsigned int hwc[], struct mmcr_regs *mmcr,
+				struct perf_event *pevents[], u32 flags)
+{
+	int ret;
+
+	ret = isa207_compute_mmcr(event, n_ev, hwc, mmcr, pevents, flags);
+	if (!ret)
+		mmcr->mmcr0 |= MMCR0_C56RUN;
+	return ret;
+}
+
 static struct power_pmu power10_pmu = {
 	.name			= "POWER10",
 	.n_counter		= MAX_PMU_COUNTERS,
@@ -555,7 +573,7 @@ static struct power_pmu power10_pmu = {
 	.test_adder		= ISA207_TEST_ADDER,
 	.group_constraint_mask	= CNST_CACHE_PMC4_MASK,
 	.group_constraint_val	= CNST_CACHE_PMC4_VAL,
-	.compute_mmcr		= isa207_compute_mmcr,
+	.compute_mmcr		= power10_compute_mmcr,
 	.config_bhrb		= power10_config_bhrb,
 	.bhrb_filter_map	= power10_bhrb_filter_map,
 	.get_constraint		= isa207_get_constraint,
-- 
2.30.1 (Apple Git-130)

