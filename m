Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3402452E8B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 11:25:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4Lt90TqTz3fDS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:25:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WJxZ2gXc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WJxZ2gXc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Lkc1V07z3bsH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 19:18:48 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K8g0rK025796;
 Fri, 20 May 2022 09:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ByOcO8rmjSyJe3X2pMMo92RxsVNvLr67u5yPErq1bqU=;
 b=WJxZ2gXcxq1NLm9cZFMir7foPLsUsPcIjGNc/O0kwJovkOPRoTPFAubyn8qOgogRygLB
 7bMCb2T3yt4UBCAw5FKMLVYY97QJQSdr2nypOUwjfwyiArotaiV3+vzZgbSlSc37ISuE
 2dqyNpyn8Cwq+bTpT7OQJTYuCGJt/Wh8FdI8zjXd7SpYvsfeJub5Ov8/CQBI8JxmXREJ
 O7e9z6KiAOfQcYATrUVu4r6dxwPoCEINjUK1cW8iqH2QmRVUAzo4isglvBdQS55t+PdC
 qi+e2cZ2JRZsUdGHeIZZSSL91+R7qOJVYtW9oe/yLHW1GbrkuOgQMoNE1FlGKnvtEs49 gQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g67q20pca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:18:44 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24K9Ex9P025331;
 Fri, 20 May 2022 09:18:41 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3g2428xy8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:18:41 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24K9Icnd54264074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 09:18:38 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9B9A4C040;
 Fri, 20 May 2022 09:18:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E32784C046;
 Fri, 20 May 2022 09:18:34 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.31.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 09:18:34 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 10/35] selftest/powerpc/pmu: Add selftest to check branch
 stack enablement will not crash on any platforms
Date: Fri, 20 May 2022 14:47:26 +0530
Message-Id: <20220520091751.17000-11-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
References: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FPK3n7xdRiQy4lyIKR740dR9y2u_vmQz
X-Proofpoint-ORIG-GUID: FPK3n7xdRiQy4lyIKR740dR9y2u_vmQz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
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

