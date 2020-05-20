Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC381DAF52
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 11:51:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Rp0t1hPMzDqfL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 19:51:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Rntm46wFzDqVp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 19:45:52 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04K9bwkJ115367; Wed, 20 May 2020 05:45:45 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 312cajrnvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 May 2020 05:45:45 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04K9eOXf027610;
 Wed, 20 May 2020 09:45:44 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 313xas3c54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 May 2020 09:45:43 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04K9jfJ559375784
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 May 2020 09:45:41 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8CE24C058;
 Wed, 20 May 2020 09:45:41 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1B3F4C04A;
 Wed, 20 May 2020 09:45:39 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.85.113.195])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 20 May 2020 09:45:39 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH V3 2/2] tools/perf: Add perf tools support for extended
 register capability in powerpc
Date: Wed, 20 May 2020 05:45:33 -0400
Message-Id: <1589967933-1503-3-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1589967933-1503-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1589967933-1503-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-20_05:2020-05-19,
 2020-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=1
 bulkscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 cotscore=-2147483648 phishscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005200083
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
Cc: ravi.bangoria@linux.ibm.com, atrajeev@linux.vnet.ibm.com,
 maddy@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, acme@kernel.org,
 anju@linux.vnet.ibm.com, jolsa@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Anju T Sudhakar <anju@linux.vnet.ibm.com>

Add extended regs to sample_reg_mask in the tool side to use
with `-I?` option. Perf tools side uses extended mask to display
the platform supported register names (with -I? option) to the user
and also send this mask to the kernel to capture the extended registers
in each sample. Hence decide the mask value based on the processor
version.

Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
[Decide extended mask at run time based on platform]
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/arch/powerpc/include/uapi/asm/perf_regs.h | 14 ++++++-
 tools/perf/arch/powerpc/include/perf_regs.h     |  5 ++-
 tools/perf/arch/powerpc/util/perf_regs.c        | 55 +++++++++++++++++++++++++
 3 files changed, 72 insertions(+), 2 deletions(-)

diff --git a/tools/arch/powerpc/include/uapi/asm/perf_regs.h b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
index f599064..485b1d5 100644
--- a/tools/arch/powerpc/include/uapi/asm/perf_regs.h
+++ b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
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
diff --git a/tools/perf/arch/powerpc/include/perf_regs.h b/tools/perf/arch/powerpc/include/perf_regs.h
index e18a355..46ed00d 100644
--- a/tools/perf/arch/powerpc/include/perf_regs.h
+++ b/tools/perf/arch/powerpc/include/perf_regs.h
@@ -64,7 +64,10 @@
 	[PERF_REG_POWERPC_DAR] = "dar",
 	[PERF_REG_POWERPC_DSISR] = "dsisr",
 	[PERF_REG_POWERPC_SIER] = "sier",
-	[PERF_REG_POWERPC_MMCRA] = "mmcra"
+	[PERF_REG_POWERPC_MMCRA] = "mmcra",
+	[PERF_REG_POWERPC_MMCR0] = "mmcr0",
+	[PERF_REG_POWERPC_MMCR1] = "mmcr1",
+	[PERF_REG_POWERPC_MMCR2] = "mmcr2",
 };
 
 static inline const char *perf_reg_name(int id)
diff --git a/tools/perf/arch/powerpc/util/perf_regs.c b/tools/perf/arch/powerpc/util/perf_regs.c
index 0a52429..9179230 100644
--- a/tools/perf/arch/powerpc/util/perf_regs.c
+++ b/tools/perf/arch/powerpc/util/perf_regs.c
@@ -6,9 +6,14 @@
 
 #include "../../../util/perf_regs.h"
 #include "../../../util/debug.h"
+#include "../../../util/event.h"
+#include "../../../util/header.h"
+#include "../../../perf-sys.h"
 
 #include <linux/kernel.h>
 
+#define PVR_POWER9		0x004E
+
 const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG(r0, PERF_REG_POWERPC_R0),
 	SMPL_REG(r1, PERF_REG_POWERPC_R1),
@@ -55,6 +60,9 @@
 	SMPL_REG(dsisr, PERF_REG_POWERPC_DSISR),
 	SMPL_REG(sier, PERF_REG_POWERPC_SIER),
 	SMPL_REG(mmcra, PERF_REG_POWERPC_MMCRA),
+	SMPL_REG(mmcr0, PERF_REG_POWERPC_MMCR0),
+	SMPL_REG(mmcr1, PERF_REG_POWERPC_MMCR1),
+	SMPL_REG(mmcr2, PERF_REG_POWERPC_MMCR2),
 	SMPL_REG_END
 };
 
@@ -163,3 +171,50 @@ int arch_sdt_arg_parse_op(char *old_op, char **new_op)
 
 	return SDT_ARG_VALID;
 }
+
+uint64_t arch__intr_reg_mask(void)
+{
+	struct perf_event_attr attr = {
+		.type                   = PERF_TYPE_HARDWARE,
+		.config                 = PERF_COUNT_HW_CPU_CYCLES,
+		.sample_type            = PERF_SAMPLE_REGS_INTR,
+		.precise_ip             = 1,
+		.disabled               = 1,
+		.exclude_kernel         = 1,
+	};
+	int fd, ret;
+	char buffer[64];
+	u32 version;
+	u64 extended_mask = 0;
+
+	/* Get the PVR value to set the extended
+	 * mask specific to platform
+	 */
+	get_cpuid(buffer, sizeof(buffer));
+	ret = sscanf(buffer, "%u,", &version);
+
+	if (ret != 1) {
+		pr_debug("Failed to get the processor version, unable to output extended registers\n");
+		return PERF_REGS_MASK;
+	}
+
+	if (version == PVR_POWER9)
+		extended_mask = PERF_REG_PMU_MASK_300;
+	else
+		return PERF_REGS_MASK;
+
+	attr.sample_regs_intr = extended_mask;
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
+		return (extended_mask | PERF_REGS_MASK);
+	}
+	return PERF_REGS_MASK;
+}
-- 
1.8.3.1

