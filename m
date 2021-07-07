Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 737BD3BE33A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 08:40:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GKVD83FXqz3bjD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 16:40:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jhd+NaTv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Jhd+NaTv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GKVCd1lWQz2yfc
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 16:39:56 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1676Xnqp064027; Wed, 7 Jul 2021 02:39:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=Bn1P7+BmVJydM7AraJmZ9MoR1TXlAEHxB5uVAb5rsXU=;
 b=Jhd+NaTvn40cgxXRK1jAiNqgFlspuo/9nJ/5y3VAc5HSYVoWeeoyVtPoQxpurojKOeTw
 K1wjnN50Ac06H49AvpTFVmfwJOPlk1yTB5FsKxid9SV1RzniaMy1Pkhq9cCEzm2AN6kj
 95z/bhy+vlw1S/GR72Gw3apCDps4/AE94J9utqWe/TxlTj0A//pbghl5/XdOVr0B/w0U
 VVfHV+bLN7FOriqD9xkKL6U6+DXNsfDRLlXTzviRqBpcAxhA1XYmgdXW++3bT+r9R4KG
 7xeqcs9uDKAj3oIImZYnR1ZARnQ5WEab0jhtVTHAN5LjkZphTR5EdQ4qZj00ovccaLKH Qw== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39n1rd6pxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 02:39:49 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1676bU9E005256;
 Wed, 7 Jul 2021 06:39:47 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 39jfh88udk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 06:39:47 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1676dimb7602610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Jul 2021 06:39:44 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3371B4C05C;
 Wed,  7 Jul 2021 06:39:44 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5D3F4C052;
 Wed,  7 Jul 2021 06:39:42 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.191.209])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  7 Jul 2021 06:39:42 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Fix cycles/instructions as PM_CYC/PM_INST_CMPL
 in power10
Date: Wed,  7 Jul 2021 02:39:41 -0400
Message-Id: <1625639981-1424-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OrdrrLtL45nnLJHnYYetUHnUR5_lCZ_2
X-Proofpoint-ORIG-GUID: OrdrrLtL45nnLJHnYYetUHnUR5_lCZ_2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-07_02:2021-07-06,
 2021-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070036
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Athira Rajeev <atrajeev@linux.vnet.ibm.cm>

Power10 performance monitoring unit (PMU) driver uses performance
monitor counter 5 (PMC5) and performance monitor counter 6 (PMC6)
for counting instructions and cycles. Event used for cycles is
PM_RUN_CYC and instructions is PM_RUN_INST_CMPL. But counting of these
events in wait state is controlled by the CC56RUN bit setting in
Monitor Mode Control Register0 (MMCR0). If the CC56RUN bit is not
set, PMC5/6 will not count when CTRL[RUN] is zero.

Patch sets the CC56RUN bit in MMCR0 for power10 which makes PMC5 and
PMC6 count instructions and cycles regardless of the run bit. With this
change, these events are also now renamed to PM_CYC and PM_INST_CMPL
rather than PM_RUN_CYC and PM_RUN_INST_CMPL.

Fixes: a64e697cef23 ("powerpc/perf: power10 Performance Monitoring support")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.cm>
Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
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

 arch/powerpc/perf/power10-events-list.h |  8 +++---
 arch/powerpc/perf/power10-pmu.c         | 44 +++++++++++++++++++++++----------
 2 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/perf/power10-events-list.h b/arch/powerpc/perf/power10-events-list.h
index 93be719..564f1409 100644
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
@@ -50,8 +50,8 @@
 /* ITLB Reloaded */
 EVENT(PM_ITLB_MISS,				0x400fc);
 
-EVENT(PM_RUN_CYC_ALT,				0x0001e);
-EVENT(PM_RUN_INST_CMPL_ALT,			0x00002);
+EVENT(PM_CYC_ALT,				0x0001e);
+EVENT(PM_INST_CMPL_ALT,				0x00002);
 
 /*
  * Memory Access Events
diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index f9d64c6..9dd75f3 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -91,8 +91,8 @@
 
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
@@ -148,8 +148,8 @@ static int power10_check_attr_config(struct perf_event *ev)
 CACHE_EVENT_ATTR(iTLB-load-misses,		PM_ITLB_MISS);
 
 static struct attribute *power10_events_attr_dd1[] = {
-	GENERIC_EVENT_PTR(PM_RUN_CYC),
-	GENERIC_EVENT_PTR(PM_RUN_INST_CMPL),
+	GENERIC_EVENT_PTR(PM_CYC),
+	GENERIC_EVENT_PTR(PM_INST_CMPL),
 	GENERIC_EVENT_PTR(PM_BR_CMPL),
 	GENERIC_EVENT_PTR(PM_BR_MPRED_CMPL),
 	GENERIC_EVENT_PTR(PM_LD_REF_L1),
@@ -173,8 +173,8 @@ static int power10_check_attr_config(struct perf_event *ev)
 };
 
 static struct attribute *power10_events_attr[] = {
-	GENERIC_EVENT_PTR(PM_RUN_CYC),
-	GENERIC_EVENT_PTR(PM_RUN_INST_CMPL),
+	GENERIC_EVENT_PTR(PM_CYC),
+	GENERIC_EVENT_PTR(PM_INST_CMPL),
 	GENERIC_EVENT_PTR(PM_BR_FIN),
 	GENERIC_EVENT_PTR(PM_MPRED_BR_FIN),
 	GENERIC_EVENT_PTR(PM_LD_REF_L1),
@@ -271,8 +271,8 @@ static int power10_check_attr_config(struct perf_event *ev)
 };
 
 static int power10_generic_events_dd1[] = {
-	[PERF_COUNT_HW_CPU_CYCLES] =			PM_RUN_CYC,
-	[PERF_COUNT_HW_INSTRUCTIONS] =			PM_RUN_INST_CMPL,
+	[PERF_COUNT_HW_CPU_CYCLES] =			PM_CYC,
+	[PERF_COUNT_HW_INSTRUCTIONS] =			PM_INST_CMPL,
 	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS] =		PM_BR_CMPL,
 	[PERF_COUNT_HW_BRANCH_MISSES] =			PM_BR_MPRED_CMPL,
 	[PERF_COUNT_HW_CACHE_REFERENCES] =		PM_LD_REF_L1,
@@ -280,8 +280,8 @@ static int power10_check_attr_config(struct perf_event *ev)
 };
 
 static int power10_generic_events[] = {
-	[PERF_COUNT_HW_CPU_CYCLES] =			PM_RUN_CYC,
-	[PERF_COUNT_HW_INSTRUCTIONS] =			PM_RUN_INST_CMPL,
+	[PERF_COUNT_HW_CPU_CYCLES] =			PM_CYC,
+	[PERF_COUNT_HW_INSTRUCTIONS] =			PM_INST_CMPL,
 	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS] =		PM_BR_FIN,
 	[PERF_COUNT_HW_BRANCH_MISSES] =			PM_MPRED_BR_FIN,
 	[PERF_COUNT_HW_CACHE_REFERENCES] =		PM_LD_REF_L1,
@@ -548,6 +548,24 @@ static void power10_config_bhrb(u64 pmu_bhrb_filter)
 
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
@@ -555,7 +573,7 @@ static void power10_config_bhrb(u64 pmu_bhrb_filter)
 	.test_adder		= ISA207_TEST_ADDER,
 	.group_constraint_mask	= CNST_CACHE_PMC4_MASK,
 	.group_constraint_val	= CNST_CACHE_PMC4_VAL,
-	.compute_mmcr		= isa207_compute_mmcr,
+	.compute_mmcr		= power10_compute_mmcr,
 	.config_bhrb		= power10_config_bhrb,
 	.bhrb_filter_map	= power10_bhrb_filter_map,
 	.get_constraint		= isa207_get_constraint,
-- 
1.8.3.1

