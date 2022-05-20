Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C8552E8F4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 11:37:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4M8G2zKRz3g7m
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:37:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FbZwaYRu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FbZwaYRu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Lm24wsKz3dpt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 19:20:02 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K7SVMS022581;
 Fri, 20 May 2022 09:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8qqYlF+EdNQy6wPH1TQ1BtKZldWyw7MjcE/Qg+7xVk0=;
 b=FbZwaYRucQk52++6u+vDyaZwqrSjXyTCXH6JTNRWgL0ODc0aIv2VvFdysuJoV0X5EfOl
 OyDWR07WTRTXae1PGhFbKnSuKTJ968excDiYPErvc9yZYckWNwtQmSCf2BvEC6CZ4szd
 MNCUGVXqVSs7D8vqRtIIoI5PR6VQ+j5pfoXvd+gFYaZZ5cz9WJqp1tllLLHc0MRdCLSG
 ROW8WgVXdITSLY+Ssy+ckaxHvqsWutW6/Aj1AIeWyhXOamOVako1XjFinTCK8TAbf7Pz
 PbaxW0GGz7oFQCl+i04cccjCi53gw9gXwT4TPzj9yT53oTcTrfIvqZzJwessYvNlc6P/ 7Q== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g62qne7en-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:19:58 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24K9DJkG003418;
 Fri, 20 May 2022 09:19:55 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3g2428qbc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:19:55 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24K9JD2n22413724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 09:19:13 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFA6B4C044;
 Fri, 20 May 2022 09:19:52 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9FB84C040;
 Fri, 20 May 2022 09:19:48 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.31.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 09:19:48 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 28/35] selftest/powerpc/pmu: Add selftest for
 PERF_TYPE_HARDWARE events valid check
Date: Fri, 20 May 2022 14:47:44 +0530
Message-Id: <20220520091751.17000-29-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
References: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: R9ZVYpUuB6bRbqLFlLrOjHs7dWJk_Njw
X-Proofpoint-GUID: R9ZVYpUuB6bRbqLFlLrOjHs7dWJk_Njw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205200066
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

Testcase to ensure that using invalid event in generic
event for PERF_TYPE_HARDWARE will fail. Invalid generic
events in power10 are:
- PERF_COUNT_HW_BUS_CYCLES
- PERF_COUNT_HW_STALLED_CYCLES_FRONTEND
- PERF_COUNT_HW_STALLED_CYCLES_BACKEND
- PERF_COUNT_HW_REF_CPU_CYCLES

Invalid generic events in power9 are:
- PERF_COUNT_HW_BUS_CYCLES
- PERF_COUNT_HW_REF_CPU_CYCLES

Testcase does event open for valid and invalid generic
events to ensure event open works for all valid events
and fails for invalid events.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../powerpc/pmu/event_code_tests/Makefile     |   2 +-
 .../generic_events_valid_test.c               | 130 ++++++++++++++++++
 2 files changed, 131 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/generic_events_valid_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
index 50bcc036dddf..0d56f1ef530f 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
@@ -4,7 +4,7 @@ CFLAGS += -m64
 TEST_GEN_PROGS := group_constraint_pmc56_test group_pmc56_exclude_constraints_test group_constraint_pmc_count_test \
 	group_constraint_repeat_test group_constraint_radix_scope_qual_test reserved_bits_mmcra_sample_elig_mode_test \
 	group_constraint_mmcra_sample_test invalid_event_code_test reserved_bits_mmcra_thresh_ctl_test \
-	blacklisted_events_test event_alternatives_tests_p9 event_alternatives_tests_p10
+	blacklisted_events_test event_alternatives_tests_p9 event_alternatives_tests_p10 generic_events_valid_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/generic_events_valid_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/generic_events_valid_test.c
new file mode 100644
index 000000000000..0d237c15d3f2
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/generic_events_valid_test.c
@@ -0,0 +1,130 @@
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
+/*
+ * Testcase to ensure that using invalid event in generic
+ * event for PERF_TYPE_HARDWARE should fail
+ */
+
+static int generic_events_valid_test(void)
+{
+	struct event event;
+
+	/* Check for platform support for the test */
+	SKIP_IF(platform_check_for_tests());
+
+	/* generic events is different in compat_mode */
+	SKIP_IF(check_for_generic_compat_pmu());
+
+	/*
+	 * Invalid generic events in power10:
+	 * - PERF_COUNT_HW_BUS_CYCLES
+	 * - PERF_COUNT_HW_STALLED_CYCLES_FRONTEND
+	 * - PERF_COUNT_HW_STALLED_CYCLES_BACKEND
+	 * - PERF_COUNT_HW_REF_CPU_CYCLES
+	 */
+	if (PVR_VER(mfspr(SPRN_PVR)) == POWER10) {
+		event_init_opts(&event, PERF_COUNT_HW_CPU_CYCLES, PERF_TYPE_HARDWARE, "event");
+		FAIL_IF(event_open(&event));
+		event_close(&event);
+
+		event_init_opts(&event, PERF_COUNT_HW_INSTRUCTIONS,
+				PERF_TYPE_HARDWARE, "event");
+		FAIL_IF(event_open(&event));
+		event_close(&event);
+
+		event_init_opts(&event, PERF_COUNT_HW_CACHE_REFERENCES,
+				PERF_TYPE_HARDWARE, "event");
+		FAIL_IF(event_open(&event));
+		event_close(&event);
+
+		event_init_opts(&event, PERF_COUNT_HW_CACHE_MISSES, PERF_TYPE_HARDWARE, "event");
+		FAIL_IF(event_open(&event));
+		event_close(&event);
+
+		event_init_opts(&event, PERF_COUNT_HW_BRANCH_INSTRUCTIONS,
+				PERF_TYPE_HARDWARE, "event");
+		FAIL_IF(event_open(&event));
+		event_close(&event);
+
+		event_init_opts(&event, PERF_COUNT_HW_BRANCH_MISSES, PERF_TYPE_HARDWARE, "event");
+		FAIL_IF(event_open(&event));
+		event_close(&event);
+
+		event_init_opts(&event, PERF_COUNT_HW_BUS_CYCLES, PERF_TYPE_HARDWARE, "event");
+		FAIL_IF(!event_open(&event));
+
+		event_init_opts(&event, PERF_COUNT_HW_STALLED_CYCLES_FRONTEND,
+				PERF_TYPE_HARDWARE, "event");
+		FAIL_IF(!event_open(&event));
+
+		event_init_opts(&event, PERF_COUNT_HW_STALLED_CYCLES_BACKEND,
+				PERF_TYPE_HARDWARE, "event");
+		FAIL_IF(!event_open(&event));
+
+		event_init_opts(&event, PERF_COUNT_HW_REF_CPU_CYCLES, PERF_TYPE_HARDWARE, "event");
+		FAIL_IF(!event_open(&event));
+	} else if (PVR_VER(mfspr(SPRN_PVR)) == POWER9) {
+		/*
+		 * Invalid generic events in power9:
+		 * - PERF_COUNT_HW_BUS_CYCLES
+		 * - PERF_COUNT_HW_REF_CPU_CYCLES
+		 */
+		event_init_opts(&event, PERF_COUNT_HW_CPU_CYCLES, PERF_TYPE_HARDWARE, "event");
+		FAIL_IF(event_open(&event));
+		event_close(&event);
+
+		event_init_opts(&event, PERF_COUNT_HW_INSTRUCTIONS, PERF_TYPE_HARDWARE, "event");
+		FAIL_IF(event_open(&event));
+		event_close(&event);
+
+		event_init_opts(&event, PERF_COUNT_HW_CACHE_REFERENCES,
+				PERF_TYPE_HARDWARE, "event");
+		FAIL_IF(event_open(&event));
+		event_close(&event);
+
+		event_init_opts(&event, PERF_COUNT_HW_CACHE_MISSES, PERF_TYPE_HARDWARE, "event");
+		FAIL_IF(event_open(&event));
+		event_close(&event);
+
+		event_init_opts(&event, PERF_COUNT_HW_BRANCH_INSTRUCTIONS,
+				PERF_TYPE_HARDWARE, "event");
+		FAIL_IF(event_open(&event));
+		event_close(&event);
+
+		event_init_opts(&event, PERF_COUNT_HW_BRANCH_MISSES, PERF_TYPE_HARDWARE, "event");
+		FAIL_IF(event_open(&event));
+		event_close(&event);
+
+		event_init_opts(&event, PERF_COUNT_HW_BUS_CYCLES, PERF_TYPE_HARDWARE, "event");
+		FAIL_IF(!event_open(&event));
+
+		event_init_opts(&event, PERF_COUNT_HW_STALLED_CYCLES_FRONTEND,
+				PERF_TYPE_HARDWARE, "event");
+		FAIL_IF(event_open(&event));
+		event_close(&event);
+
+		event_init_opts(&event, PERF_COUNT_HW_STALLED_CYCLES_BACKEND,
+				PERF_TYPE_HARDWARE, "event");
+		FAIL_IF(event_open(&event));
+		event_close(&event);
+
+		event_init_opts(&event, PERF_COUNT_HW_REF_CPU_CYCLES, PERF_TYPE_HARDWARE, "event");
+		FAIL_IF(!event_open(&event));
+	}
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(generic_events_valid_test, "generic_events_valid_test");
+}
-- 
2.35.1

