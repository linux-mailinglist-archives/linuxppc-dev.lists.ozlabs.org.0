Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC1E52E8C6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 11:29:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4Lyq1SzNz3dvb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:29:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c1QLH9Nk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=c1QLH9Nk; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Ll46kzyz3cdy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 19:19:12 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K8V3Gp008018;
 Fri, 20 May 2022 09:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=w9mL9VA0HpGg4atfFN9Q0/gpgfvI5FG1YM+fjpYfreg=;
 b=c1QLH9NklvP2eQqNOYAzK2ZX0Uh8osMgakmWL0SQAMGBbVJxwiyEJwMuF2Tjg9fEXJKd
 p3MRG6cIcyHoW0IiLNFbr3Z8qEG6umOHsuhRV6sZmOLKibw15cynaifxndibNM6yISXU
 nEpx/typ6VEsUrRlW6twiXR0P3IA4lDEiJK/lf5RmlGMbrTa/WwHLDJlaU7DkAk520Iw
 mzVJPS9qpvPHRyEA3XgCuyVTHbI3zTSAo2lp4YjqGXPoBBMBLJMv2hVDwN6Zr481SlW5
 V6AAI2bKWcL0X2nNWH5Mok31ecTrYZ0YCPvzSMysdajzbf2TuTXU8eDeqMewr1CEbLhp 0g== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g67hv8us7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:19:07 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24K9EvqX013197;
 Fri, 20 May 2022 09:19:06 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3g2428ybrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:19:05 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24K9J3fd33423740
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 09:19:03 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3C584C046;
 Fri, 20 May 2022 09:19:02 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C51904C040;
 Fri, 20 May 2022 09:18:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.31.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 09:18:59 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 16/35] selftest/powerpc/pmu: Add selftest for group
 constraint check for PMC5 and PMC6
Date: Fri, 20 May 2022 14:47:32 +0530
Message-Id: <20220520091751.17000-17-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
References: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rlCwy6i_JTGuLCyK_ZsDWaRKOV2AjXjO
X-Proofpoint-GUID: rlCwy6i_JTGuLCyK_ZsDWaRKOV2AjXjO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-19_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205200066
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
2.35.1

