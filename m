Return-Path: <linuxppc-dev+bounces-5117-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C16BA0B06B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 08:59:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWl630C0tz30Wm;
	Mon, 13 Jan 2025 18:59:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736755178;
	cv=none; b=S01Mq4SXwh2R6GAUfYS1FlaLUUsAZeCVHcCvFn3/INN7f7wOvZDZI9rynIIIhC7DzbY8qcX74JCmiK2f+YGzoHT3Kz0K0FEBaEtG2kw2N0zTnBgsBq791XnImAbDOOMWmfmPtRUA4cBuD3L/kMfVw6F0ufTMv6PW8QuVyai2qxQHeCULRCpdWxYPx15sCFy9aBCXy9/UEa3NWblqMOzl0uB4/A0cSr+QKHmzLSn7WlReBT/CG9VuLZ3+XR1r4cJDG+6QsAQVN1PmA7ylzBSoPiAtObobdNIWanGIke3cR/OJPfERVkpAQK5DM+r+7QSKHR248cQ0ScdYgyCEK5fLXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736755178; c=relaxed/relaxed;
	bh=84YP+CTiRx5lz1Aa7WeDQN/rKTuglH6hm08Hil64UPo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mZADTPJXssf0DT+kMzK8S9u0JsQ+qg3imSC1XhqiHgDmJHgp8tIEm32dpNIEdJ2BUtN5fdTWU7FKKUlDrNRVERt46AxVITuL/fnc8OM/Nry3yK56kO+ZYuvFIqO6QFiE8hVtTTkqz2gUHMN4KAzRfryFVqi6g2uks3lBkUD112/dPe6OXolOnCElThTCzceHPe5ZZejCtZK2RPPHzCYIjyjrAHCBsBVTj8k1/Lcm2cgSDTHdPrbNVkUmBx6pNfzBsSygqt29O6zWY0g/CBalh/30uWWsjVOTkwZHtpbuuXVIEmgCwI+9MYMDwcyWoHXcofusQoeqn5H+qmTJqnmYuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bNjfTHlf; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bNjfTHlf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWl613QHhz2yGC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 18:59:37 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50CKkLVE002103
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=84YP+CTiRx5lz1Aa7
	WeDQN/rKTuglH6hm08Hil64UPo=; b=bNjfTHlfg6gs801T38dPzRJn/pPpWzDuY
	6DGPgle4vTCsfRnRG9d1Qtl//SqTLn+T1s0n8Xf2ukWmj/jcA/2Zs1PhjTTyDdsi
	BwoirYaEXpyXk5SX2SCz3cl1VZp5gNZvE7dUJv0hFPl3C9Cz+Zj3y8nrUWeBGC2S
	aj0Wg4ISIkqt+7zvGuLpxsQ2lgCySnRNvCaQDm3fG30CYP5Q9nFfZDwPeAAdFvFB
	QCYZIl1fw+8HfLfVA3Bs9CeWpnMSng2LLLweqGAZW4iwNwr1xL2iSJvBgMJ+EvtR
	x5sC1QLUW0+y/Xr5EMCDOwud5YUWK635EknF7O16GHWZ8lSj7SsTg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4449x2bas6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:59:32 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50D7euTl002689
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:59:22 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4443bxw92a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:59:22 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50D7xIa149807816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 07:59:18 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9C3520040;
	Mon, 13 Jan 2025 07:59:18 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C6762004B;
	Mon, 13 Jan 2025 07:59:15 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.243.204])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jan 2025 07:59:15 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, hbathini@linux.ibm.com
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com
Subject: [PATCH V2 4/5] selftests/powerpc/pmu: Add interface test for extended reg support
Date: Mon, 13 Jan 2025 13:28:57 +0530
Message-Id: <20250113075858.45137-4-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20250113075858.45137-1-atrajeev@linux.vnet.ibm.com>
References: <20250113075858.45137-1-atrajeev@linux.vnet.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1Se7rr1kxiT4AXgAZZQsypBLIDTWk3EL
X-Proofpoint-ORIG-GUID: 1Se7rr1kxiT4AXgAZZQsypBLIDTWk3EL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130067
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Kajol Jain <kjain@linux.ibm.com>

The testcase uses check_extended_regs_support and
perf_get_platform_reg_mask function to check if the
platform has extended reg support. This will help to
check if sampling pmu selftest is enabled or not for
a given platform.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
 v1 -> v2
 No code changes. Rebased to latest upstream

 .../powerpc/pmu/sampling_tests/Makefile       |  3 +-
 .../sampling_tests/check_extended_reg_test.c  | 35 +++++++++++++++++++
 .../powerpc/pmu/sampling_tests/misc.c         |  2 +-
 .../powerpc/pmu/sampling_tests/misc.h         |  2 ++
 4 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/check_extended_reg_test.c

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
index 9f79bec5fce7..0c4ed299c3b8 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
@@ -5,7 +5,8 @@ TEST_GEN_PROGS := mmcr0_exceptionbits_test mmcr0_cc56run_test mmcr0_pmccext_test
 		   mmcr3_src_test mmcra_thresh_marked_sample_test mmcra_thresh_cmp_test \
 		   mmcra_bhrb_ind_call_test mmcra_bhrb_any_test mmcra_bhrb_cond_test \
 		   mmcra_bhrb_disable_test bhrb_no_crash_wo_pmu_test intr_regs_no_crash_wo_pmu_test \
-		   bhrb_filter_map_test mmcr1_sel_unit_cache_test mmcra_bhrb_disable_no_branch_test
+		   bhrb_filter_map_test mmcr1_sel_unit_cache_test mmcra_bhrb_disable_no_branch_test \
+		   check_extended_reg_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/check_extended_reg_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/check_extended_reg_test.c
new file mode 100644
index 000000000000..865bc69f920c
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/check_extended_reg_test.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2024, Kajol Jain, IBM Corp.
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
+ * A perf sampling test to check extended
+ * reg support.
+ */
+static int check_extended_reg_test(void)
+{
+	/* Check for platform support for the test */
+	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_00));
+
+	 /* Skip for Generic compat PMU */
+	SKIP_IF(check_for_generic_compat_pmu());
+
+	/* Check if platform supports extended regs */
+	platform_extended_mask = perf_get_platform_reg_mask();
+	FAIL_IF(check_extended_regs_support());
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(check_extended_reg_test, "check_extended_reg_test");
+}
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
index c52d8bc2a5dc..1ba675802ee9 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
@@ -92,7 +92,7 @@ static void init_ev_encodes(void)
 }
 
 /* Return the extended regs mask value */
-static u64 perf_get_platform_reg_mask(void)
+u64 perf_get_platform_reg_mask(void)
 {
 	if (have_hwcap2(PPC_FEATURE2_ARCH_3_1))
 		return PERF_POWER10_MASK;
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
index 09c5abe237af..357e9f0fc0f7 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
@@ -39,6 +39,8 @@ extern int pvr;
 extern u64 platform_extended_mask;
 extern int check_pvr_for_sampling_tests(void);
 extern int platform_check_for_tests(void);
+extern int check_extended_regs_support(void);
+extern u64 perf_get_platform_reg_mask(void);
 
 /*
  * Event code field extraction macro.
-- 
2.43.5


