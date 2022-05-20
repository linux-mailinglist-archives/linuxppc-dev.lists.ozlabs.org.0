Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 763C452E8AC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 11:21:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4Lp721dPz3f0W
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:21:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sx1X4W07;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sx1X4W07; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4LkD1hbVz3bmD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 19:18:28 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K7MxEe022477;
 Fri, 20 May 2022 09:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lp+jnAWtE0z4XQsqkGXzMIzVpeK0Q5eoxPxDJuj09Gw=;
 b=sx1X4W0761cwbixgm0DOTTcIcNCWG64vxMvMAj89L1NeYytFAemjCTd0oJsMPynUrEcK
 uTX/DPx5ZrykX6qN6CncBzs+bg75B/NoWRoOapDDSnKmBYHi9e7BVwKzTxYLAcrr78pT
 BF0082XuuiAB0m0qh4tU2ZlrZXkqrSWNv2N7pWgLGxC7CPw36NLAP2PdBsyYROhP4LDY
 vOw/+CEuOCXQxnqRaJU7Xt6C3urPMJgWHVKBHyr8dnnFEv3IBgZJ21jct5O8niR6gwvP
 Tp3NjngO2q022qmKHUR6fZhzsre41MZll2+LUD7pe9OlBG4bLbpv5nLz8D0a0Mnzxer/ ZQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g62qne6q1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:18:24 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24K9F4Jb026241;
 Fri, 20 May 2022 09:18:21 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3g2428xy85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:18:21 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24K9IIm945285868
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 09:18:18 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3D244C040;
 Fri, 20 May 2022 09:18:18 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FDA34C04E;
 Fri, 20 May 2022 09:18:15 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.31.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 09:18:15 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 05/35] selftest/powerpc/pmu: Add interface test for
 mmcra_ifm field of indirect call type
Date: Fri, 20 May 2022 14:47:21 +0530
Message-Id: <20220520091751.17000-6-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
References: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CV-ddc-q_rTg41xfd_b9xOL3l1tnAUIg
X-Proofpoint-GUID: CV-ddc-q_rTg41xfd_b9xOL3l1tnAUIg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205200066
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
Cc: kjain@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com,
 rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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

