Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 363075467E3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 16:00:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKMzg1PkLz3fRf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 00:00:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Eex2gVbj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Eex2gVbj;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKMbh6mDDz3cd5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 23:42:56 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25ADL3xa010687;
	Fri, 10 Jun 2022 13:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8qqYlF+EdNQy6wPH1TQ1BtKZldWyw7MjcE/Qg+7xVk0=;
 b=Eex2gVbjBXxSwJZXNxYj4v8mrOyjVFJ6IXMtFpnf2UskZPQJvcrjaVOC1djjqESm79iv
 78QOGFQDj6HtoiuC0NUZ4HTXguaitX2vyy0AgGcdzRaRCBS8UM/DyUep87MAZrP/SiC0
 ExtXiQTAjigce12u7yDHTWlY6qMMeW4jqN3zzZB2x1h0H++ay6fjm3PK6BPpvD1Iz3gt
 /9GDu9bZu2HgC1XkV3ebkueE5sCTTO4D2zkKkI9Fj1atR43oZQ5hAGI27gCzYhnG+SOB
 7C2dPuNr5j+vLKw0MI3u8fCL1rzpzuAlDrGsHD5NGRyGLYwLxOwzbP5Ka7I12Pzn8ybY zg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm6rngckx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:42:51 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ADakYw012187;
	Fri, 10 Jun 2022 13:42:49 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3gfy19g9uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:42:49 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25ADgnDv24117670
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 13:42:49 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2CE55204E;
	Fri, 10 Jun 2022 13:42:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.7.130])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5ABCF5204F;
	Fri, 10 Jun 2022 13:42:43 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 28/35] selftest/powerpc/pmu: Add selftest for PERF_TYPE_HARDWARE events valid check
Date: Fri, 10 Jun 2022 19:11:06 +0530
Message-Id: <20220610134113.62991-29-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
References: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OlGWCXm0IrcY2mko4F6b60gi0DO0kDZ5
X-Proofpoint-ORIG-GUID: OlGWCXm0IrcY2mko4F6b60gi0DO0kDZ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206100056
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

