Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FE32C5A43
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 18:11:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChknZ5vwMzDqVp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 04:11:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=N8tWr3ot; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChkRs0hS6zDrP8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 03:56:24 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQGu6Fq066840; Thu, 26 Nov 2020 11:56:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=enjyidaL/03SOJMqWhQ2SWNHm5MC2kWjLI0aU4W036s=;
 b=N8tWr3otxAl8uHNAN/eLqPiyaXwMrvfMrrjFntkTGhMS0txOElDo+45LsXnLUfn1hQHb
 129CwNRqb/fueikN9LFi8fHRM0URmqEh1eu8G9ydhymGlwkcJJsSpjQ+iercoS9n5Crf
 bgm7rmyCmAjb0Zda1J2IeGeSXXTCNUXWY+b1mp4mtZp/L5K3wNXNBx3dYPz4oo9NXZ0O
 VoZ1CHjg6QvJ2b200rlIM35e22A2SeJqqmV6CkJqQWzQgKu6VYNwjmXAsTQ55sXdNAlj
 yaLIUH+YFP642Bq5IrMp7+FpduJtNdtrMxQbuk3ttDRVWLZf2taNpOnk8cGH9T4nYYzc wQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352gar006j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 11:56:20 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQGqnBS005281;
 Thu, 26 Nov 2020 16:56:18 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 34yy8r38uv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 16:56:18 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQGt0tr5571178
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 16:55:01 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5E674C04A;
 Thu, 26 Nov 2020 16:55:00 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEEB84C044;
 Thu, 26 Nov 2020 16:54:58 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.231.24])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 16:54:58 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 4/7] powerpc/perf: Add generic and cache event list for
 power10 DD1
Date: Thu, 26 Nov 2020 11:54:41 -0500
Message-Id: <1606409684-1589-5-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606409684-1589-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1606409684-1589-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_06:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=1 lowpriorityscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260097
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

There are event code updates for some of the generic events
and cache events for power10. Inorder to maintain the current
event codes work with DD1 also, create a new array of generic_events,
cache_events and pmu_attr_groups with suffix _dd1, example,
power10_events_attr_dd1. So that further updates to event codes
can be made in the original list, ie, power10_events_attr. Update the
power10 pmu init code to pick the dd1 list while registering
the power PMU, based on the pvr (Processor Version Register) value.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/power10-pmu.c | 152 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index 88c5430..bc3d4dd 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -129,6 +129,31 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
 CACHE_EVENT_ATTR(dTLB-load-misses,		PM_DTLB_MISS);
 CACHE_EVENT_ATTR(iTLB-load-misses,		PM_ITLB_MISS);
 
+static struct attribute *power10_events_attr_dd1[] = {
+	GENERIC_EVENT_PTR(PM_RUN_CYC),
+	GENERIC_EVENT_PTR(PM_RUN_INST_CMPL),
+	GENERIC_EVENT_PTR(PM_BR_CMPL),
+	GENERIC_EVENT_PTR(PM_BR_MPRED_CMPL),
+	GENERIC_EVENT_PTR(PM_LD_REF_L1),
+	GENERIC_EVENT_PTR(PM_LD_MISS_L1),
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
+	CACHE_EVENT_PTR(PM_BR_MPRED_CMPL),
+	CACHE_EVENT_PTR(PM_BR_CMPL),
+	CACHE_EVENT_PTR(PM_DTLB_MISS),
+	CACHE_EVENT_PTR(PM_ITLB_MISS),
+	NULL
+};
+
 static struct attribute *power10_events_attr[] = {
 	GENERIC_EVENT_PTR(PM_RUN_CYC),
 	GENERIC_EVENT_PTR(PM_RUN_INST_CMPL),
@@ -154,6 +179,11 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
 	NULL
 };
 
+static struct attribute_group power10_pmu_events_group_dd1 = {
+	.name = "events",
+	.attrs = power10_events_attr_dd1,
+};
+
 static struct attribute_group power10_pmu_events_group = {
 	.name = "events",
 	.attrs = power10_events_attr,
@@ -205,12 +235,27 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
 	.attrs = power10_pmu_format_attr,
 };
 
+static const struct attribute_group *power10_pmu_attr_groups_dd1[] = {
+	&power10_pmu_format_group,
+	&power10_pmu_events_group_dd1,
+	NULL,
+};
+
 static const struct attribute_group *power10_pmu_attr_groups[] = {
 	&power10_pmu_format_group,
 	&power10_pmu_events_group,
 	NULL,
 };
 
+static int power10_generic_events_dd1[] = {
+	[PERF_COUNT_HW_CPU_CYCLES] =			PM_RUN_CYC,
+	[PERF_COUNT_HW_INSTRUCTIONS] =			PM_RUN_INST_CMPL,
+	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS] =		PM_BR_CMPL,
+	[PERF_COUNT_HW_BRANCH_MISSES] =			PM_BR_MPRED_CMPL,
+	[PERF_COUNT_HW_CACHE_REFERENCES] =		PM_LD_REF_L1,
+	[PERF_COUNT_HW_CACHE_MISSES] =			PM_LD_MISS_L1,
+};
+
 static int power10_generic_events[] = {
 	[PERF_COUNT_HW_CPU_CYCLES] =			PM_RUN_CYC,
 	[PERF_COUNT_HW_INSTRUCTIONS] =			PM_RUN_INST_CMPL,
@@ -276,6 +321,107 @@ static void power10_config_bhrb(u64 pmu_bhrb_filter)
  * 0 means not supported, -1 means nonsensical, other values
  * are event codes.
  */
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
+			[C(RESULT_ACCESS)] = -1,
+			[C(RESULT_MISS)] = -1,
+		},
+		[C(OP_PREFETCH)] = {
+			[C(RESULT_ACCESS)] = -1,
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
 static u64 power10_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	[C(L1D)] = {
 		[C(OP_READ)] = {
@@ -422,6 +568,12 @@ int init_power10_pmu(void)
 	/* Set the PERF_REG_EXTENDED_MASK here */
 	PERF_REG_EXTENDED_MASK = PERF_REG_PMU_MASK_31;
 
+	if ((PVR_CFG(pvr) == 1)) {
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

