Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7222751D3FD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 11:09:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvlBc2j74z3c9m
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 19:09:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SVtNOveN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SVtNOveN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvknM2bkqz3dx7
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 18:51:19 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2467kuiR013525;
 Fri, 6 May 2022 08:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=LnIcBtw0SXGsVF7nQanyIScN+/N8cxLlLVK711DVHLI=;
 b=SVtNOveN5+MiGt3SN0CK16R28e6lWMjEBF7p3kQ6OW7bbxNUe8Wv7/hZxwRtJ8mFoSwn
 fZmk4PYvhUlke+xwfQUuqWtpquBEyKtPrYEBukzD5FFY0t/rY3QeNHDMFvcfA2sRdb6g
 C90yB7MFzCg7cJTAaW39fPJxofoa+2zTKkyaNhZ8sVEG1PE7fASzpwCzqNw3hR6uyoLN
 Yblvz1Di31kX9qKHF/AbO6B4KG+O2FPHSR2f63hoVg2AsXpdNLWKM/KhoVEJT4MSBhUZ
 kFJAV54QKNS5BxgevLjDBiBMkaNVPD+VYwSr0QX+b9cIzLk9fx322R81YAMF4HW5N4/z xA== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvyk8h4yn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:51:13 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2468gaTg013995;
 Fri, 6 May 2022 08:46:10 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3frvr8ppu5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:46:10 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2468Wgd053150048
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 08:32:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2281F4C046;
 Fri,  6 May 2022 08:46:07 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00AE14C044;
 Fri,  6 May 2022 08:46:05 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.19.224]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 08:46:04 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/35] selftest/powerpc/pmu: Add interface test for mmcra_ifm
 field of indirect call type
Date: Fri,  6 May 2022 14:15:14 +0530
Message-Id: <20220506084544.56527-6-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220506084544.56527-1-kjain@linux.ibm.com>
References: <20220506084544.56527-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gpWYjcpoFzTpe0AMN6RqIOhKDl8Xbi9M
X-Proofpoint-GUID: gpWYjcpoFzTpe0AMN6RqIOhKDl8Xbi9M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_01,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205060045
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com,
 disgoel@linux.vnet.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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

Note:
- branch_loops.S is derived from the branch_loop.S in the path:
  linux/tools/testing/selftests/powerpc/security/branch_loops.S
 
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
2.31.1

