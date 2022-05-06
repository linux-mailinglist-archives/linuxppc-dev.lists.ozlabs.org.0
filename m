Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F8551D3F2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 11:05:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kvl5n6TqNz3dP4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 19:05:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r/kq0k6Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=r/kq0k6Q; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kvkj11BVXz3cF9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 18:47:32 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2467P56a021397;
 Fri, 6 May 2022 08:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=OVHhYYE2DoRJgwYuzCv2oG1rM525VJJJSivPGZTdip0=;
 b=r/kq0k6QkKhd3qbVEhr35bdCYvQjLesyH8mYSwUdOO9LZrB8G24t4N1dL41wKjvrXfE5
 fOAPtcofhrsIIs5EVFzScO020FrwROE3w+HerWu+69tNvNiOGYk4qg5cRTYQdszNcNM3
 UAkb1XofkxbJ91zhLJ76uSXg+SbcUVXOCDG72dZT0yBAI2fSxz5haXeGPytnlDEX9RBM
 9IQ0GjJ2/mck69FIQK0a21AmifPNh+HxMyvibPfZAgBPBGtYSXkezMRGfjtFiLpOdx5J
 MK94/Sd7b8puO+EWt5r47pYZFr3eavPFsZzo20dMCkbjT0EkuUNbsow06ZjhwZ1kwdi7 Ew== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvy929fg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:47:27 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2468hJQQ013966;
 Fri, 6 May 2022 08:47:26 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3fvg61118c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:47:26 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2468lGdc30146982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 08:47:16 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DCCB4C04E;
 Fri,  6 May 2022 08:47:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2C8D4C044;
 Fri,  6 May 2022 08:47:20 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.19.224]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 08:47:20 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 32/35] selftest/powerpc/pmu: Add selftest for group constraint
 for unit and pmc field in p9
Date: Fri,  6 May 2022 14:15:41 +0530
Message-Id: <20220506084544.56527-33-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220506084544.56527-1-kjain@linux.ibm.com>
References: <20220506084544.56527-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NWN_0j6y22V5RRLtLy733-66N4u6VYFG
X-Proofpoint-GUID: NWN_0j6y22V5RRLtLy733-66N4u6VYFG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_03,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
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

Unit and pmu bits in the event code is used to program unit and pmc
fields in Monitor Mode Control Register 1 (MMCR1). For power9 platform,
incase unit field value is within 6 to 9, one of the event in the group
should use PMC4. Otherwise event_open should fail for that group.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../powerpc/pmu/event_code_tests/Makefile     |  3 +-
 .../group_constraint_unit_test.c              | 74 +++++++++++++++++++
 2 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_unit_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
index 374044062561..f72c73b5b79a 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
@@ -5,7 +5,8 @@ TEST_GEN_PROGS := group_constraint_pmc56_test group_pmc56_exclude_constraints_te
 	group_constraint_repeat_test group_constraint_radix_scope_qual_test reserved_bits_mmcra_sample_elig_mode_test \
 	group_constraint_mmcra_sample_test invalid_event_code_test reserved_bits_mmcra_thresh_ctl_test \
 	blacklisted_events_test event_alternatives_tests_p9 event_alternatives_tests_p10 generic_events_valid_test \
-	group_constraint_l2l3_sel_test group_constraint_cache_test group_constraint_thresh_cmp_test
+	group_constraint_l2l3_sel_test group_constraint_cache_test group_constraint_thresh_cmp_test \
+	group_constraint_unit_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_unit_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_unit_test.c
new file mode 100644
index 000000000000..a2c18923dcec
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_unit_test.c
@@ -0,0 +1,74 @@
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
+/* All successful D-side store dispatches for this thread with PMC 2 */
+#define EventCode_1 0x26080
+/* All successful D-side store dispatches for this thread with PMC 4 */
+#define EventCode_2 0x46080
+/* All successful D-side store dispatches for this thread that were L2 Miss with PMC 3 */
+#define EventCode_3 0x36880
+
+/*
+ * Testcase for group constraint check of unit and pmc bits which is
+ * used to program corresponding unit and pmc field in Monitor Mode
+ * Control Register 1 (MMCR1)
+ * One of the event in the group should use PMC 4 incase units field
+ * value is within 6 to 9 otherwise event_open for the group will fail.
+ */
+static int group_constraint_unit(void)
+{
+	struct event *e, events[3];
+
+	/*
+	 * Check for platform support for the test.
+	 * Constraint to use PMC4 with one of the event in group,
+	 * when the unit is within 6 to 9 is only applicable on
+	 * power9.
+	 */
+	SKIP_IF(platform_check_for_tests());
+	SKIP_IF(have_hwcap2(PPC_FEATURE2_ARCH_3_1));
+
+	/* Init the events for the group contraint check for unit bits */
+	e = &events[0];
+	event_init(e, EventCode_1);
+
+	 /* Expected to fail as PMC 4 is not used with unit field value 6 to 9 */
+	FAIL_IF(!event_open(&events[0]));
+
+	/* Init the events for the group contraint check for unit bits */
+	e = &events[1];
+	event_init(e, EventCode_2);
+
+	/* Expected to pass as PMC 4 is used with unit field value 6 to 9 */
+	FAIL_IF(event_open(&events[1]));
+
+	/* Init the event for the group contraint unit test */
+	e = &events[2];
+	event_init(e, EventCode_3);
+
+	/* Expected to fail as PMC4 is not being used */
+	FAIL_IF(!event_open_with_group(&events[2], events[0].fd));
+
+	/* Expected to succeed as event using PMC4 */
+	FAIL_IF(event_open_with_group(&events[2], events[1].fd));
+
+	event_close(&events[0]);
+	event_close(&events[1]);
+	event_close(&events[2]);
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(group_constraint_unit, "group_constraint_unit");
+}
-- 
2.31.1

