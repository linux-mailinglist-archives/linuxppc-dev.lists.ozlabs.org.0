Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 334CE49DBAC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:32:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkskV0jSdz3fGY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 18:32:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EGMY3R7a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EGMY3R7a; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JksTg2K9qz3cPk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 18:21:43 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20R7CLvn001708; 
 Thu, 27 Jan 2022 07:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eWqwNZf4ERXERnHPSYDMNf0hhZNiCcyHBipAUNrVgTw=;
 b=EGMY3R7atdLaxwp/vXlplcMDWP4xwIFkiP0ZRPVM5IyYWKJ5Gq+MkZHPIJrIC9xyDrX2
 mRYUn9mXCcaI1O1SeOvsOEHWLTBlK6LGryUkoqIsP3bv2px6wCNbqkSMppJMJAZPuGUU
 6d8wjVfiyEYHJviP46ZTxABNMuCkGor8xgkDNVxkJpDlnX9Foxtl9HMMZGZp+R3SZVMQ
 JjsXH7h5JkNZ/qgBywt3Y3L4O9YuZWfX7uYVVTRrUp3qoYSGMbzMekdve5pNoX9aK1O+
 sfeUgqP9+TAeo++YfTaKZFKnstk2uljn8Py3z//DMQQEsLUNBS3bZljnY9nJSArjqwUP iw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dupt005hd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:38 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20R77u0d027694;
 Thu, 27 Jan 2022 07:21:37 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3dr9j9jn5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:36 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20R7LVB429950452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 07:21:32 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5AE64204B;
 Thu, 27 Jan 2022 07:21:31 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B16A242047;
 Thu, 27 Jan 2022 07:21:29 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.106.251])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jan 2022 07:21:29 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 16/20] selftest/powerpc/pmu/: Add selftest for mmcr1
 pmcxsel/unit/cache fields
Date: Thu, 27 Jan 2022 12:50:08 +0530
Message-Id: <20220127072012.662451-17-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127072012.662451-1-kjain@linux.ibm.com>
References: <20220127072012.662451-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YI8BZMFTnnkiiXR7dkRggnNE9GfY3BAN
X-Proofpoint-ORIG-GUID: YI8BZMFTnnkiiXR7dkRggnNE9GfY3BAN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_02,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270040
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

The testcase uses event code "0x1340000001c040" to verify
the settings for different fields in Monitor Mode Control
Register 1 (MMCR1). The fields include PMCxSEL, PMCXCOMB
PMCxUNIT, cache. Checks if these fields are translated
correctly via perf interface to MMCR1

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../powerpc/pmu/sampling_tests/Makefile       |  4 +-
 .../mmcr1_sel_unit_cache_test.c               | 70 +++++++++++++++++++
 2 files changed, 72 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_sel_unit_cache_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
index bb5ffd2e322d..345ad66bd1b2 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
@@ -3,7 +3,7 @@ include ../../../../../../scripts/Kbuild.include
 
 all: $(TEST_GEN_PROGS) mmcr0_exceptionbits_test.c mmcr0_cc56run_test.c mmcr0_pmccext_test.c \
 			mmcr0_pmcjce_test.c mmcr0_fc56_pmc1ce_test.c mmcr0_fc56_pmc56_test.c \
-			mmcr1_comb_test.c
+			mmcr1_comb_test.c mmcr1_sel_unit_cache_test.c
 
 noarg:
 	$(MAKE) -C ../../
@@ -16,7 +16,7 @@ no-pie-option := $(call try-run, echo 'int main() { return 0; }' | \
 
 TEST_GEN_PROGS := mmcr0_exceptionbits_test mmcr0_cc56run_test mmcr0_pmccext_test \
 		   mmcr0_pmcjce_test mmcr0_fc56_pmc1ce_test mmcr0_fc56_pmc56_test \
-		   mmcr1_comb_test
+		   mmcr1_comb_test mmcr1_sel_unit_cache_test
 
 LDFLAGS += $(no-pie-option)
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_sel_unit_cache_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_sel_unit_cache_test.c
new file mode 100644
index 000000000000..1a4d19c11017
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_sel_unit_cache_test.c
@@ -0,0 +1,70 @@
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
+extern void thirty_two_instruction_loop_with_ll_sc(u64 loops, u64 *ll_sc_target);
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
+	u64 dummy;
+
+	/* Check for platform support for the test */
+	SKIP_IF(check_pvr_for_sampling_tests());
+
+	/* Init the event for the sampling test */
+	event_init_sampling(&event, EventCode);
+	event.attr.sample_regs_intr = platform_extended_mask;
+	FAIL_IF(event_open(&event));
+	event.mmap_buffer = event_sample_buf_mmap(event.fd, 1);
+
+	event_enable(&event);
+
+	/* workload to make the event overflow */
+	thirty_two_instruction_loop_with_ll_sc(10000000, &dummy);
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
+			GET_MMCR_FIELD(1, get_reg_value(intr_regs, "MMCR1"), 1, pmcxsel));
+	FAIL_IF(EV_CODE_EXTRACT(event.attr.config, unit) !=
+			GET_MMCR_FIELD(1, get_reg_value(intr_regs, "MMCR1"), 1, unit));
+	FAIL_IF(EV_CODE_EXTRACT(event.attr.config, cache) !=
+			GET_MMCR_FIELD(1, get_reg_value(intr_regs, "MMCR1"), 1, cache));
+
+	event_close(&event);
+	return 0;
+}
+
+int main(void)
+{
+	FAIL_IF(test_harness(mmcr1_sel_unit_cache, "mmcr1_sel_unit_cache"));
+}
-- 
2.27.0

