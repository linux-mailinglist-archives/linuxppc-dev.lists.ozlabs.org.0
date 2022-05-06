Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B28451D3FC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 11:09:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kvl9q3Fwdz3gD7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 19:09:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d1zrC82f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=d1zrC82f; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kvkj955NLz3cFM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 18:47:41 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2467DD1Z007122;
 Fri, 6 May 2022 08:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=PLo5fBGqQ47tHKnOqhpJPQbh3PnWuSQo3IAytd6252s=;
 b=d1zrC82frjyR/1on4pQgk8dweyso9mX7OzrZ/+3VirdQBfv7utB26QjqLjSUi9aFjJdn
 EIHnCVt6oiK0okkEI1aFZsrIHh8eXVQUTXQ28EH8GJhEPfgpAio/sUOT6aADwkdNLwYu
 yrRuhczu5NOAvxi0j5n27jrB5TMzxg4V2qeyQZlGJQWj6TZHE2PuhEpSHwDazwAwwf6R
 HOPUGsKmfH8Hwb22OFpIpIO44gjA1RdCxOve7bo9oecLSLFJOUr8On7OjQeO/w0DEkiP
 1WhQjVByYbdIiXRIcC/ReuCQUlKfMymTmL1TyhyHFzP7qJMniJIuh2VMk8jZb7145/I0 Iw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvy3bss6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:47:36 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2468gbgH022317;
 Fri, 6 May 2022 08:47:35 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3fvnaqgnv7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:47:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2468lWXw49676796
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 08:47:32 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 050AF4C044;
 Fri,  6 May 2022 08:47:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6FEA4C040;
 Fri,  6 May 2022 08:47:29 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.19.224]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 08:47:29 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 35/35] selftest/powerpc/pmu: Add test for hardware cache events
Date: Fri,  6 May 2022 14:15:44 +0530
Message-Id: <20220506084544.56527-36-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220506084544.56527-1-kjain@linux.ibm.com>
References: <20220506084544.56527-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -qXN8WwLuMES_SPVF5a4ONCUUAYlXw64
X-Proofpoint-ORIG-GUID: -qXN8WwLuMES_SPVF5a4ONCUUAYlXw64
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_02,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 spamscore=0 malwarescore=0 priorityscore=1501
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
2.31.1

