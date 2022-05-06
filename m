Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACD251D3DE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:59:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kvkym1kVhz3fXF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 18:59:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LoNbZIih;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LoNbZIih; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvkhV5M8Yz3cLg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 18:47:06 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2468C6GI018331;
 Fri, 6 May 2022 08:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=P+8fgYSBAHrz75fKu4N/WPerCGla0IAMQKXyqvw4YGM=;
 b=LoNbZIihdV/XyTxEICnaTeymPIY8hFh7VJvrQ9I1FafF0lP9iYJDLIZgOCObG2XT4uTR
 eXiL4i64b1nPORKw0gVW0h3xNMOhxHMR8HgJEohJFhsTIvc25mzU3O8aykUEopmDFQ27
 8QLvT0hc3Sbrv3dQEWyZ+EljbgP9pVWHyGo1AEzdTaijQM6NGnW9Trtp8GHYfiIj7onY
 kQKe6XgWWPZYmlEvfxnh5/YvAhfmFAegXUUa9Jxw1fnuItJEI8T7mK8W8MRd/RJgXw6t
 VeH0FHsQLaEJm4YAurqA91TwlxrzcpTf3WPhFG2SYCwxB0WHgIZlKQ40S6qBaAsi4eCc Cw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvyxugn6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:47:02 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2468hcwG011986;
 Fri, 6 May 2022 08:47:00 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3fuyn79te4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:47:00 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2468kvIQ42205524
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 08:46:57 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 496524C046;
 Fri,  6 May 2022 08:46:57 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E20E94C040;
 Fri,  6 May 2022 08:46:54 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.19.224]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 08:46:54 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 23/35] selftest/powerpc/pmu: Add selftest for checking invalid
 bits in event code
Date: Fri,  6 May 2022 14:15:32 +0530
Message-Id: <20220506084544.56527-24-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220506084544.56527-1-kjain@linux.ibm.com>
References: <20220506084544.56527-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Xs9n4FMbO3z8SoSwDVofFkRErD_36AMk
X-Proofpoint-GUID: Xs9n4FMbO3z8SoSwDVofFkRErD_36AMk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_03,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060045
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

From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

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
2.31.1

