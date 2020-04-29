Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2067B1BD46E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 08:10:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Bp621n2xzDqT9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 16:10:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anju@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BnzK6WcFzDqkC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 16:04:42 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03T61fXf014704; Wed, 29 Apr 2020 02:04:38 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mhr7pwws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 02:04:37 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03T5scF3007417;
 Wed, 29 Apr 2020 06:04:35 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 30mcu51gp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 06:04:35 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 03T63Ogg66191848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Apr 2020 06:03:24 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C116A405B;
 Wed, 29 Apr 2020 06:04:33 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57B48A4065;
 Wed, 29 Apr 2020 06:04:31 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.127.103])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 29 Apr 2020 06:04:31 +0000 (GMT)
From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/perf: Add support for outputting extended regs in
 perf intr_regs
Date: Wed, 29 Apr 2020 11:34:15 +0530
Message-Id: <20200429060415.25930-3-anju@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200429060415.25930-1-anju@linux.vnet.ibm.com>
References: <20200429060415.25930-1-anju@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_01:2020-04-28,
 2020-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxscore=0 suspectscore=1 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004290043
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
Cc: ravi.bangoria@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linux-kernel@vger.kernel.org, acme@kernel.org, anju@linux.vnet.ibm.com,
 jolsa@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The capability flag PERF_PMU_CAP_EXTENDED_REGS, is used to indicate the
PMU which support extended registers. The generic code define the mask
of extended registers as 0 for non supported architectures.

Add support for extended registers in POWER9 architecture. For POWER9,
the extended registers are mmcr0, mmc1 and mmcr2.

REG_RESERVED mask is redefined to accommodate the extended registers.

With patch:
----------------

# perf record -I?
available registers: r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14
r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30 r31 nip
msr orig_r3 ctr link xer ccr softe trap dar dsisr sier mmcra mmcr0
mmcr1 mmcr2

# perf record -I ls
# perf script -D

PERF_RECORD_SAMPLE(IP, 0x1): 9019/9019: 0 period: 1 addr: 0
... intr regs: mask 0xffffffffffff ABI 64-bit
.... r0    0xc00000000011b12c
.... r1    0xc000003f9a98b930
.... r2    0xc000000001a32100
.... r3    0xc000003f8fe9a800
.... r4    0xc000003fd1810000
.... r5    0x3e32557150
.... r6    0xc000003f9a98b908
.... r7    0xffffffc1cdae06ac
.... r8    0x818
[.....]
.... r31   0xc000003ffd047230
.... nip   0xc00000000011b2c0
.... msr   0x9000000000009033
.... orig_r3 0xc00000000011b21c
.... ctr   0xc000000000119380
.... link  0xc00000000011b12c
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
 ... thread: perf:9019

Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/perf_event_server.h  |  5 +++
 arch/powerpc/include/uapi/asm/perf_regs.h     | 13 +++++++-
 arch/powerpc/perf/core-book3s.c               |  1 +
 arch/powerpc/perf/perf_regs.c                 | 29 ++++++++++++++--
 arch/powerpc/perf/power9-pmu.c                |  1 +
 .../arch/powerpc/include/uapi/asm/perf_regs.h | 13 +++++++-
 tools/perf/arch/powerpc/include/perf_regs.h   |  6 +++-
 tools/perf/arch/powerpc/util/perf_regs.c      | 33 +++++++++++++++++++
 8 files changed, 95 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
index 3e9703f44c7c..1d15953bd99e 100644
--- a/arch/powerpc/include/asm/perf_event_server.h
+++ b/arch/powerpc/include/asm/perf_event_server.h
@@ -55,6 +55,11 @@ struct power_pmu {
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
index f599064dd8dc..604b831378fe 100644
--- a/arch/powerpc/include/uapi/asm/perf_regs.h
+++ b/arch/powerpc/include/uapi/asm/perf_regs.h
@@ -48,6 +48,17 @@ enum perf_event_powerpc_regs {
 	PERF_REG_POWERPC_DSISR,
 	PERF_REG_POWERPC_SIER,
 	PERF_REG_POWERPC_MMCRA,
-	PERF_REG_POWERPC_MAX,
+	/* Extended registers */
+	PERF_REG_POWERPC_MMCR0,
+	PERF_REG_POWERPC_MMCR1,
+	PERF_REG_POWERPC_MMCR2,
+	PERF_REG_EXTENDED_MAX,
+	/* Max regs without the extended regs */
+	PERF_REG_POWERPC_MAX = PERF_REG_POWERPC_MMCRA + 1,
 };
+
+#define PERF_REG_PMU_MASK	((1ULL << PERF_REG_POWERPC_MAX) - 1)
+#define PERF_REG_EXTENDED_MASK  (((1ULL << (PERF_REG_EXTENDED_MAX))	\
+			- 1) - PERF_REG_PMU_MASK)
+
 #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 3dcfecf858f3..f56b77800a7b 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2276,6 +2276,7 @@ int register_power_pmu(struct power_pmu *pmu)
 
 	power_pmu.attr_groups = ppmu->attr_groups;
 
+	power_pmu.capabilities |= (ppmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS);
 #ifdef MSR_HV
 	/*
 	 * Use FCHV to ignore kernel events if MSR.HV is set.
diff --git a/arch/powerpc/perf/perf_regs.c b/arch/powerpc/perf/perf_regs.c
index a213a0aa5d25..57aa02568caf 100644
--- a/arch/powerpc/perf/perf_regs.c
+++ b/arch/powerpc/perf/perf_regs.c
@@ -15,7 +15,8 @@
 
 #define PT_REGS_OFFSET(id, r) [id] = offsetof(struct pt_regs, r)
 
-#define REG_RESERVED (~((1ULL << PERF_REG_POWERPC_MAX) - 1))
+#define REG_RESERVED (~(PERF_REG_EXTENDED_MASK) &	\
+			(~((1ULL << PERF_REG_POWERPC_MAX) - 1)))
 
 static unsigned int pt_regs_offset[PERF_REG_POWERPC_MAX] = {
 	PT_REGS_OFFSET(PERF_REG_POWERPC_R0,  gpr[0]),
@@ -69,10 +70,22 @@ static unsigned int pt_regs_offset[PERF_REG_POWERPC_MAX] = {
 	PT_REGS_OFFSET(PERF_REG_POWERPC_MMCRA, dsisr),
 };
 
+/* Function to return the extended register values */
+static u64 get_ext_regs_value(int idx)
+{
+	switch (idx) {
+	case PERF_REG_POWERPC_MMCR0:
+				    return mfspr(SPRN_MMCR0);
+	case PERF_REG_POWERPC_MMCR1:
+				    return mfspr(SPRN_MMCR1);
+	case PERF_REG_POWERPC_MMCR2:
+				    return mfspr(SPRN_MMCR2);
+	default: return 0;
+	}
+}
+
 u64 perf_reg_value(struct pt_regs *regs, int idx)
 {
-	if (WARN_ON_ONCE(idx >= PERF_REG_POWERPC_MAX))
-		return 0;
 
 	if (idx == PERF_REG_POWERPC_SIER &&
 	   (IS_ENABLED(CONFIG_FSL_EMB_PERF_EVENT) ||
@@ -85,6 +98,16 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
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
index 08c3ef796198..c37193b3e73f 100644
--- a/arch/powerpc/perf/power9-pmu.c
+++ b/arch/powerpc/perf/power9-pmu.c
@@ -434,6 +434,7 @@ static struct power_pmu power9_pmu = {
 	.cache_events		= &power9_cache_events,
 	.attr_groups		= power9_pmu_attr_groups,
 	.bhrb_nr		= 32,
+	.capabilities		= PERF_PMU_CAP_EXTENDED_REGS,
 };
 
 int init_power9_pmu(void)
diff --git a/tools/arch/powerpc/include/uapi/asm/perf_regs.h b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
index f599064dd8dc..d66953294c73 100644
--- a/tools/arch/powerpc/include/uapi/asm/perf_regs.h
+++ b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
@@ -48,6 +48,17 @@ enum perf_event_powerpc_regs {
 	PERF_REG_POWERPC_DSISR,
 	PERF_REG_POWERPC_SIER,
 	PERF_REG_POWERPC_MMCRA,
-	PERF_REG_POWERPC_MAX,
+	/* Extended arch registers */
+	PERF_REG_POWERPC_MMCR0,
+	PERF_REG_POWERPC_MMCR1,
+	PERF_REG_POWERPC_MMCR2,
+	PERF_REG_EXTENDED_MAX,
+	/* Max regs without extended arch regs */
+	PERF_REG_POWERPC_MAX = PERF_REG_POWERPC_MMCRA + 1,
+
 };
+#define PERF_REG_PMU_MASK	((1ULL << PERF_REG_POWERPC_MAX) - 1)
+#define PERF_REG_EXTENDED_MASK  (((1ULL << (PERF_REG_EXTENDED_MAX))\
+			- 1) - PERF_REG_PMU_MASK)
+
 #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
diff --git a/tools/perf/arch/powerpc/include/perf_regs.h b/tools/perf/arch/powerpc/include/perf_regs.h
index e18a3556f5e3..f7bbdb816f88 100644
--- a/tools/perf/arch/powerpc/include/perf_regs.h
+++ b/tools/perf/arch/powerpc/include/perf_regs.h
@@ -64,7 +64,11 @@ static const char *reg_names[] = {
 	[PERF_REG_POWERPC_DAR] = "dar",
 	[PERF_REG_POWERPC_DSISR] = "dsisr",
 	[PERF_REG_POWERPC_SIER] = "sier",
-	[PERF_REG_POWERPC_MMCRA] = "mmcra"
+	[PERF_REG_POWERPC_MMCRA] = "mmcra",
+	[PERF_REG_POWERPC_MMCR0] = "mmcr0",
+	[PERF_REG_POWERPC_MMCR1] = "mmcr1",
+	[PERF_REG_POWERPC_MMCR2] = "mmcr2",
+
 };
 
 static inline const char *perf_reg_name(int id)
diff --git a/tools/perf/arch/powerpc/util/perf_regs.c b/tools/perf/arch/powerpc/util/perf_regs.c
index 0a5242900248..37b150f9d1a1 100644
--- a/tools/perf/arch/powerpc/util/perf_regs.c
+++ b/tools/perf/arch/powerpc/util/perf_regs.c
@@ -6,6 +6,8 @@
 
 #include "../../../util/perf_regs.h"
 #include "../../../util/debug.h"
+#include "../../../util/event.h"
+#include "../../../perf-sys.h"
 
 #include <linux/kernel.h>
 
@@ -55,6 +57,9 @@ const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG(dsisr, PERF_REG_POWERPC_DSISR),
 	SMPL_REG(sier, PERF_REG_POWERPC_SIER),
 	SMPL_REG(mmcra, PERF_REG_POWERPC_MMCRA),
+	SMPL_REG(mmcr0, PERF_REG_POWERPC_MMCR0),
+	SMPL_REG(mmcr1, PERF_REG_POWERPC_MMCR1),
+	SMPL_REG(mmcr2, PERF_REG_POWERPC_MMCR2),
 	SMPL_REG_END
 };
 
@@ -163,3 +168,31 @@ int arch_sdt_arg_parse_op(char *old_op, char **new_op)
 
 	return SDT_ARG_VALID;
 }
+
+uint64_t arch__intr_reg_mask(void)
+{
+	struct perf_event_attr attr = {
+		.type                   = PERF_TYPE_HARDWARE,
+		.config                 = PERF_COUNT_HW_CPU_CYCLES,
+		.sample_type            = PERF_SAMPLE_REGS_INTR,
+		.sample_regs_intr       = PERF_REG_EXTENDED_MASK,
+		.precise_ip             = 1,
+		.disabled               = 1,
+		.exclude_kernel         = 1,
+	};
+	int fd;
+
+	attr.sample_period = 1;
+	event_attr_init(&attr);
+
+	/*
+	 * check if the pmu supports perf extended regs, before
+	 * returning the register mask to sample.
+	 */
+	fd = sys_perf_event_open(&attr, 0, -1, -1, 0);
+	if (fd != -1) {
+		close(fd);
+		return (PERF_REG_EXTENDED_MASK | PERF_REGS_MASK);
+	}
+	return PERF_REGS_MASK;
+}
-- 
2.20.1

