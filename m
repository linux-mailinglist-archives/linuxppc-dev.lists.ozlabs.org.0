Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6035467A5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 15:50:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKMmD52ksz3f4y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 23:50:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ny855NrZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ny855NrZ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKMZp22hdz3cdT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 23:42:10 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25ADT27P015079;
	Fri, 10 Jun 2022 13:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=bnEra8kXUHAtNeois4Z5tN5fyPAq2CV9OweoRBSllEM=;
 b=Ny855NrZMSDbARVjef7Pvv9dIWWTYGdQvsIUevtak7UR/Q/juKaCAX4aVY7MY2/l6Ey/
 gsiCuFTvqnhGNQed6ULkqWhuGUn3zqLruphMr9o5VPvQYT/xompdWyjZ7uF0EcldHIGZ
 H2gxC5AwA/8skmOqe+AByddndqvV9V0kppxsoLTTbJP/t8HAMkmDT10yJppQrzA/5w3f
 m1InJ9xxYsF6wU8I02Ov3Twnp+VW0b0e6MJ0oZbbCeFHtxftiiGJ/LEY2FiRW3WL9K0v
 w/NhiMQEHNkVlUVnoHFQ3qtBXAhKgEZHuDELeayWy2Rq5s98L81pstk2MPQp+Ik8BxSe 3A== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm6vn0aqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:42:06 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ADc3Ci020407;
	Fri, 10 Jun 2022 13:42:04 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma06fra.de.ibm.com with ESMTP id 3gfxnj6jfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:42:03 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25ADg05215073724
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 13:42:00 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AAC5E52050;
	Fri, 10 Jun 2022 13:42:00 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.7.130])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3CA7A5204F;
	Fri, 10 Jun 2022 13:41:57 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 13/35] selftest/powerpc/pmu: Add selftest for mmcr1 pmcxsel/unit/cache fields
Date: Fri, 10 Jun 2022 19:10:51 +0530
Message-Id: <20220610134113.62991-14-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
References: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wsonGKjle26ku1kl36-BtH3UH_dy7s9A
X-Proofpoint-ORIG-GUID: wsonGKjle26ku1kl36-BtH3UH_dy7s9A
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

The testcase uses event code "0x21c040" to verify
the settings for different fields in Monitor Mode Control
Register 1 (MMCR1). The fields include PMCxSEL, PMCXCOMB
PMCxUNIT, cache. Checks if these fields are translated
correctly via perf interface to MMCR1

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../powerpc/pmu/sampling_tests/Makefile       |  2 +-
 .../mmcr1_sel_unit_cache_test.c               | 77 +++++++++++++++++++
 2 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_sel_unit_cache_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
index ed9befc2f836..f966d3359c6b 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
@@ -7,7 +7,7 @@ TEST_GEN_PROGS := mmcr0_exceptionbits_test mmcr0_cc56run_test mmcr0_pmccext_test
 		   mmcr3_src_test mmcra_thresh_marked_sample_test mmcra_thresh_cmp_test \
 		   mmcra_bhrb_ind_call_test mmcra_bhrb_any_test mmcra_bhrb_cond_test \
 		   mmcra_bhrb_disable_test bhrb_no_crash_wo_pmu_test intr_regs_no_crash_wo_pmu_test \
-		   bhrb_filter_map_test
+		   bhrb_filter_map_test mmcr1_sel_unit_cache_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_sel_unit_cache_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_sel_unit_cache_test.c
new file mode 100644
index 000000000000..f0c003282630
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_sel_unit_cache_test.c
@@ -0,0 +1,77 @@
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
+#define MALLOC_SIZE     (0x10000 * 10)  /* Ought to be enough .. */
+
+/* The data cache was reloaded from local core's L3 due to a demand load */
+#define EventCode 0x21c040
+
+/*
+ * A perf sampling test for mmcr1
+ * fields : pmcxsel, unit, cache.
+ */
+static int mmcr1_sel_unit_cache(void)
+{
+	struct event event;
+	u64 *intr_regs;
+	char *p;
+	int i;
+
+	/* Check for platform support for the test */
+	SKIP_IF(check_pvr_for_sampling_tests());
+
+	p = malloc(MALLOC_SIZE);
+	FAIL_IF(!p);
+
+	/* Init the event for the sampling test */
+	event_init_sampling(&event, EventCode);
+	event.attr.sample_regs_intr = platform_extended_mask;
+	event.attr.sample_period = 1;
+	FAIL_IF(event_open(&event));
+	event.mmap_buffer = event_sample_buf_mmap(event.fd, 1);
+
+	event_enable(&event);
+
+	/* workload to make the event overflow */
+	for (i = 0; i < MALLOC_SIZE; i += 0x10000)
+		p[i] = i;
+
+	event_disable(&event);
+
+	/* Check for sample count */
+	FAIL_IF(!collect_samples(event.mmap_buffer));
+
+	intr_regs = get_intr_regs(&event, event.mmap_buffer);
+
+	/* Check for intr_regs */
+	FAIL_IF(!intr_regs);
+
+	/*
+	 * Verify that  pmcxsel, unit and cache field of MMCR1
+	 * match with corresponding event code fields
+	 */
+	FAIL_IF(EV_CODE_EXTRACT(event.attr.config, pmcxsel) !=
+			get_mmcr1_pmcxsel(get_reg_value(intr_regs, "MMCR1"), 1));
+	FAIL_IF(EV_CODE_EXTRACT(event.attr.config, unit) !=
+			get_mmcr1_unit(get_reg_value(intr_regs, "MMCR1"), 1));
+	FAIL_IF(EV_CODE_EXTRACT(event.attr.config, cache) !=
+			get_mmcr1_cache(get_reg_value(intr_regs, "MMCR1"), 1));
+
+	free(p);
+	event_close(&event);
+	return 0;
+}
+
+int main(void)
+{
+	FAIL_IF(test_harness(mmcr1_sel_unit_cache, "mmcr1_sel_unit_cache"));
+}
-- 
2.35.1

