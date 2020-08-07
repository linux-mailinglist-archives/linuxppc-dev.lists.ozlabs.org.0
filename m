Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD4F23EB6A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 12:22:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNLz41GR8zDqx6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 20:22:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aSqSK368; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNLk33pqVzDqCF
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 20:11:39 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 077A2Pjj046838; Fri, 7 Aug 2020 06:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=2Fo0UtUg9jvo9S2ZgiyE7XYLJh/v35iMTixbtNm/8DE=;
 b=aSqSK368cIeUQzQtqIfVvQScBmyw7A8uGTyk+gvhjGqzkqZf7Sn0ucVJPJarwNLKS5Uj
 MllnlFFRWOwiLneO/kbfxVLEU5B8vExXPf7s8Hyj6SAT4wxj+vp0T4dyybkYPGVsYgL1
 R53csdqlSLDIc6n/rEubKQ8ZjW71jnXqTeznnIooEiuFuQgzVy0N+p8m7pzAoiqL+oJx
 ftiGKZ5IcbFGjCM2gNeiokJDtuQuPYov4EqqK5NVGdy+1pWFUpQ6AtANv6J6Xq411MY9
 XpI3RUBTb/b3B+so7QUVOjKqiAZP9wmq0jzhktR8qZ+3WjQF7Yfe2ljVgEVprf7+3Jis /w== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32rephnrqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 06:11:32 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 077A5Ygi007418;
 Fri, 7 Aug 2020 10:11:31 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 32n018c0gf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 10:11:30 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 077ABSvG26673420
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Aug 2020 10:11:28 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04FE14C052;
 Fri,  7 Aug 2020 10:11:28 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1E974C046;
 Fri,  7 Aug 2020 10:11:25 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.199.53.190])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Aug 2020 10:11:25 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au, acme@kernel.org, jolsa@kernel.org
Subject: [PATCH V6 2/2] tools/perf: Add perf tools support for extended regs
 in power10
Date: Fri,  7 Aug 2020 06:11:19 -0400
Message-Id: <1596795079-23601-3-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596795079-23601-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1596795079-23601-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-07_05:2020-08-06,
 2020-08-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008070071
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
 linuxppc-dev@lists.ozlabs.org, kjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Added support for supported regs which are new in power10
( MMCR3, SIER2, SIER3 ) to sample_reg_mask in the tool side
to use with `-I?` option. Also added PVR check to send extended
mask for power10 at kernel while capturing extended regs in
each sample.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reviewed-by: Kajol Jain <kjain@linux.ibm.com>
Reviewed-and-tested-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 tools/arch/powerpc/include/uapi/asm/perf_regs.h | 6 ++++++
 tools/perf/arch/powerpc/include/perf_regs.h     | 3 +++
 tools/perf/arch/powerpc/util/perf_regs.c        | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/tools/arch/powerpc/include/uapi/asm/perf_regs.h b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
index 225c64c..bdf5f10 100644
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
@@ -60,6 +63,9 @@ enum perf_event_powerpc_regs {
 
 /* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300 */
 #define PERF_REG_PMU_MASK_300   (((1ULL << (PERF_REG_POWERPC_MMCR2 + 1)) - 1) - PERF_REG_PMU_MASK)
+/* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_31 */
+#define PERF_REG_PMU_MASK_31   (((1ULL << (PERF_REG_POWERPC_SIER3 + 1)) - 1) - PERF_REG_PMU_MASK)
 
 #define PERF_REG_MAX_ISA_300   (PERF_REG_POWERPC_MMCR2 + 1)
+#define PERF_REG_MAX_ISA_31    (PERF_REG_POWERPC_SIER3 + 1)
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
index d64ba0c..2b6d470 100644
--- a/tools/perf/arch/powerpc/util/perf_regs.c
+++ b/tools/perf/arch/powerpc/util/perf_regs.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 
 #define PVR_POWER9		0x004E
+#define PVR_POWER10		0x0080
 
 const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG(r0, PERF_REG_POWERPC_R0),
@@ -64,6 +65,9 @@
 	SMPL_REG(mmcr0, PERF_REG_POWERPC_MMCR0),
 	SMPL_REG(mmcr1, PERF_REG_POWERPC_MMCR1),
 	SMPL_REG(mmcr2, PERF_REG_POWERPC_MMCR2),
+	SMPL_REG(mmcr3, PERF_REG_POWERPC_MMCR3),
+	SMPL_REG(sier2, PERF_REG_POWERPC_SIER2),
+	SMPL_REG(sier3, PERF_REG_POWERPC_SIER3),
 	SMPL_REG_END
 };
 
@@ -194,6 +198,8 @@ uint64_t arch__intr_reg_mask(void)
 	version = (((mfspr(SPRN_PVR)) >>  16) & 0xFFFF);
 	if (version == PVR_POWER9)
 		extended_mask = PERF_REG_PMU_MASK_300;
+	else if (version == PVR_POWER10)
+		extended_mask = PERF_REG_PMU_MASK_31;
 	else
 		return mask;
 
-- 
1.8.3.1

