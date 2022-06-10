Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE48546803
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 16:04:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKN493r3Dz3gbX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 00:04:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GM3OdU+4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GM3OdU+4;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKMc25sD5z3dQY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 23:43:14 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25ADDVLn032303;
	Fri, 10 Jun 2022 13:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MMva3TOI0LgdSg3m6+ErKN4iRu1ijQUOW+a1VgNtEZU=;
 b=GM3OdU+4xpXno6vfrNg057ZFTPFHBqnXl7t4O6cWBpDpRimfhjuFsmBD8KEonpJEUnpB
 1yvLIfnpUxOjolZ00aNHFDsad+1BCLh1L5v6uCFwm0+EGpF+tQ3uupGVll0KIE5N63rc
 Z33fVRa38KJZQsLj4ZIzktN92MfTtToiNeWcaiLchqnsiJe4rolycsExzwcu9xOrw/2C
 scen/J1I49hucMjoUPU6ElROnMrk94MjdzK7uA4waX7/ZCF9Xc3edrfXfpyMfFjfBGrF
 17KZFGkyax5NYfhdVWmo9nzvUBrFOR8kwwDzo6paMFc/bCUAT8u1eYJcCxzLM7fCJpqm jw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm6na0j6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:43:09 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ADa0pk004499;
	Fri, 10 Jun 2022 13:43:08 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3gfy19g9sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:43:08 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25ADh52H19399026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 13:43:05 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3EB2852050;
	Fri, 10 Jun 2022 13:43:05 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.7.130])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id E14F852051;
	Fri, 10 Jun 2022 13:43:02 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 34/35] selftest/powerpc/pmu: Add selftest for group constraint check for MMCRA thresh_sel field
Date: Fri, 10 Jun 2022 19:11:12 +0530
Message-Id: <20220610134113.62991-35-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
References: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6AeeIwpUVxDsNRe4XWrY6zSh68nl8aFF
X-Proofpoint-ORIG-GUID: 6AeeIwpUVxDsNRe4XWrY6zSh68nl8aFF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 clxscore=1015
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Thresh select bits in the event code is used to program thresh_sel
field in Monitor Mode Control Register A (MMCRA: 45-47). When scheduling
events as a group, all events in that group should match value in these
bits. Otherwise event open for the sibling events will fail.

Testcase uses event code PM_MRK_INST_CMPL (0x401e0) as leader and
another event PM_THRESH_MET (0x101ec) as sibling event, and checks
if group constraint checks for thresh_sel field added correctly via
perf interface.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../powerpc/pmu/event_code_tests/Makefile     |  2 +-
 .../group_constraint_thresh_sel_test.c        | 63 +++++++++++++++++++
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_sel_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
index 16cbb2e52865..755993d210f2 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
@@ -6,7 +6,7 @@ TEST_GEN_PROGS := group_constraint_pmc56_test group_pmc56_exclude_constraints_te
 	group_constraint_mmcra_sample_test invalid_event_code_test reserved_bits_mmcra_thresh_ctl_test \
 	blacklisted_events_test event_alternatives_tests_p9 event_alternatives_tests_p10 generic_events_valid_test \
 	group_constraint_l2l3_sel_test group_constraint_cache_test group_constraint_thresh_cmp_test \
-	group_constraint_unit_test group_constraint_thresh_ctl_test
+	group_constraint_unit_test group_constraint_thresh_ctl_test group_constraint_thresh_sel_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_sel_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_sel_test.c
new file mode 100644
index 000000000000..50a8cd843ce7
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_sel_test.c
@@ -0,0 +1,63 @@
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
+ * Primary PMU events used here are PM_MRK_INST_CMPL (0x401e0) and
+ * PM_THRESH_MET (0x101ec).
+ * Threshold event selection used is issue to complete
+ * Sampling criteria is Load or Store only sampling
+ */
+#define EventCode_1 0x35340401e0
+#define EventCode_2 0x35540101ec
+#define EventCode_3 0x35340101ec
+
+/*
+ * Testcase for group constraint check of thresh_sel bits which is
+ * used to program thresh select field in Monitor Mode Control Register A
+ * (MMCRA: 45-57).
+ * All events in the group should match thresh sel bits otherwise
+ * event_open for the group will fail.
+ */
+static int group_constraint_thresh_sel(void)
+{
+	struct event event, leader;
+
+	/* Check for platform support for the test */
+	SKIP_IF(platform_check_for_tests());
+
+	/* Init the events for the group contraint thresh select test */
+	event_init(&leader, EventCode_1);
+	FAIL_IF(event_open(&leader));
+
+	event_init(&event, EventCode_2);
+
+	/* Expected to fail as sibling and leader event request different thresh_sel bits */
+	FAIL_IF(!event_open_with_group(&event, leader.fd));
+
+	event_close(&event);
+
+	/* Init the event for the group contraint thresh select test */
+	event_init(&event, EventCode_3);
+
+	 /* Expected to succeed as sibling and leader event request same thresh_sel bits */
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
+	return test_harness(group_constraint_thresh_sel, "group_constraint_thresh_sel");
+}
-- 
2.35.1

