Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E443051D3CD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:55:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kvksw65ghz3dvm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 18:55:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cO7guhDl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cO7guhDl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kvkh657vcz3c8d
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 18:46:46 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2468Uw34010694;
 Fri, 6 May 2022 08:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aLzoPDEOiGHdFhr97jDwKrASV/Ocmzjod62fLN/hTuk=;
 b=cO7guhDl9gc7WMCsYWAo2T6B9NB4q3LfYx/JTwjsIOFuTKTc0F7WjF1gtF/01iNbwpF4
 UsscFFpCa/FgU2oy6mqtAsIS8r8mdSz2j8tzAdtEaoz4TP40PU+6nX+q3/AdSqUhj2Qh
 g4c55OkCK76/lgKfqdQTBL7oEhaSJpi5FTtDG6XJUeCDi+kZrYkwXFgqK8zkvxPfW46G
 02Xh3fgjLOJZupDJ5AaQAFE3K/EN43fKJ5kKBPcdUh7j3V/8Iw8HwPvjFJW7h1Oru+xv
 C3kGIXqhQ3aaSs3NYXPXgymUFirlNAHrFw5FDJeF5TepHwX+By0F8DCotkvDdafwxuYD gw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw07yg82g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:46:41 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2468gfjg013209;
 Fri, 6 May 2022 08:46:40 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3fvg61117b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:46:39 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2468kaVT50135376
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 08:46:36 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE70F4C046;
 Fri,  6 May 2022 08:46:36 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53BB04C040;
 Fri,  6 May 2022 08:46:34 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.19.224]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 08:46:34 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 16/35] selftest/powerpc/pmu: Add selftest for group constraint
 check for PMC5 and PMC6
Date: Fri,  6 May 2022 14:15:25 +0530
Message-Id: <20220506084544.56527-17-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220506084544.56527-1-kjain@linux.ibm.com>
References: <20220506084544.56527-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 12PkIU5pLMkaV5HTdQhfnR1FMwiaXmax
X-Proofpoint-ORIG-GUID: 12PkIU5pLMkaV5HTdQhfnR1FMwiaXmax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_02,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
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

From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Events using Performance Monitor Counter 5 (PMC5) and
Performance Monitor Counter 6 (PMC6) can't have other fields in
event code like cache bits, thresholding or marked bit. PMC5 and PMC6
only supports base events: ie 500fa and 600f4. Other combinations
should fail. Testcase tries setting other bits in event code for
500fa and 600f4 to check this scenario.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../powerpc/pmu/event_code_tests/Makefile     |  2 +-
 .../group_constraint_pmc56_test.c             | 63 +++++++++++++++++++
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_pmc56_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
index 6377ae205064..eb0017233b0b 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 CFLAGS += -m64
 
-TEST_GEN_PROGS :=
+TEST_GEN_PROGS := group_constraint_pmc56_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_pmc56_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_pmc56_test.c
new file mode 100644
index 000000000000..f5ee4796d46c
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_pmc56_test.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2022, Athira Rajeev, IBM Corp.
+ */
+
+#include <stdio.h>
+#include "../event.h"
+#include "../sampling_tests/misc.h"
+
+/*
+ * Testcase for checking constraint checks for
+ * Performance Monitor Counter 5 (PMC5) and also
+ * Performance Monitor Counter 6 (PMC6). Events using
+ * PMC5/PMC6 shouldn't have other fields in event
+ * code like cache bits, thresholding or marked bit.
+ */
+
+static int group_constraint_pmc56(void)
+{
+	struct event event;
+
+	/* Check for platform support for the test */
+	SKIP_IF(platform_check_for_tests());
+
+	/*
+	 * Events using PMC5 and PMC6 with cache bit
+	 * set in event code is expected to fail.
+	 */
+	event_init(&event, 0x2500fa);
+	FAIL_IF(!event_open(&event));
+
+	event_init(&event, 0x2600f4);
+	FAIL_IF(!event_open(&event));
+
+	/*
+	 * PMC5 and PMC6 only supports base events:
+	 * ie 500fa and 600f4. Other combinations
+	 * should fail.
+	 */
+	event_init(&event, 0x501e0);
+	FAIL_IF(!event_open(&event));
+
+	event_init(&event, 0x6001e);
+	FAIL_IF(!event_open(&event));
+
+	event_init(&event, 0x501fa);
+	FAIL_IF(!event_open(&event));
+
+	/*
+	 * Events using PMC5 and PMC6 with random
+	 * sampling bits set in event code should fail
+	 * to schedule.
+	 */
+	event_init(&event, 0x35340500fa);
+	FAIL_IF(!event_open(&event));
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(group_constraint_pmc56, "group_constraint_pmc56");
+}
-- 
2.31.1

