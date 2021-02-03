Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBD730D39E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 08:01:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVsz91tkTzF0yr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 18:01:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lHYeY/lD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVss86L6szDqYD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 17:55:56 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1136WcxG027275; Wed, 3 Feb 2021 01:55:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=3l3v45Sl/n05Nr8RtTLOf90tUHOh38tYENODeK1/J5I=;
 b=lHYeY/lDxzXnsbyEAZNTKwqeshtqkfKsjVReuJNNho1TtzARB+HQyUkVFYkyYdrDyk+2
 RQ27FgYjaOU4fPLjhX5loUopKkAqMhawzF3admXTZB+wJB91KRy91NLZtWnuvOP0SsKn
 gFV+Y9C/SqrC13RI//7UGZDOmOcwlbQt6YF5l1jbGgjtp4iq9Cx/RGgfTnq3ZoFOLQ5Z
 IGtx7YPgcO/dYDt1a5JpplLeEcp4YijvRApT6ug6N8i4jGG27Uu2iRnBvFY+oBRotoU+
 JShZsM+clQWg4uBzaG7FHB5zhNfs9Eq/RIrwEZETLmuaDbydfymy/2lHlhcKmklK6lQT SA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36fnyq1b5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 01:55:50 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1136sqUP023888;
 Wed, 3 Feb 2021 06:55:48 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 36ev5crnf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 06:55:48 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1136tjbJ41484782
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Feb 2021 06:55:45 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6158A4C04A;
 Wed,  3 Feb 2021 06:55:45 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12B884C044;
 Wed,  3 Feb 2021 06:55:44 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.224.72])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  3 Feb 2021 06:55:43 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au, acme@kernel.org, jolsa@kernel.org
Subject: [PATCH 3/3] tools/perf: Add perf tools support to expose Performance
 Monitor Counter SPRs as part of extended regs
Date: Wed,  3 Feb 2021 01:55:37 -0500
Message-Id: <1612335337-1888-4-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612335337-1888-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1612335337-1888-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-03_01:2021-02-02,
 2021-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102030035
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

To enable presenting of Performance Monitor Counter Registers
(PMC1 to PMC6) as part of extended regsiters, patch adds these
to sample_reg_mask in the tool side (to use with -I? option).

Simplified the PERF_REG_PMU_MASK_300/31 definition. Excluded the
unsupported SPRs (MMCR3, SIER2, SIER3) from extended mask value for
CPU_FTR_ARCH_300.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/arch/powerpc/include/uapi/asm/perf_regs.h | 28 +++++++++++++++++++------
 tools/perf/arch/powerpc/include/perf_regs.h     |  6 ++++++
 tools/perf/arch/powerpc/util/perf_regs.c        |  6 ++++++
 3 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/tools/arch/powerpc/include/uapi/asm/perf_regs.h b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
index bdf5f10f8b9f..578b3ee86105 100644
--- a/tools/arch/powerpc/include/uapi/asm/perf_regs.h
+++ b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
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
diff --git a/tools/perf/arch/powerpc/include/perf_regs.h b/tools/perf/arch/powerpc/include/perf_regs.h
index 63f3ac91049f..98b6f9eabfc3 100644
--- a/tools/perf/arch/powerpc/include/perf_regs.h
+++ b/tools/perf/arch/powerpc/include/perf_regs.h
@@ -71,6 +71,12 @@
 	[PERF_REG_POWERPC_MMCR3] = "mmcr3",
 	[PERF_REG_POWERPC_SIER2] = "sier2",
 	[PERF_REG_POWERPC_SIER3] = "sier3",
+	[PERF_REG_POWERPC_PMC1] = "pmc1",
+	[PERF_REG_POWERPC_PMC2] = "pmc2",
+	[PERF_REG_POWERPC_PMC3] = "pmc3",
+	[PERF_REG_POWERPC_PMC4] = "pmc4",
+	[PERF_REG_POWERPC_PMC5] = "pmc5",
+	[PERF_REG_POWERPC_PMC6] = "pmc6",
 };
 
 static inline const char *perf_reg_name(int id)
diff --git a/tools/perf/arch/powerpc/util/perf_regs.c b/tools/perf/arch/powerpc/util/perf_regs.c
index 2b6d4704e3aa..8116a253f91f 100644
--- a/tools/perf/arch/powerpc/util/perf_regs.c
+++ b/tools/perf/arch/powerpc/util/perf_regs.c
@@ -68,6 +68,12 @@
 	SMPL_REG(mmcr3, PERF_REG_POWERPC_MMCR3),
 	SMPL_REG(sier2, PERF_REG_POWERPC_SIER2),
 	SMPL_REG(sier3, PERF_REG_POWERPC_SIER3),
+	SMPL_REG(pmc1, PERF_REG_POWERPC_PMC1),
+	SMPL_REG(pmc2, PERF_REG_POWERPC_PMC2),
+	SMPL_REG(pmc3, PERF_REG_POWERPC_PMC3),
+	SMPL_REG(pmc4, PERF_REG_POWERPC_PMC4),
+	SMPL_REG(pmc5, PERF_REG_POWERPC_PMC5),
+	SMPL_REG(pmc6, PERF_REG_POWERPC_PMC6),
 	SMPL_REG_END
 };
 
-- 
1.8.3.1

