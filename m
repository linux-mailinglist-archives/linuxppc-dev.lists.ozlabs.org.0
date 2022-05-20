Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E9D52E8BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 11:26:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4Ltv2tkLz3fGv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:25:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=teIfr6jT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=teIfr6jT; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Lkj5ZbSz3btV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 19:18:53 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K8vNOG012083;
 Fri, 20 May 2022 09:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=F+O/2nlc7gY+twNgknuY2EiVJZo3VrTPNDLGr0oGmzI=;
 b=teIfr6jT3Pg1UkXWZ934U9zW5VQBwK64sFEvp1BbATpc+QZrvqVOmjfr74YzZygLd/ui
 ieKkaPjuvMquxK7rqEF0Gb/4FwONmG2re3LABsNV+Y0Ehm7EwS0QcaCoEjch5qlvvUZl
 JR5qY5xg3PlIQmxRhq7VL3/4FAXOIdMfIXfF26VF0yWDWq+JgXxv1XGm7Wjt74ZIoNbj
 MFe9a4BRIaQ+Efk2x7+/j2ysXb9uDSZpRFmd5fht/DYjGKY+Gu5f8JBzyugtE56pjUl4
 PNjuhEnEfUm6SVQW9zVtImAi04jfiDJMLM80Sf9MiH+K/7H/HQnkLSNpHF1DYrhqAucB Ug== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g67xardk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:18:48 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24K9EuRb005534;
 Fri, 20 May 2022 09:18:46 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3g4j3gk6ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:18:46 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24K94kJX23527918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 09:04:46 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4276D4C044;
 Fri, 20 May 2022 09:18:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19FA64C040;
 Fri, 20 May 2022 09:18:40 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.31.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 09:18:39 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 11/35] selftest/powerpc/pmu: Add selftest to check
 PERF_SAMPLE_REGS_INTR option will not crash on any platforms
Date: Fri, 20 May 2022 14:47:27 +0530
Message-Id: <20220520091751.17000-12-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
References: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _puWAF2mnpMO1hSbDKen2opFse4vHk74
X-Proofpoint-ORIG-GUID: _puWAF2mnpMO1hSbDKen2opFse4vHk74
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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

With sampling, --intr-regs option is used for capturing
interrupt regs. When --intr-regs option is used, PMU code
uses is_sier_available() function which uses PMU flags in
the code. In environment where platform specific PMU is
not registered, PMU flags is not defined. A fix was added
in kernel to address crash while accessing is_sier_available()
function when pmu is not set. commit f75e7d73bdf7 ("powerpc/perf:
Fix crash with is_sier_available when pmu is not set").

Add perf sampling test to exercise this code and make sure
enabling intr_regs shouldn't crash in any platform. Testcase
uses software event cycles since software event will work even
in cases without PMU.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../powerpc/pmu/sampling_tests/Makefile       |  2 +-
 .../intr_regs_no_crash_wo_pmu_test.c          | 57 +++++++++++++++++++
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/intr_regs_no_crash_wo_pmu_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
index 8d4839cde013..8d4566dac440 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
@@ -6,7 +6,7 @@ TEST_GEN_PROGS := mmcr0_exceptionbits_test mmcr0_cc56run_test mmcr0_pmccext_test
 		   mmcr1_comb_test mmcr2_l2l3_test mmcr2_fcs_fch_test \
 		   mmcr3_src_test mmcra_thresh_marked_sample_test mmcra_thresh_cmp_test \
 		   mmcra_bhrb_ind_call_test mmcra_bhrb_any_test mmcra_bhrb_cond_test \
-		   mmcra_bhrb_disable_test bhrb_no_crash_wo_pmu_test
+		   mmcra_bhrb_disable_test bhrb_no_crash_wo_pmu_test intr_regs_no_crash_wo_pmu_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/intr_regs_no_crash_wo_pmu_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/intr_regs_no_crash_wo_pmu_test.c
new file mode 100644
index 000000000000..839d2d225da0
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/intr_regs_no_crash_wo_pmu_test.c
@@ -0,0 +1,57 @@
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
+ * sampling with -intr-regs doesn't crash
+ * in any environment, say:
+ *  - With generic compat PMU
+ *  - without any PMU registered
+ *  - With platform specific PMU.
+ *  A fix for crash with intr_regs was
+ *  addressed in commit: f75e7d73bdf7 in kernel.
+ *
+ * This testcase exercises this code path by doing
+ * intr_regs using software event. Software event is
+ * used since s/w event will work even in platform
+ * without PMU.
+ */
+static int intr_regs_no_crash_wo_pmu_test(void)
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
+	event.attr.sample_type = PERF_SAMPLE_REGS_INTR;
+	event.attr.disabled = 1;
+
+	/*
+	 * Return code of event_open is not considered
+	 * since test just expects no crash from using
+	 * PERF_SAMPLE_REGS_INTR.
+	 */
+	event_open(&event);
+
+	event_close(&event);
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(intr_regs_no_crash_wo_pmu_test, "intr_regs_no_crash_wo_pmu_test");
+}
-- 
2.35.1

