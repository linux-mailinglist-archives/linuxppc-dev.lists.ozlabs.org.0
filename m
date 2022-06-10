Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3475467D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 15:57:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKMvv1pqSz3fqT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 23:56:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rTI/vrhT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rTI/vrhT;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKMbP54ftz3cF8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 23:42:41 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25ADDYTv026362;
	Fri, 10 Jun 2022 13:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=yiOj9jHWKnzv1W6gdRT6N2AfHdUkaFjyJ27qhjeMEXM=;
 b=rTI/vrhT51uWXpvPEQWFUP+Sj4FggOvcLMk9PvsIr+o7itIhu0atyOlh4+LAmXNl56/2
 Ollz31SupOLF9eI/eAD0U+haAVRb1VSrU+tp5yHdErqEeYud4mfaP68mB3odP3oah0Vx
 FzGs9IX16BuQn+oGApZHqUeGMNUgHmPgd71U9EZLYcFY+zBZ6BAk8Bw8T8ML8GwFyyZc
 IW0SUlwvndYmOUdg/GmnvdS0owR6o6Ukbhyl0BaOlKSASuUFfmJSby83lgt3qE2HlzKb
 A+gvRwkJ8mVuxxp6U+FwXk7wIUuevQXlTw3pwjGjOgNbzR05gbaExE1jn3TeeNRsB7bE Xg== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm6n6ghks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:42:36 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ADaE6o009398;
	Fri, 10 Jun 2022 13:42:34 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma01fra.de.ibm.com with ESMTP id 3gfy19ej4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:42:34 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25ADgV6618284916
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 13:42:31 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 84E7C52051;
	Fri, 10 Jun 2022 13:42:31 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.7.130])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 39ABA5204E;
	Fri, 10 Jun 2022 13:42:28 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 23/35] selftest/powerpc/pmu: Add selftest for checking invalid bits in event code
Date: Fri, 10 Jun 2022 19:11:01 +0530
Message-Id: <20220610134113.62991-24-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
References: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FfISf8XlAM0zbhuM6qnIRWrCiOechOtd
X-Proofpoint-GUID: FfISf8XlAM0zbhuM6qnIRWrCiOechOtd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 mlxscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206100056
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

Some of the bits in the event code is reserved
for specific platforms. Event code bits 52-59 are
reserved in power9, whereas in power10, these are used
for programming Monitor Mode Control Register 3 (MMCR3).
Bit 9 in event code is reserved in power9, whereas it
is used for programming "radix_scope_qual" bit 18 in Monitor
Mode Control Register 1 (MMCR1).

Testcase to ensure that using reserved bits in
event code should cause event_open to fail.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../powerpc/pmu/event_code_tests/Makefile     |  2 +-
 .../invalid_event_code_test.c                 | 67 +++++++++++++++++++
 2 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/invalid_event_code_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
index 590b642ef900..1ce1ef4586fd 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
@@ -3,7 +3,7 @@ CFLAGS += -m64
 
 TEST_GEN_PROGS := group_constraint_pmc56_test group_pmc56_exclude_constraints_test group_constraint_pmc_count_test \
 	group_constraint_repeat_test group_constraint_radix_scope_qual_test reserved_bits_mmcra_sample_elig_mode_test \
-	group_constraint_mmcra_sample_test
+	group_constraint_mmcra_sample_test invalid_event_code_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/invalid_event_code_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/invalid_event_code_test.c
new file mode 100644
index 000000000000..f51fcab837fc
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/invalid_event_code_test.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2022, Athira Rajeev, IBM Corp.
+ */
+
+#include <stdio.h>
+#include <sys/prctl.h>
+#include <limits.h>
+#include "../event.h"
+#include "../sampling_tests/misc.h"
+
+/* The data cache was reloaded from local core's L3 due to a demand load */
+#define EventCode_1 0x1340000001c040
+/* PM_DATA_RADIX_PROCESS_L2_PTE_FROM_L2 */
+#define EventCode_2 0x14242
+/* Event code with IFM, EBB, BHRB bits set in event code */
+#define EventCode_3 0xf00000000000001e
+
+/*
+ * Some of the bits in the event code is
+ * reserved for specific platforms.
+ * Event code bits 52-59 are reserved in power9,
+ * whereas in power10, these are used for programming
+ * Monitor Mode Control Register 3 (MMCR3).
+ * Bit 9 in event code is reserved in power9,
+ * whereas it is used for programming "radix_scope_qual"
+ * bit 18 in Monitor Mode Control Register 1 (MMCR1).
+ *
+ * Testcase to ensure that using reserved bits in
+ * event code should cause event_open to fail.
+ */
+
+static int invalid_event_code(void)
+{
+	struct event event;
+
+	/* Check for platform support for the test */
+	SKIP_IF(platform_check_for_tests());
+
+	/*
+	 * Events using MMCR3 bits and radix scope qual bits
+	 * should fail in power9 and should succeed in power10.
+	 * Init the events and check for pass/fail in event open.
+	 */
+	if (have_hwcap2(PPC_FEATURE2_ARCH_3_1)) {
+		event_init(&event, EventCode_1);
+		FAIL_IF(event_open(&event));
+		event_close(&event);
+
+		event_init(&event, EventCode_2);
+		FAIL_IF(event_open(&event));
+		event_close(&event);
+	} else {
+		event_init(&event, EventCode_1);
+		FAIL_IF(!event_open(&event));
+
+		event_init(&event, EventCode_2);
+		FAIL_IF(!event_open(&event));
+	}
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(invalid_event_code, "invalid_event_code");
+}
-- 
2.35.1

