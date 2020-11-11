Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D135E2AE7B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 06:02:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWCJv5Z0DzDqX0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 16:02:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hQfz6BtG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWCHJ6FczzDqMm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 16:01:00 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AB4WTBQ022042; Tue, 10 Nov 2020 23:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=Udix5ktjAWXsPMSjxGOqgnkTT0AOBScHlKQ9gDoGlz8=;
 b=hQfz6BtGMlwHJPce0MKf9GZBIzZT5+OrNQmvVkrGwIifgDTsNyThviQzpsGPloZd5hB4
 DGhcOLQJb45n21zb0lUN/m5gM/Q9teTr7JqI7mwKV8PTP7hLPp+cC+XCCUxs8NU3O46c
 J4fdSCH7D9z8LEaCMcyYtI4nh7HLh2yGP52lOCPIARHJ1I+m+wMdfQkce/eJKhsgrDr0
 qb3scxX03ZEpLABTBA/GaIjV67bfuzMZ+/glPHb18VP0cqprJvLuGbB6MlSrRe6EcB01
 hPwte3/92sx0GEk9yUpdHqZX60L1EzM1JWrpom/PLihRxDawfPRPcNRT9bPmSk9L03sl hw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34qw4qd95p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 23:33:21 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AB4WTdT010232;
 Wed, 11 Nov 2020 04:33:19 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 34nk78kugq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Nov 2020 04:33:19 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AB4XHAC62521626
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Nov 2020 04:33:17 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E54E4C044;
 Wed, 11 Nov 2020 04:33:17 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F3134C050;
 Wed, 11 Nov 2020 04:33:16 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.242.115])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Nov 2020 04:33:15 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 3/4] powerpc/perf: Fix to update l2l3 events and generic event
 codes for power10
Date: Tue, 10 Nov 2020 23:33:08 -0500
Message-Id: <1605069189-2740-4-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1605069189-2740-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1605069189-2740-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-11_01:2020-11-10,
 2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011110018
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
Cc: mikey@neuling.org, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix the event code for events: branch-instructions (to PM_BR_FIN),
branch-misses (to PM_BR_MPRED_FIN) and cache-misses (to
PM_LD_DEMAND_MISS_L1_FIN) for power10 PMU. Update the
list of generic events with this modified event code.
Export l2l3 events (PM_L2_ST_MISS and PM_L2_ST) and LLC-prefetches
(PM_L3_PF_MISS_L3) via sysfs, and also add these to cache_events.

To maintain the current event code work with DD1, rename
existing array of generic_events, cache_events and pmu_attr_groups
with suffix _dd1. Update the power10 pmu init code to pick the
dd1 list while registering the power PMU, based on the pvr
(Processor Version Register) value.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/power10-events-list.h |   9 ++
 arch/powerpc/perf/power10-pmu.c         | 166 +++++++++++++++++++++++++++++++-
 2 files changed, 173 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/perf/power10-events-list.h b/arch/powerpc/perf/power10-events-list.h
index 60c1b81..9e0b3c9 100644
--- a/arch/powerpc/perf/power10-events-list.h
+++ b/arch/powerpc/perf/power10-events-list.h
@@ -15,6 +15,9 @@
 EVENT(PM_RUN_INST_CMPL,				0x500fa);
 EVENT(PM_BR_CMPL,                               0x4d05e);
 EVENT(PM_BR_MPRED_CMPL,                         0x400f6);
+EVENT(PM_BR_FIN,				0x2f04a);
+EVENT(PM_BR_MPRED_FIN,				0x35884);
+EVENT(PM_LD_DEMAND_MISS_L1_FIN,			0x400f0);
 
 /* All L1 D cache load references counted at finish, gated by reject */
 EVENT(PM_LD_REF_L1,				0x100fc);
@@ -36,6 +39,12 @@
 EVENT(PM_DATA_FROM_L3,				0x01340000001c040);
 /* Demand LD - L3 Miss (not L2 hit and not L3 hit) */
 EVENT(PM_DATA_FROM_L3MISS,			0x300fe);
+/* All successful D-side store dispatches for this thread */
+EVENT(PM_L2_ST,					0x010000046080);
+/* All successful D-side store dispatches for this thread that were L2 Miss */
+EVENT(PM_L2_ST_MISS,				0x26880);
+/* Total HW L3 prefetches(Load+store) */
+EVENT(PM_L3_PF_MISS_L3,				0x100000016080);
 /* Data PTEG reload */
 EVENT(PM_DTLB_MISS,				0x300fc);
 /* ITLB Reloaded */
diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index cf44fb7..86665ad 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -114,6 +114,9 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
 GENERIC_EVENT_ATTR(cache-misses,		PM_LD_MISS_L1);
 GENERIC_EVENT_ATTR(mem-loads,			MEM_LOADS);
 GENERIC_EVENT_ATTR(mem-stores,			MEM_STORES);
+GENERIC_EVENT_ATTR(branch-instructions,         PM_BR_FIN);
+GENERIC_EVENT_ATTR(branch-misses,               PM_BR_MPRED_FIN);
+GENERIC_EVENT_ATTR(cache-misses,		PM_LD_DEMAND_MISS_L1_FIN);
 
 CACHE_EVENT_ATTR(L1-dcache-load-misses,		PM_LD_MISS_L1);
 CACHE_EVENT_ATTR(L1-dcache-loads,		PM_LD_REF_L1);
@@ -124,12 +127,15 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
 CACHE_EVENT_ATTR(L1-icache-prefetches,		PM_IC_PREF_REQ);
 CACHE_EVENT_ATTR(LLC-load-misses,		PM_DATA_FROM_L3MISS);
 CACHE_EVENT_ATTR(LLC-loads,			PM_DATA_FROM_L3);
+CACHE_EVENT_ATTR(LLC-prefetches,		PM_L3_PF_MISS_L3);
+CACHE_EVENT_ATTR(LLC-store-misses,		PM_L2_ST_MISS);
+CACHE_EVENT_ATTR(LLC-stores,			PM_L2_ST);
 CACHE_EVENT_ATTR(branch-load-misses,		PM_BR_MPRED_CMPL);
 CACHE_EVENT_ATTR(branch-loads,			PM_BR_CMPL);
 CACHE_EVENT_ATTR(dTLB-load-misses,		PM_DTLB_MISS);
 CACHE_EVENT_ATTR(iTLB-load-misses,		PM_ITLB_MISS);
 
-static struct attribute *power10_events_attr[] = {
+static struct attribute *power10_events_attr_dd1[] = {
 	GENERIC_EVENT_PTR(PM_RUN_CYC),
 	GENERIC_EVENT_PTR(PM_RUN_INST_CMPL),
 	GENERIC_EVENT_PTR(PM_BR_CMPL),
@@ -154,11 +160,44 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
 	NULL
 };
 
+static struct attribute *power10_events_attr[] = {
+	GENERIC_EVENT_PTR(PM_RUN_CYC),
+	GENERIC_EVENT_PTR(PM_RUN_INST_CMPL),
+	GENERIC_EVENT_PTR(PM_BR_FIN),
+	GENERIC_EVENT_PTR(PM_BR_MPRED_FIN),
+	GENERIC_EVENT_PTR(PM_LD_REF_L1),
+	GENERIC_EVENT_PTR(PM_LD_DEMAND_MISS_L1_FIN),
+	GENERIC_EVENT_PTR(MEM_LOADS),
+	GENERIC_EVENT_PTR(MEM_STORES),
+	CACHE_EVENT_PTR(PM_LD_MISS_L1),
+	CACHE_EVENT_PTR(PM_LD_REF_L1),
+	CACHE_EVENT_PTR(PM_LD_PREFETCH_CACHE_LINE_MISS),
+	CACHE_EVENT_PTR(PM_ST_MISS_L1),
+	CACHE_EVENT_PTR(PM_L1_ICACHE_MISS),
+	CACHE_EVENT_PTR(PM_INST_FROM_L1),
+	CACHE_EVENT_PTR(PM_IC_PREF_REQ),
+	CACHE_EVENT_PTR(PM_DATA_FROM_L3MISS),
+	CACHE_EVENT_PTR(PM_DATA_FROM_L3),
+	CACHE_EVENT_PTR(PM_L3_PF_MISS_L3),
+	CACHE_EVENT_PTR(PM_L2_ST_MISS),
+	CACHE_EVENT_PTR(PM_L2_ST),
+	CACHE_EVENT_PTR(PM_BR_MPRED_CMPL),
+	CACHE_EVENT_PTR(PM_BR_CMPL),
+	CACHE_EVENT_PTR(PM_DTLB_MISS),
+	CACHE_EVENT_PTR(PM_ITLB_MISS),
+	NULL
+};
+
 static struct attribute_group power10_pmu_events_group = {
 	.name = "events",
 	.attrs = power10_events_attr,
 };
 
+static struct attribute_group power10_pmu_events_group_dd1 = {
+	.name = "events",
+	.attrs = power10_events_attr_dd1,
+};
+
 PMU_FORMAT_ATTR(event,          "config:0-59");
 PMU_FORMAT_ATTR(pmcxsel,        "config:0-7");
 PMU_FORMAT_ATTR(mark,           "config:8");
@@ -211,7 +250,13 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
 	NULL,
 };
 
-static int power10_generic_events[] = {
+static const struct attribute_group *power10_pmu_attr_groups_dd1[] = {
+	&power10_pmu_format_group,
+	&power10_pmu_events_group_dd1,
+	NULL,
+};
+
+static int power10_generic_events_dd1[] = {
 	[PERF_COUNT_HW_CPU_CYCLES] =			PM_RUN_CYC,
 	[PERF_COUNT_HW_INSTRUCTIONS] =			PM_RUN_INST_CMPL,
 	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS] =		PM_BR_CMPL,
@@ -220,6 +265,15 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
 	[PERF_COUNT_HW_CACHE_MISSES] =			PM_LD_MISS_L1,
 };
 
+static int power10_generic_events[] = {
+	[PERF_COUNT_HW_CPU_CYCLES] =			PM_RUN_CYC,
+	[PERF_COUNT_HW_INSTRUCTIONS] =			PM_RUN_INST_CMPL,
+	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS] =		PM_BR_FIN,
+	[PERF_COUNT_HW_BRANCH_MISSES] =			PM_BR_MPRED_FIN,
+	[PERF_COUNT_HW_CACHE_REFERENCES] =		PM_LD_REF_L1,
+	[PERF_COUNT_HW_CACHE_MISSES] =			PM_LD_DEMAND_MISS_L1_FIN,
+};
+
 static u64 power10_bhrb_filter_map(u64 branch_sample_type)
 {
 	u64 pmu_bhrb_filter = 0;
@@ -311,6 +365,107 @@ static void power10_config_bhrb(u64 pmu_bhrb_filter)
 			[C(RESULT_MISS)] = PM_DATA_FROM_L3MISS,
 		},
 		[C(OP_WRITE)] = {
+			[C(RESULT_ACCESS)] = PM_L2_ST,
+			[C(RESULT_MISS)] = PM_L2_ST_MISS,
+		},
+		[C(OP_PREFETCH)] = {
+			[C(RESULT_ACCESS)] = PM_L3_PF_MISS_L3,
+			[C(RESULT_MISS)] = 0,
+		},
+	},
+	 [C(DTLB)] = {
+		[C(OP_READ)] = {
+			[C(RESULT_ACCESS)] = 0,
+			[C(RESULT_MISS)] = PM_DTLB_MISS,
+		},
+		[C(OP_WRITE)] = {
+			[C(RESULT_ACCESS)] = -1,
+			[C(RESULT_MISS)] = -1,
+		},
+		[C(OP_PREFETCH)] = {
+			[C(RESULT_ACCESS)] = -1,
+			[C(RESULT_MISS)] = -1,
+		},
+	},
+	[C(ITLB)] = {
+		[C(OP_READ)] = {
+			[C(RESULT_ACCESS)] = 0,
+			[C(RESULT_MISS)] = PM_ITLB_MISS,
+		},
+		[C(OP_WRITE)] = {
+			[C(RESULT_ACCESS)] = -1,
+			[C(RESULT_MISS)] = -1,
+		},
+		[C(OP_PREFETCH)] = {
+			[C(RESULT_ACCESS)] = -1,
+			[C(RESULT_MISS)] = -1,
+		},
+	},
+	[C(BPU)] = {
+		[C(OP_READ)] = {
+			[C(RESULT_ACCESS)] = PM_BR_CMPL,
+			[C(RESULT_MISS)] = PM_BR_MPRED_CMPL,
+		},
+		[C(OP_WRITE)] = {
+			[C(RESULT_ACCESS)] = -1,
+			[C(RESULT_MISS)] = -1,
+		},
+		[C(OP_PREFETCH)] = {
+			[C(RESULT_ACCESS)] = -1,
+			[C(RESULT_MISS)] = -1,
+		},
+	},
+	[C(NODE)] = {
+		[C(OP_READ)] = {
+			[C(RESULT_ACCESS)] = -1,
+			[C(RESULT_MISS)] = -1,
+		},
+		[C(OP_WRITE)] = {
+			[C(RESULT_ACCESS)] = -1,
+			[C(RESULT_MISS)] = -1,
+		},
+		[C(OP_PREFETCH)] = {
+			[C(RESULT_ACCESS)] = -1,
+			[C(RESULT_MISS)] = -1,
+		},
+	},
+};
+
+static u64 power10_cache_events_dd1[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
+	[C(L1D)] = {
+		[C(OP_READ)] = {
+			[C(RESULT_ACCESS)] = PM_LD_REF_L1,
+			[C(RESULT_MISS)] = PM_LD_MISS_L1,
+		},
+		[C(OP_WRITE)] = {
+			[C(RESULT_ACCESS)] = 0,
+			[C(RESULT_MISS)] = PM_ST_MISS_L1,
+		},
+		[C(OP_PREFETCH)] = {
+			[C(RESULT_ACCESS)] = PM_LD_PREFETCH_CACHE_LINE_MISS,
+			[C(RESULT_MISS)] = 0,
+		},
+	},
+	[C(L1I)] = {
+		[C(OP_READ)] = {
+			[C(RESULT_ACCESS)] = PM_INST_FROM_L1,
+			[C(RESULT_MISS)] = PM_L1_ICACHE_MISS,
+		},
+		[C(OP_WRITE)] = {
+			[C(RESULT_ACCESS)] = PM_INST_FROM_L1MISS,
+			[C(RESULT_MISS)] = -1,
+		},
+		[C(OP_PREFETCH)] = {
+			[C(RESULT_ACCESS)] = PM_IC_PREF_REQ,
+			[C(RESULT_MISS)] = 0,
+		},
+	},
+	[C(LL)] = {
+		[C(OP_READ)] = {
+			[C(RESULT_ACCESS)] = PM_DATA_FROM_L3,
+			[C(RESULT_MISS)] = PM_DATA_FROM_L3MISS,
+		},
+		[C(OP_WRITE)] = {
 			[C(RESULT_ACCESS)] = -1,
 			[C(RESULT_MISS)] = -1,
 		},
@@ -407,6 +562,7 @@ static void power10_config_bhrb(u64 pmu_bhrb_filter)
 int init_power10_pmu(void)
 {
 	int rc;
+	unsigned int pvr = mfspr(SPRN_PVR);
 
 	/* Comes from cpu_specs[] */
 	if (!cur_cpu_spec->oprofile_cpu_type ||
@@ -416,6 +572,12 @@ int init_power10_pmu(void)
 	/* Set the PERF_REG_EXTENDED_MASK here */
 	PERF_REG_EXTENDED_MASK = PERF_REG_PMU_MASK_31;
 
+	if ((PVR_MAJ(pvr) == 1)) {
+		power10_pmu.generic_events = power10_generic_events_dd1;
+		power10_pmu.attr_groups = power10_pmu_attr_groups_dd1;
+		power10_pmu.cache_events = &power10_cache_events_dd1;
+	}
+
 	rc = register_power_pmu(&power10_pmu);
 	if (rc)
 		return rc;
-- 
1.8.3.1

