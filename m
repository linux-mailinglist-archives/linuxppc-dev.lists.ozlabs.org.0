Return-Path: <linuxppc-dev+bounces-5118-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B01A4A0B06C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 08:59:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWl632Z3sz3c3x;
	Mon, 13 Jan 2025 18:59:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736755179;
	cv=none; b=mb8dMIQ488PaMRCdrTGoMlo0Y2v+tNEw3Zu3890s8RMfzNV6EGAcpxRiEj5RjgLY0Gb2+1Z6FY6R0k1qF7AA2dpSenRcyexXborrUYK6ZieERQcM6Z5g2nHyLalSZYH6Jxw7aJAVvs/k6FEjJoAGUcwIg+NCEFDAggHU5ZObjrEOvuE1VI/9dvVx+gvXozYMKOBGUu9TAhg4aFz8B1AoaxL9xy5EX+BJzoNDU0YS3W+nDTN7jwM2Nyv8aiKM9ryPa7d4zN1WA0ID8Vyu7ZeucLMWQsGtQvWafN+82AOjd6G/2vwRxf9q00Sfrw4ShVESCkK/2dYvbVABnK/pIpBmrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736755179; c=relaxed/relaxed;
	bh=noQaMQG0jzXojHfkY/L/6VFeevQL44ToniHzsNWtHUI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K4Gfg+D+kkbgLicscfpkYnXrdkQ8VzgDKW0NRzhPsMPZoMJUso0OT7lQBkfQu1wAoWYGmHS32JS+Q0z4K+AuxenzzNvf28fbh6WxqWDxX5cBj+bbFoJmLcPjYCWoYNf/b8oRu7xpfqxFwaiPLrWk5DMrtOdxTte7/SC8p4NTwjNJiywA1uO4mX49RfpMWJjx37DJAk4CyPoRzinK3ANzRuiPY5ToeD0s/b8hB1BK0tICK4pSJ82/C2Im6N6CO26EDjUJTpaahd+ThOsg7dUwKVMJTn1nWO2H+sAtR/lAfyMgPjGib6uGknFhM/M3ry9nrkpWEfi1rCFSu+MG0ZSsQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IA5f9SJM; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IA5f9SJM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWl614ZGHz30Pp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 18:59:37 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50CNbQTp024304
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=noQaMQG0jzXojHfkY/L/6VFeevQL44ToniHzsNWtH
	UI=; b=IA5f9SJMXIpNt1qDHXNrcTCkqzt2/A0ez6ZfxjkQodtRk3kaxfux35k/x
	9Ru72hQ0Hp2reTH2huNHl1OHzpGRlW+qC3X//1mhP3BUw6/6XfDhcuNLHrKAmHWb
	aE3Sh2QddXjcFp9fTae47TLZfQ9408mpjR5szwO/jgI/krqLbjBJUmXRYNAmDO7q
	RCbUjGAPZMH3K6FqjL90hexwxXIPPZpD9IagJJvLkMsF2sHnHPBUm7OiXOxAeb/U
	Nq8yXJKjUUu1bM6FPNOKjwcTPGuys6Sr8MjFw/CeNWjDPwke51Y2EZEVIWxwFb3v
	u2PWbym1aTdD8pAQZmM/sv2Vxhpdw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444qjahbww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:59:32 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50D79fQ0004576
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:59:10 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4442ysdbnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:59:10 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50D7x6Vv57344402
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 07:59:06 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9558F2005A;
	Mon, 13 Jan 2025 07:59:06 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E5FE2004B;
	Mon, 13 Jan 2025 07:59:03 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.243.204])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jan 2025 07:59:03 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, hbathini@linux.ibm.com
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com
Subject: [PATCH V2 1/5] tools/testing/selftests/powerpc: Enable pmu selftests for power11
Date: Mon, 13 Jan 2025 13:28:54 +0530
Message-Id: <20250113075858.45137-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
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
X-Proofpoint-GUID: yGx9wIltqyl7-WieNFP7Jf4O7FFUNhDY
X-Proofpoint-ORIG-GUID: yGx9wIltqyl7-WieNFP7Jf4O7FFUNhDY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130067
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add check for power11 pvr in the selftest utility
functions. Selftests uses pvr value to check for platform
support inorder to run the tests. pvr is also used to
send the extended mask value to capture sampling registers.

Update some of the utility functions to use hwcap2 inorder
to return platform specific bits from sampling registers.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
 v1 -> v2
 No code changes. Rebased to latest upstream

 .../selftests/powerpc/pmu/sampling_tests/misc.c       | 11 ++++++++++-
 .../selftests/powerpc/pmu/sampling_tests/misc.h       | 10 ++++++----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
index eac6420abdf1..c52d8bc2a5dc 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
@@ -59,6 +59,7 @@ static void init_ev_encodes(void)
 	ev_shift_thd_stop = 32;
 
 	switch (pvr) {
+	case POWER11:
 	case POWER10:
 		ev_mask_thd_cmp = 0x3ffff;
 		ev_shift_thd_cmp = 0;
@@ -129,8 +130,14 @@ int platform_check_for_tests(void)
 	 * Check for supported platforms
 	 * for sampling test
 	 */
-	if ((pvr != POWER10) && (pvr != POWER9))
+	switch (pvr) {
+	case POWER11:
+	case POWER10:
+	case POWER9:
+		break;
+	default:
 		goto out;
+	}
 
 	/*
 	 * Check PMU driver registered by looking for
@@ -499,6 +506,8 @@ static bool auxv_generic_compat_pmu(void)
 		base_pvr = POWER9;
 	else if (!strcmp(auxv_base_platform(), "power10"))
 		base_pvr = POWER10;
+	else if (!strcmp(auxv_base_platform(), "power11"))
+		base_pvr = POWER11;
 
 	return (!base_pvr);
 }
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
index 64e25cce1435..09c5abe237af 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
@@ -8,10 +8,12 @@
 #include <sys/stat.h>
 #include "../event.h"
 
+#define POWER11 0x82
 #define POWER10 0x80
 #define POWER9  0x4e
 #define PERF_POWER9_MASK        0x7f8ffffffffffff
 #define PERF_POWER10_MASK       0x7ffffffffffffff
+#define PERF_POWER11_MASK       PERF_POWER10_MASK
 
 #define MMCR0_FC56      0x00000010UL /* freeze counters 5 and 6 */
 #define MMCR0_PMCCEXT   0x00000200UL /* PMCCEXT control */
@@ -165,21 +167,21 @@ static inline int get_mmcr2_fcta(u64 mmcr2, int pmc)
 
 static inline int get_mmcr2_l2l3(u64 mmcr2, int pmc)
 {
-	if (pvr == POWER10)
+	if (have_hwcap2(PPC_FEATURE2_ARCH_3_1))
 		return ((mmcr2 & 0xf8) >> 3);
 	return 0;
 }
 
 static inline int get_mmcr3_src(u64 mmcr3, int pmc)
 {
-	if (pvr != POWER10)
+	if (!have_hwcap2(PPC_FEATURE2_ARCH_3_1))
 		return 0;
 	return ((mmcr3 >> ((49 - (15 * ((pmc) - 1))))) & 0x7fff);
 }
 
 static inline int get_mmcra_thd_cmp(u64 mmcra, int pmc)
 {
-	if (pvr == POWER10)
+	if (have_hwcap2(PPC_FEATURE2_ARCH_3_1))
 		return ((mmcra >> 45) & 0x7ff);
 	return ((mmcra >> 45) & 0x3ff);
 }
@@ -191,7 +193,7 @@ static inline int get_mmcra_sm(u64 mmcra, int pmc)
 
 static inline u64 get_mmcra_bhrb_disable(u64 mmcra, int pmc)
 {
-	if (pvr == POWER10)
+	if (have_hwcap2(PPC_FEATURE2_ARCH_3_1))
 		return mmcra & BHRB_DISABLE;
 	return 0;
 }
-- 
2.43.5


