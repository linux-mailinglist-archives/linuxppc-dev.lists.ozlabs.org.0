Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCA722DFC2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 16:56:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BF5bh6QjNzF12M
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 00:56:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BF5Mr5yhHzDsgr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 00:45:44 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06QEVLCS133073; Sun, 26 Jul 2020 10:45:35 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32gdnspgfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 10:45:35 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06QEjX76003859;
 Sun, 26 Jul 2020 14:45:33 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 32gcpw8sby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 14:45:33 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06QEjUoq15597592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 26 Jul 2020 14:45:30 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96C0E4C044;
 Sun, 26 Jul 2020 14:45:30 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B71C54C04E;
 Sun, 26 Jul 2020 14:45:27 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.199.33.244])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 26 Jul 2020 14:45:27 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V4 4/4] tools/perf: Add perf tools support for extended regs
 in power10
Date: Sun, 26 Jul 2020 10:45:13 -0400
Message-Id: <1595774713-1482-5-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595774713-1482-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1595774713-1482-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-26_07:2020-07-24,
 2020-07-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=1 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007260109
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

Added support for supported regs which are new in power10
( MMCR3, SIER2, SIER3 ) to sample_reg_mask in the tool side
to use with `-I?` option. Also added PVR check to send extended
mask for power10 at kernel while capturing extended regs in
each sample.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reviewed-by: Kajol Jain <kjain@linux.ibm.com>
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

