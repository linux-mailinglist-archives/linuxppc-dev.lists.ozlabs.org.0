Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BB849DB9D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:30:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jksh85pnwz3cW6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 18:30:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gDmh5VT3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gDmh5VT3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JksTV3DSrz3bcB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 18:21:34 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20R7Cdhj022012; 
 Thu, 27 Jan 2022 07:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=iIeFW42atAsmhMW1qJ5JKtFrflrgy/ibOsM3xQ+atGU=;
 b=gDmh5VT33F7OhCf7pLr71l7nTwzDr70OTfrY1RIig1rPxD843xyT/Z8Q9ZCBtbZOE9Dk
 SEixt7sx6m/5xNYBaBRGU/OSdX+tzEsK+Z4aNBu7GqohjMOI06gZu9Y2HJ1L/Uwid/u+
 HMfGj4IwOcjaxkpVrhpCS7GsKB0XnAda5GTZmhF0EJGHTA2lvonytS2FM7w3Xwy4B3/t
 1yf5bGVStIt6LYZuOWm+9qPheY0EyBxSrorcNncrVbi7aT9kbPoK1W4FheMW7II373Pv
 JMP6aWJ0X8tasoJCcXvdCBvFbiegLgM8F4mIVrbK/CGZXtXAHdfkeYkBQxlrmWXxHfTP WA== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dupsug5yd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:30 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20R78IoO008552;
 Thu, 27 Jan 2022 07:21:28 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3dr96jtrcy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:28 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20R7LNIp34144728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 07:21:23 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FA5C4203F;
 Thu, 27 Jan 2022 07:21:23 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3ACE42041;
 Thu, 27 Jan 2022 07:21:20 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.106.251])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jan 2022 07:21:20 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 13/20] selftest/powerpc/pmu/: Add interface test for
 mmcr0_fc56 field using pmc1
Date: Thu, 27 Jan 2022 12:50:05 +0530
Message-Id: <20220127072012.662451-14-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127072012.662451-1-kjain@linux.ibm.com>
References: <20220127072012.662451-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OxJITRq8rY2S6dIJggvTq1qUPgKaIFO3
X-Proofpoint-ORIG-GUID: OxJITRq8rY2S6dIJggvTq1qUPgKaIFO3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_02,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270040
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

The testcase uses event code 0x1001e to verify two bit settings
(FC5-6 and PMC1CE) in Monitor Mode Control Register 0 (MMCR0).
Check if FC5-6 bit to be set in MMCR0 when not using Performance
Monitor Counter 5 and 6 (PMC5 and PMC6). And also PMC1CE is
expected to be set when using PMC1. Test if these fields are
programmed correctly via perf interface.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../powerpc/pmu/sampling_tests/Makefile       |  4 +-
 .../sampling_tests/mmcr0_fc56_pmc1ce_test.c   | 58 +++++++++++++++++++
 2 files changed, 60 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_fc56_pmc1ce_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
index 4ff9031abfb5..b82e63dfed26 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
@@ -2,7 +2,7 @@
 include ../../../../../../scripts/Kbuild.include
 
 all: $(TEST_GEN_PROGS) mmcr0_exceptionbits_test.c mmcr0_cc56run_test.c mmcr0_pmccext_test.c \
-			mmcr0_pmcjce_test.c
+			mmcr0_pmcjce_test.c mmcr0_fc56_pmc1ce_test.c
 
 noarg:
 	$(MAKE) -C ../../
@@ -14,7 +14,7 @@ no-pie-option := $(call try-run, echo 'int main() { return 0; }' | \
 	$(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -no-pie -x c - -o "$$TMP", -no-pie)
 
 TEST_GEN_PROGS := mmcr0_exceptionbits_test mmcr0_cc56run_test mmcr0_pmccext_test \
-		   mmcr0_pmcjce_test
+		   mmcr0_pmcjce_test mmcr0_fc56_pmc1ce_test
 
 LDFLAGS += $(no-pie-option)
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_fc56_pmc1ce_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_fc56_pmc1ce_test.c
new file mode 100644
index 000000000000..d62ef3d881e5
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_fc56_pmc1ce_test.c
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
+ * fields: fc56, pmc1ce.
+ */
+static int mmcr0_fc56_pmc1ce(void)
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
+	FAIL_IF(event_open(&event));
+	event.mmap_buffer = event_sample_buf_mmap(event.fd, 1);
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
+	/* Verify that fc56, pmc1ce fields are set in MMCR0 */
+	FAIL_IF(!GET_MMCR_FIELD(0, get_reg_value(intr_regs, "MMCR0"), 1, fc56));
+	FAIL_IF(!GET_MMCR_FIELD(0, get_reg_value(intr_regs, "MMCR0"), 1, pmc1ce));
+
+	event_close(&event);
+	return 0;
+}
+
+int main(void)
+{
+	FAIL_IF(test_harness(mmcr0_fc56_pmc1ce, "mmcr0_fc56_pmc1ce"));
+}
-- 
2.27.0

