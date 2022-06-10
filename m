Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA04F546796
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 15:48:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKMk24RVBz3fJb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 23:48:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AZXU3mFM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AZXU3mFM;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKMZc4KPlz3bwb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 23:42:00 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25ADT27L015079;
	Fri, 10 Jun 2022 13:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ByOcO8rmjSyJe3X2pMMo92RxsVNvLr67u5yPErq1bqU=;
 b=AZXU3mFMHl6eE6nKHmD5+1x/wcc9mUSJcoaoNF8OZKhD4dnzWjwPXKTUtpEbAeyVx3rN
 KpZstD0LCA06qLnnrzk2u/Jdo2YoltBfSGWhMnLZLZqKDzYG2PQwusRYpOYe0UosV3ah
 Ew+79nZY89u0q+TkcLdn75agLOkahd1ye++k42sIpBplsSYIdpA0DgJPOdkomiB8H9zO
 pWwHKjNyrAy31FcwiFKKCkM3xm8G+xRMXVk9yT4gyQVu5+9h3CV3AeBiFqRFQKa6Ua5v
 biiWMUd7DWPHVOI6WYjal16yemuVWs+IvIR7uCVMzcHoUxJk1/0fOBgNGhfovGyLPiZx JQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm6vn0akd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:41:56 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ADZuOZ006996;
	Fri, 10 Jun 2022 13:41:54 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma02fra.de.ibm.com with ESMTP id 3gfy196h83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:41:54 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25ADfpDt9109806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 13:41:51 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56D145204E;
	Fri, 10 Jun 2022 13:41:51 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.7.130])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0D2F752051;
	Fri, 10 Jun 2022 13:41:48 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 10/35] selftest/powerpc/pmu: Add selftest to check branch stack enablement will not crash on any platforms
Date: Fri, 10 Jun 2022 19:10:48 +0530
Message-Id: <20220610134113.62991-11-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
References: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: spWVSYycEY87he_iK4B2rfKLQlzTlcNg
X-Proofpoint-ORIG-GUID: spWVSYycEY87he_iK4B2rfKLQlzTlcNg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

While enabling branch stack for an event, BHRB (Branch History
Rolling Buffer) filter is set using bhrb_filter_map() callback.
This callback is not defined for cases like generic_compat_pmu
or in case where there is no PMU registered. A fix was added
in kernel to address a crash issue observed while enabling branch
stack for environments which doesn't have this callback.
commit b460b512417a ("powerpc/perf: Fix crashes with
generic_compat_pmu & BHRB").

Add perf sampling test to exercise this code path and make
sure enabling branch stack shouldn't crash in any platform.
Testcase uses software event cycles since software event is
available and can be used even in cases without PMU.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../powerpc/pmu/sampling_tests/Makefile       |  2 +-
 .../bhrb_no_crash_wo_pmu_test.c               | 59 +++++++++++++++++++
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_no_crash_wo_pmu_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
index f4da49d55d57..8d4839cde013 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
@@ -6,7 +6,7 @@ TEST_GEN_PROGS := mmcr0_exceptionbits_test mmcr0_cc56run_test mmcr0_pmccext_test
 		   mmcr1_comb_test mmcr2_l2l3_test mmcr2_fcs_fch_test \
 		   mmcr3_src_test mmcra_thresh_marked_sample_test mmcra_thresh_cmp_test \
 		   mmcra_bhrb_ind_call_test mmcra_bhrb_any_test mmcra_bhrb_cond_test \
-		   mmcra_bhrb_disable_test
+		   mmcra_bhrb_disable_test bhrb_no_crash_wo_pmu_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_no_crash_wo_pmu_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_no_crash_wo_pmu_test.c
new file mode 100644
index 000000000000..4644c6782974
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_no_crash_wo_pmu_test.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2022, Athira Rajeev, IBM Corp.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+
+#include "../event.h"
+#include "misc.h"
+#include "utils.h"
+
+/*
+ * A perf sampling test for making sure
+ * enabling branch stack doesn't crash in any
+ * environment, say:
+ *  - With generic compat PMU
+ *  - without any PMU registered
+ *  - With platform specific PMU
+ *  A fix for bhrb sampling crash was added in kernel
+ *  via commit: b460b512417a ("powerpc/perf: Fix crashes
+ *  with generic_compat_pmu & BHRB")
+ *
+ * This testcase exercises this code by doing branch
+ * stack enable for software event. s/w event is used
+ * since software event will work even in platform
+ * without PMU.
+ */
+static int bhrb_no_crash_wo_pmu_test(void)
+{
+	struct event event;
+
+	/*
+	 * Init the event for the sampling test.
+	 * This uses software event which works on
+	 * any platform.
+	 */
+	event_init_opts(&event, 0, PERF_TYPE_SOFTWARE, "cycles");
+
+	event.attr.sample_period = 1000;
+	event.attr.sample_type = PERF_SAMPLE_BRANCH_STACK;
+	event.attr.disabled = 1;
+
+	/*
+	 * Return code of event_open is not
+	 * considered since test just expects no crash from
+	 * using PERF_SAMPLE_BRANCH_STACK. Also for environment
+	 * like generic compat PMU, branch stack is unsupported.
+	 */
+	event_open(&event);
+
+	event_close(&event);
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(bhrb_no_crash_wo_pmu_test, "bhrb_no_crash_wo_pmu_test");
+}
-- 
2.35.1

