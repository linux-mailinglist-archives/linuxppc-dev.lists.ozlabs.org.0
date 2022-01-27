Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F70C49DBBF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:35:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jksnk1QGYz3fYL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 18:35:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dV6bVELe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dV6bVELe; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JksTr3c5rz3cRn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 18:21:52 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20R5a82i026111; 
 Thu, 27 Jan 2022 07:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fmYRK/N6Dxysf8gF77OzoW1XPK4vcFcIOTEtV3SOvKs=;
 b=dV6bVELeY5JqZA2ORTcZawlBob0FFRyGM53eJVdBS3xIhz6UJXnUtyJBoVls5tl370+b
 86xWb+91OuMfT+cNeFzJyKcFsKED07mcDAIpfgdKUFtsX3gz5UrOyT5BEda6c5AzHDjg
 uBZosLp3XHNlaFqmSNhLtL1hR5DR/OZrO4GGiPAhMtzC8+9gCgOsyp+IZ1AJvV71w5Bu
 lvdZAAvoZic9PxH5t7BvOetOg0cLHc9NMgFz6oc6vzxR6dK8TnNo7NJWAnb6nezh+t2D
 VdT+d/ESVqsrV04mXPA4/GPfLbs92xEaEHmYYzsQOLwLqKHTn2S3H2cZnT8UmyLuF/GO 6Q== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dumkutsdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:48 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20R783ih027723;
 Thu, 27 Jan 2022 07:21:46 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3dr9j9jn73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:46 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20R7Lheg42861014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 07:21:43 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00E1642049;
 Thu, 27 Jan 2022 07:21:43 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17C0142045;
 Thu, 27 Jan 2022 07:21:41 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.106.251])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jan 2022 07:21:40 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 20/20] selftest/powerpc/pmu: Add interface test for mmcra
 register fields
Date: Thu, 27 Jan 2022 12:50:12 +0530
Message-Id: <20220127072012.662451-21-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127072012.662451-1-kjain@linux.ibm.com>
References: <20220127072012.662451-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: e6InFPaoNr_IB5WvdWWPvwmf3ckaYZlH
X-Proofpoint-ORIG-GUID: e6InFPaoNr_IB5WvdWWPvwmf3ckaYZlH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_01,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270036
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The testcase uses event code 0x35340401e0 to verify
the settings for different fields in Monitor Mode Control
Register A (MMCRA). The fields include thresh_start, thresh_stop
thresh_select, sdar mode, sample and marked bit. Checks if
these fields are translated correctly via perf interface to MMCRA.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../powerpc/pmu/sampling_tests/Makefile       |  4 +-
 .../mmcra_thresh_marked_sample_test.c         | 80 +++++++++++++++++++
 2 files changed, 82 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_marked_sample_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
index 58d3ddf779d2..a9bf343df911 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
@@ -4,7 +4,7 @@ include ../../../../../../scripts/Kbuild.include
 all: $(TEST_GEN_PROGS) mmcr0_exceptionbits_test.c mmcr0_cc56run_test.c mmcr0_pmccext_test.c \
 			mmcr0_pmcjce_test.c mmcr0_fc56_pmc1ce_test.c mmcr0_fc56_pmc56_test.c \
 			mmcr1_comb_test.c mmcr1_sel_unit_cache_test.c mmcr2_l2l3_test.c \
-			mmcr2_fcs_fch_test.c mmcr3_src_test.c
+			mmcr2_fcs_fch_test.c mmcr3_src_test.c mmcra_thresh_marked_sample_test.c
 
 noarg:
 	$(MAKE) -C ../../
@@ -18,7 +18,7 @@ no-pie-option := $(call try-run, echo 'int main() { return 0; }' | \
 TEST_GEN_PROGS := mmcr0_exceptionbits_test mmcr0_cc56run_test mmcr0_pmccext_test \
 		   mmcr0_pmcjce_test mmcr0_fc56_pmc1ce_test mmcr0_fc56_pmc56_test \
 		   mmcr1_comb_test mmcr1_sel_unit_cache_test mmcr2_l2l3_test \
-		   mmcr2_fcs_fch_test mmcr3_src_test
+		   mmcr2_fcs_fch_test mmcr3_src_test mmcra_thresh_marked_sample_test
 
 LDFLAGS += $(no-pie-option)
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_marked_sample_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_marked_sample_test.c
new file mode 100644
index 000000000000..ca6bdb335fa5
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_marked_sample_test.c
@@ -0,0 +1,80 @@
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
+#define EventCode 0x35340401e0
+
+extern void thirty_two_instruction_loop_with_ll_sc(u64 loops, u64 *ll_sc_target);
+
+/* A perf sampling test to test mmcra fields */
+static int mmcra_thresh_marked_sample(void)
+{
+	struct event event;
+	u64 *intr_regs;
+	u64 dummy;
+
+	/* Check for platform support for the test */
+	SKIP_IF(check_pvr_for_sampling_tests());
+
+	/* Init the event for the sampling test */
+	event_init_sampling(&event, EventCode);
+	event.attr.sample_regs_intr = platform_extended_mask;
+	FAIL_IF(event_open(&event));
+	event.mmap_buffer = event_sample_buf_mmap(event.fd, 1);
+
+	event_enable(&event);
+
+	/* workload to make the event overflow */
+	thirty_two_instruction_loop_with_ll_sc(1000000, &dummy);
+
+	event_disable(&event);
+
+	/* Check for sample count */
+	FAIL_IF(!collect_samples(event.mmap_buffer));
+
+	intr_regs = get_intr_regs(&event, event.mmap_buffer);
+
+	/* Check for intr_regs */
+	FAIL_IF(!intr_regs);
+
+	/*
+	 * Verify that thresh sel/start/stop, marked, random sample
+	 * eligibility, sdar mode and sample mode fields match with
+	 * the corresponding event code fields
+	 */
+	FAIL_IF(EV_CODE_EXTRACT(event.attr.config, thd_sel) !=
+			GET_MMCR_FIELD(A, get_reg_value(intr_regs, "MMCRA"), 4, thd_sel));
+	FAIL_IF(EV_CODE_EXTRACT(event.attr.config, thd_start) !=
+			GET_MMCR_FIELD(A, get_reg_value(intr_regs, "MMCRA"), 4, thd_start));
+	FAIL_IF(EV_CODE_EXTRACT(event.attr.config, thd_stop) !=
+			GET_MMCR_FIELD(A, get_reg_value(intr_regs, "MMCRA"), 4, thd_stop));
+	FAIL_IF(EV_CODE_EXTRACT(event.attr.config, marked) !=
+			GET_MMCR_FIELD(A, get_reg_value(intr_regs, "MMCRA"), 4, marked));
+	FAIL_IF(EV_CODE_EXTRACT(event.attr.config, sample >> 2) !=
+			GET_MMCR_FIELD(A, get_reg_value(intr_regs, "MMCRA"), 4, rand_samp_elig));
+	FAIL_IF(EV_CODE_EXTRACT(event.attr.config, sample & 0x3) !=
+			GET_MMCR_FIELD(A, get_reg_value(intr_regs, "MMCRA"), 4, sample_mode));
+	FAIL_IF(EV_CODE_EXTRACT(event.attr.config, sm) !=
+			GET_MMCR_FIELD(A, get_reg_value(intr_regs, "MMCRA"), 4, sm));
+
+	event_close(&event);
+	return 0;
+}
+
+int main(void)
+{
+	FAIL_IF(test_harness(mmcra_thresh_marked_sample, "mmcra_thresh_marked_sample"));
+}
-- 
2.27.0

