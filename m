Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 750405467F4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 16:01:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKN1D2KzVz3gHZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 00:01:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xo1P5ApD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xo1P5ApD;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKMbp27Fyz3dQn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 23:43:02 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25ADemAO022623;
	Fri, 10 Jun 2022 13:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BdDHxMktcATadBuMuPBWZgMZx/i0hqGRnv1YD/qVhH0=;
 b=Xo1P5ApDKXn52egpjUhh7xgWONKRKshof7cy+LEy0+kyi8474zN3Ew06+OGUZDVi12pr
 VCucrzAAK6YrNEMVk9H/z1Op8AgS4dzH+u/4wxxuyO5FQprXWfAqYnbydhUQC9xInkqS
 lsVOPQF0nKytRtk5jEFW1s+O35PmAgJJ5XJePALay0H5lZk6BUmRf6eu0Zj85kPrsRB5
 +XspIigV1A2PP47VOdF22V293bp2dsdN8D1UKGiilFVVUVnbg3PbQL93Z3GPDdP1bS48
 4/YbiL8udZSrNG7wkNM/ERFfX7mwNyv1FHMIfrXUgq8rE09IWomDWEH5kuhrLSCr8bYl AA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm6at0x8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:42:58 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ADa4lI019984;
	Fri, 10 Jun 2022 13:42:56 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma06ams.nl.ibm.com with ESMTP id 3gfxnj0bm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:42:55 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25ADgqCf17039764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 13:42:52 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D6B0952050;
	Fri, 10 Jun 2022 13:42:52 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.7.130])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 714EA5204E;
	Fri, 10 Jun 2022 13:42:50 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 30/35] selftest/powerpc/pmu: Add selftest for group constraint check for MMCR1 cache bits
Date: Fri, 10 Jun 2022 19:11:08 +0530
Message-Id: <20220610134113.62991-31-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
References: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: omv6V6F6gdLRPPN-sLrAzHsT6cAxFplS
X-Proofpoint-ORIG-GUID: omv6V6F6gdLRPPN-sLrAzHsT6cAxFplS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Data and instruction cache qualifier bits in the event code is
used to program cache select field in Monitor Mode Control
Register 1 (MMCR1: 16-17). When scheduling events as a group, all
events in that group should match value in these bits. Otherwise
event open for the sibling events will fail.

Testcase uses event code "0x1100fc" as leader and other events
like "0x23e054" and "0x13e054" as sibling events to checks for
l1 cache select field constraints via perf interface.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../powerpc/pmu/event_code_tests/Makefile     |  2 +-
 .../group_constraint_cache_test.c             | 60 +++++++++++++++++++
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_cache_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
index 58e1a7a2ed4e..dc27ca2ffcad 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
@@ -5,7 +5,7 @@ TEST_GEN_PROGS := group_constraint_pmc56_test group_pmc56_exclude_constraints_te
 	group_constraint_repeat_test group_constraint_radix_scope_qual_test reserved_bits_mmcra_sample_elig_mode_test \
 	group_constraint_mmcra_sample_test invalid_event_code_test reserved_bits_mmcra_thresh_ctl_test \
 	blacklisted_events_test event_alternatives_tests_p9 event_alternatives_tests_p10 generic_events_valid_test \
-	group_constraint_l2l3_sel_test
+	group_constraint_l2l3_sel_test group_constraint_cache_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_cache_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_cache_test.c
new file mode 100644
index 000000000000..f4be05aa3a3d
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_cache_test.c
@@ -0,0 +1,60 @@
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
+/* All L1 D cache load references counted at finish, gated by reject */
+#define EventCode_1 0x1100fc
+/* Load Missed L1 */
+#define EventCode_2 0x23e054
+/* Load Missed L1 */
+#define EventCode_3 0x13e054
+
+/*
+ * Testcase for group constraint check of data and instructions
+ * cache qualifier bits which is used to program cache select field in
+ * Monitor Mode Control Register 1 (MMCR1: 16-17) for l1 cache.
+ * All events in the group should match cache select bits otherwise
+ * event_open for the group will fail.
+ */
+static int group_constraint_cache(void)
+{
+	struct event event, leader;
+
+	/* Check for platform support for the test */
+	SKIP_IF(platform_check_for_tests());
+
+	/* Init the events for the group contraint check for l1 cache select bits */
+	event_init(&leader, EventCode_1);
+	FAIL_IF(event_open(&leader));
+
+	event_init(&event, EventCode_2);
+
+	/* Expected to fail as sibling event doesn't request same l1 cache select bits as leader */
+	FAIL_IF(!event_open_with_group(&event, leader.fd));
+
+	event_close(&event);
+
+	/* Init the event for the group contraint l1 cache select test */
+	event_init(&event, EventCode_3);
+
+	/* Expected to succeed as sibling event request same l1 cache select bits as leader */
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
+	return test_harness(group_constraint_cache, "group_constraint_cache");
+}
-- 
2.35.1

