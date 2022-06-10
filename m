Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FAE546805
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 16:04:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKN4v4NCMz3fDH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 00:04:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p5AalfA8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p5AalfA8;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKMc54NDHz3bm9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 23:43:17 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25ADIk0R023572;
	Fri, 10 Jun 2022 13:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YZJCWQJDl8EpxaIDAUr/SfBqa9hdH6rdD3xk0ObGKak=;
 b=p5AalfA8Zus6fGbn+6E/WYgP+MLYMrIpHAjB5dvdxUrnTn3oG4SZUVlFtRFnu+jDGicV
 W8e8X4jKa7HSuYnXi/ux+NmNl4XAqNC2Ub6MU0znEc+li24Ho8KM4gBjf9cS9p/Czery
 Ab4k7cXhtV5hTm8v1Oxj8rLz+/kEuT/0fMsTAEXCkbi4JtGMOV/ifWjKUF2eFgKCwD+U
 w1i0hA60djSVNCqCONidHlqnpWIBIhox3hOdKhFT7dL80Ae63Wi5y9a4y4SripoDiTB1
 I9FMGWoyEqezVFPaCtXQ0Qf6gnudmKROdmOfwXDpFCjs2ZFP/jGof5boqvn7N1U00Rie /Q== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm6qurj4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:43:13 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ADaCP6004584;
	Fri, 10 Jun 2022 13:43:11 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03ams.nl.ibm.com with ESMTP id 3gfy19g9sx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:43:11 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25ADh8te22544868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 13:43:08 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3FCFF5204E;
	Fri, 10 Jun 2022 13:43:08 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.7.130])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id EB26C52051;
	Fri, 10 Jun 2022 13:43:05 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 35/35] selftest/powerpc/pmu: Add test for hardware cache events
Date: Fri, 10 Jun 2022 19:11:13 +0530
Message-Id: <20220610134113.62991-36-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
References: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6HbuIlPP_QHhF0tCF_5O1AdMU1PVsy0A
X-Proofpoint-ORIG-GUID: 6HbuIlPP_QHhF0tCF_5O1AdMU1PVsy0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100056
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

