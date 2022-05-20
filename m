Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 103CC52E8CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 11:30:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4Lzg74SYz3fYN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:30:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NJk3avos;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NJk3avos; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Ll76c1hz3ch3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 19:19:15 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K8qDiX017318;
 Fri, 20 May 2022 09:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hM9J5pONB4jO2MNBcT06FaFVivotjobai6iS+6nXJEQ=;
 b=NJk3avosRdTy9EYF55CUIU1VyaUKOS2/V6D+x9oIYg2lNtnu8EiwxRNnJ3zvRxberGlr
 2MMFmKIxJSpkFm2oZnNpMn82mamEpnBB9sGmUNWsGX94RK3eNKPnYLTYEn5sa5HvKrG9
 z6S5UwyWWNLvWBjXgTXUdRzbyIyYaf+BtZcDmodVbjiqFDlbIlvzMe195bxbKR9cQ6cQ
 SDkwF9vSrsuheeFyiJKhF2F+9GwjDsgFQvzHEFoSY4TpzZsM/bevAp6McA3viJfHM5FZ
 pRtJY3+KJnplJGCm3o3UzFwoSwqKOAc9os8ZkEBzhVlQI7WHOqWDrkQPIBPv3v9nkd5Q kw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g67uw0fhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:19:12 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24K9CxSR026124;
 Fri, 20 May 2022 09:19:09 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3g2429gjh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:19:09 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24K9J6iT55902588
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 09:19:06 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE31D4C040;
 Fri, 20 May 2022 09:19:06 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD61A4C04A;
 Fri, 20 May 2022 09:19:03 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.31.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 09:19:03 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 17/35] selftest/powerpc/pmu: Add selftest to check PMC5/6
 is excluded from some constraint checks
Date: Fri, 20 May 2022 14:47:33 +0530
Message-Id: <20220520091751.17000-18-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
References: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JSDP5DZVJDGDq9G4nLEyH_KwPZbs9e_Z
X-Proofpoint-ORIG-GUID: JSDP5DZVJDGDq9G4nLEyH_KwPZbs9e_Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Events using Performance Monitor Counter 5 (PMC5) and
Performance Monitor Counter 6 (PMC6) should be excluded
from constraint check when scheduled along with group of
events. Example, combination of PMC5, PMC6, and an event
with cache bit will succeed to schedule though first two
events doesn't have cache bit set. Testcase use three events,
ie, 600f4(cycles), 500fa(instructions), 22C040 with cache
bit (dc_ic) set to test this constraint check.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../powerpc/pmu/event_code_tests/Makefile     |  2 +-
 .../group_pmc56_exclude_constraints_test.c    | 64 +++++++++++++++++++
 2 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_pmc56_exclude_constraints_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
index eb0017233b0b..c0eb28935e6e 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 CFLAGS += -m64
 
-TEST_GEN_PROGS := group_constraint_pmc56_test
+TEST_GEN_PROGS := group_constraint_pmc56_test group_pmc56_exclude_constraints_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_pmc56_exclude_constraints_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_pmc56_exclude_constraints_test.c
new file mode 100644
index 000000000000..cff9ac170df6
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_pmc56_exclude_constraints_test.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2022, Athira Rajeev, IBM Corp.
+ */
+
+#include <stdio.h>
+#include "../event.h"
+#include <sys/prctl.h>
+#include <limits.h>
+#include "../sampling_tests/misc.h"
+
+/*
+ * Testcase for group constraint check for
+ * Performance Monitor Counter 5 (PMC5) and also
+ * Performance Monitor Counter 6 (PMC6).
+ * Test that pmc5/6 is excluded from constraint
+ * check when scheduled along with group of events.
+ */
+
+static int group_pmc56_exclude_constraints(void)
+{
+	struct event *e, events[3];
+	int i;
+
+	/* Check for platform support for the test */
+	SKIP_IF(platform_check_for_tests());
+
+	/*
+	 * PMC5/6 is excluded from constraint bit
+	 * check along with group of events. Use
+	 * group of events with PMC5, PMC6 and also
+	 * event with cache bit (dc_ic) set. Test expects
+	 * this set of events to go in as a group.
+	 */
+	e = &events[0];
+	event_init(e, 0x500fa);
+
+	e = &events[1];
+	event_init(e, 0x600f4);
+
+	e = &events[2];
+	event_init(e, 0x22C040);
+
+	FAIL_IF(event_open(&events[0]));
+
+	/*
+	 * The event_open will fail if constraint check fails.
+	 * Since we are asking for events in a group and since
+	 * PMC5/PMC6 is excluded from group constraints, even_open
+	 * should pass.
+	 */
+	for (i = 1; i < 3; i++)
+		FAIL_IF(event_open_with_group(&events[i], events[0].fd));
+
+	for (i = 0; i < 3; i++)
+		event_close(&events[i]);
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(group_pmc56_exclude_constraints, "group_pmc56_exclude_constraints");
+}
-- 
2.35.1

