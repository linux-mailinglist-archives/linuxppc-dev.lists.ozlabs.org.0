Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD5C5467F6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 16:02:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKN1w07PRz3gMQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 00:02:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N42GiBbG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N42GiBbG;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKMbt2407z3cdX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 23:43:06 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25ADa5wH031424;
	Fri, 10 Jun 2022 13:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3LML9mJY+S1YP7GZ4prnn2lnf1gqvA3gMpkmkVKStFY=;
 b=N42GiBbG2O7EcfoOj8N/UsnJ0obITAbAbWS/qNf/VA1mMRjCPCj9kUeiWHKL99DnKcwf
 s3ss0/zGuCnTiFDCui6JYoXeE6EHYnPtyStgOr+u81iGd/xboF4Y7RyoJztG+Uz/+OXf
 m3FfvX5Fouo7oHL+CbH/ntjz7FTXjdd4aUtBCqt0PRmbyzLijzn5Jh9vdSEydq5VCTvF
 SHFdB6fD3ddCqr+NZJTKMk1O4kkzbIjs+w6KNjD/UVVQNa24S7nbVwQg2TkFAkTMsbFb
 nvU7hQdCoDQVOrMUHUFMj6VljyPxCc3exLsni8VEmodKu+kQB+umUZ/OCrcGMq93CXph kw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm6yr03h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:43:00 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ADafgu020449;
	Fri, 10 Jun 2022 13:42:59 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma06ams.nl.ibm.com with ESMTP id 3gfxnj0bm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:42:59 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25ADguY510551584
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 13:42:56 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFEEE5204F;
	Fri, 10 Jun 2022 13:42:55 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.7.130])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A78E052050;
	Fri, 10 Jun 2022 13:42:53 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 31/35] selftest/powerpc/pmu: Add selftest for group constraint check for MMCRA thresh_cmp field
Date: Fri, 10 Jun 2022 19:11:09 +0530
Message-Id: <20220610134113.62991-32-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
References: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rzA4GT9T-9MaOs_c8-QOLuTrH_VB1LpK
X-Proofpoint-ORIG-GUID: rzA4GT9T-9MaOs_c8-QOLuTrH_VB1LpK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100052
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

Thresh compare bits for a event is used to program thresh compare
field in Monitor Mode Control Register A (MMCRA: 9-18 bits for
power9 and MMCRA: 8-18 bits for power10). When scheduling events
as a group, all events in that group should match value in
thresh compare bits. Otherwise event open for the sibling
events will fail.

Testcase uses event code "0x401e0" as leader and another event
"0x101ec" as sibling event, and checks for thresh compare
constraint via perf interface.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../powerpc/pmu/event_code_tests/Makefile     |  2 +-
 .../group_constraint_thresh_cmp_test.c        | 96 +++++++++++++++++++
 2 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_cmp_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
index dc27ca2ffcad..374044062561 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
@@ -5,7 +5,7 @@ TEST_GEN_PROGS := group_constraint_pmc56_test group_pmc56_exclude_constraints_te
 	group_constraint_repeat_test group_constraint_radix_scope_qual_test reserved_bits_mmcra_sample_elig_mode_test \
 	group_constraint_mmcra_sample_test invalid_event_code_test reserved_bits_mmcra_thresh_ctl_test \
 	blacklisted_events_test event_alternatives_tests_p9 event_alternatives_tests_p10 generic_events_valid_test \
-	group_constraint_l2l3_sel_test group_constraint_cache_test
+	group_constraint_l2l3_sel_test group_constraint_cache_test group_constraint_thresh_cmp_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_cmp_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_cmp_test.c
new file mode 100644
index 000000000000..9f1197104e8c
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_cmp_test.c
@@ -0,0 +1,96 @@
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
+ * Primary PMU events used here is PM_MRK_INST_CMPL (0x401e0) and
+ * PM_THRESH_MET (0x101ec)
+ * Threshold event selection used is issue to complete for cycles
+ * Sampling criteria is Load or Store only sampling
+ */
+#define p9_EventCode_1 0x13e35340401e0
+#define p9_EventCode_2 0x17d34340101ec
+#define p9_EventCode_3 0x13e35340101ec
+#define p10_EventCode_1 0x35340401e0
+#define p10_EventCode_2 0x35340101ec
+
+/*
+ * Testcase for group constraint check of thresh_cmp bits which is
+ * used to program thresh compare field in Monitor Mode Control Register A
+ * (MMCRA: 9-18 bits for power9 and MMCRA: 8-18 bits for power10).
+ * All events in the group should match thresh compare bits otherwise
+ * event_open for the group will fail.
+ */
+static int group_constraint_thresh_cmp(void)
+{
+	struct event event, leader;
+
+	/* Check for platform support for the test */
+	SKIP_IF(platform_check_for_tests());
+
+	if (have_hwcap2(PPC_FEATURE2_ARCH_3_1)) {
+		/* Init the events for the group contraint check for thresh_cmp bits */
+		event_init(&leader, p10_EventCode_1);
+
+		/* Add the thresh_cmp value for leader in config1 */
+		leader.attr.config1 = 1000;
+		FAIL_IF(event_open(&leader));
+
+		event_init(&event, p10_EventCode_2);
+
+		/* Add the different thresh_cmp value from the leader event in config1 */
+		event.attr.config1 = 2000;
+
+		/* Expected to fail as sibling and leader event request different thresh_cmp bits */
+		FAIL_IF(!event_open_with_group(&event, leader.fd));
+
+		event_close(&event);
+
+		/* Init the event for the group contraint thresh compare test */
+		event_init(&event, p10_EventCode_2);
+
+		/* Add the same thresh_cmp value for leader and sibling event in config1 */
+		event.attr.config1 = 1000;
+
+		/* Expected to succeed as sibling and leader event request same thresh_cmp bits */
+		FAIL_IF(event_open_with_group(&event, leader.fd));
+
+		event_close(&leader);
+		event_close(&event);
+	} else {
+		/* Init the events for the group contraint check for thresh_cmp bits */
+		event_init(&leader, p9_EventCode_1);
+		FAIL_IF(event_open(&leader));
+
+		event_init(&event, p9_EventCode_2);
+
+		/* Expected to fail as sibling and leader event request different thresh_cmp bits */
+		FAIL_IF(!event_open_with_group(&event, leader.fd));
+
+		event_close(&event);
+
+		/* Init the event for the group contraint thresh compare test */
+		event_init(&event, p9_EventCode_3);
+
+		/* Expected to succeed as sibling and leader event request same thresh_cmp bits */
+		FAIL_IF(event_open_with_group(&event, leader.fd));
+
+		event_close(&leader);
+		event_close(&event);
+	}
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(group_constraint_thresh_cmp, "group_constraint_thresh_cmp");
+}
-- 
2.35.1

