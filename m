Return-Path: <linuxppc-dev+bounces-5114-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79510A0B068
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 08:59:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWl5v0QY5z2ywR;
	Mon, 13 Jan 2025 18:59:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736755170;
	cv=none; b=DkhRTGmHcjNeZjQ4iMp2ubXQGHU4AKwv8TSDaf4PPNg2dxA7XTCPEbciI8bmlbzIr3i2E9LnimiSCDo6Jiwt83G3gNhW1TgzT1Qlq84se7nhWHjNLYq5eH9VfWagRqKpp8jPo0AqHCaRiFM4E4+GmiqmUBfjf0FOe3rGlLDzza23ecpg3f19LVujk4gHNbYtRITtI27dqOLvMkogtlJ+I3CmhAXCUOs784F36sllxkdKRz3+i+iKaJwDcOZr/3lRBUyxW2n25pwWSRNrZV04w4wPM53Ww5MD9q+vPtyntIKdraI2guZO1aAJi7ZX12K0oEez61K0t8huIQf0IUnfkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736755170; c=relaxed/relaxed;
	bh=TotvjtltiUiPekMf3K3AMDyHf0K1DgRnryXD/cUDciw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OcnlkS03Nvy+qyt/96onUAzVRq/ISzLGDTAXZh5pn57/uo8px5Wjvl99uEGM6orGLv/LzL5d+XOYwB4Cg9BRZPw3lJQrD7uWC0WDlXMSSQ2NwJQov+PA9PxBJ3GP/l2oH3abHp7sqV1XM0J6eK5ekkTFWOf/asCjzzcDAv87/lQuIeEax0J1cZ8lmu/RNeIFXmdpFpArGf/riHDB/6If+rQmL4iV3ZSY9cyfXstmaQuj4JZ0vsHjGoUeTi5pDxSKD1sRAhn+MySkONq6bGDX3TwyZegja8CjBsfeBqL9UBCBlhfiUUY0io8rhwTukqFj6/bec/A/9/DuGPRUXUJxVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VE0gYBLE; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VE0gYBLE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWl5s6nPnz2yjb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 18:59:29 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D3tsmK006056
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=TotvjtltiUiPekMf3
	K3AMDyHf0K1DgRnryXD/cUDciw=; b=VE0gYBLE/XaPv/7s4S+2Ev6MjdUqQDHhh
	nGAgeaBz88YUsUsyfn0SJTTwA7dDOtSbQ6a9E8AJxnj6w0Olw7UQ0alFHb+HUyjq
	GBcVa30n5KEAizT2Q9Q+OZLjAABHX9VUScVD0issj63Q6QtM0zmgt25vpmUZXjc8
	nSup/TKoB01gfGq/Xy4p25A1ZojxSeZJo2aDZAxc8nNZwp407rzSEigaXKk4g4rK
	d7reET2RR+QeKJt9qY6pV2Ig4PDLkDavXf2HuRKSE6ju8QHeK9OhnbsC3qsRfDxG
	G1rATMExXx4gRcm2aDMmTpXM6jheDkCMj92bVp8wdtbiEdLeSMgwA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444uac0s42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:59:27 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50D46CV6016991
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:59:18 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4444fjw2p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:59:18 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50D7xEFs27001398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 07:59:14 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A40A920043;
	Mon, 13 Jan 2025 07:59:14 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6181820040;
	Mon, 13 Jan 2025 07:59:11 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.243.204])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jan 2025 07:59:10 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, hbathini@linux.ibm.com
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com
Subject: [PATCH V2 3/5] tools/testing/selftests/powerpc/pmu: Update comment description to mention ISA v3.1 for power10 and above
Date: Mon, 13 Jan 2025 13:28:56 +0530
Message-Id: <20250113075858.45137-3-atrajeev@linux.vnet.ibm.com>
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
X-Proofpoint-GUID: _3t8M6MOnoY2--Ec4MEjGVd63a9dFW73
X-Proofpoint-ORIG-GUID: _3t8M6MOnoY2--Ec4MEjGVd63a9dFW73
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130067
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Updated the comments in the pmu selftests to include
power11/ISA v3.1 where ever required.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
 v1 -> v2
 No code changes. Rebased to latest upstream

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


