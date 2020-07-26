Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D7322DADE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 02:36:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BDkWx6fhYzDrDN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 10:36:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BDkTV1z2czDrCT
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jul 2020 10:34:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pE+vUun8; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BDkTT6dGBz9sRK; Sun, 26 Jul 2020 10:34:21 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BDkTT5mr8z9sRN; Sun, 26 Jul 2020 10:34:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595723661;
 bh=XhQTR+Iet54JBirszTsLaY+tajK7Zm6AMs2qxteo63U=;
 h=From:To:Subject:Date:From;
 b=pE+vUun8n22L98aKSa7HyapGudD2ROO8CeX1qI1DtKgg1KOi2n2SoLsW+5V7S63fh
 6SFEzhodU0syoa3sORdviLCLi2pU3XQbvdoJ4KYPkSe+LRnJh6shd3LYYfy6VweZna
 1jn+ZWnM5u6qIz2/D+sVj+O2j4gOkA7HS+HS0vM2FAb8X5pkUlu3dt5rRFMFxpiztN
 VQwcXk+SKJcY2iCnpr6IAFrIPy9dbUVBHQ6JvcOBhHOhlQceoGHosANHNd9IAmf3dr
 pZXBGTF6+8sjcSHEGea4jCAMOHfAKXh1ATCuDtInLo5hvlfVW8ZHYVz4YXbtsk1/fR
 QJKk5csPsHjcQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] selftests/powerpc: Skip vmx/vsx tests on older CPUs
Date: Sun, 26 Jul 2020 10:34:19 +1000
Message-Id: <20200726003419.2040332-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These tests use VSX or newer VMX instructions, so need to be skipped
on older CPUs to avoid SIGILL'ing.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/math/Makefile      | 8 ++++----
 tools/testing/selftests/powerpc/math/vmx_preempt.c | 3 +++
 tools/testing/selftests/powerpc/math/vmx_signal.c  | 3 +++
 tools/testing/selftests/powerpc/math/vmx_syscall.c | 7 ++++++-
 tools/testing/selftests/powerpc/math/vsx_preempt.c | 2 ++
 5 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/powerpc/math/Makefile b/tools/testing/selftests/powerpc/math/Makefile
index 4e2049d2fd8d..fcc91c205984 100644
--- a/tools/testing/selftests/powerpc/math/Makefile
+++ b/tools/testing/selftests/powerpc/math/Makefile
@@ -11,9 +11,9 @@ $(OUTPUT)/fpu_syscall: fpu_asm.S
 $(OUTPUT)/fpu_preempt: fpu_asm.S
 $(OUTPUT)/fpu_signal:  fpu_asm.S
 
-$(OUTPUT)/vmx_syscall: vmx_asm.S
-$(OUTPUT)/vmx_preempt: vmx_asm.S
-$(OUTPUT)/vmx_signal: vmx_asm.S
+$(OUTPUT)/vmx_syscall: vmx_asm.S ../utils.c
+$(OUTPUT)/vmx_preempt: vmx_asm.S ../utils.c
+$(OUTPUT)/vmx_signal: vmx_asm.S ../utils.c
 
 $(OUTPUT)/vsx_preempt: CFLAGS += -mvsx
-$(OUTPUT)/vsx_preempt: vsx_asm.S
+$(OUTPUT)/vsx_preempt: vsx_asm.S ../utils.c
diff --git a/tools/testing/selftests/powerpc/math/vmx_preempt.c b/tools/testing/selftests/powerpc/math/vmx_preempt.c
index 2e059f154e77..6761d6ce30ec 100644
--- a/tools/testing/selftests/powerpc/math/vmx_preempt.c
+++ b/tools/testing/selftests/powerpc/math/vmx_preempt.c
@@ -57,6 +57,9 @@ int test_preempt_vmx(void)
 	int i, rc, threads;
 	pthread_t *tids;
 
+	// vcmpequd used in vmx_asm.S is v2.07
+	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_2_07));
+
 	threads = sysconf(_SC_NPROCESSORS_ONLN) * THREAD_FACTOR;
 	tids = malloc(threads * sizeof(pthread_t));
 	FAIL_IF(!tids);
diff --git a/tools/testing/selftests/powerpc/math/vmx_signal.c b/tools/testing/selftests/powerpc/math/vmx_signal.c
index 785a48e0976f..b340a5c4e79d 100644
--- a/tools/testing/selftests/powerpc/math/vmx_signal.c
+++ b/tools/testing/selftests/powerpc/math/vmx_signal.c
@@ -96,6 +96,9 @@ int test_signal_vmx(void)
 	void *rc_p;
 	pthread_t *tids;
 
+	// vcmpequd used in vmx_asm.S is v2.07
+	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_2_07));
+
 	threads = sysconf(_SC_NPROCESSORS_ONLN) * THREAD_FACTOR;
 	tids = malloc(threads * sizeof(pthread_t));
 	FAIL_IF(!tids);
diff --git a/tools/testing/selftests/powerpc/math/vmx_syscall.c b/tools/testing/selftests/powerpc/math/vmx_syscall.c
index 9ee293cc868e..03c78dfe3444 100644
--- a/tools/testing/selftests/powerpc/math/vmx_syscall.c
+++ b/tools/testing/selftests/powerpc/math/vmx_syscall.c
@@ -49,9 +49,14 @@ int test_vmx_syscall(void)
 	 * Setup an environment with much context switching
 	 */
 	pid_t pid2;
-	pid_t pid = fork();
+	pid_t pid;
 	int ret;
 	int child_ret;
+
+	// vcmpequd used in vmx_asm.S is v2.07
+	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_2_07));
+
+	pid = fork();
 	FAIL_IF(pid == -1);
 
 	pid2 = fork();
diff --git a/tools/testing/selftests/powerpc/math/vsx_preempt.c b/tools/testing/selftests/powerpc/math/vsx_preempt.c
index 63de9c6e2cd3..d1601bb889d4 100644
--- a/tools/testing/selftests/powerpc/math/vsx_preempt.c
+++ b/tools/testing/selftests/powerpc/math/vsx_preempt.c
@@ -92,6 +92,8 @@ int test_preempt_vsx(void)
 	int i, rc, threads;
 	pthread_t *tids;
 
+	SKIP_IF(!have_hwcap(PPC_FEATURE_HAS_VSX));
+
 	threads = sysconf(_SC_NPROCESSORS_ONLN) * THREAD_FACTOR;
 	tids = malloc(threads * sizeof(pthread_t));
 	FAIL_IF(!tids);
-- 
2.25.1

