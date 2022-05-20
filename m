Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4DE52E8FE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 11:41:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4MDK3cLRz3fbK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:41:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Cl1UniUj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Cl1UniUj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4LmR43XVz3drL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 19:20:23 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K8LRBt025556;
 Fri, 20 May 2022 09:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gd3zosLXd1AQ02PIk0aYmSSw3cjYKXSA1YGuOLxpgcE=;
 b=Cl1UniUj7WF+fkBESgXax6HE/w00yItwhctryz1TStMFiO3BeEsjgr35Jh5VMqG4pgX4
 LG4d0LoJsdD/yE23pr3btcleFbcUjIEdNK7ZZ2JD0MYF9LEq/JsDz+gId4f07YSaB0qy
 KRRFxSgrUhd1XrexCS3+0JnXjRWy1CpKBSUCBYKjz+friILEzhTw6jMPx1yu5JixbjSD
 YqjlZrWcJP9zqbroa9WRmtN3FeeQ36iEPHAdJ0hf2PPXrD1Fj8ffhHGpdda3yAsN1zx2
 IlV/elNjcBXksWiT51lYT+ifn6yINtXmxKZpUp5bb8zP6b1LgU3LKWJBQezzQLS+olvw hg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g5yvc0u6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:20:18 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24K9F19p026786;
 Fri, 20 May 2022 09:20:17 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3g2429ghvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:20:16 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24K9JY8228967324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 09:19:34 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D30E84C044;
 Fri, 20 May 2022 09:20:13 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2721C4C040;
 Fri, 20 May 2022 09:20:09 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.31.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 09:20:08 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 33/35] selftest/powerpc/pmu: Add selftest for group
 constraint check for MMCRA thresh_ctl field
Date: Fri, 20 May 2022 14:47:49 +0530
Message-Id: <20220520091751.17000-34-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
References: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JS1TF3RHDhjSnc8LyUInOV8x-nI6F43N
X-Proofpoint-ORIG-GUID: JS1TF3RHDhjSnc8LyUInOV8x-nI6F43N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-19_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 clxscore=1015 mlxscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

From: Kajol Jain <kjain@linux.ibm.com>

Thresh control bits in the event code is used to program thresh_ctl
field in Monitor Mode Control Register A (MMCRA: 48-55). When scheduling
events as a group, all events in that group should match value in these
bits. Otherwise event open for the sibling events will fail.

Testcase uses event code PM_MRK_INST_CMPL (0x401e0) as leader and
another event PM_THRESH_MET (101ec) as sibling event, and checks if
group constraint checks for thresh_ctl field added correctly via perf interface.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../powerpc/pmu/event_code_tests/Makefile     |  2 +-
 .../group_constraint_thresh_ctl_test.c        | 64 +++++++++++++++++++
 2 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_ctl_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
index f72c73b5b79a..16cbb2e52865 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
@@ -6,7 +6,7 @@ TEST_GEN_PROGS := group_constraint_pmc56_test group_pmc56_exclude_constraints_te
 	group_constraint_mmcra_sample_test invalid_event_code_test reserved_bits_mmcra_thresh_ctl_test \
 	blacklisted_events_test event_alternatives_tests_p9 event_alternatives_tests_p10 generic_events_valid_test \
 	group_constraint_l2l3_sel_test group_constraint_cache_test group_constraint_thresh_cmp_test \
-	group_constraint_unit_test
+	group_constraint_unit_test group_constraint_thresh_ctl_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_ctl_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_ctl_test.c
new file mode 100644
index 000000000000..e0852ebc1671
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_ctl_test.c
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
+/*
+ * Primary PMU events used here are PM_MRK_INST_CMPL (0x401e0) and
+ * PM_THRESH_MET (0x101ec).
+ * Threshold event selection used is issue to complete and issue to
+ * finished for cycles
+ * Sampling criteria is Load or Store only sampling
+ */
+#define EventCode_1 0x35340401e0
+#define EventCode_2 0x34340101ec
+#define EventCode_3 0x35340101ec
+
+/*
+ * Testcase for group constraint check of thresh_ctl bits which is
+ * used to program thresh compare field in Monitor Mode Control Register A
+ * (MMCR0: 48-55).
+ * All events in the group should match thresh ctl bits otherwise
+ * event_open for the group will fail.
+ */
+static int group_constraint_thresh_ctl(void)
+{
+	struct event event, leader;
+
+	/* Check for platform support for the test */
+	SKIP_IF(platform_check_for_tests());
+
+	/* Init the events for the group contraint thresh control test */
+	event_init(&leader, EventCode_1);
+	FAIL_IF(event_open(&leader));
+
+	event_init(&event, EventCode_2);
+
+	/* Expected to fail as sibling and leader event request different thresh_ctl bits */
+	FAIL_IF(!event_open_with_group(&event, leader.fd));
+
+	event_close(&event);
+
+	/* Init the event for the group contraint thresh control test */
+	event_init(&event, EventCode_3);
+
+	 /* Expected to succeed as sibling and leader event request same thresh_ctl bits */
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
+	return test_harness(group_constraint_thresh_ctl, "group_constraint_thresh_ctl");
+}
-- 
2.35.1

