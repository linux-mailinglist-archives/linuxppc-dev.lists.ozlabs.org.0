Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3098052E8F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 11:35:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4M5y0JP7z3g0d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:35:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xr1e9kT+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Xr1e9kT+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Llp2FqXz3dQT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 19:19:50 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K7vWqh021702;
 Fri, 20 May 2022 09:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=93aZ2Tqle+g0vSfoUq4oXekZTGu140lI0iGaWxrchy8=;
 b=Xr1e9kT+/OOSh9fgoZw+EubrZJKXpy2hzTP9Iib/BR9cfxLRQq3uHmbBzeBf9bL+bRVL
 VSafPu27B0FZ7iqkZC6GP3q/xBo1rLGOjCPkwHVTJiUVMbQc9VxFg8ebA47X6sQQaj2x
 awV7yYVqSNLyXORRe8LGqGZsDhK41SCy9Y9mdW2yPjrYqXMIW2W5bvRw4VsBvM1MeB9j
 Abr9FgSWk6/TA+vWGNKkbn4DtHXnykwSDWhntsprcD63pv6cJqKo1pMhx9qni1Ls6uT+
 aQyEB4AenrR5MflSnvtjGhApAlUweQwfdodiixbbiRD8a0WbsVDaHln3W33GhntqCXZL Vg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g63a95nug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:19:46 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24K9EqEi005523;
 Fri, 20 May 2022 09:19:43 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3g4j3gk6ff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:19:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24K95h4K18022826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 09:05:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCB224C04E;
 Fri, 20 May 2022 09:19:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C127B4C04A;
 Fri, 20 May 2022 09:19:34 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.31.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 09:19:34 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 25/35] selftest/powerpc/pmu: Add selftest for blacklist
 events check in power9
Date: Fri, 20 May 2022 14:47:41 +0530
Message-Id: <20220520091751.17000-26-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
References: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iiHQu2N8vXhCUmKSDBTSN1kqRt67TzVF
X-Proofpoint-ORIG-GUID: iiHQu2N8vXhCUmKSDBTSN1kqRt67TzVF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
2.35.1

