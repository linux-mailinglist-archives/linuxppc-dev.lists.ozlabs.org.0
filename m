Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2F25467B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 15:53:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKMr86Zngz3dxD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 23:53:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TvsbXAYS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TvsbXAYS;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKMb63HH5z3c8W
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 23:42:26 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25ADQ8XO031025;
	Fri, 10 Jun 2022 13:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zHduhIy69vJCSQCE2zn4fzTmljS1FaTlYU6ukHjQBlc=;
 b=TvsbXAYSyA68YDzYIeajmknnTeCgzUGcQW4llXy1Lo5RFpFUPkwYetjHxrjDKmj667WH
 V5LH6sPmTRAaDVhuhC7PE7LHUzD6l3ro6lrQyvQ0zEZYCY8qZI7BHz9lX63ILHV0IqeI
 H9D/AiYlyFjnSo+ez6u+xW86lD6lhnxY8bwgXNTO4nBRcPKWxjKh/ipJaAE767HqbsAn
 5ycuy88h/JiYovgZiKVv3Nthd/MimFfli0aBAw0IVjgkNuHWOC65oG9RVQGbXYc3EKKq
 dh/Z0gPjA3MqyPY4TdrY0KBc+RyPtmf38AK5hvH4sUKZlTSqBpEAgmWzrya5D6YCsgAI Zg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm6ub0a7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:42:21 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ADaJ3U011736;
	Fri, 10 Jun 2022 13:42:19 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3gfy19g9ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:42:19 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25ADgGpO19792252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 13:42:16 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C47B5204F;
	Fri, 10 Jun 2022 13:42:16 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.7.130])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id E6E7B5204E;
	Fri, 10 Jun 2022 13:42:13 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 18/35] selftest/powerpc/pmu: Add selftest to check constraint for number of counters in use.
Date: Fri, 10 Jun 2022 19:10:56 +0530
Message-Id: <20220610134113.62991-19-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
References: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xyk-jDxNQ0tpuoXu4_-S_W-NZOoj_wP7
X-Proofpoint-GUID: xyk-jDxNQ0tpuoXu4_-S_W-NZOoj_wP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
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

Testcase for group constraint check for number of
counters in use. The number of programmable counters
is from PMC1 to PMC4. Testcase uses four events with PMC1
to PMC4 and 5th event without any PMC which is expected to fail
since it is exceeding the number of counters in use.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../powerpc/pmu/event_code_tests/Makefile     |  2 +-
 .../group_constraint_pmc_count_test.c         | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_pmc_count_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
index c0eb28935e6e..6310634c5beb 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 CFLAGS += -m64
 
-TEST_GEN_PROGS := group_constraint_pmc56_test group_pmc56_exclude_constraints_test
+TEST_GEN_PROGS := group_constraint_pmc56_test group_pmc56_exclude_constraints_test group_constraint_pmc_count_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_pmc_count_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_pmc_count_test.c
new file mode 100644
index 000000000000..af7c5c75101c
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_pmc_count_test.c
@@ -0,0 +1,70 @@
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
+ * Testcase for number of counters in use.
+ * The number of programmable counters is from
+ * performance monitor counter 1 to performance
+ * monitor counter 4 (PMC1-PMC4). If number of
+ * counters in use exceeds the limit, next event
+ * should fail to schedule.
+ */
+
+static int group_constraint_pmc_count(void)
+{
+	struct event *e, events[5];
+	int i;
+
+	/* Check for platform support for the test */
+	SKIP_IF(platform_check_for_tests());
+
+	/*
+	 * Test for number of counters in use.
+	 * Use PMC1 to PMC4 for leader and 3 sibling
+	 * events. Trying to open fourth event should
+	 * fail here.
+	 */
+	e = &events[0];
+	event_init(e, 0x1001a);
+
+	e = &events[1];
+	event_init(e, 0x200fc);
+
+	e = &events[2];
+	event_init(e, 0x30080);
+
+	e = &events[3];
+	event_init(e, 0x40054);
+
+	e = &events[4];
+	event_init(e, 0x0002c);
+
+	FAIL_IF(event_open(&events[0]));
+
+	/*
+	 * The event_open will fail on event 4 if constraint
+	 * check fails
+	 */
+	for (i = 1; i < 5; i++) {
+		if (i == 4)
+			FAIL_IF(!event_open_with_group(&events[i], events[0].fd));
+		else
+			FAIL_IF(event_open_with_group(&events[i], events[0].fd));
+	}
+
+	for (i = 1; i < 4; i++)
+		event_close(&events[i]);
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(group_constraint_pmc_count, "group_constraint_pmc_count");
+}
-- 
2.35.1

