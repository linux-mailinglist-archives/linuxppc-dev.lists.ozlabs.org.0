Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CAE51D3D3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:56:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvkvZ2M9Pz3fLh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 18:56:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IeaJlnPR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IeaJlnPR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvkhD6Lcfz3cGk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 18:46:52 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2468V0Ms010731;
 Fri, 6 May 2022 08:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aIAnlYn5oNWdhZ0YR9lizQtIoce7Yjkks6AjG6ffLHs=;
 b=IeaJlnPRh6T5i15zQzCH22Pin7+wKDDsGWc0qtaQAp0k/HtLSkK/6pDVKwtFCv6Fguqy
 7sbqOjsHQoFsLNdbp9EhaRE6MsmIM9XyH3M7HfG5hVn67yWr3gYb1ANRdydq5GzVnwmr
 3Yrg2BaICNJ422D37sbTJBjjHWmqz3ZvVSB49wOoFgTUhVS1pWVAszMtInZeze9IV91J
 ndjTNeDJFtswquGZhmbQpMSJI1PEDoJ68cWSAB+HtSeRTK6DmUtgfympZZfq6RN4lBR4
 DQKJOVJRy32WG78yWojYXcqPcQoejlSNHOCOsE5rLCHrBi0FvpnViaRabjaM7dmYX3Ks oA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw07yg84s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:46:47 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2468hJQN013966;
 Fri, 6 May 2022 08:46:46 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3fvg61117f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:46:46 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2468XIWq50004258
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 08:33:18 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A762F4C046;
 Fri,  6 May 2022 08:46:42 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5148B4C044;
 Fri,  6 May 2022 08:46:40 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.19.224]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 08:46:39 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 18/35] selftest/powerpc/pmu: Add selftest to check constraint
 for number of counters in use.
Date: Fri,  6 May 2022 14:15:27 +0530
Message-Id: <20220506084544.56527-19-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220506084544.56527-1-kjain@linux.ibm.com>
References: <20220506084544.56527-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WaLNQqV3O7dJn836d0G3gPxwhvjrx2jX
X-Proofpoint-ORIG-GUID: WaLNQqV3O7dJn836d0G3gPxwhvjrx2jX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_02,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205060045
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
2.31.1

