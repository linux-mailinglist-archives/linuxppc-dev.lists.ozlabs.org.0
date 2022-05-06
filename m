Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8111A51D3AA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:48:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kvkk92gJ2z3cKr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 18:48:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Phmlncsm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Phmlncsm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvkgS6V4Gz3bxR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 18:46:12 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2467kkB1013248;
 Fri, 6 May 2022 08:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=492Fmn/QLuilmqChpGTzKLSms4stswIjVNhc4Xw4qRE=;
 b=Phmlncsm5tgVf6qQLq5aHDyzQG/fHo0EdNUyQy1Pe3gaKFWsPwskuwcV1dwmaw9eRzzE
 mEAo7mZz7wSfshnFhUdWGy8rW4Nok5L+RTG2I092YRTJ4l8/Uvm8j9OF8HCnL8BIGRtx
 X+uP2QL+BNyyEaOAOGfzjyrx8KqB8bjaArOz3RkDqugPh5slxbPN5SoYiUn8iibcjs64
 DlzJhoEwSFDUjBluvG+bxW2yA+eiN56AXYjtlho+99jH1rEXPWOSeofVtidIVd0vm1cZ
 XOVKFeQqF+SosIxXv8+gZEWxRc2l4qYIntY5nviLR6UpD+g0zr53NvNkwWHHwiE7rBwe xg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvyk8h281-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:46:06 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2468gj3K022336;
 Fri, 6 May 2022 08:46:05 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3fvnaqgnt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:46:05 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2468k1ja41222432
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 08:46:02 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE14D4C044;
 Fri,  6 May 2022 08:46:01 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8AE34C046;
 Fri,  6 May 2022 08:45:59 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.19.224]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 08:45:59 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/35] selftest/powerpc/pmu: Add interface test for
 mmcra_thresh_cmp fields
Date: Fri,  6 May 2022 14:15:12 +0530
Message-Id: <20220506084544.56527-4-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220506084544.56527-1-kjain@linux.ibm.com>
References: <20220506084544.56527-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tfCi8EZ1HY_rs8Cn-wKHVoOGmh-9dT9w
X-Proofpoint-GUID: tfCi8EZ1HY_rs8Cn-wKHVoOGmh-9dT9w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_01,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205060043
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
2.31.1

