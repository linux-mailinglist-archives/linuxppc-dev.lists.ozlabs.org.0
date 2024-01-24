Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DCF83A0B8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 05:48:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OrKBzNcx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TKWgJ6sG4z3cM5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 15:48:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OrKBzNcx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKWdn3C8nz3byl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jan 2024 15:47:09 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40O2OiRI013359;
	Wed, 24 Jan 2024 04:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eYjphvgJLIPGR2auXQfnjXBQxYfsYMt/OnZImPwfN74=;
 b=OrKBzNcxQjG3S0gXscqDgM3/UpYRaynbGe76rMyHdhZOn3zNTVAc1pwSAIo5skIciq+4
 CuK053Y+Ygo4vhGDJZ0uXmuvar4BVO+KfzyWVMOTMBH/6I1sOZHaE77ufT+OOkn9Iiqc
 +HdvI6oo0sKYpN+mnTK5wqgjx2m9fhCs9mvMApeePWG070oe8EtFCM15q3abH3d5cVqi
 COAkHvi299enCeiPXKDviXLiR6+lbYxgg2zR4bvx4TOCicph0Jutrbxc2y7Qpqpc7wuo
 4FCAUyB8BjCmTOo9MYWitwsf6IUyyNBYEAtBknMSFGfNdCZAdSekYjSUFstqQ8Cyr2qc Cw== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vtqndd573-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 04:47:03 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40O2jfUm010850;
	Wed, 24 Jan 2024 04:47:02 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vrrvyuv2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 04:47:02 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40O4kw7o15794694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Jan 2024 04:46:58 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89ECE20043;
	Wed, 24 Jan 2024 04:46:58 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDBC420040;
	Wed, 24 Jan 2024 04:46:55 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.177.74.226])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 24 Jan 2024 04:46:55 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 2/2] powerpc/perf: Power11 Performance Monitoring support
Date: Wed, 24 Jan 2024 10:15:59 +0530
Message-ID: <20240124044559.171447-2-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124044559.171447-1-maddy@linux.ibm.com>
References: <20240124044559.171447-1-maddy@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZMPgSMjeI66xH96vkXt-2gXwK0Sayxkl
X-Proofpoint-GUID: ZMPgSMjeI66xH96vkXt-2gXwK0Sayxkl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-24_01,2024-01-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401240033
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Base enablement patch to register performance monitoring hardware
support for Power11. Patch introduce the raw event encoding format,
defines the supported list of events, config fields for the event
attributes and their corresponding bit values which are exported via
sysfs.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/perf/Makefile              |   3 +-
 arch/powerpc/perf/core-book3s.c         |   2 +
 arch/powerpc/perf/internal.h            |   1 +
 arch/powerpc/perf/power11-events-list.h |   8 +
 arch/powerpc/perf/power11-pmu.c         | 475 ++++++++++++++++++++++++
 5 files changed, 488 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/perf/power11-events-list.h
 create mode 100644 arch/powerpc/perf/power11-pmu.c

diff --git a/arch/powerpc/perf/Makefile b/arch/powerpc/perf/Makefile
index 4f53d0b97539..c5d34dbe7fad 100644
--- a/arch/powerpc/perf/Makefile
+++ b/arch/powerpc/perf/Makefile
@@ -7,7 +7,8 @@ obj-$(CONFIG_PPC_PERF_CTRS)	+= core-book3s.o
 obj64-$(CONFIG_PPC_PERF_CTRS)	+= ppc970-pmu.o power5-pmu.o \
 				   power5+-pmu.o power6-pmu.o power7-pmu.o \
 				   isa207-common.o power8-pmu.o power9-pmu.o \
-				   generic-compat-pmu.o power10-pmu.o bhrb.o
+				   generic-compat-pmu.o power10-pmu.o bhrb.o \
+				   power11-pmu.o
 obj32-$(CONFIG_PPC_PERF_CTRS)	+= mpc7450-pmu.o
 
 obj-$(CONFIG_PPC_POWERNV)	+= imc-pmu.o
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index b7ff680cde96..6f0d46c53027 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2593,6 +2593,8 @@ static int __init init_ppc64_pmu(void)
 		return 0;
 	else if (!init_power10_pmu())
 		return 0;
+	else if (!init_power11_pmu())
+		return 0;
 	else if (!init_ppc970_pmu())
 		return 0;
 	else
diff --git a/arch/powerpc/perf/internal.h b/arch/powerpc/perf/internal.h
index 4c18b5504326..a70ac471a5a5 100644
--- a/arch/powerpc/perf/internal.h
+++ b/arch/powerpc/perf/internal.h
@@ -10,4 +10,5 @@ int __init init_power7_pmu(void);
 int __init init_power8_pmu(void);
 int __init init_power9_pmu(void);
 int __init init_power10_pmu(void);
+int __init init_power11_pmu(void);
 int __init init_generic_compat_pmu(void);
diff --git a/arch/powerpc/perf/power11-events-list.h b/arch/powerpc/perf/power11-events-list.h
new file mode 100644
index 000000000000..702ca1a1fad9
--- /dev/null
+++ b/arch/powerpc/perf/power11-events-list.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Performance counter support for POWER11 processors.
+ *
+ * Copyright 2024 Madhavan Srinivasan, IBM Corporation.
+ */
+
+#include "power10-events-list.h"
diff --git a/arch/powerpc/perf/power11-pmu.c b/arch/powerpc/perf/power11-pmu.c
new file mode 100644
index 000000000000..f89bef42e128
--- /dev/null
+++ b/arch/powerpc/perf/power11-pmu.c
@@ -0,0 +1,475 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Performance counter support for POWER11 processors.
+ *
+ * Copyright 2024 Madhavan Srinivasan, IBM Corporation.
+ */
+
+#define pr_fmt(fmt)	"power11-pmu: " fmt
+
+#include "isa207-common.h"
+
+/*
+ * Raw event encoding for Power11:
+ *
+ *        60        56        52        48        44        40        36        32
+ * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
+ *   | | [ ]   [ src_match ] [  src_mask ]   | [ ] [ l2l3_sel ]  [  thresh_ctl   ]
+ *   | |  |                                  |  |                         |
+ *   | |  *- IFM (Linux)                     |  |        thresh start/stop -*
+ *   | *- BHRB (Linux)                       |  src_sel
+ *   *- EBB (Linux)                          *invert_bit
+ *
+ *        28        24        20        16        12         8         4         0
+ * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
+ *   [   ] [  sample ]   [ ] [ ]   [ pmc ]   [unit ]   [ ] |  m   [    pmcxsel    ]
+ *     |        |        |    |                        |   |  |
+ *     |        |        |    |                        |   |  *- mark
+ *     |        |        |    *- L1/L2/L3 cache_sel    |   |*-radix_scope_qual
+ *     |        |        sdar_mode                     |
+ *     |        *- sampling mode for marked events     *- combine
+ *     |
+ *     *- thresh_sel
+ *
+ * Below uses IBM bit numbering.
+ *
+ * MMCR1[x:y] = unit    (PMCxUNIT)
+ * MMCR1[24]   = pmc1combine[0]
+ * MMCR1[25]   = pmc1combine[1]
+ * MMCR1[26]   = pmc2combine[0]
+ * MMCR1[27]   = pmc2combine[1]
+ * MMCR1[28]   = pmc3combine[0]
+ * MMCR1[29]   = pmc3combine[1]
+ * MMCR1[30]   = pmc4combine[0]
+ * MMCR1[31]   = pmc4combine[1]
+ *
+ * if pmc == 3 and unit == 0 and pmcxsel[0:6] == 0b0101011
+ *	MMCR1[20:27] = thresh_ctl
+ * else if pmc == 4 and unit == 0xf and pmcxsel[0:6] == 0b0101001
+ *	MMCR1[20:27] = thresh_ctl
+ * else
+ *	MMCRA[48:55] = thresh_ctl   (THRESH START/END)
+ *
+ * if thresh_sel:
+ *	MMCRA[45:47] = thresh_sel
+ *
+ * if l2l3_sel:
+ * MMCR2[56:60] = l2l3_sel[0:4]
+ *
+ * MMCR1[16] = cache_sel[0]
+ * MMCR1[17] = cache_sel[1]
+ * MMCR1[18] = radix_scope_qual
+ *
+ * if mark:
+ *	MMCRA[63]    = 1		(SAMPLE_ENABLE)
+ *	MMCRA[57:59] = sample[0:2]	(RAND_SAMP_ELIG)
+ *	MMCRA[61:62] = sample[3:4]	(RAND_SAMP_MODE)
+ *
+ * if EBB and BHRB:
+ *	MMCRA[32:33] = IFM
+ *
+ * MMCRA[SDAR_MODE]  = sdar_mode[0:1]
+ */
+
+/*
+ * Some power11 event codes.
+ */
+#define EVENT(_name, _code)     enum{_name = _code}
+
+#include "power11-events-list.h"
+
+#undef EVENT
+
+/* MMCRA IFM bits - POWER11 */
+#define POWER11_MMCRA_IFM1		0x0000000040000000UL
+#define POWER11_MMCRA_IFM2		0x0000000080000000UL
+#define POWER11_MMCRA_IFM3		0x00000000C0000000UL
+#define POWER11_MMCRA_BHRB_MASK		0x00000000C0000000UL
+
+extern u64 PERF_REG_EXTENDED_MASK;
+
+/* Table of alternatives, sorted by column 0 */
+static const unsigned int power11_event_alternatives[][MAX_ALT] = {
+	{ PM_INST_CMPL_ALT,		PM_INST_CMPL },
+	{ PM_CYC_ALT,			PM_CYC },
+};
+
+static int power11_get_alternatives(u64 event, unsigned int flags, u64 alt[])
+{
+	int num_alt = 0;
+
+	num_alt = isa207_get_alternatives(event, alt,
+					  ARRAY_SIZE(power11_event_alternatives), flags,
+					  power11_event_alternatives);
+
+	return num_alt;
+}
+
+static int power11_check_attr_config(struct perf_event *ev)
+{
+	u64 val;
+	u64 event = ev->attr.config;
+
+	val = (event >> EVENT_SAMPLE_SHIFT) & EVENT_SAMPLE_MASK;
+	if (val == 0x10 || isa3XX_check_attr_config(ev))
+		return -EINVAL;
+
+	return 0;
+}
+
+GENERIC_EVENT_ATTR(cpu-cycles,			PM_CYC);
+GENERIC_EVENT_ATTR(instructions,		PM_INST_CMPL);
+GENERIC_EVENT_ATTR(cache-references,		PM_LD_REF_L1);
+GENERIC_EVENT_ATTR(mem-loads,			MEM_LOADS);
+GENERIC_EVENT_ATTR(mem-stores,			MEM_STORES);
+GENERIC_EVENT_ATTR(branch-instructions,		PM_BR_FIN);
+GENERIC_EVENT_ATTR(branch-misses,		PM_MPRED_BR_FIN);
+GENERIC_EVENT_ATTR(cache-misses,		PM_LD_DEMAND_MISS_L1_FIN);
+
+CACHE_EVENT_ATTR(L1-dcache-load-misses,		PM_LD_MISS_L1);
+CACHE_EVENT_ATTR(L1-dcache-loads,		PM_LD_REF_L1);
+CACHE_EVENT_ATTR(L1-dcache-prefetches,		PM_LD_PREFETCH_CACHE_LINE_MISS);
+CACHE_EVENT_ATTR(L1-dcache-store-misses,	PM_ST_MISS_L1);
+CACHE_EVENT_ATTR(L1-icache-load-misses,		PM_L1_ICACHE_MISS);
+CACHE_EVENT_ATTR(L1-icache-loads,		PM_INST_FROM_L1);
+CACHE_EVENT_ATTR(L1-icache-prefetches,		PM_IC_PREF_REQ);
+CACHE_EVENT_ATTR(LLC-load-misses,		PM_DATA_FROM_L3MISS);
+CACHE_EVENT_ATTR(LLC-loads,			PM_DATA_FROM_L3);
+CACHE_EVENT_ATTR(LLC-prefetches,		PM_L3_PF_MISS_L3);
+CACHE_EVENT_ATTR(LLC-store-misses,		PM_L2_ST_MISS);
+CACHE_EVENT_ATTR(LLC-stores,			PM_L2_ST);
+CACHE_EVENT_ATTR(branch-load-misses,		PM_BR_MPRED_CMPL);
+CACHE_EVENT_ATTR(branch-loads,			PM_BR_CMPL);
+CACHE_EVENT_ATTR(dTLB-load-misses,		PM_DTLB_MISS);
+CACHE_EVENT_ATTR(iTLB-load-misses,		PM_ITLB_MISS);
+
+static struct attribute *power11_events_attr[] = {
+	GENERIC_EVENT_PTR(PM_CYC),
+	GENERIC_EVENT_PTR(PM_INST_CMPL),
+	GENERIC_EVENT_PTR(PM_BR_FIN),
+	GENERIC_EVENT_PTR(PM_MPRED_BR_FIN),
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
+static const struct attribute_group power11_pmu_events_group = {
+	.name = "events",
+	.attrs = power11_events_attr,
+};
+
+PMU_FORMAT_ATTR(event,          "config:0-59");
+PMU_FORMAT_ATTR(pmcxsel,        "config:0-7");
+PMU_FORMAT_ATTR(mark,           "config:8");
+PMU_FORMAT_ATTR(combine,        "config:10-11");
+PMU_FORMAT_ATTR(unit,           "config:12-15");
+PMU_FORMAT_ATTR(pmc,            "config:16-19");
+PMU_FORMAT_ATTR(cache_sel,      "config:20-21");
+PMU_FORMAT_ATTR(sdar_mode,      "config:22-23");
+PMU_FORMAT_ATTR(sample_mode,    "config:24-28");
+PMU_FORMAT_ATTR(thresh_sel,     "config:29-31");
+PMU_FORMAT_ATTR(thresh_stop,    "config:32-35");
+PMU_FORMAT_ATTR(thresh_start,   "config:36-39");
+PMU_FORMAT_ATTR(l2l3_sel,       "config:40-44");
+PMU_FORMAT_ATTR(src_sel,        "config:45-46");
+PMU_FORMAT_ATTR(invert_bit,     "config:47");
+PMU_FORMAT_ATTR(src_mask,       "config:48-53");
+PMU_FORMAT_ATTR(src_match,      "config:54-59");
+PMU_FORMAT_ATTR(radix_scope,	"config:9");
+PMU_FORMAT_ATTR(thresh_cmp,     "config1:0-17");
+
+static struct attribute *power11_pmu_format_attr[] = {
+	&format_attr_event.attr,
+	&format_attr_pmcxsel.attr,
+	&format_attr_mark.attr,
+	&format_attr_combine.attr,
+	&format_attr_unit.attr,
+	&format_attr_pmc.attr,
+	&format_attr_cache_sel.attr,
+	&format_attr_sdar_mode.attr,
+	&format_attr_sample_mode.attr,
+	&format_attr_thresh_sel.attr,
+	&format_attr_thresh_stop.attr,
+	&format_attr_thresh_start.attr,
+	&format_attr_l2l3_sel.attr,
+	&format_attr_src_sel.attr,
+	&format_attr_invert_bit.attr,
+	&format_attr_src_mask.attr,
+	&format_attr_src_match.attr,
+	&format_attr_radix_scope.attr,
+	&format_attr_thresh_cmp.attr,
+	NULL,
+};
+
+static const struct attribute_group power11_pmu_format_group = {
+	.name = "format",
+	.attrs = power11_pmu_format_attr,
+};
+
+static struct attribute *power11_pmu_caps_attrs[] = {
+	NULL
+};
+
+static struct attribute_group power11_pmu_caps_group = {
+	.name  = "caps",
+	.attrs = power11_pmu_caps_attrs,
+};
+
+static const struct attribute_group *power11_pmu_attr_groups[] = {
+	&power11_pmu_format_group,
+	&power11_pmu_events_group,
+	&power11_pmu_caps_group,
+	NULL,
+};
+
+static int power11_generic_events[] = {
+	[PERF_COUNT_HW_CPU_CYCLES] =			PM_CYC,
+	[PERF_COUNT_HW_INSTRUCTIONS] =			PM_INST_CMPL,
+	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS] =		PM_BR_FIN,
+	[PERF_COUNT_HW_BRANCH_MISSES] =			PM_MPRED_BR_FIN,
+	[PERF_COUNT_HW_CACHE_REFERENCES] =		PM_LD_REF_L1,
+	[PERF_COUNT_HW_CACHE_MISSES] =			PM_LD_DEMAND_MISS_L1_FIN,
+};
+
+static u64 power11_bhrb_filter_map(u64 branch_sample_type)
+{
+	u64 pmu_bhrb_filter = 0;
+
+	/* BHRB and regular PMU events share the same privilege state
+	 * filter configuration. BHRB is always recorded along with a
+	 * regular PMU event. As the privilege state filter is handled
+	 * in the basic PMC configuration of the accompanying regular
+	 * PMU event, we ignore any separate BHRB specific request.
+	 */
+
+	/* No branch filter requested */
+	if (branch_sample_type & PERF_SAMPLE_BRANCH_ANY)
+		return pmu_bhrb_filter;
+
+	/* Invalid branch filter options - HW does not support */
+	if (branch_sample_type & PERF_SAMPLE_BRANCH_ANY_RETURN)
+		return -1;
+
+	if (branch_sample_type & PERF_SAMPLE_BRANCH_IND_CALL) {
+		pmu_bhrb_filter |= POWER11_MMCRA_IFM2;
+		return pmu_bhrb_filter;
+	}
+
+	if (branch_sample_type & PERF_SAMPLE_BRANCH_COND) {
+		pmu_bhrb_filter |= POWER11_MMCRA_IFM3;
+		return pmu_bhrb_filter;
+	}
+
+	if (branch_sample_type & PERF_SAMPLE_BRANCH_CALL)
+		return -1;
+
+	if (branch_sample_type & PERF_SAMPLE_BRANCH_ANY_CALL) {
+		pmu_bhrb_filter |= POWER11_MMCRA_IFM1;
+		return pmu_bhrb_filter;
+	}
+
+	/* Every thing else is unsupported */
+	return -1;
+}
+
+static void power11_config_bhrb(u64 pmu_bhrb_filter)
+{
+	pmu_bhrb_filter &= POWER11_MMCRA_BHRB_MASK;
+
+	/* Enable BHRB filter in PMU */
+	mtspr(SPRN_MMCRA, (mfspr(SPRN_MMCRA) | pmu_bhrb_filter));
+}
+
+#define C(x)	PERF_COUNT_HW_CACHE_##x
+
+/*
+ * Table of generalized cache-related events.
+ * 0 means not supported, -1 means nonsensical, other values
+ * are event codes.
+ */
+static u64 power11_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
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
+#undef C
+
+/*
+ * Set the MMCR0[CC56RUN] bit to enable counting for
+ * PMC5 and PMC6 regardless of the state of CTRL[RUN],
+ * so that we can use counters 5 and 6 as PM_INST_CMPL and
+ * PM_CYC.
+ */
+static int power11_compute_mmcr(u64 event[], int n_ev,
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
+static struct power_pmu power11_pmu = {
+	.name			= "Power11",
+	.n_counter		= MAX_PMU_COUNTERS,
+	.add_fields		= ISA207_ADD_FIELDS,
+	.test_adder		= ISA207_TEST_ADDER,
+	.group_constraint_mask	= CNST_CACHE_PMC4_MASK,
+	.group_constraint_val	= CNST_CACHE_PMC4_VAL,
+	.compute_mmcr		= power11_compute_mmcr,
+	.config_bhrb		= power11_config_bhrb,
+	.bhrb_filter_map	= power11_bhrb_filter_map,
+	.get_constraint		= isa207_get_constraint,
+	.get_alternatives	= power11_get_alternatives,
+	.get_mem_data_src	= isa207_get_mem_data_src,
+	.get_mem_weight		= isa207_get_mem_weight,
+	.disable_pmc		= isa207_disable_pmc,
+	.flags			= PPMU_HAS_SIER | PPMU_ARCH_207S |
+				  PPMU_ARCH_31 | PPMU_HAS_ATTR_CONFIG1,
+	.n_generic		= ARRAY_SIZE(power11_generic_events),
+	.generic_events		= power11_generic_events,
+	.cache_events		= &power11_cache_events,
+	.attr_groups		= power11_pmu_attr_groups,
+	.bhrb_nr		= 32,
+	.capabilities           = PERF_PMU_CAP_EXTENDED_REGS,
+	.check_attr_config	= power11_check_attr_config,
+};
+
+int __init init_power11_pmu(void)
+{
+	unsigned int pvr;
+	int rc;
+
+	pvr = mfspr(SPRN_PVR);
+	if (PVR_VER(pvr) != PVR_POWER11)
+		return -ENODEV;
+
+	/* Set the PERF_REG_EXTENDED_MASK here */
+	PERF_REG_EXTENDED_MASK = PERF_REG_PMU_MASK_31;
+
+	rc = register_power_pmu(&power11_pmu);
+	if (rc)
+		return rc;
+
+	/* Tell userspace that EBB is supported */
+	cur_cpu_spec->cpu_user_features2 |= PPC_FEATURE2_EBB;
+
+	return 0;
+}
-- 
2.43.0

