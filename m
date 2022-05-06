Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9436F51D3EA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 11:01:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kvl102qfwz3f36
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 19:01:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aGVrTSfl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aGVrTSfl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kvkhj2FVpz3cMx
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 18:47:17 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2468XD13030312;
 Fri, 6 May 2022 08:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=O57kyyYCZ32sJ3NyJA7YGi2vJegOHRiKGSEeWMIiqAc=;
 b=aGVrTSfly24gK+oBm/QecIeeBELkYntie903m1kxKZsd0yXBYZcHZ4+3N5sohDMxJRzJ
 1Z3u0Sc/W4b7XRBpc76MHSBLW2A6hctQp8xVMRX7ygvs/oN6+jtAoYt1BVEfmzOmrpJ+
 /tDKZnVeM0i2/S/1iKVWSfxOhGHby8SlXl7uymgg5ubuauk9UvvSEb9VzR4wFjg7U31e
 vyv1A8TJnTpiFgqCr/xs5l946pys6lbnl+/cO9jeAD+Xf5e+PjWr9IFq1skAgKGHpCUN
 R2hlMBnPUVGn5H3F9wGOKqkEB54WzA2a7IwFpz5H0sEBIo9uNKr91dVU4pL+QPGfDpW4 +A== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw090r7ux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:47:11 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2468gq5R013262;
 Fri, 6 May 2022 08:47:09 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3fvg611184-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:47:09 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2468l6H848562614
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 08:47:06 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E81BF4C044;
 Fri,  6 May 2022 08:47:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A85A4C046;
 Fri,  6 May 2022 08:47:03 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.19.224]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 08:47:03 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 26/35] selftest/powerpc/pmu: Add selftest for event
 alternatives for power9
Date: Fri,  6 May 2022 14:15:35 +0530
Message-Id: <20220506084544.56527-27-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220506084544.56527-1-kjain@linux.ibm.com>
References: <20220506084544.56527-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: X_dRn2McORQl9jKuV8sS_OpCPRNq3L4P
X-Proofpoint-ORIG-GUID: X_dRn2McORQl9jKuV8sS_OpCPRNq3L4P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_02,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
2.31.1

