Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB2E5467F7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 16:02:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKN2d3F3Hz3gR3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 00:02:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rv3IL3fn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rv3IL3fn;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKMbw3Jbpz3dq4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 23:43:08 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AD7cEs029906;
	Fri, 10 Jun 2022 13:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gpm6kmL3duadPe76LeMtaQhIDiRVGfxf4j9V9G8KeEU=;
 b=Rv3IL3fnJFDHzJf0qSAiCVoZeziRcmMosOvoxGsipSrBISMWiyHfqFF4tZnUSIN4x+g8
 d1Oyvkn6/yrPHmxPgQxNfzfU9p9F01f+Pgd+aIXefEGAak7+b4o+GWd+jiX8yx9JnT7K
 mhFbYi0CiDfgWCwa1WC2/16tOmwULlkEP1eWBLkzGfA9rA5DDuGZ72s0YQwSKVrr+lK3
 xENPHIVhIrE46t+VBgAfpxuYh6BRBla4casU3khqVVvChrsMKqwQ4AKZIev4oYvenaCI
 P7vfXzCXethxaTnc2IIG/DhR7709baLZ3gKy0qhx1DqDsoJRdextA4xQYlsiogjKQYs3 BQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm4vaarj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:43:04 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ADaqhc010074;
	Fri, 10 Jun 2022 13:43:02 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma03fra.de.ibm.com with ESMTP id 3gfy18xj47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:43:01 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25ADgxk817695130
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 13:42:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0786052052;
	Fri, 10 Jun 2022 13:42:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.7.130])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A81EC5204E;
	Fri, 10 Jun 2022 13:42:56 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 32/35] selftest/powerpc/pmu: Add selftest for group constraint for unit and pmc field in p9
Date: Fri, 10 Jun 2022 19:11:10 +0530
Message-Id: <20220610134113.62991-33-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
References: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ucc94LIPzj2s64DOsByTlvqsjnCiKxKb
X-Proofpoint-GUID: Ucc94LIPzj2s64DOsByTlvqsjnCiKxKb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Unit and pmu bits in the event code is used to program unit and pmc
fields in Monitor Mode Control Register 1 (MMCR1). For power9 platform,
incase unit field value is within 6 to 9, one of the event in the group
should use PMC4. Otherwise event_open should fail for that group.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../powerpc/pmu/event_code_tests/Makefile     |  3 +-
 .../group_constraint_unit_test.c              | 74 +++++++++++++++++++
 2 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_unit_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
index 374044062561..f72c73b5b79a 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
@@ -5,7 +5,8 @@ TEST_GEN_PROGS := group_constraint_pmc56_test group_pmc56_exclude_constraints_te
 	group_constraint_repeat_test group_constraint_radix_scope_qual_test reserved_bits_mmcra_sample_elig_mode_test \
 	group_constraint_mmcra_sample_test invalid_event_code_test reserved_bits_mmcra_thresh_ctl_test \
 	blacklisted_events_test event_alternatives_tests_p9 event_alternatives_tests_p10 generic_events_valid_test \
-	group_constraint_l2l3_sel_test group_constraint_cache_test group_constraint_thresh_cmp_test
+	group_constraint_l2l3_sel_test group_constraint_cache_test group_constraint_thresh_cmp_test \
+	group_constraint_unit_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_unit_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_unit_test.c
new file mode 100644
index 000000000000..a2c18923dcec
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_unit_test.c
@@ -0,0 +1,74 @@
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
+/* All successful D-side store dispatches for this thread with PMC 2 */
+#define EventCode_1 0x26080
+/* All successful D-side store dispatches for this thread with PMC 4 */
+#define EventCode_2 0x46080
+/* All successful D-side store dispatches for this thread that were L2 Miss with PMC 3 */
+#define EventCode_3 0x36880
+
+/*
+ * Testcase for group constraint check of unit and pmc bits which is
+ * used to program corresponding unit and pmc field in Monitor Mode
+ * Control Register 1 (MMCR1)
+ * One of the event in the group should use PMC 4 incase units field
+ * value is within 6 to 9 otherwise event_open for the group will fail.
+ */
+static int group_constraint_unit(void)
+{
+	struct event *e, events[3];
+
+	/*
+	 * Check for platform support for the test.
+	 * Constraint to use PMC4 with one of the event in group,
+	 * when the unit is within 6 to 9 is only applicable on
+	 * power9.
+	 */
+	SKIP_IF(platform_check_for_tests());
+	SKIP_IF(have_hwcap2(PPC_FEATURE2_ARCH_3_1));
+
+	/* Init the events for the group contraint check for unit bits */
+	e = &events[0];
+	event_init(e, EventCode_1);
+
+	 /* Expected to fail as PMC 4 is not used with unit field value 6 to 9 */
+	FAIL_IF(!event_open(&events[0]));
+
+	/* Init the events for the group contraint check for unit bits */
+	e = &events[1];
+	event_init(e, EventCode_2);
+
+	/* Expected to pass as PMC 4 is used with unit field value 6 to 9 */
+	FAIL_IF(event_open(&events[1]));
+
+	/* Init the event for the group contraint unit test */
+	e = &events[2];
+	event_init(e, EventCode_3);
+
+	/* Expected to fail as PMC4 is not being used */
+	FAIL_IF(!event_open_with_group(&events[2], events[0].fd));
+
+	/* Expected to succeed as event using PMC4 */
+	FAIL_IF(event_open_with_group(&events[2], events[1].fd));
+
+	event_close(&events[0]);
+	event_close(&events[1]);
+	event_close(&events[2]);
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(group_constraint_unit, "group_constraint_unit");
+}
-- 
2.35.1

