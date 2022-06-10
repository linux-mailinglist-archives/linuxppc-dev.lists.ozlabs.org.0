Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA66E5467A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 15:51:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKMn55tccz3fS1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 23:51:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tDYLp8/L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tDYLp8/L;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKMZt15W7z3cBR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 23:42:13 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25ADY6V6023721;
	Fri, 10 Jun 2022 13:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=H2mJyVfxSFtGlDKQR8WQk7YTGRxrRlnMe4PJmLNNGjI=;
 b=tDYLp8/LJxZFj3GmchhHopdZ7Tv272GWkJmIzH91HE1t1Z2Rm33PXF4q6J0g5/Y/Agn2
 rceHbcbGOfoXwqRTpr+FyjU6Fxuu2bRyTxkxGLO83Q5cXSeObCXv4yurK5jUN95KFwdZ
 Hvf8onHwTYEuuTH0RfHvwejlJYQjJieSFHIG5iaeq95G+ypBbyFypkc25ND3X1mSHAGI
 NDiaNhknWpYK3QwdL6zzQJicgt9qcm7upoJy2GrM6uIJqfHBNEcyKfOEW/tyM3C4B0y3
 983adce+wU07kZ46A7PbJLQelXDXouFCy/uhhatB5SwKzUHm90ht7NRhfYrZJTq8fus5 0A== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm6y185ea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:42:08 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ADZu02006997;
	Fri, 10 Jun 2022 13:42:07 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma02fra.de.ibm.com with ESMTP id 3gfy196h8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:42:07 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25ADg6fO16515478
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 13:42:06 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0DC6F5204F;
	Fri, 10 Jun 2022 13:42:04 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.7.130])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6D46F5204E;
	Fri, 10 Jun 2022 13:42:01 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 14/35] selftest/powerpc/pmu: Add interface test for bhrb disable field for non-branch samples
Date: Fri, 10 Jun 2022 19:10:52 +0530
Message-Id: <20220610134113.62991-15-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
References: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5JYMHf5pwxoT8sAii6tlKANhJ3iE1woz
X-Proofpoint-GUID: 5JYMHf5pwxoT8sAii6tlKANhJ3iE1woz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206100052
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

The testcase uses "instructions" event to generate the
samples and fetch Monitor Mode Control Register A (MMCRA)
when overflow. Branch History Rolling Buffer(bhrb) disable bit
is part of MMCRA which need to be verified by perf interface.
Incase sample is not of branch type, bhrb disable bit is explicitly
set to 1. Testcase checks if the bhrb disable bit is set of MMCRA
register via perf interface for ISA v3.1 platform

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../powerpc/pmu/sampling_tests/Makefile       |  2 +-
 .../mmcra_bhrb_disable_no_branch_test.c       | 64 +++++++++++++++++++
 2 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_no_branch_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
index f966d3359c6b..9e67351fb252 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
@@ -7,7 +7,7 @@ TEST_GEN_PROGS := mmcr0_exceptionbits_test mmcr0_cc56run_test mmcr0_pmccext_test
 		   mmcr3_src_test mmcra_thresh_marked_sample_test mmcra_thresh_cmp_test \
 		   mmcra_bhrb_ind_call_test mmcra_bhrb_any_test mmcra_bhrb_cond_test \
 		   mmcra_bhrb_disable_test bhrb_no_crash_wo_pmu_test intr_regs_no_crash_wo_pmu_test \
-		   bhrb_filter_map_test mmcr1_sel_unit_cache_test
+		   bhrb_filter_map_test mmcr1_sel_unit_cache_test mmcra_bhrb_disable_no_branch_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_no_branch_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_no_branch_test.c
new file mode 100644
index 000000000000..488c865387e4
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_no_branch_test.c
@@ -0,0 +1,64 @@
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
+extern void thirty_two_instruction_loop(int loops);
+
+/* Instructions */
+#define EventCode 0x500fa
+
+/*
+ * A perf sampling test for mmcra
+ * field: bhrb_disable.
+ */
+static int mmcra_bhrb_disable_no_branch_test(void)
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
+	event.attr.exclude_kernel = 1;
+
+	FAIL_IF(event_open(&event));
+	event.mmap_buffer = event_sample_buf_mmap(event.fd, 1);
+
+	FAIL_IF(event_enable(&event));
+
+	/* workload to make the event overflow */
+	thirty_two_instruction_loop(10000);
+
+	FAIL_IF(event_disable(&event));
+
+	intr_regs = get_intr_regs(&event, event.mmap_buffer);
+
+	/* Check for intr_regs */
+	FAIL_IF(!intr_regs);
+
+	/* Verify that bhrb_disable bit is set in MMCRA for non-branch samples */
+	FAIL_IF(!get_mmcra_bhrb_disable(get_reg_value(intr_regs, "MMCRA"), 5));
+
+	event_close(&event);
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(mmcra_bhrb_disable_no_branch_test, "mmcra_bhrb_disable_no_branch_test");
+}
-- 
2.35.1

