Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1B65467C3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 15:55:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKMtK0Nw8z3fpq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 23:55:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GKqfQWgd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GKqfQWgd;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKMbG4DS8z3bj3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 23:42:34 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AD8XM2026956;
	Fri, 10 Jun 2022 13:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2wcHqJPeCoM2uceTF99DutyoJ7TUmN8qHa3/hqeEzkc=;
 b=GKqfQWgdextN4t5NAgqjAvqcvR9jE814U948c14fhFI1ja86pVsrBaglMHDxC19UB5MY
 c8+E0rD6hK3Koft2AINDoNyMy68ywkjTmjyob1HIEbtGFkQrsklMWaIu+QNL8U/nTaSJ
 ywd6npSbveuKc4pwPnbABBl324pOihr1eZgBgjiwUPaV5dhiumIaQSencx+Q9Rhkvwqm
 lmVCXRl/TuVenzg0ZMSkq6BQYAdNzVKPv3YXlmEeac96TOK29nkzQhnOTIzZcKWmIzEv
 WKtE3QljmARh7FCOgtCcEltLyPsIJtGKrKoxwRI761neUpWS2w2KaWjwEVfTnluFQq9a pw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm6jyrq0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:42:30 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ADZu03006997;
	Fri, 10 Jun 2022 13:42:28 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma02fra.de.ibm.com with ESMTP id 3gfy196h8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:42:28 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25ADgRCt6095250
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 13:42:28 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6700F52057;
	Fri, 10 Jun 2022 13:42:25 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.7.130])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 208275204F;
	Fri, 10 Jun 2022 13:42:22 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 21/35] selftest/powerpc/pmu: Add selftest for group constraint for MMCRA Sampling Mode field
Date: Fri, 10 Jun 2022 19:10:59 +0530
Message-Id: <20220610134113.62991-22-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
References: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XVPJZB0ZoB_wg29Wb7MudcZGWpYmR8bT
X-Proofpoint-ORIG-GUID: XVPJZB0ZoB_wg29Wb7MudcZGWpYmR8bT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_05,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100052
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

Testcase for reserved bits in Monitor Mode Control
Register A (MMCRA) Random Sampling Mode (SM) value.
As per Instruction Set Architecture (ISA), the values
0x5, 0x9, 0xD, 0x19, 0x1D, 0x1A, 0x1E are reserved
for sampling mode field. Test that having these reserved
bit values should cause event_open to fail. Input event
code in testcases uses these sampling bits along with
401e0 (PM_MRK_INST_CMPL).

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../powerpc/pmu/event_code_tests/Makefile     |  2 +-
 ...eserved_bits_mmcra_sample_elig_mode_test.c | 77 +++++++++++++++++++
 2 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_sample_elig_mode_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
index 5b61fb0b9fd6..5dd482843572 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
@@ -2,7 +2,7 @@
 CFLAGS += -m64
 
 TEST_GEN_PROGS := group_constraint_pmc56_test group_pmc56_exclude_constraints_test group_constraint_pmc_count_test \
-	group_constraint_repeat_test group_constraint_radix_scope_qual_test
+	group_constraint_repeat_test group_constraint_radix_scope_qual_test reserved_bits_mmcra_sample_elig_mode_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_sample_elig_mode_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_sample_elig_mode_test.c
new file mode 100644
index 000000000000..4c119c821b99
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_sample_elig_mode_test.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2022, Athira Rajeev, IBM Corp.
+ */
+
+#include <stdio.h>
+#include "../event.h"
+#include "../sampling_tests/misc.h"
+
+/*
+ * Testcase for reserved bits in Monitor Mode Control
+ * Register A (MMCRA) Random Sampling Mode (SM) value.
+ * As per Instruction Set Architecture (ISA), the values
+ * 0x5, 0x9, 0xD, 0x19, 0x1D, 0x1A, 0x1E are reserved
+ * for sampling mode field. Test that having these reserved
+ * bit values should cause event_open to fail.
+ * Input event code uses these sampling bits along with
+ * 401e0 (PM_MRK_INST_CMPL).
+ */
+
+static int reserved_bits_mmcra_sample_elig_mode(void)
+{
+	struct event event;
+
+	/* Check for platform support for the test */
+	SKIP_IF(platform_check_for_tests());
+
+	/* Skip for Generic compat PMU */
+	SKIP_IF(check_for_generic_compat_pmu());
+
+	/*
+	 * MMCRA Random Sampling Mode (SM) values: 0x5
+	 * 0x9, 0xD, 0x19, 0x1D, 0x1A, 0x1E is reserved.
+	 * Expected to fail when using these reserved values.
+	 */
+	event_init(&event, 0x50401e0);
+	FAIL_IF(!event_open(&event));
+
+	event_init(&event, 0x90401e0);
+	FAIL_IF(!event_open(&event));
+
+	event_init(&event, 0xD0401e0);
+	FAIL_IF(!event_open(&event));
+
+	event_init(&event, 0x190401e0);
+	FAIL_IF(!event_open(&event));
+
+	event_init(&event, 0x1D0401e0);
+	FAIL_IF(!event_open(&event));
+
+	event_init(&event, 0x1A0401e0);
+	FAIL_IF(!event_open(&event));
+
+	event_init(&event, 0x1E0401e0);
+	FAIL_IF(!event_open(&event));
+
+	/*
+	 * MMCRA Random Sampling Mode (SM) value 0x10
+	 * is reserved in power10 and 0xC is reserved in
+	 * power9.
+	 */
+	if (PVR_VER(mfspr(SPRN_PVR)) == POWER10) {
+		event_init(&event, 0x100401e0);
+		FAIL_IF(!event_open(&event));
+	} else if (PVR_VER(mfspr(SPRN_PVR)) == POWER9) {
+		event_init(&event, 0xC0401e0);
+		FAIL_IF(!event_open(&event));
+	}
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(reserved_bits_mmcra_sample_elig_mode,
+			    "reserved_bits_mmcra_sample_elig_mode");
+}
-- 
2.35.1

