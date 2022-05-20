Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7453052E8E6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 11:34:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4M552dJJz3fw7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:34:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NcQR8yDp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NcQR8yDp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Llh0YZNz3dQG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 19:19:43 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K9JQjX004036;
 Fri, 20 May 2022 09:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=mI3VFGYTJyQoxNt2cehr2apPaDHf99oMJSJuPZsbG9k=;
 b=NcQR8yDpfEZP5D5Gi+MNYvlu9cVA0Tp1z5x1FFfvZpXLnoJ2y0xKW2YjzhUc4yU3sIHr
 C9u4CErPoLBQi1zlmtdErexisYwmy+nP9F7r2V0psjetf2wBsqTMBnk+u0fgQ8Kyg0TE
 Htu44G/xxufPV5u+rJELldIA21bN3ccSVCD/1a+w+9jDapjNXSGlGquOFM///C3WuUyE
 FYvL1n9QZyymNvztbgTZDBejREJcuYtZzdklv9p45U7utPan2aqsYeEePbL5BUQjjire
 IEE6UOxDjFutH79xQSTjucPzLlzbUOBchU8m357GvowgRw3T7hwq+0oq38RFm4v2VFwL tw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g64xrbwmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:19:38 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24K9F3BJ020248;
 Fri, 20 May 2022 09:19:37 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3g23pjgjpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:19:36 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24K9JYwL52298052
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 09:19:34 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0752C4C046;
 Fri, 20 May 2022 09:19:34 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8A154C040;
 Fri, 20 May 2022 09:19:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.31.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 09:19:30 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 24/35] selftest/powerpc/pmu: Add selftest for reserved bit
 check for MMCRA thresh_ctl field
Date: Fri, 20 May 2022 14:47:40 +0530
Message-Id: <20220520091751.17000-25-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
References: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CUq1jXc1ggytBCtJLGqlTjLKdVUKo6_d
X-Proofpoint-ORIG-GUID: CUq1jXc1ggytBCtJLGqlTjLKdVUKo6_d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Testcase for reserved bits in Monitor Mode
Control Register A (MMCRA) thresh_ctl bits.
For MMCRA[48:51]/[52:55]) Threshold Start/Stop,
0b11110000/0b00001111 is reserved.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../powerpc/pmu/event_code_tests/Makefile     |  2 +-
 .../reserved_bits_mmcra_thresh_ctl_test.c     | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_thresh_ctl_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
index 1ce1ef4586fd..e50570794337 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
@@ -3,7 +3,7 @@ CFLAGS += -m64
 
 TEST_GEN_PROGS := group_constraint_pmc56_test group_pmc56_exclude_constraints_test group_constraint_pmc_count_test \
 	group_constraint_repeat_test group_constraint_radix_scope_qual_test reserved_bits_mmcra_sample_elig_mode_test \
-	group_constraint_mmcra_sample_test invalid_event_code_test
+	group_constraint_mmcra_sample_test invalid_event_code_test reserved_bits_mmcra_thresh_ctl_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_thresh_ctl_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_thresh_ctl_test.c
new file mode 100644
index 000000000000..4ea1c2f8913f
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_thresh_ctl_test.c
@@ -0,0 +1,44 @@
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
+ * Testcase for reserved bits in Monitor Mode
+ * Control Register A (MMCRA) thresh_ctl bits.
+ * For MMCRA[48:51]/[52:55]) Threshold Start/Stop,
+ * 0b11110000/0b00001111 is reserved.
+ */
+
+static int reserved_bits_mmcra_thresh_ctl(void)
+{
+	struct event event;
+
+	/* Check for platform support for the test */
+	SKIP_IF(platform_check_for_tests());
+
+	/* Skip for Generic compat PMU */
+	SKIP_IF(check_for_generic_compat_pmu());
+
+	/*
+	 * MMCRA[48:51]/[52:55]) Threshold Start/Stop
+	 * events Selection. 0b11110000/0b00001111 is reserved.
+	 * Expected to fail when using these reserved values.
+	 */
+	event_init(&event, 0xf0340401e0);
+	FAIL_IF(!event_open(&event));
+
+	event_init(&event, 0x0f340401e0);
+	FAIL_IF(!event_open(&event));
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(reserved_bits_mmcra_thresh_ctl, "reserved_bits_mmcra_thresh_ctl");
+}
-- 
2.35.1

