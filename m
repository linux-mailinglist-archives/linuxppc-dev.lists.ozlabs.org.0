Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A02D30D390
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 07:59:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVsxY2860zF09Y
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 17:59:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NzZlCRns; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVss72rX5zDqYD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 17:55:54 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1136Y5Q7127337; Wed, 3 Feb 2021 01:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=35jpTTm5/uo+TdwyEJin8bDFrujlzTcONmvzSEHSS+c=;
 b=NzZlCRnspy1h7fy1Q1KdH5n6eGo7t7M4ZqLnMSJfBVj2I2P7IOYAwGYmGJXVd2DQ2tyw
 CpK93SmlKDGm13picRIEDCPFPV9mx0aIAaBfwm88wDtUZfUfYG52G+0/R41xM6+2W9xD
 VbW5i+QmD0I+fyZ/T+MrONiYV4xyJOD/Xqe00oWqDIquz67Kd2AW4tZ5vYNJtEvqQXjE
 E20YI1HpxngaCcEK7Q7ULdbzyGcpdhUXeeLkPA+b8yp7a1VwzW8LuOTC+f+wY0AbX2ry
 aDOc2qRrnScA5ozn2JxL+YmTODidiv5xKXStEoX+FaHpxrJ4kypFL4374iPvLr9l815i FA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36fpmtrevf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 01:55:49 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1136rYqH022542;
 Wed, 3 Feb 2021 06:55:46 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 36ev5crnf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 06:55:46 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1136tZo733096012
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Feb 2021 06:55:35 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD8364C044;
 Wed,  3 Feb 2021 06:55:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5462E4C05C;
 Wed,  3 Feb 2021 06:55:42 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.224.72])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  3 Feb 2021 06:55:42 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au, acme@kernel.org, jolsa@kernel.org
Subject: [PATCH 2/3] powerpc/perf: Expose Performance Monitor Counter SPR's as
 part of extended regs
Date: Wed,  3 Feb 2021 01:55:36 -0500
Message-Id: <1612335337-1888-3-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612335337-1888-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1612335337-1888-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-03_01:2021-02-02,
 2021-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2102030035
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
Cc: kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently Monitor Mode Control Registers and Sampling registers are
part of extended regs. Patch adds support to include Performance Monitor
Counter Registers (PMC1 to PMC6 ) as part of extended registers.

PMCs are saved in the perf interrupt handler as part of
per-cpu array 'pmcs' in struct cpu_hw_events. While capturing
the register values for extended regs, fetch these saved PMC values.

Simplified the PERF_REG_PMU_MASK_300/31 definition to include PMU
SPRs MMCR0 to PMC6. Exclude the unsupported SPRs (MMCR3, SIER2, SIER3)
from extended mask value for CPU_FTR_ARCH_300 in the new definition.

PERF_REG_EXTENDED_MAX is used to check if any index beyond the extended
registers is requested in the sample. Have one PERF_REG_EXTENDED_MAX
for CPU_FTR_ARCH_300/CPU_FTR_ARCH_31 since perf_reg_validate function
already checks the extended mask for the presence of any unsupported
register.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/perf_event.h     |  2 ++
 arch/powerpc/include/uapi/asm/perf_regs.h | 28 ++++++++++++++++++++++------
 arch/powerpc/perf/core-book3s.c           | 11 +++++++++++
 arch/powerpc/perf/perf_regs.c             | 13 ++++---------
 4 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/perf_event.h b/arch/powerpc/include/asm/perf_event.h
index daec64d41b44..164e910bf654 100644
--- a/arch/powerpc/include/asm/perf_event.h
+++ b/arch/powerpc/include/asm/perf_event.h
@@ -14,6 +14,7 @@
 #include <asm/perf_event_server.h>
 #else
 static inline bool is_sier_available(void) { return false; }
+static inline unsigned long get_pmcs_ext_regs(int idx) { return 0; }
 #endif
 
 #ifdef CONFIG_FSL_EMB_PERF_EVENT
@@ -40,6 +41,7 @@
 
 /* To support perf_regs sier update */
 extern bool is_sier_available(void);
+extern unsigned long get_pmcs_ext_regs(int idx);
 /* To define perf extended regs mask value */
 extern u64 PERF_REG_EXTENDED_MASK;
 #define PERF_REG_EXTENDED_MASK	PERF_REG_EXTENDED_MASK
diff --git a/arch/powerpc/include/uapi/asm/perf_regs.h b/arch/powerpc/include/uapi/asm/perf_regs.h
index bdf5f10f8b9f..578b3ee86105 100644
--- a/arch/powerpc/include/uapi/asm/perf_regs.h
+++ b/arch/powerpc/include/uapi/asm/perf_regs.h
@@ -55,17 +55,33 @@ enum perf_event_powerpc_regs {
 	PERF_REG_POWERPC_MMCR3,
 	PERF_REG_POWERPC_SIER2,
 	PERF_REG_POWERPC_SIER3,
+	PERF_REG_POWERPC_PMC1,
+	PERF_REG_POWERPC_PMC2,
+	PERF_REG_POWERPC_PMC3,
+	PERF_REG_POWERPC_PMC4,
+	PERF_REG_POWERPC_PMC5,
+	PERF_REG_POWERPC_PMC6,
 	/* Max regs without the extended regs */
 	PERF_REG_POWERPC_MAX = PERF_REG_POWERPC_MMCRA + 1,
 };
 
 #define PERF_REG_PMU_MASK	((1ULL << PERF_REG_POWERPC_MAX) - 1)
 
-/* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300 */
-#define PERF_REG_PMU_MASK_300   (((1ULL << (PERF_REG_POWERPC_MMCR2 + 1)) - 1) - PERF_REG_PMU_MASK)
-/* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_31 */
-#define PERF_REG_PMU_MASK_31   (((1ULL << (PERF_REG_POWERPC_SIER3 + 1)) - 1) - PERF_REG_PMU_MASK)
+/* Exclude MMCR3, SIER2, SIER3 for CPU_FTR_ARCH_300 */
+#define	PERF_EXCLUDE_REG_EXT_300	(7ULL << PERF_REG_POWERPC_MMCR3)
 
-#define PERF_REG_MAX_ISA_300   (PERF_REG_POWERPC_MMCR2 + 1)
-#define PERF_REG_MAX_ISA_31    (PERF_REG_POWERPC_SIER3 + 1)
+/*
+ * PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300
+ * includes 9 SPRS from MMCR0 to PMC6 excluding the
+ * unsupported SPRS in PERF_EXCLUDE_REG_EXT_300.
+ */
+#define PERF_REG_PMU_MASK_300   ((0xfffULL << PERF_REG_POWERPC_MMCR0) - PERF_EXCLUDE_REG_EXT_300)
+
+/*
+ * PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_31
+ * includes 12 SPRs from MMCR0 to PMC6.
+ */
+#define PERF_REG_PMU_MASK_31   (0xfffULL << PERF_REG_POWERPC_MMCR0)
+
+#define PERF_REG_EXTENDED_MAX  (PERF_REG_POWERPC_PMC6 + 1)
 #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 436af496e3aa..6ffc18b7e80b 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -150,6 +150,17 @@ bool is_sier_available(void)
 	return false;
 }
 
+/*
+ * Return PMC value corresponding to the
+ * index passed.
+ */
+unsigned long get_pmcs_ext_regs(int idx)
+{
+	struct cpu_hw_events *cpuhw = this_cpu_ptr(&cpu_hw_events);
+
+	return cpuhw->pmcs[idx];
+}
+
 static bool regs_use_siar(struct pt_regs *regs)
 {
 	/*
diff --git a/arch/powerpc/perf/perf_regs.c b/arch/powerpc/perf/perf_regs.c
index 6f681b105eec..b931eed482c9 100644
--- a/arch/powerpc/perf/perf_regs.c
+++ b/arch/powerpc/perf/perf_regs.c
@@ -75,6 +75,8 @@
 static u64 get_ext_regs_value(int idx)
 {
 	switch (idx) {
+	case PERF_REG_POWERPC_PMC1 ... PERF_REG_POWERPC_PMC6:
+		return get_pmcs_ext_regs(idx - PERF_REG_POWERPC_PMC1);
 	case PERF_REG_POWERPC_MMCR0:
 		return mfspr(SPRN_MMCR0);
 	case PERF_REG_POWERPC_MMCR1:
@@ -95,13 +97,6 @@ static u64 get_ext_regs_value(int idx)
 
 u64 perf_reg_value(struct pt_regs *regs, int idx)
 {
-	u64 perf_reg_extended_max = PERF_REG_POWERPC_MAX;
-
-	if (cpu_has_feature(CPU_FTR_ARCH_31))
-		perf_reg_extended_max = PERF_REG_MAX_ISA_31;
-	else if (cpu_has_feature(CPU_FTR_ARCH_300))
-		perf_reg_extended_max = PERF_REG_MAX_ISA_300;
-
 	if (idx == PERF_REG_POWERPC_SIER &&
 	   (IS_ENABLED(CONFIG_FSL_EMB_PERF_EVENT) ||
 	    IS_ENABLED(CONFIG_PPC32) ||
@@ -113,14 +108,14 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 	    IS_ENABLED(CONFIG_PPC32)))
 		return 0;
 
-	if (idx >= PERF_REG_POWERPC_MAX && idx < perf_reg_extended_max)
+	if (idx >= PERF_REG_POWERPC_MAX && idx < PERF_REG_EXTENDED_MAX)
 		return get_ext_regs_value(idx);
 
 	/*
 	 * If the idx is referring to value beyond the
 	 * supported registers, return 0 with a warning
 	 */
-	if (WARN_ON_ONCE(idx >= perf_reg_extended_max))
+	if (WARN_ON_ONCE(idx >= PERF_REG_EXTENDED_MAX))
 		return 0;
 
 	return regs_get_register(regs, pt_regs_offset[idx]);
-- 
1.8.3.1

