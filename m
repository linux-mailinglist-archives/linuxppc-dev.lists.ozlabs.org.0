Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C76D852E8F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 11:36:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4M6k53M6z3fNf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:36:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e0Y2OruF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=e0Y2OruF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Lls01B3z3cdp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 19:19:52 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K8q9qH017093;
 Fri, 20 May 2022 09:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zRk5dfQhtiLo4Omvg/nYWLsx7k4ZLX53p5BELEdK9Ro=;
 b=e0Y2OruFmBp+Jrvi0q7hTvoswGMl1PiRANAFK0rZPSPgW5ZD4HluW97mj2/nGPreDxaY
 IU7sYa9R7BdyhrWSw4fy6Ae/p2pbwS+HdFcIlv2LTOgXflaJ9XyPV3TAhTOWRooK6eSB
 41IOCTq3Ujzrm/Ftz9MCPzliw16NJoS4fsT8RnXeG0zrIxWWBAgrueWKX+HPLRP79TFX
 EBuaQUxswA6/x++mOqUBIvg6e9mqRkmc2F5SgsPGlhQ837hY8LZY24Hb8kP74I1rju+K
 4duUagGKPtj55W5I8N+2FIrSOWe+JUWM2q/HGrymgb+ZebfPjMLxLd+42g0IxTBd6wTS Qg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g67uw0fu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:19:48 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24K9Cu0K026121;
 Fri, 20 May 2022 09:19:46 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3g2429gjj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:19:46 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24K9JhrQ45678934
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 09:19:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97A554C04A;
 Fri, 20 May 2022 09:19:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A26724C044;
 Fri, 20 May 2022 09:19:40 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.31.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 09:19:40 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 26/35] selftest/powerpc/pmu: Add selftest for event
 alternatives for power9
Date: Fri, 20 May 2022 14:47:42 +0530
Message-Id: <20220520091751.17000-27-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
References: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jGnk6X3-HTVobculSb2xT4Xy5TIqZcd4
X-Proofpoint-ORIG-GUID: jGnk6X3-HTVobculSb2xT4Xy5TIqZcd4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Platform specific PMU supports alternative event for some
of the event codes. During perf_event_open, it any event
group doesn't match constraint check criteria, further lookup
is done to find alternative event. Code checks to see if
it is possible to schedule event as group using alternative
events.

Testcase exercises the alternative event find code for
power9. Example, since events in same PMC can't go in as
a group, ideally using PM_RUN_CYC_ALT (0x200f4) and
PM_BR_TAKEN_CMPL (0x200fa) will fail. But since RUN_CYC
(0x600f4) is alternative event for 0x200f4, it is possible
to use 0x600f4 and 0x200fa as group. Testcase uses such
combination for all events in power9 which has an
alternative event.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../powerpc/pmu/event_code_tests/Makefile     |   2 +-
 .../event_alternatives_tests_p9.c             | 116 ++++++++++++++++++
 2 files changed, 117 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_tests_p9.c

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
index a5916a938154..cf27e612290e 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
@@ -4,7 +4,7 @@ CFLAGS += -m64
 TEST_GEN_PROGS := group_constraint_pmc56_test group_pmc56_exclude_constraints_test group_constraint_pmc_count_test \
 	group_constraint_repeat_test group_constraint_radix_scope_qual_test reserved_bits_mmcra_sample_elig_mode_test \
 	group_constraint_mmcra_sample_test invalid_event_code_test reserved_bits_mmcra_thresh_ctl_test \
-	blacklisted_events_test
+	blacklisted_events_test event_alternatives_tests_p9
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_tests_p9.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_tests_p9.c
new file mode 100644
index 000000000000..f7dcf0e0447c
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_tests_p9.c
@@ -0,0 +1,116 @@
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
+#define EventCode_1 0x200fa
+#define EventCode_2 0x200fc
+#define EventCode_3 0x300fc
+#define EventCode_4 0x400fc
+
+/*
+ * Check for event alternatives.
+ */
+
+static int event_alternatives_tests_p9(void)
+{
+	struct event event, leader;
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
+	SKIP_IF(PVR_VER(mfspr(SPRN_PVR)) != POWER9);
+
+	/* Skip for generic compat PMU */
+	SKIP_IF(check_for_generic_compat_pmu());
+
+	/* Init the event for PM_RUN_CYC_ALT */
+	event_init(&leader, PM_RUN_CYC_ALT);
+	FAIL_IF(event_open(&leader));
+
+	event_init(&event, EventCode_1);
+
+	/*
+	 * Expected to pass since PM_RUN_CYC_ALT in PMC2 has alternative event
+	 * 0x600f4. So it can go in with EventCode_1 which is using PMC2
+	 */
+	FAIL_IF(event_open_with_group(&event, leader.fd));
+
+	event_close(&leader);
+	event_close(&event);
+
+	event_init(&leader, PM_INST_DISP);
+	FAIL_IF(event_open(&leader));
+
+	event_init(&event, EventCode_2);
+	/*
+	 * Expected to pass since PM_INST_DISP in PMC2 has alternative event
+	 * 0x300f2 in PMC3. So it can go in with EventCode_2 which is using PMC2
+	 */
+	FAIL_IF(event_open_with_group(&event, leader.fd));
+
+	event_close(&leader);
+	event_close(&event);
+
+	event_init(&leader, PM_BR_2PATH);
+	FAIL_IF(event_open(&leader));
+
+	event_init(&event, EventCode_2);
+	/*
+	 * Expected to pass since PM_BR_2PATH in PMC2 has alternative event
+	 * 0x40036 in PMC4. So it can go in with EventCode_2 which is using PMC2
+	 */
+	FAIL_IF(event_open_with_group(&event, leader.fd));
+
+	event_close(&leader);
+	event_close(&event);
+
+	event_init(&leader, PM_LD_MISS_L1);
+	FAIL_IF(event_open(&leader));
+
+	event_init(&event, EventCode_3);
+	/*
+	 * Expected to pass since PM_LD_MISS_L1 in PMC3 has alternative event
+	 * 0x400f0 in PMC4. So it can go in with EventCode_3 which is using PMC3
+	 */
+	FAIL_IF(event_open_with_group(&event, leader.fd));
+
+	event_close(&leader);
+	event_close(&event);
+
+	event_init(&leader, PM_RUN_INST_CMPL_ALT);
+	FAIL_IF(event_open(&leader));
+
+	event_init(&event, EventCode_4);
+	/*
+	 * Expected to pass since PM_RUN_INST_CMPL_ALT in PMC4 has alternative event
+	 * 0x500fa in PMC5. So it can go in with EventCode_4 which is using PMC4
+	 */
+	FAIL_IF(event_open_with_group(&event, leader.fd));
+
+	event_close(&leader);
+	event_close(&event);
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(event_alternatives_tests_p9, "event_alternatives_tests_p9");
+}
-- 
2.35.1

