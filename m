Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF9452E8B8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 11:24:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4LsS00NJz3dxH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:24:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z/+HFqQP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Z/+HFqQP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4LkW2Jbsz3bpY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 19:18:43 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K7ZHPu022524;
 Fri, 20 May 2022 09:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Ztn6+1CzfQFpj/C6joZPygKkbCVy4xRNhex/LYxLBAM=;
 b=Z/+HFqQPfkLTCZrZePpXTbmw2Zz1Dvzqj3CJiNZJcpOAqqs77V7sZlZx/dTA2GhX2GM1
 fkntY100ynzII+O18bdzE0TFRPiaOMEYILR0g7fjx/tpEo1sQCFx/fgnJpLAtTEMrbOc
 v9l3SnsNRca3MRBhGZV38gxIiFRy6rsKKqZlMaI4Mjd/2Bfvjz/w5hLCGrX9X99t7xiL
 zt/M+gNjwPqDQj9G7vyBmmONggi8lUVdNV4uda47KUbUwvLi5210oDmHxKmG1Wel1vla
 RWeFu0od6/VFSku1gbhi2LOUlzDqimbUYwE9p3xmXQ+YvRPVJQL/5fJDdR4noUNefWNX rA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g62qne6uj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:18:39 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24K9Et7E013040;
 Fri, 20 May 2022 09:18:37 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3g2428ybqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:18:37 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24K9IYJY22938056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 09:18:34 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B61F4C040;
 Fri, 20 May 2022 09:18:34 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3D8D4C044;
 Fri, 20 May 2022 09:18:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.31.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 09:18:30 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 09/35] selftest/powerpc/pmu: Refactor the platform check
 and add macros to find array size/PVR
Date: Fri, 20 May 2022 14:47:25 +0530
Message-Id: <20220520091751.17000-10-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
References: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uVDui3Er3nMWAe_x-BsIsrAIp0qbHIhz
X-Proofpoint-GUID: uVDui3Er3nMWAe_x-BsIsrAIp0qbHIhz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
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

The platform check for selftest support "check_pvr_for_sampling_tests"
is specific to sampling tests which includes PVR check, presence of
PMU and extended regs support. Extended regs support is needed for
sampling tests which tests whether PMU registers are programmed
correctly. There could be other sampling tests which may not need
extended regs, example, bhrb filter tests which only needs validity
check via event open.

Hence refactor the platform check to have a common function
"platform_check_for_tests" that checks only for PVR check
and presence of PMU. The existing function
"check_pvr_for_sampling_tests" will invoke the common function
and also will include checks for extended regs specific for
sampling. The common function can also be used by tests other
than sampling like event code tests.

Add macro to find array size ("ARRAY_SIZE") to sampling
tests "misc.h" file. This can be used in next tests to
find event array size. Also update "include/reg.h" to
add macros to find minor and major version from PVR which
will be used in testcases.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/testing/selftests/powerpc/include/reg.h |  4 ++++
 .../powerpc/pmu/sampling_tests/misc.c         | 20 +++++++++++++++----
 .../powerpc/pmu/sampling_tests/misc.h         |  3 +++
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/reg.h b/tools/testing/selftests/powerpc/include/reg.h
index c422be8a42b2..2ac7a4c7749c 100644
--- a/tools/testing/selftests/powerpc/include/reg.h
+++ b/tools/testing/selftests/powerpc/include/reg.h
@@ -55,6 +55,10 @@
 #define PVR_VER(pvr)	(((pvr) >>  16) & 0xFFFF)
 #define SPRN_PVR	0x11F
 
+#define PVR_CFG(pvr)    (((pvr) >>  8) & 0xF)   /* Configuration field */
+#define PVR_MAJ(pvr)    (((pvr) >>  4) & 0xF)   /* Major revision field */
+#define PVR_MIN(pvr)    (((pvr) >>  0) & 0xF)   /* Minor revision field */
+
 #define SPRN_DSCR_PRIV 0x11	/* Privilege State DSCR */
 #define SPRN_DSCR      0x03	/* Data Stream Control Register */
 #define SPRN_PPR       896	/* Program Priority Register */
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
index 045e6204fba6..98768856f678 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
@@ -121,12 +121,10 @@ int check_extended_regs_support(void)
 	return -1;
 }
 
-int check_pvr_for_sampling_tests(void)
+int platform_check_for_tests(void)
 {
 	pvr = PVR_VER(mfspr(SPRN_PVR));
 
-	platform_extended_mask = perf_get_platform_reg_mask();
-
 	/*
 	 * Check for supported platforms
 	 * for sampling test
@@ -138,19 +136,33 @@ int check_pvr_for_sampling_tests(void)
 	 * Check PMU driver registered by looking for
 	 * PPC_FEATURE2_EBB bit in AT_HWCAP2
 	 */
-	if (!have_hwcap2(PPC_FEATURE2_EBB))
+	if (!have_hwcap2(PPC_FEATURE2_EBB) || !have_hwcap2(PPC_FEATURE2_ARCH_3_00))
 		goto out;
 
+	return 0;
+
+out:
+	printf("%s: Tests un-supported for this platform\n", __func__);
+	return -1;
+}
+
+int check_pvr_for_sampling_tests(void)
+{
+	SKIP_IF(platform_check_for_tests());
+
+	platform_extended_mask = perf_get_platform_reg_mask();
 	/* check if platform supports extended regs */
 	if (check_extended_regs_support())
 		goto out;
 
 	init_ev_encodes();
 	return 0;
+
 out:
 	printf("%s: Sampling tests un-supported\n", __func__);
 	return -1;
 }
+
 /*
  * Allocate mmap buffer of "mmap_pages" number of
  * pages.
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
index 874a1596add8..4181755cf5a0 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
@@ -18,6 +18,8 @@
 #define MMCR1_RSQ       0x200000000000ULL /* radix scope qual field */
 #define BHRB_DISABLE    0x2000000000ULL /* MMCRA BHRB DISABLE bit */
 
+#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
+
 extern int ev_mask_pmcxsel, ev_shift_pmcxsel;
 extern int ev_mask_marked, ev_shift_marked;
 extern int ev_mask_comb, ev_shift_comb;
@@ -36,6 +38,7 @@ extern int ev_mask_mmcr3_src, ev_shift_mmcr3_src;
 extern int pvr;
 extern u64 platform_extended_mask;
 extern int check_pvr_for_sampling_tests(void);
+extern int platform_check_for_tests(void);
 
 /*
  * Event code field extraction macro.
-- 
2.35.1

