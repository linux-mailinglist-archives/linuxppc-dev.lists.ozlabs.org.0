Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA53249DBB1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:33:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkslP5wwBz3cR0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 18:33:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VTOmBr9+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VTOmBr9+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JksTk5xpmz3cPJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 18:21:46 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20R5a8CS026121; 
 Thu, 27 Jan 2022 07:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2xbEWIpAH1EW4GgDjv1qYUGEuqaygdHv/1Pu2wHEMN0=;
 b=VTOmBr9+HCSSSseSuAb19hXAfP75gYqzC3MCx+iXxxzStned2x5huCidOjwpWsWNt+Y7
 wQez31ty2tZZjfu658CUSZ9HffYRzxYG5UBud7WX2QF2L1bOl9kHiCMt6WqUgYebq0x8
 iZbK6WyMAwZbrvCLwcx7wY7CLrMT6UqOE/w6BqiZYvAQpIqTBadOCBwkNv7DgONar3fK
 M4UJO4xqPOqpYQd8Rusrq8Wy7+0kzySpAs2oKhwxyV8ZE++PEboNzLWpx+zGpB0fKilI
 y//eqo69NYmxdMDogrr/KEd4cCZdlTd6GtqjNGid08ZdbD+ziwCUAd8UfezNH7BLnC9t hw== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dumkutsbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:42 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20R78MvT028472;
 Thu, 27 Jan 2022 07:21:40 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 3dr9j9anx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:40 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20R7LYXE34144738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 07:21:34 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A05A64203F;
 Thu, 27 Jan 2022 07:21:34 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 512C442045;
 Thu, 27 Jan 2022 07:21:32 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.106.251])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jan 2022 07:21:32 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 17/20] selftest/powerpc/pmu/: Add interface test for
 mmcr2_l2l3 field
Date: Thu, 27 Jan 2022 12:50:09 +0530
Message-Id: <20220127072012.662451-18-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127072012.662451-1-kjain@linux.ibm.com>
References: <20220127072012.662451-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JmNIS3gFDiDKmc8h-Zo1OjbHXVDIBOP-
X-Proofpoint-ORIG-GUID: JmNIS3gFDiDKmc8h-Zo1OjbHXVDIBOP-
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
Cc: atrajeev@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com,
 maddy@linux.vnet.ibm.com, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Madhavan Srinivasan <maddy@linux.ibm.com>

The testcases uses event code 0x010000046080 to verify
the l2l3 bit setting for Monitor Mode Control Register 2
(MMCR2). check if this bit is set correctly via perf interface
in ISA v3.1 platform.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 .../powerpc/pmu/sampling_tests/Makefile       |  4 +-
 .../pmu/sampling_tests/mmcr2_l2l3_test.c      | 74 +++++++++++++++++++
 2 files changed, 76 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr2_l2l3_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
index 345ad66bd1b2..f01666d7f2e0 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
@@ -3,7 +3,7 @@ include ../../../../../../scripts/Kbuild.include
 
 all: $(TEST_GEN_PROGS) mmcr0_exceptionbits_test.c mmcr0_cc56run_test.c mmcr0_pmccext_test.c \
 			mmcr0_pmcjce_test.c mmcr0_fc56_pmc1ce_test.c mmcr0_fc56_pmc56_test.c \
-			mmcr1_comb_test.c mmcr1_sel_unit_cache_test.c
+			mmcr1_comb_test.c mmcr1_sel_unit_cache_test.c mmcr2_l2l3_test.c
 
 noarg:
 	$(MAKE) -C ../../
@@ -16,7 +16,7 @@ no-pie-option := $(call try-run, echo 'int main() { return 0; }' | \
 
 TEST_GEN_PROGS := mmcr0_exceptionbits_test mmcr0_cc56run_test mmcr0_pmccext_test \
 		   mmcr0_pmcjce_test mmcr0_fc56_pmc1ce_test mmcr0_fc56_pmc56_test \
-		   mmcr1_comb_test mmcr1_sel_unit_cache_test
+		   mmcr1_comb_test mmcr1_sel_unit_cache_test mmcr2_l2l3_test
 
 LDFLAGS += $(no-pie-option)
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr2_l2l3_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr2_l2l3_test.c
new file mode 100644
index 000000000000..7167e2217ba8
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr2_l2l3_test.c
@@ -0,0 +1,74 @@
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
+/* All successful D-side store dispatches for this thread */
+#define EventCode 0x010000046080
+
+#define MALLOC_SIZE     (0x10000 * 10)  /* Ought to be enough .. */
+
+/*
+ * A perf sampling test for mmcr2
+ * fields : l2l3
+ */
+static int mmcr2_l2l3(void)
+{
+	struct event event;
+	u64 *intr_regs;
+	char *p;
+	int i;
+
+	/* Check for platform support for the test */
+	SKIP_IF(check_pvr_for_sampling_tests());
+	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_1));
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
+	p = malloc(MALLOC_SIZE);
+	FAIL_IF(!p);
+
+	for (i = 0; i < MALLOC_SIZE; i += 0x10000)
+		p[i] = i;
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
+	 * Verify that l2l3 field of MMCR2 match with
+	 * corresponding event code field
+	 */
+	FAIL_IF(EV_CODE_EXTRACT(event.attr.config, l2l3) !=
+		GET_MMCR_FIELD(2, get_reg_value(intr_regs, "MMCR2"), 4, l2l3));
+
+	event_close(&event);
+	free(p);
+
+	return 0;
+}
+
+int main(void)
+{
+	FAIL_IF(test_harness(mmcr2_l2l3, "mmcr2_l2l3"));
+}
-- 
2.27.0

