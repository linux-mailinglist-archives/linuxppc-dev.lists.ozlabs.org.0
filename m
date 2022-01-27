Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C324849DBA4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:31:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jkshw599mz3f7J
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 18:31:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KIASN1/Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KIASN1/Y; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JksTX1V96z3bcg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 18:21:36 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20R6ch0E015769; 
 Thu, 27 Jan 2022 07:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5+uW7vA6kMwGShqh8ylgJ1SlQGFugy8hDg9SkPfjSbo=;
 b=KIASN1/YNd0/i3temW/eKthvQneAJaPVFSqHf2Cnn7K+MlGO5M/gx9f8kG3T6sB15s90
 Az5kIU7gRgqvrf3UDVV3FhTfLdTJxIvl+CbX6/5PcityA4fHY2zPn22N25uvERuxJ4/O
 zvJ1PAEUuWKF+Ka1pX8S/rtGfPHejfUiivsRuSAOgKiTElz+yTRjCV1u3vv2X/1u+u4E
 aBKN+1rLQjAXrxfkfepcehgDwgskphOjYvYNd59WADebh195fAK2LIq1wlGW3tY+Rrch
 WewP985LFefdsmN7UOVBUHLfieq0moNLW00+pKIDJGkRr2zmaf623gmG50cJXDXP/vZW Sw== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dung21u4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:31 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20R78KcM028429;
 Thu, 27 Jan 2022 07:21:29 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3dr9j9anvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:29 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20R7BnOr49021306
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 07:11:49 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EBC642049;
 Thu, 27 Jan 2022 07:21:26 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BD2042045;
 Thu, 27 Jan 2022 07:21:24 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.106.251])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jan 2022 07:21:23 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 14/20] selftest/powerpc/pmu/: Add interface test for
 mmcr0_pmc56 using pmc5
Date: Thu, 27 Jan 2022 12:50:06 +0530
Message-Id: <20220127072012.662451-15-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127072012.662451-1-kjain@linux.ibm.com>
References: <20220127072012.662451-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1QpZWJ4CPWg2cyMy9rPwaYCgy7sOJ32n
X-Proofpoint-GUID: 1QpZWJ4CPWg2cyMy9rPwaYCgy7sOJ32n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_02,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
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

From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

The testcase uses event code 0x500fa to verify the
FC5-6 bit setting in Monitor Mode Control Register 0 (MMCR0).
Check if FC5-6 bit is not set in MMCR0 when using Performance
Monitor Counter 5 and 6 (PMC5 and PMC6).

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../powerpc/pmu/sampling_tests/Makefile       |  4 +-
 .../sampling_tests/mmcr0_fc56_pmc56_test.c    | 58 +++++++++++++++++++
 2 files changed, 60 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_fc56_pmc56_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
index b82e63dfed26..d27d5084a3ce 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
@@ -2,7 +2,7 @@
 include ../../../../../../scripts/Kbuild.include
 
 all: $(TEST_GEN_PROGS) mmcr0_exceptionbits_test.c mmcr0_cc56run_test.c mmcr0_pmccext_test.c \
-			mmcr0_pmcjce_test.c mmcr0_fc56_pmc1ce_test.c
+			mmcr0_pmcjce_test.c mmcr0_fc56_pmc1ce_test.c mmcr0_fc56_pmc56_test.c
 
 noarg:
 	$(MAKE) -C ../../
@@ -14,7 +14,7 @@ no-pie-option := $(call try-run, echo 'int main() { return 0; }' | \
 	$(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -no-pie -x c - -o "$$TMP", -no-pie)
 
 TEST_GEN_PROGS := mmcr0_exceptionbits_test mmcr0_cc56run_test mmcr0_pmccext_test \
-		   mmcr0_pmcjce_test mmcr0_fc56_pmc1ce_test
+		   mmcr0_pmcjce_test mmcr0_fc56_pmc1ce_test mmcr0_fc56_pmc56_test
 
 LDFLAGS += $(no-pie-option)
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_fc56_pmc56_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_fc56_pmc56_test.c
new file mode 100644
index 000000000000..2c824a67e975
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_fc56_pmc56_test.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2022, Athira Rajeev, IBM Corp.
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
+ * A perf sampling test for mmcr0
+ * fields: fc56_pmc56
+ */
+static int mmcr0_fc56_pmc56(void)
+{
+	struct event event;
+	u64 *intr_regs;
+
+	 /* Check for platform support for the test */
+	SKIP_IF(check_pvr_for_sampling_tests());
+
+	/* Init the event for the sampling test */
+	event_init_sampling(&event, 0x500fa);
+	event.attr.sample_regs_intr = platform_extended_mask;
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
+	/* Verify that fc56 is not set in MMCR0 when using PMC5 */
+	FAIL_IF(GET_MMCR_FIELD(0, get_reg_value(intr_regs, "MMCR0"), 5, fc56));
+
+	event_close(&event);
+	return 0;
+}
+
+int main(void)
+{
+	FAIL_IF(test_harness(mmcr0_fc56_pmc56, "mmcr0_fc56_pmc56"));
+}
-- 
2.27.0

