Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6AA51D3DB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:58:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kvkx53ybPz3fRR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 18:58:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lFb/uOS/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lFb/uOS/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvkhL49cMz3byk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 18:46:58 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2467kjeV013198;
 Fri, 6 May 2022 08:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JDS4hNHnSXha/21PRbDnXIXgaJPP88z6YGVHpB17Tco=;
 b=lFb/uOS/QJ3uiuZqHJxpswDLb0D8FRlfWykJZXsmgasdb3XIRpChWdPxqQfhSdWVGVOs
 icg4ea60v+FbjWPnHQEKypspixPDhwoUpnixDVSjPCBdGfAEgUOdE7WCYugPYrzzt06N
 7SXOQVtkPlwrpXXV7J+Z1kxPEai9c90zKlVfMZ1oLwXr4LKzVCI8ZdANTC3jrl6U9wIK
 wZAYHf3TAHeqzBtfzA4F8ON8ApkVUtuzfT7jL9Ou7ELZZQEfrrO3KtQbMQECFBkJzFTQ
 QRkVpm2CwubolOmn69u68Hn9Urc3fr9BeI+lXEsuhW04Xk6Raui6J64OhREbOOhQ9vfF /A== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvyk8h2me-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:46:53 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2468hGmZ025057;
 Fri, 6 May 2022 08:46:51 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3ftp7fw702-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:46:51 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2468kfQX21365032
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 08:46:41 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E5CB4C046;
 Fri,  6 May 2022 08:46:48 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1577F4C040;
 Fri,  6 May 2022 08:46:46 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.19.224]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 08:46:45 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 20/35] selftest/powerpc/pmu: Add selftest for group constraint
 check for radix_scope_qual field
Date: Fri,  6 May 2022 14:15:29 +0530
Message-Id: <20220506084544.56527-21-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220506084544.56527-1-kjain@linux.ibm.com>
References: <20220506084544.56527-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lObPxcedFSre_PR6Mi6oPeA5Jc22uWPM
X-Proofpoint-GUID: lObPxcedFSre_PR6Mi6oPeA5Jc22uWPM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_01,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205060043
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

Testcase for group constraint check for radix_scope_qual
field which is used to program Monitor Mode Control Register
(MMCR1) bit 18. All events in the group should match radix_scope_qual
bit, otherwise event_open for the group should fail. Testcase uses
"0x14242" (PM_DATA_RADIX_PROCESS_L2_PTE_FROM_L2) with radix_scope_qual
bit set for power10.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../powerpc/pmu/event_code_tests/Makefile     |  2 +-
 .../group_constraint_radix_scope_qual_test.c  | 56 +++++++++++++++++++
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_radix_scope_qual_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
index ace100e3226e..5b61fb0b9fd6 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
@@ -2,7 +2,7 @@
 CFLAGS += -m64
 
 TEST_GEN_PROGS := group_constraint_pmc56_test group_pmc56_exclude_constraints_test group_constraint_pmc_count_test \
-	group_constraint_repeat_test
+	group_constraint_repeat_test group_constraint_radix_scope_qual_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_radix_scope_qual_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_radix_scope_qual_test.c
new file mode 100644
index 000000000000..9225618b846a
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_radix_scope_qual_test.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2022, Athira Rajeev, IBM Corp.
+ */
+
+#include <stdio.h>
+#include "../event.h"
+#include "../sampling_tests/misc.h"
+
+/* PM_DATA_RADIX_PROCESS_L2_PTE_FROM_L2 */
+#define EventCode_1 0x14242
+/* PM_DATA_RADIX_PROCESS_L2_PTE_FROM_L3 */
+#define EventCode_2 0x24242
+
+/*
+ * Testcase for group constraint check for radix_scope_qual
+ * field which is used to program Monitor Mode Control
+ * egister (MMCR1)  bit 18.
+ * All events in the group should match radix_scope_qual,
+ * bits otherwise event_open for the group should fail.
+ */
+
+static int group_constraint_radix_scope_qual(void)
+{
+	struct event event, leader;
+
+	/*
+	 * Check for platform support for the test.
+	 * This test is aplicable on power10 only.
+	 */
+	SKIP_IF(platform_check_for_tests());
+	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_1));
+
+	/* Init the events for the group contraint check for radix_scope_qual bits */
+	event_init(&leader, EventCode_1);
+	FAIL_IF(event_open(&leader));
+
+	event_init(&event, 0x200fc);
+
+	/* Expected to fail as sibling event doesn't request same radix_scope_qual bits as leader */
+	FAIL_IF(!event_open_with_group(&event, leader.fd));
+
+	event_init(&event, EventCode_2);
+	/* Expected to pass as sibling event request same radix_scope_qual bits as leader */
+	FAIL_IF(event_open_with_group(&event, leader.fd));
+
+	event_close(&leader);
+	event_close(&event);
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(group_constraint_radix_scope_qual,
+			    "group_constraint_radix_scope_qual");
+}
-- 
2.31.1

