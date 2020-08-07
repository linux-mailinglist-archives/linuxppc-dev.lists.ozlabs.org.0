Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A44523EB3E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 12:12:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNLkQ6XllzDqx4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 20:11:58 +1000 (AEST)
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
 header.s=pp1 header.b=W4KCIkbS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNLZp6DNMzDqDf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 20:05:22 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 077A3O1Z019735; Fri, 7 Aug 2020 06:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=kOQGqc+5PiKIJsuaqCtl6Wcl+Dp1aRwESIipBTfCndM=;
 b=W4KCIkbSPhCPPcq7GThO21q+YRBXbkPqsBd4AcZ+6mcMtUXPRzURt1Duc+7LLr51m7YU
 OK7O6rU8S3IpMveWHziTj/cpJWMcgnZ2fm5h6W9jqR/GzeXgp1mNuLYb31DbLlZRBvtp
 /H5ah79w6bhE5i2F7pHjDPwxHos2yC+d9hV8kapL3rWA46vfOl1Qqou/mCaQ0StbVyil
 FkvJQAab5hFX2v3hyGOjEJZwbkUwMkWu2z3jh3JoodvU0UMz7pM2zm2bZ+8uQI7G5nKY
 qSbwwxGuvBqcD4taSftcIbJbNJqhrHN5Dbu6caWelvQVLlhwGzBF8VRP1WblVRyHU4op xQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32rgng2mrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 06:05:16 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 077A3IEb031861;
 Fri, 7 Aug 2020 10:05:14 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 32mynhc087-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 10:05:14 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 077A5BKq64356726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Aug 2020 10:05:11 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F19F14C04A;
 Fri,  7 Aug 2020 10:05:10 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63FA34C04E;
 Fri,  7 Aug 2020 10:05:08 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.199.53.190])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Aug 2020 10:05:08 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V6 2/2] powerpc/perf: Add extended regs support for power10
 platform
Date: Fri,  7 Aug 2020 06:05:01 -0400
Message-Id: <1596794701-23530-3-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596794701-23530-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1596794701-23530-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-07_06:2020-08-06,
 2020-08-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 suspectscore=1 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008070075
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org, maddy@linux.vnet.ibm.com,
 kjain@linux.ibm.com, acme@kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Include capability flag `PERF_PMU_CAP_EXTENDED_REGS` for power10
and expose MMCR3, SIER2, SIER3 registers as part of extended regs.
Also introduce `PERF_REG_PMU_MASK_31` to define extended mask
value at runtime for power10

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
[Fix build failure on PPC32 platform]
Suggested-by: Ryan Grimm <grimm@linux.ibm.com>
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Kajol Jain <kjain@linux.ibm.com>
Tested-by: Nageswara R Sastry <nasastry@in.ibm.com>
Reviewed-and-tested-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/include/uapi/asm/perf_regs.h |  6 ++++++
 arch/powerpc/perf/perf_regs.c             | 12 +++++++++++-
 arch/powerpc/perf/power10-pmu.c           |  6 ++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/uapi/asm/perf_regs.h b/arch/powerpc/include/uapi/asm/perf_regs.h
index 225c64c..bdf5f10 100644
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
@@ -60,6 +63,9 @@ enum perf_event_powerpc_regs {
 
 /* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300 */
 #define PERF_REG_PMU_MASK_300   (((1ULL << (PERF_REG_POWERPC_MMCR2 + 1)) - 1) - PERF_REG_PMU_MASK)
+/* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_31 */
+#define PERF_REG_PMU_MASK_31   (((1ULL << (PERF_REG_POWERPC_SIER3 + 1)) - 1) - PERF_REG_PMU_MASK)
 
 #define PERF_REG_MAX_ISA_300   (PERF_REG_POWERPC_MMCR2 + 1)
+#define PERF_REG_MAX_ISA_31    (PERF_REG_POWERPC_SIER3 + 1)
 #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
diff --git a/arch/powerpc/perf/perf_regs.c b/arch/powerpc/perf/perf_regs.c
index 9301e68..8e53f2f 100644
--- a/arch/powerpc/perf/perf_regs.c
+++ b/arch/powerpc/perf/perf_regs.c
@@ -81,6 +81,14 @@ static u64 get_ext_regs_value(int idx)
 		return mfspr(SPRN_MMCR1);
 	case PERF_REG_POWERPC_MMCR2:
 		return mfspr(SPRN_MMCR2);
+#ifdef CONFIG_PPC64
+	case PERF_REG_POWERPC_MMCR3:
+		return mfspr(SPRN_MMCR3);
+	case PERF_REG_POWERPC_SIER2:
+		return mfspr(SPRN_SIER2);
+	case PERF_REG_POWERPC_SIER3:
+		return mfspr(SPRN_SIER3);
+#endif
 	default: return 0;
 	}
 }
@@ -89,7 +97,9 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 {
 	u64 perf_reg_extended_max = PERF_REG_POWERPC_MAX;
 
-	if (cpu_has_feature(CPU_FTR_ARCH_300))
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		perf_reg_extended_max = PERF_REG_MAX_ISA_31;
+	else if (cpu_has_feature(CPU_FTR_ARCH_300))
 		perf_reg_extended_max = PERF_REG_MAX_ISA_300;
 
 	if (idx == PERF_REG_POWERPC_SIER &&
diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index f7cff7f..8314865 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -87,6 +87,8 @@
 #define POWER10_MMCRA_IFM3		0x00000000C0000000UL
 #define POWER10_MMCRA_BHRB_MASK		0x00000000C0000000UL
 
+extern u64 PERF_REG_EXTENDED_MASK;
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
+	PERF_REG_EXTENDED_MASK = PERF_REG_PMU_MASK_31;
+
 	rc = register_power_pmu(&power10_pmu);
 	if (rc)
 		return rc;
-- 
1.8.3.1

