Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8249951D3BE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:53:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvkqY2QSnz3cK0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 18:53:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BnOrfnON;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BnOrfnON; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kvkgv4Xc4z3cB6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 18:46:35 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2468V1rm010804;
 Fri, 6 May 2022 08:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=OglIg3EOOXX/vTsLXlcwq0Mizf7LrdfyHZVPUsrZeOA=;
 b=BnOrfnONdqUNsFqpmP0VpU53DMm4uNgXLXJAdzfydccXQD5uGIWMiIZWCdRmBPURZGFf
 SwW/J6nMkKFc5SwMbT0QcLv+ikahBOp/XOb6HUMEk5bhmSsRtde4d1O690HzdH+5p/MO
 XVVR/vDFUD+ewlp36WirPL3UEYyLMoTnTvPdijBWAyig1TD+4KT9drLRNEI/j9DfGSvE
 XPyDEFMIPfHBqSRQ2AbY4BXb/ZLCdZH3ehponJhrc9+sBPiuQ7oM+3s4IM2EmaWTmkbh
 L8+mL077crorYpwWLtWQZ0pp6TzCSM31DBEybKi+SI9i0XyrqPJm/iYwxV2ZIt+Nuelb 4w== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw07yg7xc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:46:30 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2468gVBK019110;
 Fri, 6 May 2022 08:46:28 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 3frvr8xq2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:46:28 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2468kPjO38273302
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 08:46:25 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36D134C046;
 Fri,  6 May 2022 08:46:25 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B1314C040;
 Fri,  6 May 2022 08:46:23 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.19.224]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 08:46:22 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 12/35] selftest/powerpc/pmu: Add selftest for checking valid
 and invalid bhrb filter maps
Date: Fri,  6 May 2022 14:15:21 +0530
Message-Id: <20220506084544.56527-13-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220506084544.56527-1-kjain@linux.ibm.com>
References: <20220506084544.56527-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: msYgIRZ7FhvciSJfux-Pv2iNBvtEEwPx
X-Proofpoint-ORIG-GUID: msYgIRZ7FhvciSJfux-Pv2iNBvtEEwPx
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

For PERF_SAMPLE_BRANCH_STACK sample type, different
branch_sample_type, ie branch filters are supported.
All the branch filters are not supported in powerpc.
Example, power10 platform supports any, ind_call and
cond branch filters. Whereas, it is different in power9.
Testcase checks event open for invalid and valid branch
sample types. The branch types for testcase are picked
from "perf_branch_sample_type" in perf_event.h

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../powerpc/pmu/sampling_tests/Makefile       |   3 +-
 .../pmu/sampling_tests/bhrb_filter_map_test.c | 115 ++++++++++++++++++
 2 files changed, 117 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
index 8d4566dac440..ed9befc2f836 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
@@ -6,7 +6,8 @@ TEST_GEN_PROGS := mmcr0_exceptionbits_test mmcr0_cc56run_test mmcr0_pmccext_test
 		   mmcr1_comb_test mmcr2_l2l3_test mmcr2_fcs_fch_test \
 		   mmcr3_src_test mmcra_thresh_marked_sample_test mmcra_thresh_cmp_test \
 		   mmcra_bhrb_ind_call_test mmcra_bhrb_any_test mmcra_bhrb_cond_test \
-		   mmcra_bhrb_disable_test bhrb_no_crash_wo_pmu_test intr_regs_no_crash_wo_pmu_test
+		   mmcra_bhrb_disable_test bhrb_no_crash_wo_pmu_test intr_regs_no_crash_wo_pmu_test \
+		   bhrb_filter_map_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
new file mode 100644
index 000000000000..8eee65504e22
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
@@ -0,0 +1,115 @@
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
+ * A perf sampling test to check bhrb filter
+ * map. All the branch filters are not supported
+ * in powerpc. Supported filters in:
+ * power10: any, any_call, ind_call, cond
+ * power9: any, any_call
+ *
+ * Testcase checks event open for invalid bhrb filter
+ * types should fail and valid filter types should pass.
+ * Testcase does validity check for these branch
+ * sample types.
+ */
+
+/* Invalid types for powerpc */
+int invalid_bhrb_filter_map[] = {
+	PERF_SAMPLE_BRANCH_USER,
+	PERF_SAMPLE_BRANCH_KERNEL,
+	PERF_SAMPLE_BRANCH_HV,
+	PERF_SAMPLE_BRANCH_ANY_RETURN,
+	PERF_SAMPLE_BRANCH_ABORT_TX,
+	PERF_SAMPLE_BRANCH_IN_TX,
+	PERF_SAMPLE_BRANCH_NO_TX,
+	PERF_SAMPLE_BRANCH_CALL_STACK,
+	PERF_SAMPLE_BRANCH_IND_JUMP,
+	PERF_SAMPLE_BRANCH_CALL,
+	PERF_SAMPLE_BRANCH_NO_FLAGS,
+	PERF_SAMPLE_BRANCH_NO_CYCLES,
+	PERF_SAMPLE_BRANCH_TYPE_SAVE,
+};
+
+/* Valid bhrb filters in power9/power10 */
+int bhrb_filter_map_valid_common[] = {
+	PERF_SAMPLE_BRANCH_ANY,
+	PERF_SAMPLE_BRANCH_ANY_CALL,
+};
+
+/* Valid bhrb filters in power10 */
+int bhrb_filter_map_valid_p10[] = {
+	PERF_SAMPLE_BRANCH_IND_CALL,
+	PERF_SAMPLE_BRANCH_COND,
+};
+
+static int bhrb_filter_map_test(void)
+{
+	struct event event;
+	int i;
+
+	/* Check for platform support for the test */
+	SKIP_IF(platform_check_for_tests());
+
+	/*
+	 * Skip for Generic compat PMU since
+	 * bhrb filters is not supported
+	 */
+	SKIP_IF(check_for_generic_compat_pmu());
+
+	/* Init the event for the sampling test */
+	event_init(&event, 0x1001e);
+
+	event.attr.sample_period = 1000;
+	event.attr.sample_type = PERF_SAMPLE_BRANCH_STACK;
+	event.attr.disabled = 1;
+
+	/* Invalid filter maps which are expected to fail in event_open */
+	for (i = 0; i < ARRAY_SIZE(invalid_bhrb_filter_map); i++) {
+		event.attr.branch_sample_type = invalid_bhrb_filter_map[i];
+		FAIL_IF(!event_open(&event));
+	}
+
+	/* valid filter maps for power9/power10 which are expected to pass in event_open */
+	for (i = 0; i < ARRAY_SIZE(bhrb_filter_map_valid_common); i++) {
+		event.attr.branch_sample_type = bhrb_filter_map_valid_common[i];
+		FAIL_IF(event_open(&event));
+		event_close(&event);
+	}
+
+	/*
+	 * filter maps which are valid in power10 and invalid in power9.
+	 * PVR check is used here since PMU specific data like bhrb filter
+	 * alternative tests is handled by respective PMU driver code and
+	 * using PVR will work correctly for all cases including generic
+	 * compat mode.
+	 */
+	if (PVR_VER(mfspr(SPRN_PVR)) == POWER10) {
+		for (i = 0; i < ARRAY_SIZE(bhrb_filter_map_valid_p10); i++) {
+			event.attr.branch_sample_type = bhrb_filter_map_valid_p10[i];
+			FAIL_IF(event_open(&event));
+			event_close(&event);
+		}
+	} else {
+		for (i = 0; i < ARRAY_SIZE(bhrb_filter_map_valid_p10); i++) {
+			event.attr.branch_sample_type = bhrb_filter_map_valid_p10[i];
+			FAIL_IF(!event_open(&event));
+		}
+	}
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(bhrb_filter_map_test, "bhrb_filter_map_test");
+}
-- 
2.31.1

