Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C3851D3B6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:51:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvknH45Wzz3cBR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 18:51:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M/jKoygW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=M/jKoygW; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kvkgk5yCZz3c9y
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 18:46:26 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2468C9aX018375;
 Fri, 6 May 2022 08:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CASs9Xl1CrLls//3clSENTzKqxp8McvaLESSqhENAps=;
 b=M/jKoygWIYM1TX7EMtm5zFQQNSDfOaURoviVh3dwwC2payneX4GCiLEPfCeNNHUevoY1
 RkQWQYU1lFH3Ox22ldV73SF3D63nX+OuMucIV5YEGuna3QZO6fzGAZeNGyKpLO5KK+m7
 E3FEnBR5koEytG2FvAGpDew/HsLof9ESrCTtLzjXcdDHTs5UzpUxYiXa6ikAoYz6AlP4
 jQfLbUXIQCPeXLnXEHxPXr2UXe49FxW8CHDCb9pAwLS4084aM2EJy/XWJDhL6nOI0sIk
 /zFeEiDQAJseRsTkQ38kZ9vzxcAtCbns0ND1Q4wiiTZKYAwDCPh7M3lE1/3q/Oe1fo9H gw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvyxugmu5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:46:22 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2468hgAf012017;
 Fri, 6 May 2022 08:46:20 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3fuyn79tdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:46:20 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2468kHbK46399780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 08:46:17 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79FA74C04A;
 Fri,  6 May 2022 08:46:17 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 612524C040;
 Fri,  6 May 2022 08:46:15 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.19.224]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 08:46:15 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/35] selftest/powerpc/pmu: Refactor the platform check and
 add macros to find array size/PVR
Date: Fri,  6 May 2022 14:15:18 +0530
Message-Id: <20220506084544.56527-10-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220506084544.56527-1-kjain@linux.ibm.com>
References: <20220506084544.56527-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y1kUl5nL--C551qFyWfA_f_vCzzBVF2M
X-Proofpoint-GUID: y1kUl5nL--C551qFyWfA_f_vCzzBVF2M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_03,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060045
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
index 2562d8439d7d..facd6266b203 100644
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
2.31.1

