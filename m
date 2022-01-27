Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A85E549DBB7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:34:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JksmB3gWnz3dt0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 18:34:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rLcv3vC9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rLcv3vC9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JksTn1XJ0z3cCK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 18:21:49 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20R7Ak8q018121; 
 Thu, 27 Jan 2022 07:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=OJQgx1AElawuiSkOW43B0QnuC5HHOh5GFb4KY2nVc0A=;
 b=rLcv3vC9+DvqMvxmFZbhIl7yG9L+ztZ/T9ibrYShB6DYoSa4KXHxLx225nSW8FuNE3mf
 MAy1o3+9I4CoAvV2G022HDUHlPv1yn5vUOdeDIpN7yh1SNIx74YgM5sXM1/x/t+EhHNl
 h+19BcZb3+CD2zx0liJbbGcKTbx14SpmF8Z/lUgomJREnFzvvdnyMRH6hG+QhovciPNJ
 qvwuBPIn9nmyv7cIuIn2CVAdsW02glDUfQ4gEonMj8gBlChUBj6NQmJRpfIYPJYfo2bk
 l3ppaboxDNImtiVCd7z7rtBR1MxjI3k2xImjxy9p0VWAH0ed+N70qeDphS4iSGP49EhX 4g== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dupc3gjkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:45 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20R78Jur021659;
 Thu, 27 Jan 2022 07:21:43 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3dr9j9mpf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:42 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20R7Lb8H36634886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 07:21:37 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5055C4204B;
 Thu, 27 Jan 2022 07:21:37 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BEDA42042;
 Thu, 27 Jan 2022 07:21:35 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.106.251])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jan 2022 07:21:34 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 18/20] selftest/powerpc/pmu/: Add interface test for
 mmcr2_fcs_fch fields
Date: Thu, 27 Jan 2022 12:50:10 +0530
Message-Id: <20220127072012.662451-19-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127072012.662451-1-kjain@linux.ibm.com>
References: <20220127072012.662451-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Rd3ImgCRLzxBD-fv1e81SZcd4s9kn5Uf
X-Proofpoint-GUID: Rd3ImgCRLzxBD-fv1e81SZcd4s9kn5Uf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_02,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201270040
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
Cc: atrajeev@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com,
 maddy@linux.vnet.ibm.com, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Madhavan Srinivasan <maddy@linux.ibm.com>

The testcases uses cycles event to verify the freeze counter
settings in Monitor Mode Control Register 2 (MMCR2). Event
modifier (exclude_kernel) setting is used for the event attribute
to check the FCxS and FCxH ( Freeze counter in privileged and
hypervisor state ) settings via perf interface.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 .../powerpc/pmu/sampling_tests/Makefile       |  6 +-
 .../pmu/sampling_tests/mmcr2_fcs_fch_test.c   | 67 +++++++++++++++++++
 2 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr2_fcs_fch_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
index f01666d7f2e0..1deaab5a4ebf 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
@@ -3,7 +3,8 @@ include ../../../../../../scripts/Kbuild.include
 
 all: $(TEST_GEN_PROGS) mmcr0_exceptionbits_test.c mmcr0_cc56run_test.c mmcr0_pmccext_test.c \
 			mmcr0_pmcjce_test.c mmcr0_fc56_pmc1ce_test.c mmcr0_fc56_pmc56_test.c \
-			mmcr1_comb_test.c mmcr1_sel_unit_cache_test.c mmcr2_l2l3_test.c
+			mmcr1_comb_test.c mmcr1_sel_unit_cache_test.c mmcr2_l2l3_test.c \
+			mmcr2_fcs_fch_test.c
 
 noarg:
 	$(MAKE) -C ../../
@@ -16,7 +17,8 @@ no-pie-option := $(call try-run, echo 'int main() { return 0; }' | \
 
 TEST_GEN_PROGS := mmcr0_exceptionbits_test mmcr0_cc56run_test mmcr0_pmccext_test \
 		   mmcr0_pmcjce_test mmcr0_fc56_pmc1ce_test mmcr0_fc56_pmc56_test \
-		   mmcr1_comb_test mmcr1_sel_unit_cache_test mmcr2_l2l3_test
+		   mmcr1_comb_test mmcr1_sel_unit_cache_test mmcr2_l2l3_test \
+		   mmcr2_fcs_fch_test
 
 LDFLAGS += $(no-pie-option)
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr2_fcs_fch_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr2_fcs_fch_test.c
new file mode 100644
index 000000000000..1c1c48ca7d4c
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr2_fcs_fch_test.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2022, Madhavan Srinivasan, IBM Corp.
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
+/*
+ * A perf sampling test for mmcr2
+ * fields : fcs, fch.
+ */
+static int mmcr2_fcs_fch(void)
+{
+	struct event event;
+	u64 *intr_regs;
+
+	/* Check for platform support for the test */
+	SKIP_IF(check_pvr_for_sampling_tests());
+
+	/* Init the event for the sampling test */
+	event_init_sampling(&event, 0x1001e);
+	event.attr.sample_regs_intr = platform_extended_mask;
+	event.attr.exclude_kernel = 1;
+	FAIL_IF(event_open(&event));
+	event.mmap_buffer = event_sample_buf_mmap(event.fd, 1);
+
+	event_enable(&event);
+
+	/* workload to make the event overflow */
+	thirty_two_instruction_loop(10000);
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
+	 * Verify that fcs and fch field of MMCR2 match
+	 * with corresponding modifier fields.
+	 */
+	if (is_pSeries())
+		FAIL_IF(GET_ATTR_FIELD(&event, exclude_kernel) !=
+			GET_MMCR_FIELD(2, get_reg_value(intr_regs, "MMCR2"), 1, fcs));
+	else
+		FAIL_IF(GET_ATTR_FIELD(&event, exclude_kernel) !=
+			GET_MMCR_FIELD(2, get_reg_value(intr_regs, "MMCR2"), 1, fch));
+
+	event_close(&event);
+	return 0;
+}
+
+int main(void)
+{
+	FAIL_IF(test_harness(mmcr2_fcs_fch, "mmcr2_fcs_fch"));
+}
-- 
2.27.0

