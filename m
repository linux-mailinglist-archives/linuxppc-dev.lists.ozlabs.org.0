Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABF835C25B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 12:00:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJkl430XYz3bv8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 20:00:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=59.111.176.35; helo=mail-m17635.qiye.163.com;
 envelope-from=wanjiabing@vivo.com; receiver=<UNKNOWN>)
Received: from mail-m17635.qiye.163.com (mail-m17635.qiye.163.com
 [59.111.176.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJkkj4MSrz309w
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 20:00:20 +1000 (AEST)
Received: from wanjb-KLV-WX9.. (unknown [123.131.141.119])
 by mail-m17635.qiye.163.com (Hmail) with ESMTPA id 5C287400351;
 Mon, 12 Apr 2021 18:00:10 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Shuah Khan <shuah@kernel.org>,
 Jordan Niethe <jniethe5@gmail.com>, Michael Neuling <mikey@neuling.org>,
 Wan Jiabing <wanjiabing@vivo.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: alignment: Remove unneeded variables
Date: Mon, 12 Apr 2021 17:59:21 +0800
Message-Id: <20210412095923.3916-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGUJDHlYaGB5NH0lKQ0hIT0lVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PRQ6Szo*DD8JSx88MAkpEgsc
 CDxPFDZVSlVKTUpDSUlKTUpKSU9LVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlK
 SUhVSkhKVUpPSlVKSkJZV1kIAVlBTElCQzcG
X-HM-Tid: 0a78c58636eed991kuws5c287400351
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
Cc: kael_w@yeah.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix coccicheck warning:

./tools/testing/selftests/powerpc/alignment/alignment_handler.c:539:5-7:
Unneeded variable: "rc". Return "0" on line 562
./tools/testing/selftests/powerpc/alignment/alignment_handler.c:567:5-7:
Unneeded variable: "rc". Return "0" on line 580
./tools/testing/selftests/powerpc/alignment/alignment_handler.c:585:5-7:
Unneeded variable: "rc". Return "0" on line 594
./tools/testing/selftests/powerpc/alignment/alignment_handler.c:600:5-7:
Unneeded variable: "rc". Return "0" on line 611
./tools/testing/selftests/powerpc/alignment/alignment_handler.c:416:5-7:
Unneeded variable: "rc". Return "0" on line 470
./tools/testing/selftests/powerpc/alignment/alignment_handler.c:475:5-7:
Unneeded variable: "rc". Return "0" on line 485
./tools/testing/selftests/powerpc/alignment/alignment_handler.c:490:5-7:
Unneeded variable: "rc". Return "0" on line 506
./tools/testing/selftests/powerpc/alignment/alignment_handler.c:511:5-7:
Unneeded variable: "rc". Return "0" on line 534
./tools/testing/selftests/powerpc/alignment/alignment_handler.c:331:5-7:
Unneeded variable: "rc". Return "0" on line 344
./tools/testing/selftests/powerpc/alignment/alignment_handler.c:349:5-7:
Unneeded variable: "rc". Return "0" on line 360
./tools/testing/selftests/powerpc/alignment/alignment_handler.c:365:5-7:
Unneeded variable: "rc". Return "0" on line 392
./tools/testing/selftests/powerpc/alignment/alignment_handler.c:397:5-7:
Unneeded variable: "rc". Return "0" on line 411

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 .../powerpc/alignment/alignment_handler.c     | 48 +++++--------------
 1 file changed, 12 insertions(+), 36 deletions(-)

diff --git a/tools/testing/selftests/powerpc/alignment/alignment_handler.c b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
index c25cf7cd45e9..48bfb7b36d84 100644
--- a/tools/testing/selftests/powerpc/alignment/alignment_handler.c
+++ b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
@@ -328,8 +328,6 @@ static bool can_open_cifile(void)
 
 int test_alignment_handler_vsx_206(void)
 {
-	int rc = 0;
-
 	SKIP_IF(!can_open_cifile());
 	SKIP_IF(!have_hwcap(PPC_FEATURE_ARCH_2_06));
 
@@ -341,13 +339,11 @@ int test_alignment_handler_vsx_206(void)
 	STORE_VSX_XFORM_TEST(stxvd2x);
 	STORE_VSX_XFORM_TEST(stxvw4x);
 	STORE_VSX_XFORM_TEST(stxsdx);
-	return rc;
+	return 0;
 }
 
 int test_alignment_handler_vsx_207(void)
 {
-	int rc = 0;
-
 	SKIP_IF(!can_open_cifile());
 	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_2_07));
 
@@ -357,13 +353,11 @@ int test_alignment_handler_vsx_207(void)
 	LOAD_VSX_XFORM_TEST(lxsiwzx);
 	STORE_VSX_XFORM_TEST(stxsspx);
 	STORE_VSX_XFORM_TEST(stxsiwx);
-	return rc;
+	return 0;
 }
 
 int test_alignment_handler_vsx_300(void)
 {
-	int rc = 0;
-
 	SKIP_IF(!can_open_cifile());
 
 	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_00));
@@ -389,13 +383,11 @@ int test_alignment_handler_vsx_300(void)
 	STORE_VSX_XFORM_TEST(stxvx);
 	STORE_VSX_XFORM_TEST(stxvl);
 	STORE_VSX_XFORM_TEST(stxvll);
-	return rc;
+	return 0;
 }
 
 int test_alignment_handler_vsx_prefix(void)
 {
-	int rc = 0;
-
 	SKIP_IF(!can_open_cifile());
 	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_1));
 
@@ -408,13 +400,11 @@ int test_alignment_handler_vsx_prefix(void)
 	STORE_VSX_8LS_PREFIX_TEST(PSTXSSP, 0);
 	STORE_VSX_8LS_PREFIX_TEST(PSTXV0, 0);
 	STORE_VSX_8LS_PREFIX_TEST(PSTXV1, 1);
-	return rc;
+	return 0;
 }
 
 int test_alignment_handler_integer(void)
 {
-	int rc = 0;
-
 	SKIP_IF(!can_open_cifile());
 
 	printf("Integer\n");
@@ -467,13 +457,11 @@ int test_alignment_handler_integer(void)
 	STORE_DFORM_TEST(stmw);
 #endif
 
-	return rc;
+	return 0;
 }
 
 int test_alignment_handler_integer_206(void)
 {
-	int rc = 0;
-
 	SKIP_IF(!can_open_cifile());
 	SKIP_IF(!have_hwcap(PPC_FEATURE_ARCH_2_06));
 
@@ -482,13 +470,11 @@ int test_alignment_handler_integer_206(void)
 	LOAD_XFORM_TEST(ldbrx);
 	STORE_XFORM_TEST(stdbrx);
 
-	return rc;
+	return 0;
 }
 
 int test_alignment_handler_integer_prefix(void)
 {
-	int rc = 0;
-
 	SKIP_IF(!can_open_cifile());
 	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_1));
 
@@ -503,13 +489,11 @@ int test_alignment_handler_integer_prefix(void)
 	STORE_MLS_PREFIX_TEST(PSTH);
 	STORE_MLS_PREFIX_TEST(PSTW);
 	STORE_8LS_PREFIX_TEST(PSTD);
-	return rc;
+	return 0;
 }
 
 int test_alignment_handler_vmx(void)
 {
-	int rc = 0;
-
 	SKIP_IF(!can_open_cifile());
 	SKIP_IF(!have_hwcap(PPC_FEATURE_HAS_ALTIVEC));
 
@@ -531,13 +515,11 @@ int test_alignment_handler_vmx(void)
 	STORE_VMX_XFORM_TEST(stvehx);
 	STORE_VMX_XFORM_TEST(stvewx);
 	STORE_VMX_XFORM_TEST(stvxl);
-	return rc;
+	return 0;
 }
 
 int test_alignment_handler_fp(void)
 {
-	int rc = 0;
-
 	SKIP_IF(!can_open_cifile());
 
 	printf("Floating point\n");
@@ -559,13 +541,11 @@ int test_alignment_handler_fp(void)
 	STORE_FLOAT_XFORM_TEST(stfsux);
 	STORE_FLOAT_XFORM_TEST(stfiwx);
 
-	return rc;
+	return 0;
 }
 
 int test_alignment_handler_fp_205(void)
 {
-	int rc = 0;
-
 	SKIP_IF(!can_open_cifile());
 	SKIP_IF(!have_hwcap(PPC_FEATURE_ARCH_2_05));
 
@@ -577,13 +557,11 @@ int test_alignment_handler_fp_205(void)
 	STORE_FLOAT_DFORM_TEST(stfdp);
 	STORE_FLOAT_XFORM_TEST(stfdpx);
 
-	return rc;
+	return 0;
 }
 
 int test_alignment_handler_fp_206(void)
 {
-	int rc = 0;
-
 	SKIP_IF(!can_open_cifile());
 	SKIP_IF(!have_hwcap(PPC_FEATURE_ARCH_2_06));
 
@@ -591,14 +569,12 @@ int test_alignment_handler_fp_206(void)
 
 	LOAD_FLOAT_XFORM_TEST(lfiwzx);
 
-	return rc;
+	return 0;
 }
 
 
 int test_alignment_handler_fp_prefix(void)
 {
-	int rc = 0;
-
 	SKIP_IF(!can_open_cifile());
 	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_1));
 
@@ -608,7 +584,7 @@ int test_alignment_handler_fp_prefix(void)
 	LOAD_FLOAT_MLS_PREFIX_TEST(PLFD);
 	STORE_FLOAT_MLS_PREFIX_TEST(PSTFS);
 	STORE_FLOAT_MLS_PREFIX_TEST(PSTFD);
-	return rc;
+	return 0;
 }
 
 void usage(char *prog)
-- 
2.30.2

