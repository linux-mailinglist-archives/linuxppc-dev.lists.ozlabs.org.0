Return-Path: <linuxppc-dev+bounces-4372-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EE99F9F19
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2024 08:38:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFbkR6fMjz2ymg;
	Sat, 21 Dec 2024 18:38:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734766719;
	cv=none; b=SYR+MPXk+fsoEJDLroEAGrQX521oq50R5gvUTF+6N/Zde2D3EUZZ9WNItbMi0/780EXdZMH3VFoQSnijUBn5o7OhAbHAlrlmCDSjpm7VswwXfQUyDLc4bHgK9UcJXPi/Fjsg+V3MGDDmFACHVTjf0XZyHybE8xFlOOo+szdp/AgdMwkdY1fVp2Fk0DH2y/REv40Ry88azvQ9ogi6mlB82y+G7beIg2nKTtDTC4cny/nahvhCFG5g2injYp8zbj6a3N+vioJM1w7+tZk8fOyDhD3YeamiYT3ucKmeKaGfjCiHQRNvHr5pAMfZ6qrPLGrQaHdsJTX1jS5WhuaWcJBGKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734766719; c=relaxed/relaxed;
	bh=8UIBfGyFcDPuHG3Owb9Fo6Ogao0KpnZYdnZWxHwj9rw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gPkruoBn4MbqJYK3zfogZuyiT5ClnVvod4o6gTplLOZ0mofx7muqDhtYlH5nOUpr9VAGTFUaY/YDQG4jh4QcI9wVV7G04pcSO6ZpM6LP7DvRd3cAC2XDMcF7E6L5StFwTwkvr/ZrbsqODcGug2fFmmfOBKTxa4vE5IJFnnMDiIT9UfB+aBjDXBjf4E+GRhyjgo88JzX8qM9jKlEMwvDMwTzOMRAzYFsK3mDoBRGB1+vNV8CJnEBis/wA4Ww5jKdcnewubhn/yJuwbmo5pNlIxdQmtw6+LQOrN8kgsxA8i9mKGMLUjpXHo4H+ZW0F+ly/7jCWeYhiczJcdI/uAzyGGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PM9n27aM; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PM9n27aM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFbkQ6VQNz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2024 18:38:38 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BL5HJS4003697;
	Sat, 21 Dec 2024 07:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=8UIBfGyFcDPuHG3Ow
	b9Fo6Ogao0KpnZYdnZWxHwj9rw=; b=PM9n27aMdoQxXpDb3UqD8OmkrVnNhVV/3
	r5eXPGEuJ9Vv6CtYpFfq5JOkNA6nhtaKgeWvSJCxcFx0kHIbJp2acpbLUNtrjL9J
	VaMrV3kdc6Sd1xCbC8XED50Ig9PivyjSIRzCk2jwGUcamiZy/b/hPiURaNQdyG3y
	vPwO/sXE/kq7cgI+dBWTetbfIsrliR42JhGgtyr+wMoTacznVo/hhhTvPJRnW0vV
	UMzu7b/YMxMZfze5He8dPdgeK+VOx9wC3Guxk/shdgHzN4bf/kyFiel6dKkxoat3
	OoDaH6xWE8jwmeNC7rUWIOtnlZctptp7vUoJF7HB6zf4OxYrSrr+A==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43nqd1ra1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 07:38:36 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BL3l8o2024022;
	Sat, 21 Dec 2024 07:38:36 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43hnukwpvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 07:38:35 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BL7cVNs11338070
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 21 Dec 2024 07:38:31 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9944220043;
	Sat, 21 Dec 2024 07:38:31 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC49620040;
	Sat, 21 Dec 2024 07:38:27 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.244.52])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 21 Dec 2024 07:38:27 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, hbathini@linux.ibm.com
Cc: linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com,
        kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com
Subject: [PATCH 3/4] tools/testing/selftests/powerpc/pmu: Update comment description to mention ISA v3.1 for power10 and above
Date: Sat, 21 Dec 2024 13:08:09 +0530
Message-Id: <20241221073810.65802-3-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20241221073810.65802-1-atrajeev@linux.vnet.ibm.com>
References: <20241221073810.65802-1-atrajeev@linux.vnet.ibm.com>
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
X-Proofpoint-GUID: SQB-EUm_plXvknwv_9wJLkkSjcPcSjbp
X-Proofpoint-ORIG-GUID: SQB-EUm_plXvknwv_9wJLkkSjcPcSjbp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412210063
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Updated the comments in the pmu selftests to include
power11/ISA v3.1 where ever required.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../event_code_tests/group_constraint_l2l3_sel_test.c  |  2 +-
 .../group_constraint_radix_scope_qual_test.c           |  2 +-
 .../group_constraint_thresh_cmp_test.c                 |  2 +-
 .../pmu/event_code_tests/invalid_event_code_test.c     |  4 ++--
 .../reserved_bits_mmcra_sample_elig_mode_test.c        |  2 +-
 .../powerpc/pmu/sampling_tests/bhrb_filter_map_test.c  | 10 +++++-----
 .../powerpc/pmu/sampling_tests/mmcra_bhrb_cond_test.c  |  2 +-
 .../sampling_tests/mmcra_bhrb_disable_no_branch_test.c |  2 +-
 .../pmu/sampling_tests/mmcra_bhrb_disable_test.c       |  2 +-
 .../pmu/sampling_tests/mmcra_bhrb_ind_call_test.c      |  2 +-
 10 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_l2l3_sel_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_l2l3_sel_test.c
index 85a636886069..e3c7a0c071e2 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_l2l3_sel_test.c
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_l2l3_sel_test.c
@@ -30,7 +30,7 @@ static int group_constraint_l2l3_sel(void)
 
 	/*
 	 * Check for platform support for the test.
-	 * This test is only aplicable on power10
+	 * This test is only aplicable on ISA v3.1
 	 */
 	SKIP_IF(platform_check_for_tests());
 	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_1));
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_radix_scope_qual_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_radix_scope_qual_test.c
index 9225618b846a..9233175787cc 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_radix_scope_qual_test.c
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_radix_scope_qual_test.c
@@ -26,7 +26,7 @@ static int group_constraint_radix_scope_qual(void)
 
 	/*
 	 * Check for platform support for the test.
-	 * This test is aplicable on power10 only.
+	 * This test is aplicable on ISA v3.1 only.
 	 */
 	SKIP_IF(platform_check_for_tests());
 	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_1));
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_cmp_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_cmp_test.c
index 9f1197104e8c..4b69e7214c0b 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_cmp_test.c
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_cmp_test.c
@@ -25,7 +25,7 @@
 /*
  * Testcase for group constraint check of thresh_cmp bits which is
  * used to program thresh compare field in Monitor Mode Control Register A
- * (MMCRA: 9-18 bits for power9 and MMCRA: 8-18 bits for power10).
+ * (MMCRA: 9-18 bits for power9 and MMCRA: 8-18 bits for power10/power11).
  * All events in the group should match thresh compare bits otherwise
  * event_open for the group will fail.
  */
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/invalid_event_code_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/invalid_event_code_test.c
index f51fcab837fc..88aa7fd64ec1 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/invalid_event_code_test.c
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/invalid_event_code_test.c
@@ -20,7 +20,7 @@
  * Some of the bits in the event code is
  * reserved for specific platforms.
  * Event code bits 52-59 are reserved in power9,
- * whereas in power10, these are used for programming
+ * whereas in ISA v3.1, these are used for programming
  * Monitor Mode Control Register 3 (MMCR3).
  * Bit 9 in event code is reserved in power9,
  * whereas it is used for programming "radix_scope_qual"
@@ -39,7 +39,7 @@ static int invalid_event_code(void)
 
 	/*
 	 * Events using MMCR3 bits and radix scope qual bits
-	 * should fail in power9 and should succeed in power10.
+	 * should fail in power9 and should succeed in power10 ( ISA v3.1 )
 	 * Init the events and check for pass/fail in event open.
 	 */
 	if (have_hwcap2(PPC_FEATURE2_ARCH_3_1)) {
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_sample_elig_mode_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_sample_elig_mode_test.c
index 7bb26a232fbe..757f454c0dc0 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_sample_elig_mode_test.c
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_sample_elig_mode_test.c
@@ -57,7 +57,7 @@ static int reserved_bits_mmcra_sample_elig_mode(void)
 
 	/*
 	 * MMCRA Random Sampling Mode (SM) value 0x10
-	 * is reserved in power10 and 0xC is reserved in
+	 * is reserved in power10/power11 and 0xC is reserved in
 	 * power9.
 	 */
 	if ((pvr == POWER10) || (pvr == POWER11)) {
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
index 64ab9784f9b1..3ad71d49ae65 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
@@ -14,7 +14,7 @@
  * A perf sampling test to check bhrb filter
  * map. All the branch filters are not supported
  * in powerpc. Supported filters in:
- * power10: any, any_call, ind_call, cond
+ * power10/power11: any, any_call, ind_call, cond
  * power9: any, any_call
  *
  * Testcase checks event open for invalid bhrb filter
@@ -24,13 +24,13 @@
  */
 
 /* Invalid types for powerpc */
-/* Valid bhrb filters in power9/power10 */
+/* Valid bhrb filters in power9/power10/power11 */
 int bhrb_filter_map_valid_common[] = {
 	PERF_SAMPLE_BRANCH_ANY,
 	PERF_SAMPLE_BRANCH_ANY_CALL,
 };
 
-/* Valid bhrb filters in power10 */
+/* Valid bhrb filters in power10/power11 */
 int bhrb_filter_map_valid_p10[] = {
 	PERF_SAMPLE_BRANCH_IND_CALL,
 	PERF_SAMPLE_BRANCH_COND,
@@ -69,7 +69,7 @@ static int bhrb_filter_map_test(void)
 		FAIL_IF(!event_open(&event));
 	}
 
-	/* valid filter maps for power9/power10 which are expected to pass in event_open */
+	/* valid filter maps for power9/power10/power11 which are expected to pass in event_open */
 	for (i = 0; i < ARRAY_SIZE(bhrb_filter_map_valid_common); i++) {
 		event.attr.branch_sample_type = bhrb_filter_map_valid_common[i];
 		FAIL_IF(event_open(&event));
@@ -77,7 +77,7 @@ static int bhrb_filter_map_test(void)
 	}
 
 	/*
-	 * filter maps which are valid in power10 and invalid in power9.
+	 * filter maps which are valid in power10/power11 and invalid in power9.
 	 * PVR check is used here since PMU specific data like bhrb filter
 	 * alternative tests is handled by respective PMU driver code and
 	 * using PVR will work correctly for all cases including generic
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_cond_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_cond_test.c
index 3e08176eb7f8..809de8d58b3b 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_cond_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_cond_test.c
@@ -29,7 +29,7 @@ static int mmcra_bhrb_cond_test(void)
 
 	/*
 	 * Check for platform support for the test.
-	 * This test is only aplicable on power10
+	 * This test is only aplicable on ISA v3.1
 	 */
 	SKIP_IF(check_pvr_for_sampling_tests());
 	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_1));
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_no_branch_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_no_branch_test.c
index 488c865387e4..fa0dc15f9123 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_no_branch_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_no_branch_test.c
@@ -26,7 +26,7 @@ static int mmcra_bhrb_disable_no_branch_test(void)
 
 	/*
 	 * Check for platform support for the test.
-	 * This test is only aplicable on power10
+	 * This test is only aplicable on ISA v3.1
 	 */
 	SKIP_IF(check_pvr_for_sampling_tests());
 	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_1));
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_test.c
index 186a853c0f62..bc3161ab003d 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_test.c
@@ -26,7 +26,7 @@ static int mmcra_bhrb_disable_test(void)
 
 	/*
 	 * Check for platform support for the test.
-	 * This test is only aplicable on power10
+	 * This test is only aplicable on ISA v3.1
 	 */
 	SKIP_IF(check_pvr_for_sampling_tests());
 	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_1));
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_ind_call_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_ind_call_test.c
index f0706730c099..fd6c9f12212c 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_ind_call_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_ind_call_test.c
@@ -29,7 +29,7 @@ static int mmcra_bhrb_ind_call_test(void)
 
 	/*
 	 * Check for platform support for the test.
-	 * This test is only aplicable on power10
+	 * This test is only aplicable on ISA v3.1
 	 */
 	SKIP_IF(check_pvr_for_sampling_tests());
 	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_1));
-- 
2.43.5


