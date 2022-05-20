Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F086452E8E3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 11:34:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4M4K67Wcz3fsr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:34:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O2jQWRI7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=O2jQWRI7; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Llc1sDKz3dPf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 19:19:40 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K6J9vB014983;
 Fri, 20 May 2022 09:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=yiOj9jHWKnzv1W6gdRT6N2AfHdUkaFjyJ27qhjeMEXM=;
 b=O2jQWRI7fj1W+cUi0uUysga0j4bzWiI25/yiNf1imupxp2Ekn5TQo4K/KwFS4c14/9mB
 yuPDoHdn/OXhcpST+91d0sMwboc02iwKfMzAbhTABEE5DON7KzMsvr2vqN1/PKgp0H73
 TjudWXfG5Nf1/+pdEbn1MwCJRzCe6pV7gVDx2Don5bG8JJOONwiypRz45sFjMQljzQvV
 1nUGifEFjb2Cms7TBFwB6gfyNIORFyNUfiOtmh87ZtnlUg74Xl/Ui9A6S0sp/22tA+0/
 no7SOC7FGvsFIW4jIouS+tD3T8GNOhoirMCqrMhcyaOScCEDpPBLtufg/2Te3hDJTK99 mQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g65m5k3m2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:19:34 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24K9EqaG019297;
 Fri, 20 May 2022 09:19:33 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3g23pjgjp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:19:33 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24K9JU3d38601126
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 09:19:30 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB1B14C04A;
 Fri, 20 May 2022 09:19:29 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB46F4C046;
 Fri, 20 May 2022 09:19:26 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.31.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 09:19:26 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 23/35] selftest/powerpc/pmu: Add selftest for checking
 invalid bits in event code
Date: Fri, 20 May 2022 14:47:39 +0530
Message-Id: <20220520091751.17000-24-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
References: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XdCwgDsdcadWphdPySYA12VgiiMv9R-g
X-Proofpoint-ORIG-GUID: XdCwgDsdcadWphdPySYA12VgiiMv9R-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205200066
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
Cc: kjain@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com,
 rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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

