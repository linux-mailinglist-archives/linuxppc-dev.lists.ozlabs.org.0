Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBF85467C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 15:55:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKMsd24l7z3fkx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 23:55:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WbtkrGbK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WbtkrGbK;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKMbD2LwTz3cFL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 23:42:32 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25ADY04Z023539;
	Fri, 10 Jun 2022 13:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8qmDGrDQlMQLN800IKy8y0zQxGkdlD7Kh5Ze6nh06MU=;
 b=WbtkrGbKFIMD7VXxMStxu5ZfolQIa47Bv9EwoTzQCBqI+Cs7iFQto9GBcXbrZmf2Oa0K
 tMVTKJAl+wKvIOd33oYcXgz2/7QAf0k8uQ7zJw8bXNduuFAyYIQTyEAenxo7D6XWV38K
 y5Sd4/EoKaDakVq8Besa/WKQQBMzAOF0Ylf+DMXlRTNx4mNJYKeaF8ZGdW+H2tHzQkpn
 lfYMo1oNqHLtzh7m5lxMxpmejWSyqK/sml8xhmok7fEPEI+ZHQ0Qz4GDCS+0onOGRlC+
 i3rtLFyJuIUgNQ6BwNKZ5diw5cgfV58dYN/GgVdNCamEU8vLSOHLAWcJSR+jBQxgumLC gQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm6y185ku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:42:27 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ADaJ0O011737;
	Fri, 10 Jun 2022 13:42:25 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04ams.nl.ibm.com with ESMTP id 3gfy19g9u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:42:25 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25ADg1hk22085900
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 13:42:01 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 688085204F;
	Fri, 10 Jun 2022 13:42:22 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.7.130])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 218DE5204E;
	Fri, 10 Jun 2022 13:42:19 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 20/35] selftest/powerpc/pmu: Add selftest for group constraint check for radix_scope_qual field
Date: Fri, 10 Jun 2022 19:10:58 +0530
Message-Id: <20220610134113.62991-21-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
References: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7f1gW__0Z-PNiXLoEg4HOE8IEaoOcRET
X-Proofpoint-GUID: 7f1gW__0Z-PNiXLoEg4HOE8IEaoOcRET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206100052
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
2.35.1

