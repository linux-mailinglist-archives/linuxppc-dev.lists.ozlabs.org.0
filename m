Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2114D49DB87
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:28:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jksdj08Fxz3dfv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 18:28:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qMDiM42t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qMDiM42t; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JksTK2NJDz3bT0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 18:21:25 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20R7CPT8029812; 
 Thu, 27 Jan 2022 07:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0nICuyXzwQ45B3bm4HtK5vUAWi1O58DgMmTu7LbF+SU=;
 b=qMDiM42t+L5M9dYyARqg4VsUAX6fwukkOl4RE2KOiBDO9h6WhUi/bt1k+1+xkXXGqF7c
 jH1MaM1RXZ0Y4MB6R1Xn+VSUgXAsm3kKxzt6FMt7J4SK0GnR4VLWr6246EDoPX9xvtGV
 yKct7RJO8d2iCs2py45nP9H2V4VRW9PyvWc5v0EzZqTMSwekR0yfWkiBmqvMDPN2IVNN
 6H0D89vfTpZf+rxGaTDAahpedKu797lLA15m4DrzvIh64Grx0aAKiaUXo207et/Qx/qI
 exDddMx7x8PDFIgrOC77wJZ2s/HTEhG2ICRbSB+Xi6E+8wLNAtlBmRXjP63IpRGPH7L3 mg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dupsug5sp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:21 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20R787VS016072;
 Thu, 27 Jan 2022 07:21:19 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3dr9j9mn5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:18 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20R7BZ8A41877900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 07:11:35 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BA1E4203F;
 Thu, 27 Jan 2022 07:21:12 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0710642045;
 Thu, 27 Jan 2022 07:21:10 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.106.251])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jan 2022 07:21:09 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 09/20] selftest/powerpc/pmu/: Add interface test for mmcr0
 exception bits
Date: Thu, 27 Jan 2022 12:50:01 +0530
Message-Id: <20220127072012.662451-10-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127072012.662451-1-kjain@linux.ibm.com>
References: <20220127072012.662451-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QJAc-rVdBQg1cpvf-JYqFiP9bv-w7Mb0
X-Proofpoint-GUID: QJAc-rVdBQg1cpvf-JYqFiP9bv-w7Mb0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_02,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 mlxscore=0 clxscore=1015 adultscore=0 impostorscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The testcase uses "instructions" event to verify two
bits(PMAE and PMAO) in Monitor Mode Control Register 0
(MMCR0). At the time of interrupt, pmae bit ( which enables
performance monitor exception ) is expected to be cleared
and pmao (which indicates performance monitor alert) bit
is expected to be set in MMCR0. And testcases handles
these checks.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../powerpc/pmu/sampling_tests/Makefile       |  6 +-
 .../sampling_tests/mmcr0_exceptionbits_test.c | 59 +++++++++++++++++++
 2 files changed, 63 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_exceptionbits_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
index eb00c9f931ec..aee25c7037ac 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 include ../../../../../../scripts/Kbuild.include
 
-all: $(TEST_GEN_PROGS)
+all: $(TEST_GEN_PROGS) mmcr0_exceptionbits_test.c
 
 noarg:
 	$(MAKE) -C ../../
@@ -12,9 +12,11 @@ CFLAGS += -m64 -I../../../../../lib/
 no-pie-option := $(call try-run, echo 'int main() { return 0; }' | \
 	$(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -no-pie -x c - -o "$$TMP", -no-pie)
 
+TEST_GEN_PROGS := mmcr0_exceptionbits_test
+
 LDFLAGS += $(no-pie-option)
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
 
-$(TEST_GEN_PROGS): ../../harness.c ../../utils.c ../event.c ../lib.c misc.c misc.h
+$(TEST_GEN_PROGS): ../../harness.c ../../utils.c ../event.c ../lib.c misc.c misc.h ../loop.S
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_exceptionbits_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_exceptionbits_test.c
new file mode 100644
index 000000000000..4de0b40264c9
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_exceptionbits_test.c
@@ -0,0 +1,59 @@
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
+ * fields : pmae, pmao.
+ */
+static int mmcr0_exceptionbits(void)
+{
+	struct event event;
+	u64 *intr_regs;
+
+	/* Check for platform support for the test */
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
+	/* Verify that pmae is cleared and pmao is set in MMCR0 */
+	FAIL_IF(GET_MMCR_FIELD(0, get_reg_value(intr_regs, "MMCR0"), 5, pmae));
+	FAIL_IF(!GET_MMCR_FIELD(0, get_reg_value(intr_regs, "MMCR0"), 5, pmao));
+
+	event_close(&event);
+	return 0;
+}
+
+int main(void)
+{
+	FAIL_IF(test_harness(mmcr0_exceptionbits, "mmcr0_exceptionbits"));
+}
-- 
2.27.0

