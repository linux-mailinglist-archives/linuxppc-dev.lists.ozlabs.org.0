Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C25F9546787
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 15:45:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKMf95Fd5z3dpx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 23:45:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VZZ+eCHE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VZZ+eCHE;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKMZL2KXNz3c7q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 23:41:46 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25ACwqE8000765;
	Fri, 10 Jun 2022 13:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lp+jnAWtE0z4XQsqkGXzMIzVpeK0Q5eoxPxDJuj09Gw=;
 b=VZZ+eCHEZx/dgFi5rSN46voJt7puGymF1zkIQ4+JZ0FDxzG6XceejNXBFwi7MKnEVo7S
 cHi8+ZKX4NP4j8MU4AKBzeClWhGhmw4OthSocUNArVPkLObtDBCUOaogONAxhkBMVtGr
 W3lsm31ZGAEUEfqMkamo2DKFV369A16dLlPuRdKarOxYGTgnoHz48V74klPFaz9sPj5f
 U/MRzVbaYgMBahfBnL/eRUF4FGiAHlBJdRvnS9ZZPB1VXRK577HUC5UpUb3l1uVFbs8l
 neZhttSQ/iLOx3UZsC2Ftt0nguWtyXtgBk7v1hFvmjLmel3w5AtehqPo5ZanTh3nYhTG 6A== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm69q9476-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:41:40 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ADa4wF005488;
	Fri, 10 Jun 2022 13:41:39 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04fra.de.ibm.com with ESMTP id 3gfy18xhx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:41:38 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25ADfZE618481620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 13:41:35 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CBF505204F;
	Fri, 10 Jun 2022 13:41:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.7.130])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 832BA5204E;
	Fri, 10 Jun 2022 13:41:33 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 05/35] selftest/powerpc/pmu: Add interface test for mmcra_ifm field of indirect call type
Date: Fri, 10 Jun 2022 19:10:43 +0530
Message-Id: <20220610134113.62991-6-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
References: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iJ8b8ukyD-j4EmJGULwo3QbexOqjNJbo
X-Proofpoint-ORIG-GUID: iJ8b8ukyD-j4EmJGULwo3QbexOqjNJbo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100056
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

The testcase uses "instructions" event to check if the
Instruction filtering mode(IFM) bits are programmed correctly
for indirect branch type. Testcase checks if IFM bits are
programmed correctly to Monitor Mode Control Register A (MMCRA)
via perf interface for ISA v3.1 platform.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../selftests/powerpc/pmu/branch_loops.S      | 28 ++++++++
 .../powerpc/pmu/sampling_tests/Makefile       |  5 +-
 .../sampling_tests/mmcra_bhrb_ind_call_test.c | 69 +++++++++++++++++++
 3 files changed, 100 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/branch_loops.S
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_ind_call_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/branch_loops.S b/tools/testing/selftests/powerpc/pmu/branch_loops.S
new file mode 100644
index 000000000000..de758dd3cecf
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/branch_loops.S
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022, Kajol Jain, IBM Corp.
+ */
+
+#include <ppc-asm.h>
+
+	.text
+
+#define ITER_SHIFT	31
+
+FUNC_START(indirect_branch_loop)
+	li	r3, 1
+	sldi	r3, r3, ITER_SHIFT
+
+1:	cmpdi	r3, 0
+	beqlr
+
+	addi	r3, r3, -1
+
+	ld	r4, 2f@got(%r2)
+	mtctr	r4
+	bctr
+
+	.balign 32
+2:	b	1b
+
+FUNC_END(indirect_branch_loop)
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
index 6508e6074bac..89def6e706c8 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
@@ -4,9 +4,10 @@ CFLAGS += -m64
 TEST_GEN_PROGS := mmcr0_exceptionbits_test mmcr0_cc56run_test mmcr0_pmccext_test \
 		   mmcr0_pmcjce_test mmcr0_fc56_pmc1ce_test mmcr0_fc56_pmc56_test \
 		   mmcr1_comb_test mmcr2_l2l3_test mmcr2_fcs_fch_test \
-		   mmcr3_src_test mmcra_thresh_marked_sample_test mmcra_thresh_cmp_test
+		   mmcr3_src_test mmcra_thresh_marked_sample_test mmcra_thresh_cmp_test \
+		   mmcra_bhrb_ind_call_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
 
-$(TEST_GEN_PROGS): ../../harness.c ../../utils.c ../event.c ../lib.c misc.c misc.h ../loop.S
+$(TEST_GEN_PROGS): ../../harness.c ../../utils.c ../event.c ../lib.c misc.c misc.h ../loop.S ../branch_loops.S
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_ind_call_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_ind_call_test.c
new file mode 100644
index 000000000000..f0706730c099
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_ind_call_test.c
@@ -0,0 +1,69 @@
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
+extern void indirect_branch_loop(void);
+
+/* Instructions */
+#define EventCode 0x500fa
+
+/* ifm field for indirect branch mode */
+#define IFM_IND_BRANCH 0x2
+
+/*
+ * A perf sampling test for mmcra
+ * field: ifm for bhrb ind_call.
+ */
+static int mmcra_bhrb_ind_call_test(void)
+{
+	struct event event;
+	u64 *intr_regs;
+
+	/*
+	 * Check for platform support for the test.
+	 * This test is only aplicable on power10
+	 */
+	SKIP_IF(check_pvr_for_sampling_tests());
+	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_1));
+
+	 /* Init the event for the sampling test */
+	event_init_sampling(&event, EventCode);
+	event.attr.sample_regs_intr = platform_extended_mask;
+	event.attr.sample_type |= PERF_SAMPLE_BRANCH_STACK;
+	event.attr.branch_sample_type = PERF_SAMPLE_BRANCH_IND_CALL;
+	event.attr.exclude_kernel = 1;
+
+	FAIL_IF(event_open(&event));
+	event.mmap_buffer = event_sample_buf_mmap(event.fd, 1);
+
+	FAIL_IF(event_enable(&event));
+
+	/* workload to make the event overflow */
+	indirect_branch_loop();
+
+	FAIL_IF(event_disable(&event));
+
+	intr_regs = get_intr_regs(&event, event.mmap_buffer);
+
+	/* Check for intr_regs */
+	FAIL_IF(!intr_regs);
+
+	/* Verify that ifm bit is set properly in MMCRA */
+	FAIL_IF(get_mmcra_ifm(get_reg_value(intr_regs, "MMCRA"), 5) != IFM_IND_BRANCH);
+
+	event_close(&event);
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(mmcra_bhrb_ind_call_test, "mmcra_bhrb_ind_call_test");
+}
-- 
2.35.1

