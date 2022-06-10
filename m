Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76434546782
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 15:43:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKMcl2hjhz3cDt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 23:43:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GWpYshjU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GWpYshjU;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKMZC5wbCz3c2B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 23:41:39 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25ADL3Ej010679;
	Fri, 10 Jun 2022 13:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ujOGE9UYi1DDs64ZS5T5xtikLZwhdTdKhU1eKf27cl0=;
 b=GWpYshjUrR/mbPOkVWTt5+oCnrs1qkTgGg25WYj5akpS8MVTuN9NzJgVK7SNyoFfnWCN
 H6tpqwyhr40kN27D9gLNKzMh2uGRYHXrny2CDyOgGNH3yPjf5HGCoOTO1Ifwuz97FQHK
 V8GqbQozuoSKqaSrpSgqlbtTVj9aDe+rL5++PwpdgT3YW3PlhQPwwrfGfjXrBdZ6FYOK
 Oyj0hQQ6UmRe1ys0MbSW7zxTIwg2mxku13I+8CDc1mT93I7oENUQPgLQcTZc+dO68Jzd
 T8nWkSo0O2U3hUrODmcPVz3VUYTH8fKfvNmxLMj2ZdSCfTt062NMf3/m5IoojlpPbpFw Dw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm6rngbvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:41:34 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ADal8w020453;
	Fri, 10 Jun 2022 13:41:32 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3gfxnj0bj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:41:32 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25ADfWFM15008170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 13:41:32 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8C4B52051;
	Fri, 10 Jun 2022 13:41:29 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.7.130])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 820875204E;
	Fri, 10 Jun 2022 13:41:27 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 03/35] selftest/powerpc/pmu: Add interface test for mmcra_thresh_cmp fields
Date: Fri, 10 Jun 2022 19:10:41 +0530
Message-Id: <20220610134113.62991-4-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
References: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: K03_lvaENvGrxm2nLLQz8l11VPR1NoJ9
X-Proofpoint-ORIG-GUID: K03_lvaENvGrxm2nLLQz8l11VPR1NoJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206100056
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Kajol Jain <kjain@linux.ibm.com>

The testcase uses event code 0x35340401e0 for load
only sampling, to verify the settings of thresh compare field
in Monitor Mode Control Register A (MMCRA: 9-18 bits for power9
and MMCRA: 8-18 bits for power10). Testcase checks if the thresh compare
field is programmed correctly via perf interface to MMCRA
register.

Signed-off-by: Kajol Jain<kjain@linux.ibm.com>
---
 .../powerpc/pmu/sampling_tests/Makefile       |  2 +-
 .../sampling_tests/mmcra_thresh_cmp_test.c    | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_cmp_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
index a785c6a173b9..6508e6074bac 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
@@ -4,7 +4,7 @@ CFLAGS += -m64
 TEST_GEN_PROGS := mmcr0_exceptionbits_test mmcr0_cc56run_test mmcr0_pmccext_test \
 		   mmcr0_pmcjce_test mmcr0_fc56_pmc1ce_test mmcr0_fc56_pmc56_test \
 		   mmcr1_comb_test mmcr2_l2l3_test mmcr2_fcs_fch_test \
-		   mmcr3_src_test mmcra_thresh_marked_sample_test
+		   mmcr3_src_test mmcra_thresh_marked_sample_test mmcra_thresh_cmp_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_cmp_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_cmp_test.c
new file mode 100644
index 000000000000..904362f172c9
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_cmp_test.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2022, Kajol Jain, IBM Corp.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+
+#include "../event.h"
+#include "misc.h"
+#include "utils.h"
+
+/*
+ * Primary PMU event used here is PM_MRK_INST_CMPL (0x401e0)
+ * Threshold event selection used is issue to complete for cycles
+ * Sampling criteria is Load only sampling
+ */
+#define p9_EventCode 0x13E35340401e0
+#define p10_EventCode 0x35340401e0
+
+extern void thirty_two_instruction_loop_with_ll_sc(u64 loops, u64 *ll_sc_target);
+
+/* A perf sampling test to test mmcra fields */
+static int mmcra_thresh_cmp(void)
+{
+	struct event event;
+	u64 *intr_regs;
+	u64 dummy;
+
+	/* Check for platform support for the test */
+	SKIP_IF(check_pvr_for_sampling_tests());
+
+	/* Skip for comapt mode */
+	SKIP_IF(check_for_compat_mode());
+
+	/* Init the event for the sampling test */
+	if (!have_hwcap2(PPC_FEATURE2_ARCH_3_1)) {
+		event_init_sampling(&event, p9_EventCode);
+	} else {
+		event_init_sampling(&event, p10_EventCode);
+		event.attr.config1 = 1000;
+	}
+
+	event.attr.sample_regs_intr = platform_extended_mask;
+	FAIL_IF(event_open(&event));
+	event.mmap_buffer = event_sample_buf_mmap(event.fd, 1);
+
+	FAIL_IF(event_enable(&event));
+
+	/* workload to make the event overflow */
+	thirty_two_instruction_loop_with_ll_sc(1000000, &dummy);
+
+	FAIL_IF(event_disable(&event));
+
+	/* Check for sample count */
+	FAIL_IF(!collect_samples(event.mmap_buffer));
+
+	intr_regs = get_intr_regs(&event, event.mmap_buffer);
+
+	/* Check for intr_regs */
+	FAIL_IF(!intr_regs);
+
+	/* Verify that thresh cmp match with the corresponding event code fields */
+	FAIL_IF(get_thresh_cmp_val(event) !=
+			get_mmcra_thd_cmp(get_reg_value(intr_regs, "MMCRA"), 4));
+
+	event_close(&event);
+	return 0;
+}
+
+int main(void)
+{
+	FAIL_IF(test_harness(mmcra_thresh_cmp, "mmcra_thresh_cmp"));
+}
-- 
2.35.1

