Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 250FA5467ED
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 16:00:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKN0N0PmRz3gDQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 00:00:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nByVsFtd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nByVsFtd;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKMbl372Zz3dQv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 23:42:59 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25ADDhhP027016;
	Fri, 10 Jun 2022 13:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lJeZdoeCsdq2t6SJtlAMwM92GEwyego/kFluYFCfRe8=;
 b=nByVsFtdORzv6J7wREyf8z4ScVzDCCiHMzP4ChC/Qj/P1k7mQUuNp13iqoKmLxxUSH+N
 sCGm0ikWK9Gjj16OLvjbQHEQAz5lLxTRWL3XUEQ3Nk8Jm3dim/gGEvFzWXMiacJZXmGW
 sLchuG7GHj9u2axzZh8znMjb4TTAAKpdIjK7MWGAln8BshR5tTI5/7yRBhcy+qivQK5W
 1K3nYNbsnQsflZlBnPEBa69Rxjvj2IiJoUoHBq305qjiIrx1Xxvo8Uzek8z3CXXZSYTH
 Jtn6Ul5jNlV3s/tKANRP/XejFsRDPcApCbm/Dy/S474d60tdAB/hQhy3A5i+Km1vceim 4Q== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm6n6ghsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:42:54 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ADa9vv009271;
	Fri, 10 Jun 2022 13:42:52 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma01fra.de.ibm.com with ESMTP id 3gfy19ej4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:42:52 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25ADgnTq13435140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 13:42:49 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B25145204F;
	Fri, 10 Jun 2022 13:42:49 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.7.130])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 63FA35204E;
	Fri, 10 Jun 2022 13:42:46 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 29/35] selftest/powerpc/pmu: Add selftest for group constraint check for MMCR0 l2l3_sel bits
Date: Fri, 10 Jun 2022 19:11:07 +0530
Message-Id: <20220610134113.62991-30-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
References: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: V5o7ivnLa1z3g6hWCTrDYLsTyydUYtQT
X-Proofpoint-GUID: V5o7ivnLa1z3g6hWCTrDYLsTyydUYtQT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 mlxscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
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

From: Kajol Jain <kjain@linux.ibm.com>

In power10, L2L3 select bits in the event code is used to
program l2l3_sel field in Monitor Mode Control Register 0
(MMCR0: 56-60). When scheduling events as a group,
all events in that group should match value in these bits.
Otherwise event open for the sibling events will fail.

Testcase uses event code "0x010000046080" as leader and another events
"0x26880" and "0x010000026880" as sibling events, and checks for
l2l3_sel constraints via perf interface for ISA v3.1 platform.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../powerpc/pmu/event_code_tests/Makefile     |  3 +-
 .../group_constraint_l2l3_sel_test.c          | 64 +++++++++++++++++++
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_l2l3_sel_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
index 0d56f1ef530f..58e1a7a2ed4e 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
@@ -4,7 +4,8 @@ CFLAGS += -m64
 TEST_GEN_PROGS := group_constraint_pmc56_test group_pmc56_exclude_constraints_test group_constraint_pmc_count_test \
 	group_constraint_repeat_test group_constraint_radix_scope_qual_test reserved_bits_mmcra_sample_elig_mode_test \
 	group_constraint_mmcra_sample_test invalid_event_code_test reserved_bits_mmcra_thresh_ctl_test \
-	blacklisted_events_test event_alternatives_tests_p9 event_alternatives_tests_p10 generic_events_valid_test
+	blacklisted_events_test event_alternatives_tests_p9 event_alternatives_tests_p10 generic_events_valid_test \
+	group_constraint_l2l3_sel_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_l2l3_sel_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_l2l3_sel_test.c
new file mode 100644
index 000000000000..85a636886069
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_l2l3_sel_test.c
@@ -0,0 +1,64 @@
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
+/* All successful D-side store dispatches for this thread */
+#define EventCode_1 0x010000046080
+/* All successful D-side store dispatches for this thread that were L2 Miss */
+#define EventCode_2 0x26880
+/* All successful D-side store dispatches for this thread that were L2 Miss */
+#define EventCode_3 0x010000026880
+
+/*
+ * Testcase for group constraint check of l2l3_sel bits which is
+ * used to program l2l3 select field in Monitor Mode Control Register 0
+ * (MMCR0: 56-60).
+ * All events in the group should match l2l3_sel bits otherwise
+ * event_open for the group should fail.
+ */
+static int group_constraint_l2l3_sel(void)
+{
+	struct event event, leader;
+
+	/*
+	 * Check for platform support for the test.
+	 * This test is only aplicable on power10
+	 */
+	SKIP_IF(platform_check_for_tests());
+	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_1));
+
+	/* Init the events for the group contraint check for l2l3_sel bits */
+	event_init(&leader, EventCode_1);
+	FAIL_IF(event_open(&leader));
+
+	event_init(&event, EventCode_2);
+
+	/* Expected to fail as sibling event doesn't request same l2l3_sel bits as leader */
+	FAIL_IF(!event_open_with_group(&event, leader.fd));
+
+	event_close(&event);
+
+	/* Init the event for the group contraint l2l3_sel test */
+	event_init(&event, EventCode_3);
+
+	/* Expected to succeed as sibling event request same l2l3_sel bits as leader */
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
+	return test_harness(group_constraint_l2l3_sel, "group_constraint_l2l3_sel");
+}
-- 
2.35.1

