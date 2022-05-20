Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6BB52E913
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 11:42:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4MFr1Sbwz3gR1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:42:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pDPjhdno;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pDPjhdno; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Lmb0X0lz3drd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 19:20:30 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K7r4oe021388;
 Fri, 20 May 2022 09:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YZJCWQJDl8EpxaIDAUr/SfBqa9hdH6rdD3xk0ObGKak=;
 b=pDPjhdnoY4yyXsYCPOmfONbE9L8uUSrCphZ8W9gnFP3AbN9/YGEgLFMFO5C+mEXXhHAi
 rJbQYmJg3gz/7P4lvXPrWHXzYSQRxq2ldPNKZLDBv+pr7oBBlKC2SFldkC3byGXqXRuQ
 cwgNIf9ZV+Jmr/YlLnM6NWaPWkBNcvI+UTJerqwKkiHXytbitU5AS+ATpyfTygyzpl4n
 HTNQvoFOgzyIzbDZIk0VpjU0PEH/gaZrJpgQ36eKf3qwcQh4D99+Vj0Qn9vmoJmzWBSp
 vQIHfXrHd6fkGaeKvjvVpAWwCMCW8tw8uQ40JuM+33e0xDIHrS1KHzpLMkjK5YMH3ccq pQ== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g63a95p93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:20:27 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24K9F46A014191;
 Fri, 20 May 2022 09:20:25 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3g2428ybta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:20:24 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24K96PIr49086928
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 09:06:25 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9ACD14C044;
 Fri, 20 May 2022 09:20:21 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78E494C050;
 Fri, 20 May 2022 09:20:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.31.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 09:20:18 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 35/35] selftest/powerpc/pmu: Add test for hardware cache
 events
Date: Fri, 20 May 2022 14:47:51 +0530
Message-Id: <20220520091751.17000-36-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
References: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UkueGWdcg0KuouAk238tjRUb6FNKvtTL
X-Proofpoint-ORIG-GUID: UkueGWdcg0KuouAk238tjRUb6FNKvtTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205200066
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

From: Kajol Jain <kjain@linux.ibm.com>

The testcase checks if the transalation of a generic hardware cache
event is done properly via perf interface. The hardware cache events
has type as PERF_TYPE_HW_CACHE and each event points to raw event
code id.

Testcase checks different combination of cache level,
cache event operation type and cache event result type and verify
for a given event code, whether transalation matches with the current
cache event mappings via perf interface.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../powerpc/pmu/event_code_tests/Makefile     |  3 +-
 .../hw_cache_event_type_test.c                | 88 +++++++++++++++++++
 2 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/hw_cache_event_type_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
index 755993d210f2..4e07d7046457 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
@@ -6,7 +6,8 @@ TEST_GEN_PROGS := group_constraint_pmc56_test group_pmc56_exclude_constraints_te
 	group_constraint_mmcra_sample_test invalid_event_code_test reserved_bits_mmcra_thresh_ctl_test \
 	blacklisted_events_test event_alternatives_tests_p9 event_alternatives_tests_p10 generic_events_valid_test \
 	group_constraint_l2l3_sel_test group_constraint_cache_test group_constraint_thresh_cmp_test \
-	group_constraint_unit_test group_constraint_thresh_ctl_test group_constraint_thresh_sel_test
+	group_constraint_unit_test group_constraint_thresh_ctl_test group_constraint_thresh_sel_test \
+	hw_cache_event_type_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/hw_cache_event_type_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/hw_cache_event_type_test.c
new file mode 100644
index 000000000000..a45b1da5b568
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/hw_cache_event_type_test.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2022, Kajol Jain, IBM Corp.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+
+#include "../event.h"
+#include "utils.h"
+#include "../sampling_tests/misc.h"
+
+/*
+ * Load Missed L1, for power9 its pointing to PM_LD_MISS_L1_FIN (0x2c04e) and
+ * for power10 its pointing to PM_LD_MISS_L1 (0x3e054)
+ *
+ * Hardware cache level : PERF_COUNT_HW_CACHE_L1D
+ * Hardware cache event operation type : PERF_COUNT_HW_CACHE_OP_READ
+ * Hardware cache event result type : PERF_COUNT_HW_CACHE_RESULT_MISS
+ */
+#define EventCode_1 0x10000
+/*
+ * Hardware cache level : PERF_COUNT_HW_CACHE_L1D
+ * Hardware cache event operation type : PERF_COUNT_HW_CACHE_OP_WRITE
+ * Hardware cache event result type : PERF_COUNT_HW_CACHE_RESULT_ACCESS
+ */
+#define EventCode_2 0x0100
+/*
+ * Hardware cache level : PERF_COUNT_HW_CACHE_DTLB
+ * Hardware cache event operation type : PERF_COUNT_HW_CACHE_OP_WRITE
+ * Hardware cache event result type : PERF_COUNT_HW_CACHE_RESULT_ACCESS
+ */
+#define EventCode_3 0x0103
+/*
+ * Hardware cache level : PERF_COUNT_HW_CACHE_L1D
+ * Hardware cache event operation type : PERF_COUNT_HW_CACHE_OP_READ
+ * Hardware cache event result type : Invalid ( > PERF_COUNT_HW_CACHE_RESULT_MAX)
+ */
+#define EventCode_4 0x030000
+
+/*
+ * A perf test to check valid hardware cache events.
+ */
+static int hw_cache_event_type_test(void)
+{
+	struct event event;
+
+	/* Check for platform support for the test */
+	SKIP_IF(platform_check_for_tests());
+
+	/* Skip for Generic compat PMU */
+	SKIP_IF(check_for_generic_compat_pmu());
+
+	/* Init the event to test hardware cache event */
+	event_init_opts(&event, EventCode_1, PERF_TYPE_HW_CACHE, "event");
+
+	/* Expected to success as its pointing to L1 load miss */
+	FAIL_IF(event_open(&event));
+	event_close(&event);
+
+	/* Init the event to test hardware cache event */
+	event_init_opts(&event, EventCode_2, PERF_TYPE_HW_CACHE, "event");
+
+	/* Expected to fail as the corresponding cache event entry have 0 in that index */
+	FAIL_IF(!event_open(&event));
+	event_close(&event);
+
+	/* Init the event to test hardware cache event */
+	event_init_opts(&event, EventCode_3, PERF_TYPE_HW_CACHE, "event");
+
+	/* Expected to fail as the corresponding cache event entry have -1 in that index */
+	FAIL_IF(!event_open(&event));
+	event_close(&event);
+
+	/* Init the event to test hardware cache event */
+	event_init_opts(&event, EventCode_4, PERF_TYPE_HW_CACHE, "event");
+
+	/* Expected to fail as hardware cache event result type is Invalid */
+	FAIL_IF(!event_open(&event));
+	event_close(&event);
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(hw_cache_event_type_test, "hw_cache_event_type_test");
+}
-- 
2.35.1

