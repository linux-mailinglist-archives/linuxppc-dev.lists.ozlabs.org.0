Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 542752108F9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 12:10:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xcRn0d52zDr63
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 20:10:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xbMJ4s6QzDqvj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 19:21:32 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06193Br1084312; Wed, 1 Jul 2020 05:21:28 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 320mjrektf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 05:21:27 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0619EWug030983;
 Wed, 1 Jul 2020 09:21:25 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 31wyyattd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 09:21:25 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0619LNun57737306
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Jul 2020 09:21:23 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DFF54C059;
 Wed,  1 Jul 2020 09:21:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0AA94C046;
 Wed,  1 Jul 2020 09:21:21 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.199.47.174])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Jul 2020 09:21:21 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 10/10] powerpc/perf: Add extended regs support for power10
 platform
Date: Wed,  1 Jul 2020 05:21:02 -0400
Message-Id: <1593595262-1433-11-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_04:2020-07-01,
 2020-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=1 spamscore=0
 bulkscore=0 cotscore=-2147483648 clxscore=1015 classifier=spam adjust=0
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

Include capability flag `PERF_PMU_CAP_EXTENDED_REGS` for power10
and expose MMCR3, SIER2, SIER3 registers as part of extended regs.
Also introduce `PERF_REG_PMU_MASK_31` to define extended mask
value at runtime for power10

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/include/uapi/asm/perf_regs.h       |  6 ++++++
 arch/powerpc/perf/perf_regs.c                   | 10 +++++++++-
 arch/powerpc/perf/power10-pmu.c                 |  6 ++++++
 tools/arch/powerpc/include/uapi/asm/perf_regs.h |  6 ++++++
 tools/perf/arch/powerpc/include/perf_regs.h     |  3 +++
 tools/perf/arch/powerpc/util/perf_regs.c        |  6 ++++++
 6 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/uapi/asm/perf_regs.h b/arch/powerpc/include/uapi/asm/perf_regs.h
index 485b1d5..020b51c 100644
--- a/arch/powerpc/include/uapi/asm/perf_regs.h
+++ b/arch/powerpc/include/uapi/asm/perf_regs.h
@@ -52,6 +52,9 @@ enum perf_event_powerpc_regs {
 	PERF_REG_POWERPC_MMCR0,
 	PERF_REG_POWERPC_MMCR1,
 	PERF_REG_POWERPC_MMCR2,
+	PERF_REG_POWERPC_MMCR3,
+	PERF_REG_POWERPC_SIER2,
+	PERF_REG_POWERPC_SIER3,
 	/* Max regs without the extended regs */
 	PERF_REG_POWERPC_MAX = PERF_REG_POWERPC_MMCRA + 1,
 };
@@ -62,4 +65,7 @@ enum perf_event_powerpc_regs {
 #define PERF_REG_PMU_MASK_300   (((1ULL << (PERF_REG_POWERPC_MMCR2 + 1)) - 1) \
 				- PERF_REG_PMU_MASK)
 
+/* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_31 */
+#define PERF_REG_PMU_MASK_31	(((1ULL << (PERF_REG_POWERPC_SIER3 + 1)) - 1) \
+				- PERF_REG_PMU_MASK)
 #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
diff --git a/arch/powerpc/perf/perf_regs.c b/arch/powerpc/perf/perf_regs.c
index c8a7e8c..c969935 100644
--- a/arch/powerpc/perf/perf_regs.c
+++ b/arch/powerpc/perf/perf_regs.c
@@ -81,6 +81,12 @@ static u64 get_ext_regs_value(int idx)
 		return mfspr(SPRN_MMCR1);
 	case PERF_REG_POWERPC_MMCR2:
 		return mfspr(SPRN_MMCR2);
+	case PERF_REG_POWERPC_MMCR3:
+			return mfspr(SPRN_MMCR3);
+	case PERF_REG_POWERPC_SIER2:
+			return mfspr(SPRN_SIER2);
+	case PERF_REG_POWERPC_SIER3:
+			return mfspr(SPRN_SIER3);
 	default: return 0;
 	}
 }
@@ -89,7 +95,9 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 {
 	u64 PERF_REG_EXTENDED_MAX;
 
-	if (cpu_has_feature(CPU_FTR_ARCH_300))
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		PERF_REG_EXTENDED_MAX = PERF_REG_POWERPC_SIER3 + 1;
+	else if (cpu_has_feature(CPU_FTR_ARCH_300))
 		PERF_REG_EXTENDED_MAX = PERF_REG_POWERPC_MMCR2 + 1;
 
 	if (idx == PERF_REG_POWERPC_SIER &&
diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index 07fb919..51082d6 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -86,6 +86,8 @@
 #define POWER10_MMCRA_IFM3		0x00000000C0000000UL
 #define POWER10_MMCRA_BHRB_MASK		0x00000000C0000000UL
 
+extern u64 mask_var;
+
 /* Table of alternatives, sorted by column 0 */
 static const unsigned int power10_event_alternatives[][MAX_ALT] = {
 	{ PM_RUN_CYC_ALT,		PM_RUN_CYC },
@@ -397,6 +399,7 @@ static void power10_config_bhrb(u64 pmu_bhrb_filter)
 	.cache_events		= &power10_cache_events,
 	.attr_groups		= power10_pmu_attr_groups,
 	.bhrb_nr		= 32,
+	.capabilities           = PERF_PMU_CAP_EXTENDED_REGS,
 };
 
 int init_power10_pmu(void)
@@ -408,6 +411,9 @@ int init_power10_pmu(void)
 	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power10"))
 		return -ENODEV;
 
+	/* Set the PERF_REG_EXTENDED_MASK here */
+	mask_var = PERF_REG_PMU_MASK_31;
+
 	rc = register_power_pmu(&power10_pmu);
 	if (rc)
 		return rc;
diff --git a/tools/arch/powerpc/include/uapi/asm/perf_regs.h b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
index 485b1d5..020b51c 100644
--- a/tools/arch/powerpc/include/uapi/asm/perf_regs.h
+++ b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
@@ -52,6 +52,9 @@ enum perf_event_powerpc_regs {
 	PERF_REG_POWERPC_MMCR0,
 	PERF_REG_POWERPC_MMCR1,
 	PERF_REG_POWERPC_MMCR2,
+	PERF_REG_POWERPC_MMCR3,
+	PERF_REG_POWERPC_SIER2,
+	PERF_REG_POWERPC_SIER3,
 	/* Max regs without the extended regs */
 	PERF_REG_POWERPC_MAX = PERF_REG_POWERPC_MMCRA + 1,
 };
@@ -62,4 +65,7 @@ enum perf_event_powerpc_regs {
 #define PERF_REG_PMU_MASK_300   (((1ULL << (PERF_REG_POWERPC_MMCR2 + 1)) - 1) \
 				- PERF_REG_PMU_MASK)
 
+/* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_31 */
+#define PERF_REG_PMU_MASK_31	(((1ULL << (PERF_REG_POWERPC_SIER3 + 1)) - 1) \
+				- PERF_REG_PMU_MASK)
 #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
diff --git a/tools/perf/arch/powerpc/include/perf_regs.h b/tools/perf/arch/powerpc/include/perf_regs.h
index 46ed00d..63f3ac9 100644
--- a/tools/perf/arch/powerpc/include/perf_regs.h
+++ b/tools/perf/arch/powerpc/include/perf_regs.h
@@ -68,6 +68,9 @@
 	[PERF_REG_POWERPC_MMCR0] = "mmcr0",
 	[PERF_REG_POWERPC_MMCR1] = "mmcr1",
 	[PERF_REG_POWERPC_MMCR2] = "mmcr2",
+	[PERF_REG_POWERPC_MMCR3] = "mmcr3",
+	[PERF_REG_POWERPC_SIER2] = "sier2",
+	[PERF_REG_POWERPC_SIER3] = "sier3",
 };
 
 static inline const char *perf_reg_name(int id)
diff --git a/tools/perf/arch/powerpc/util/perf_regs.c b/tools/perf/arch/powerpc/util/perf_regs.c
index 9179230..ccc625f 100644
--- a/tools/perf/arch/powerpc/util/perf_regs.c
+++ b/tools/perf/arch/powerpc/util/perf_regs.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 
 #define PVR_POWER9		0x004E
+#define PVR_POWER10		0x0080
 
 const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG(r0, PERF_REG_POWERPC_R0),
@@ -63,6 +64,9 @@
 	SMPL_REG(mmcr0, PERF_REG_POWERPC_MMCR0),
 	SMPL_REG(mmcr1, PERF_REG_POWERPC_MMCR1),
 	SMPL_REG(mmcr2, PERF_REG_POWERPC_MMCR2),
+	SMPL_REG(mmcr3, PERF_REG_POWERPC_MMCR3),
+	SMPL_REG(sier2, PERF_REG_POWERPC_SIER2),
+	SMPL_REG(sier3, PERF_REG_POWERPC_SIER3),
 	SMPL_REG_END
 };
 
@@ -200,6 +204,8 @@ uint64_t arch__intr_reg_mask(void)
 
 	if (version == PVR_POWER9)
 		extended_mask = PERF_REG_PMU_MASK_300;
+	else if (version == PVR_POWER10)
+		extended_mask = PERF_REG_PMU_MASK_31;
 	else
 		return PERF_REGS_MASK;
 
-- 
1.8.3.1

