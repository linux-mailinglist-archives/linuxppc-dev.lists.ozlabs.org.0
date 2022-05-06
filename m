Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B31151D3E7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 11:00:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvkzW0Ztmz3cFK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 19:00:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NGngm+XM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NGngm+XM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kvkhd0NKDz3cMk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 18:47:12 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2468HZgT009588;
 Fri, 6 May 2022 08:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=l6YL7hsKtDG6eJ31K+o2ArPYqt7csTUB/gDu8ZNVgQA=;
 b=NGngm+XMp9jZ5SXk1iHIIbO4qre8qHkymNloFnpa4xfGxK8jhvRrSHPeTnCljgN6nVS4
 Rse5sDu31w/Xzht+EC4UBlVDEqV5Ua4c6GHSApsaUmBI2vaHD6iAfnOVWhpAFvOgkuHH
 JXW9SSoW9rlrK3VTGYS/aeTwy+Exx2s1dZtjriYrcAgyhfWrsb7Pxkx4bv2GJAkU63Kk
 iTMBcfTITXXRmj1GzdTtdbZZ4S57EhOoOGjtCH2+WjmlVYA8P6zVtRoqN/yinuiBL/jQ
 /aMbqIcoKFAiQJaQWY5GNdwR3BYtOvAfLddt3EUBUdvYVoCqg98qMLZsZfaf8wNtVuEQ MA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw01p0hvn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:47:08 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2468glq0007473;
 Fri, 6 May 2022 08:47:06 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3fvm08gjwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:47:06 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2468XcaR53150124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 08:33:39 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2293A4C044;
 Fri,  6 May 2022 08:47:03 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C588A4C040;
 Fri,  6 May 2022 08:47:00 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.19.224]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 08:47:00 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 25/35] selftest/powerpc/pmu: Add selftest for blacklist events
 check in power9
Date: Fri,  6 May 2022 14:15:34 +0530
Message-Id: <20220506084544.56527-26-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220506084544.56527-1-kjain@linux.ibm.com>
References: <20220506084544.56527-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PSVv_5tqYdK0tjQALIBa95lp_4WpKBEP
X-Proofpoint-ORIG-GUID: PSVv_5tqYdK0tjQALIBa95lp_4WpKBEP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_02,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 malwarescore=0 phishscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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

Some of the events are blacklisted in power9. The list
of blacklisted events are noted in power9-events-list.h
When trying to do event open for any of these blacklisted
event will cause a failure. Testcase ensures that using
blacklisted events will cause event_open to fail in power9.
This test is only applicable on power9 DD2.1 and DD2.2 and
hence test adds checks to skip on other platforms.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../powerpc/pmu/event_code_tests/Makefile     |   3 +-
 .../blacklisted_events_test.c                 | 132 ++++++++++++++++++
 2 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/blacklisted_events_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
index e50570794337..a5916a938154 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
@@ -3,7 +3,8 @@ CFLAGS += -m64
 
 TEST_GEN_PROGS := group_constraint_pmc56_test group_pmc56_exclude_constraints_test group_constraint_pmc_count_test \
 	group_constraint_repeat_test group_constraint_radix_scope_qual_test reserved_bits_mmcra_sample_elig_mode_test \
-	group_constraint_mmcra_sample_test invalid_event_code_test reserved_bits_mmcra_thresh_ctl_test
+	group_constraint_mmcra_sample_test invalid_event_code_test reserved_bits_mmcra_thresh_ctl_test \
+	blacklisted_events_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/blacklisted_events_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/blacklisted_events_test.c
new file mode 100644
index 000000000000..fafeff19cb34
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/blacklisted_events_test.c
@@ -0,0 +1,132 @@
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
+#define PM_DTLB_MISS_16G 0x1c058
+#define PM_DERAT_MISS_2M 0x1c05a
+#define PM_DTLB_MISS_2M 0x1c05c
+#define PM_MRK_DTLB_MISS_1G 0x1d15c
+#define PM_DTLB_MISS_4K 0x2c056
+#define PM_DERAT_MISS_1G 0x2c05a
+#define PM_MRK_DERAT_MISS_2M 0x2d152
+#define PM_MRK_DTLB_MISS_4K  0x2d156
+#define PM_MRK_DTLB_MISS_16G 0x2d15e
+#define PM_DTLB_MISS_64K 0x3c056
+#define PM_MRK_DERAT_MISS_1G 0x3d152
+#define PM_MRK_DTLB_MISS_64K 0x3d156
+#define PM_DISP_HELD_SYNC_HOLD 0x4003c
+#define PM_DTLB_MISS_16M 0x4c056
+#define PM_DTLB_MISS_1G 0x4c05a
+#define PM_MRK_DTLB_MISS_16M 0x4c15e
+#define PM_MRK_ST_DONE_L2 0x10134
+#define PM_RADIX_PWC_L1_HIT 0x1f056
+#define PM_FLOP_CMPL 0x100f4
+#define PM_MRK_NTF_FIN 0x20112
+#define PM_RADIX_PWC_L2_HIT 0x2d024
+#define PM_IFETCH_THROTTLE 0x3405e
+#define PM_MRK_L2_TM_ST_ABORT_SISTER 0x3e15c
+#define PM_RADIX_PWC_L3_HIT 0x3f056
+#define PM_RUN_CYC_SMT2_MODE 0x3006c
+#define PM_TM_TX_PASS_RUN_INST 0x4e014
+
+#define PVR_POWER9_CUMULUS 0x00002000
+
+int blacklist_events_dd21[] = {
+	PM_MRK_ST_DONE_L2,
+	PM_RADIX_PWC_L1_HIT,
+	PM_FLOP_CMPL,
+	PM_MRK_NTF_FIN,
+	PM_RADIX_PWC_L2_HIT,
+	PM_IFETCH_THROTTLE,
+	PM_MRK_L2_TM_ST_ABORT_SISTER,
+	PM_RADIX_PWC_L3_HIT,
+	PM_RUN_CYC_SMT2_MODE,
+	PM_TM_TX_PASS_RUN_INST,
+	PM_DISP_HELD_SYNC_HOLD,
+};
+
+int blacklist_events_dd22[] = {
+	PM_DTLB_MISS_16G,
+	PM_DERAT_MISS_2M,
+	PM_DTLB_MISS_2M,
+	PM_MRK_DTLB_MISS_1G,
+	PM_DTLB_MISS_4K,
+	PM_DERAT_MISS_1G,
+	PM_MRK_DERAT_MISS_2M,
+	PM_MRK_DTLB_MISS_4K,
+	PM_MRK_DTLB_MISS_16G,
+	PM_DTLB_MISS_64K,
+	PM_MRK_DERAT_MISS_1G,
+	PM_MRK_DTLB_MISS_64K,
+	PM_DISP_HELD_SYNC_HOLD,
+	PM_DTLB_MISS_16M,
+	PM_DTLB_MISS_1G,
+	PM_MRK_DTLB_MISS_16M,
+};
+
+int pvr_min;
+
+/*
+ * check for power9 support for 2.1 and
+ * 2.2 model where blacklist is applicable.
+ */
+int check_for_power9_version(void)
+{
+	pvr_min = PVR_MIN(mfspr(SPRN_PVR));
+
+	SKIP_IF(PVR_VER(pvr) != POWER9);
+	SKIP_IF(!(pvr & PVR_POWER9_CUMULUS));
+
+	SKIP_IF(!(3 - pvr_min));
+
+	return 0;
+}
+
+/*
+ * Testcase to ensure that using blacklisted bits in
+ * event code should cause event_open to fail in power9
+ */
+
+static int blacklisted_events(void)
+{
+	struct event event;
+	int i = 0;
+
+	/* Check for platform support for the test */
+	SKIP_IF(platform_check_for_tests());
+
+	/*
+	 * check for power9 support for 2.1 and
+	 * 2.2 model where blacklist is applicable.
+	 */
+	SKIP_IF(check_for_power9_version());
+
+	/* Skip for Generic compat mode */
+	SKIP_IF(check_for_generic_compat_pmu());
+
+	if (pvr_min == 1) {
+		for (i = 0; i < ARRAY_SIZE(blacklist_events_dd21); i++) {
+			event_init(&event, blacklist_events_dd21[i]);
+			FAIL_IF(!event_open(&event));
+		}
+	} else if (pvr_min == 2) {
+		for (i = 0; i < ARRAY_SIZE(blacklist_events_dd22); i++) {
+			event_init(&event, blacklist_events_dd22[i]);
+			FAIL_IF(!event_open(&event));
+		}
+	}
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(blacklisted_events, "blacklisted_events");
+}
-- 
2.31.1

