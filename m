Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FEF2108E9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 12:06:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xcMj0WJgzDqgB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 20:06:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xbMG0zYmzDqkZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 19:21:29 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 061935TL049401; Wed, 1 Jul 2020 05:21:25 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31x1rwne59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 05:21:25 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0619EVCB030978;
 Wed, 1 Jul 2020 09:21:22 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 31wyyattd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 09:21:22 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0619LKk557737228
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Jul 2020 09:21:20 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4FA84C063;
 Wed,  1 Jul 2020 09:21:19 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 916F54C046;
 Wed,  1 Jul 2020 09:21:18 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.199.47.174])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Jul 2020 09:21:18 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 08/10] powerpc/perf: Add support for outputting extended
 regs in perf intr_regs
Date: Wed,  1 Jul 2020 05:21:00 -0400
Message-Id: <1593595262-1433-9-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_04:2020-07-01,
 2020-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 cotscore=-2147483648 lowpriorityscore=0 phishscore=0 spamscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 suspectscore=1 clxscore=1015
 malwarescore=0 mlxscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007010067
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
Cc: mikey@neuling.org, maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Anju T Sudhakar <anju@linux.vnet.ibm.com>

Add support for perf extended register capability in powerpc.
The capability flag PERF_PMU_CAP_EXTENDED_REGS, is used to indicate the
PMU which support extended registers. The generic code define the mask
of extended registers as 0 for non supported architectures.

Patch adds extended regs support for power9 platform by
exposing MMCR0, MMCR1 and MMCR2 registers.

REG_RESERVED mask needs update to include extended regs.
`PERF_REG_EXTENDED_MASK`, contains mask value of the supported registers,
is defined at runtime in the kernel based on platform since the supported
registers may differ from one processor version to another and hence the
MASK value.

with patch
----------

available registers: r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11
r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26
r27 r28 r29 r30 r31 nip msr orig_r3 ctr link xer ccr softe
trap dar dsisr sier mmcra mmcr0 mmcr1 mmcr2

PERF_RECORD_SAMPLE(IP, 0x1): 4784/4784: 0 period: 1 addr: 0
... intr regs: mask 0xffffffffffff ABI 64-bit
.... r0    0xc00000000012b77c
.... r1    0xc000003fe5e03930
.... r2    0xc000000001b0e000
.... r3    0xc000003fdcddf800
.... r4    0xc000003fc7880000
.... r5    0x9c422724be
.... r6    0xc000003fe5e03908
.... r7    0xffffff63bddc8706
.... r8    0x9e4
.... r9    0x0
.... r10   0x1
.... r11   0x0
.... r12   0xc0000000001299c0
.... r13   0xc000003ffffc4800
.... r14   0x0
.... r15   0x7fffdd8b8b00
.... r16   0x0
.... r17   0x7fffdd8be6b8
.... r18   0x7e7076607730
.... r19   0x2f
.... r20   0xc00000001fc26c68
.... r21   0xc0002041e4227e00
.... r22   0xc00000002018fb60
.... r23   0x1
.... r24   0xc000003ffec4d900
.... r25   0x80000000
.... r26   0x0
.... r27   0x1
.... r28   0x1
.... r29   0xc000000001be1260
.... r30   0x6008010
.... r31   0xc000003ffebb7218
.... nip   0xc00000000012b910
.... msr   0x9000000000009033
.... orig_r3 0xc00000000012b86c
.... ctr   0xc0000000001299c0
.... link  0xc00000000012b77c
.... xer   0x0
.... ccr   0x28002222
.... softe 0x1
.... trap  0xf00
.... dar   0x0
.... dsisr 0x80000000000
.... sier  0x0
.... mmcra 0x80000000000
.... mmcr0 0x82008090
.... mmcr1 0x1e000000
.... mmcr2 0x0
 ... thread: perf:4784

Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
[Defined PERF_REG_EXTENDED_MASK at run time to add support for different platforms ]
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/perf_event_server.h |  8 +++++++
 arch/powerpc/include/uapi/asm/perf_regs.h    | 14 +++++++++++-
 arch/powerpc/perf/core-book3s.c              |  1 +
 arch/powerpc/perf/perf_regs.c                | 34 +++++++++++++++++++++++++---
 arch/powerpc/perf/power9-pmu.c               |  6 +++++
 5 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
index cb207f8..e8d35b6 100644
--- a/arch/powerpc/include/asm/perf_event_server.h
+++ b/arch/powerpc/include/asm/perf_event_server.h
@@ -15,6 +15,9 @@
 #define MAX_EVENT_ALTERNATIVES	8
 #define MAX_LIMITED_HWCOUNTERS	2
 
+extern u64 mask_var;
+#define PERF_REG_EXTENDED_MASK          mask_var
+
 struct perf_event;
 
 /*
@@ -55,6 +58,11 @@ struct power_pmu {
 	int 		*blacklist_ev;
 	/* BHRB entries in the PMU */
 	int		bhrb_nr;
+	/*
+	 * set this flag with `PERF_PMU_CAP_EXTENDED_REGS` if
+	 * the pmu supports extended perf regs capability
+	 */
+	int		capabilities;
 };
 
 /*
diff --git a/arch/powerpc/include/uapi/asm/perf_regs.h b/arch/powerpc/include/uapi/asm/perf_regs.h
index f599064..485b1d5 100644
--- a/arch/powerpc/include/uapi/asm/perf_regs.h
+++ b/arch/powerpc/include/uapi/asm/perf_regs.h
@@ -48,6 +48,18 @@ enum perf_event_powerpc_regs {
 	PERF_REG_POWERPC_DSISR,
 	PERF_REG_POWERPC_SIER,
 	PERF_REG_POWERPC_MMCRA,
-	PERF_REG_POWERPC_MAX,
+	/* Extended registers */
+	PERF_REG_POWERPC_MMCR0,
+	PERF_REG_POWERPC_MMCR1,
+	PERF_REG_POWERPC_MMCR2,
+	/* Max regs without the extended regs */
+	PERF_REG_POWERPC_MAX = PERF_REG_POWERPC_MMCRA + 1,
 };
+
+#define PERF_REG_PMU_MASK	((1ULL << PERF_REG_POWERPC_MAX) - 1)
+
+/* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300 */
+#define PERF_REG_PMU_MASK_300   (((1ULL << (PERF_REG_POWERPC_MMCR2 + 1)) - 1) \
+				- PERF_REG_PMU_MASK)
+
 #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 9709606..382d770 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2317,6 +2317,7 @@ int register_power_pmu(struct power_pmu *pmu)
 		pmu->name);
 
 	power_pmu.attr_groups = ppmu->attr_groups;
+	power_pmu.capabilities |= (ppmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS);
 
 #ifdef MSR_HV
 	/*
diff --git a/arch/powerpc/perf/perf_regs.c b/arch/powerpc/perf/perf_regs.c
index a213a0a..c8a7e8c 100644
--- a/arch/powerpc/perf/perf_regs.c
+++ b/arch/powerpc/perf/perf_regs.c
@@ -13,9 +13,11 @@
 #include <asm/ptrace.h>
 #include <asm/perf_regs.h>
 
+u64 mask_var;
+
 #define PT_REGS_OFFSET(id, r) [id] = offsetof(struct pt_regs, r)
 
-#define REG_RESERVED (~((1ULL << PERF_REG_POWERPC_MAX) - 1))
+#define REG_RESERVED (~(PERF_REG_EXTENDED_MASK | PERF_REG_PMU_MASK))
 
 static unsigned int pt_regs_offset[PERF_REG_POWERPC_MAX] = {
 	PT_REGS_OFFSET(PERF_REG_POWERPC_R0,  gpr[0]),
@@ -69,10 +71,26 @@
 	PT_REGS_OFFSET(PERF_REG_POWERPC_MMCRA, dsisr),
 };
 
+/* Function to return the extended register values */
+static u64 get_ext_regs_value(int idx)
+{
+	switch (idx) {
+	case PERF_REG_POWERPC_MMCR0:
+		return mfspr(SPRN_MMCR0);
+	case PERF_REG_POWERPC_MMCR1:
+		return mfspr(SPRN_MMCR1);
+	case PERF_REG_POWERPC_MMCR2:
+		return mfspr(SPRN_MMCR2);
+	default: return 0;
+	}
+}
+
 u64 perf_reg_value(struct pt_regs *regs, int idx)
 {
-	if (WARN_ON_ONCE(idx >= PERF_REG_POWERPC_MAX))
-		return 0;
+	u64 PERF_REG_EXTENDED_MAX;
+
+	if (cpu_has_feature(CPU_FTR_ARCH_300))
+		PERF_REG_EXTENDED_MAX = PERF_REG_POWERPC_MMCR2 + 1;
 
 	if (idx == PERF_REG_POWERPC_SIER &&
 	   (IS_ENABLED(CONFIG_FSL_EMB_PERF_EVENT) ||
@@ -85,6 +103,16 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 	    IS_ENABLED(CONFIG_PPC32)))
 		return 0;
 
+	if (idx >= PERF_REG_POWERPC_MAX && idx < PERF_REG_EXTENDED_MAX)
+		return get_ext_regs_value(idx);
+
+	/*
+	 * If the idx is referring to value beyond the
+	 * supported registers, return 0 with a warning
+	 */
+	if (WARN_ON_ONCE(idx >= PERF_REG_EXTENDED_MAX))
+		return 0;
+
 	return regs_get_register(regs, pt_regs_offset[idx]);
 }
 
diff --git a/arch/powerpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-pmu.c
index 05dae38..fb6fcad 100644
--- a/arch/powerpc/perf/power9-pmu.c
+++ b/arch/powerpc/perf/power9-pmu.c
@@ -90,6 +90,8 @@ enum {
 #define POWER9_MMCRA_IFM3		0x00000000C0000000UL
 #define POWER9_MMCRA_BHRB_MASK		0x00000000C0000000UL
 
+extern u64 mask_var;
+
 /* Nasty Power9 specific hack */
 #define PVR_POWER9_CUMULUS		0x00002000
 
@@ -434,6 +436,7 @@ static void power9_config_bhrb(u64 pmu_bhrb_filter)
 	.cache_events		= &power9_cache_events,
 	.attr_groups		= power9_pmu_attr_groups,
 	.bhrb_nr		= 32,
+	.capabilities           = PERF_PMU_CAP_EXTENDED_REGS,
 };
 
 int init_power9_pmu(void)
@@ -457,6 +460,9 @@ int init_power9_pmu(void)
 		}
 	}
 
+	/* Set the PERF_REG_EXTENDED_MASK here */
+	mask_var = PERF_REG_PMU_MASK_300;
+
 	rc = register_power_pmu(&power9_pmu);
 	if (rc)
 		return rc;
-- 
1.8.3.1

