Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECB951D3FB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 11:08:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kvl921n8Lz3fQX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 19:08:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iTWlh12x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iTWlh12x; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kvkj705Lcz3cFl
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 18:47:38 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2467ksDI013463;
 Fri, 6 May 2022 08:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eKex6P9HNMy3NN0FZ0XwPk/xe20goqA6Regq/ZmILv8=;
 b=iTWlh12xWQjyzpUaIqLvAxI+3sPQRFu+gq1IjZ/sInHijFs08t7rrTr4F/fak+F4caKn
 buSqxblieQl6+nSpwoXHGwyeHiN8GZhj4O8pxn5pDOcWloSD+Me/qJCtDzZd+x7lum+r
 5X06sDXqav0zfhazvvzO3D/STgCh5Gz/vd6OpmclkldUEVnNqwMTRxxa2xFakBxMpwWa
 Fqw1x82bJSdVOLO+DSTmjDNdQeA1fLaH4k3z3jkgDatuhJRaxLEax6qutDb/t5axNZ1Y
 h7JO+aKXLNx3FKJj0jd3up6DQj3zB2vN59U3hladeRqwNj9Lx9Vhvxfb4D7Urjy0PYo1 pw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvyk8h2wd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:47:33 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2468hmLf025360;
 Fri, 6 May 2022 08:47:23 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3ftp7fw70h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:47:23 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2468lKBR41353612
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 08:47:20 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 532544C044;
 Fri,  6 May 2022 08:47:20 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 080594C04E;
 Fri,  6 May 2022 08:47:18 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.19.224]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 08:47:17 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 31/35] selftest/powerpc/pmu: Add selftest for group constraint
 check for MMCRA thresh_cmp field
Date: Fri,  6 May 2022 14:15:40 +0530
Message-Id: <20220506084544.56527-32-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220506084544.56527-1-kjain@linux.ibm.com>
References: <20220506084544.56527-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -avrq2OiutzE17cfXd6_vZobeZiVJWcW
X-Proofpoint-GUID: -avrq2OiutzE17cfXd6_vZobeZiVJWcW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_01,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
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
2.31.1

