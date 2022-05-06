Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6785F51D3EB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 11:02:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kvl1l2Wx3z3fl9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 19:02:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KI6B7iXM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KI6B7iXM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kvkhk5xFnz3ccg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 18:47:18 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2467m8IM030323;
 Fri, 6 May 2022 08:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9KO32Cv48mSmM6KJIiRa4q8zXQmfA+qWift8+dy+Lv4=;
 b=KI6B7iXMz6CLYmkayOB9zmegHQEmZ0Py3v+c4mtSPPP+SLdlarZTYArbbDEU12mfwW7g
 bw/1bwK29oB7MDcFhc7qZaOaDz8rffqDdULptb+/4MCvchhCMSrPDRMVt1NEOhUmBFAA
 60RO1W7Q89JImgNo6IMLLPlgOM4PWzI7+m0mEeDjMoRJ/C2mbufDJ6J3E5h8r7GuezbW
 bfRx0KAucYM5zdFWsMpRmGkOiEsmruS/jQSakpRxaUzG3XUo+1OuFOkxHRYBq624Oofe
 wrQsIKrb6/RB6KsjZYWL/ulNFKs6eswFQNes71DZWCzncLqG/e20DQ0f4bkzg6KG6Q47 Nw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvykvs331-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:47:13 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2468gk2N013222;
 Fri, 6 May 2022 08:47:12 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3fvg611187-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:47:11 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2468l8uw26476848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 08:47:08 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C62844C046;
 Fri,  6 May 2022 08:47:08 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 806934C044;
 Fri,  6 May 2022 08:47:06 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.19.224]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 08:47:06 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 27/35] selftest/powerpc/pmu: Add selftest for event
 alternatives for power10
Date: Fri,  6 May 2022 14:15:36 +0530
Message-Id: <20220506084544.56527-28-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220506084544.56527-1-kjain@linux.ibm.com>
References: <20220506084544.56527-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: amWR_R2j5txMMW4h-XiJkVJBgexoYOBf
X-Proofpoint-GUID: amWR_R2j5txMMW4h-XiJkVJBgexoYOBf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_02,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060045
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

Platform specific PMU supports alternative event for some
of the event codes. During perf_event_open, it any event
group doesn't match constraint check criteria, further lookup
is done to find alternative event. Code checks to see if
it is possible to schedule event as group using alternative
events.

Testcase exercises the alternative event find code for
power10. Example, Using PMC1 to PMC4 in a group and again
trying to schedule PM_CYC_ALT (0x0001e) will fail since
this exceeds number of programmable events in group. But
since 0x600f4 is an alternative event for 0x0001e, it is
possible to use 0x0001e in the group. Testcase uses such
combination all events in power10 which has alternative event.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../powerpc/pmu/event_code_tests/Makefile     |   2 +-
 .../event_alternatives_tests_p10.c            | 109 ++++++++++++++++++
 2 files changed, 110 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_tests_p10.c

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
index cf27e612290e..50bcc036dddf 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
@@ -4,7 +4,7 @@ CFLAGS += -m64
 TEST_GEN_PROGS := group_constraint_pmc56_test group_pmc56_exclude_constraints_test group_constraint_pmc_count_test \
 	group_constraint_repeat_test group_constraint_radix_scope_qual_test reserved_bits_mmcra_sample_elig_mode_test \
 	group_constraint_mmcra_sample_test invalid_event_code_test reserved_bits_mmcra_thresh_ctl_test \
-	blacklisted_events_test event_alternatives_tests_p9
+	blacklisted_events_test event_alternatives_tests_p9 event_alternatives_tests_p10
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_tests_p10.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_tests_p10.c
new file mode 100644
index 000000000000..8be7aada6523
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_tests_p10.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2022, Athira Rajeev, IBM Corp.
+ */
+
+#include <stdio.h>
+#include "../event.h"
+#include "../sampling_tests/misc.h"
+
+#define PM_RUN_CYC_ALT 0x200f4
+#define PM_INST_DISP 0x200f2
+#define PM_BR_2PATH 0x20036
+#define PM_LD_MISS_L1 0x3e054
+#define PM_RUN_INST_CMPL_ALT 0x400fa
+
+#define EventCode_1 0x100fc
+#define EventCode_2 0x200fa
+#define EventCode_3 0x300fc
+#define EventCode_4 0x400fc
+
+/*
+ * Check for event alternatives.
+ */
+
+static int event_alternatives_tests_p10(void)
+{
+	struct event *e, events[5];
+	int i;
+
+	/* Check for platform support for the test */
+	SKIP_IF(platform_check_for_tests());
+
+	/*
+	 * PVR check is used here since PMU specific data like
+	 * alternative events is handled by respective PMU driver
+	 * code and using PVR will work correctly for all cases
+	 * including generic compat mode.
+	 */
+	SKIP_IF(PVR_VER(mfspr(SPRN_PVR)) != POWER10);
+
+	SKIP_IF(check_for_generic_compat_pmu());
+
+	/*
+	 * Test for event alternative for 0x0001e
+	 * and 0x00002.
+	 */
+	e = &events[0];
+	event_init(e, 0x0001e);
+
+	e = &events[1];
+	event_init(e, EventCode_1);
+
+	e = &events[2];
+	event_init(e, EventCode_2);
+
+	e = &events[3];
+	event_init(e, EventCode_3);
+
+	e = &events[4];
+	event_init(e, EventCode_4);
+
+	FAIL_IF(event_open(&events[0]));
+
+	/*
+	 * Expected to pass since 0x0001e has alternative event
+	 * 0x600f4 in PMC6. So it can go in with other events
+	 * in PMC1 to PMC4.
+	 */
+	for (i = 1; i < 5; i++)
+		FAIL_IF(event_open_with_group(&events[i], events[0].fd));
+
+	for (i = 0; i < 5; i++)
+		event_close(&events[i]);
+
+	e = &events[0];
+	event_init(e, 0x00002);
+
+	e = &events[1];
+	event_init(e, EventCode_1);
+
+	e = &events[2];
+	event_init(e, EventCode_2);
+
+	e = &events[3];
+	event_init(e, EventCode_3);
+
+	e = &events[4];
+	event_init(e, EventCode_4);
+
+	FAIL_IF(event_open(&events[0]));
+
+	/*
+	 * Expected to pass since 0x00020 has alternative event
+	 * 0x500fa in PMC5. So it can go in with other events
+	 * in PMC1 to PMC4.
+	 */
+	for (i = 1; i < 5; i++)
+		FAIL_IF(event_open_with_group(&events[i], events[0].fd));
+
+	for (i = 0; i < 5; i++)
+		event_close(&events[i]);
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(event_alternatives_tests_p10, "event_alternatives_tests_p10");
+}
-- 
2.31.1

