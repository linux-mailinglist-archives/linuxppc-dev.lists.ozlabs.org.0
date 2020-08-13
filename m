Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E904B243223
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 03:36:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRq1201j4zDqYJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 11:36:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRpyx1W3kzDqWh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 11:34:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=f5+fQjCW; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BRpyx0BbLz9sRK; Thu, 13 Aug 2020 11:34:49 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BRpyw6Nq4z9sTR; Thu, 13 Aug 2020 11:34:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597282488;
 bh=ZG+28bdNv8z93LSW57ERHHk++TVzWmMh0NldrqdXinU=;
 h=From:To:Subject:Date:From;
 b=f5+fQjCWh+0YRIcNWxUsKhuHM5p0emmXdwzsEQqjEh8phIiyAuwM5HknXBpuPNl0R
 ztiTKtanLRInIRknGxT+YPu+p7DniHdBPH/dLpLYivpuhBwhUObEuh/JvDfG+/Zrhu
 R9FjaE0dTsojAcFUsw731xKkhU5dfU1EHAE99wFZ7pShUvTiFs72vnYOfvMe9iNvwn
 KG1/6njd5CYlBrgbf2MZE6KtwU+EWD563wgkbjHwdw5yv/d7yIzj1dWS+MiqqOdGLh
 EjqiEH8v7spkXN+8tGS+A2QqD3fxPT67/V9d4rPmpK9cfjzIiDeJ/bsm5oc9yXIkfW
 KN4jl1tY7h0qQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 1/3] selftests/powerpc: Fix TM tests when CPU 0 is offline
Date: Thu, 13 Aug 2020 11:34:43 +1000
Message-Id: <20200813013445.686464-1-mpe@ellerman.id.au>
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

Several of the TM tests fail spuriously if CPU 0 is offline, because
they blindly try to affinitise to CPU 0.

Fix them by picking any online CPU and using that instead.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/tm/tm-poison.c      | 11 +++++++----
 tools/testing/selftests/powerpc/tm/tm-trap.c        | 10 ++++++----
 tools/testing/selftests/powerpc/tm/tm-unavailable.c |  9 ++++++---
 3 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/powerpc/tm/tm-poison.c b/tools/testing/selftests/powerpc/tm/tm-poison.c
index 977558497c16..29e5f26af7b9 100644
--- a/tools/testing/selftests/powerpc/tm/tm-poison.c
+++ b/tools/testing/selftests/powerpc/tm/tm-poison.c
@@ -26,7 +26,7 @@
 
 int tm_poison_test(void)
 {
-	int pid;
+	int cpu, pid;
 	cpu_set_t cpuset;
 	uint64_t poison = 0xdeadbeefc0dec0fe;
 	uint64_t unknown = 0;
@@ -35,10 +35,13 @@ int tm_poison_test(void)
 
 	SKIP_IF(!have_htm());
 
-	/* Attach both Child and Parent to CPU 0 */
+	cpu = pick_online_cpu();
+	FAIL_IF(cpu < 0);
+
+	// Attach both Child and Parent to the same CPU
 	CPU_ZERO(&cpuset);
-	CPU_SET(0, &cpuset);
-	sched_setaffinity(0, sizeof(cpuset), &cpuset);
+	CPU_SET(cpu, &cpuset);
+	FAIL_IF(sched_setaffinity(0, sizeof(cpuset), &cpuset) != 0);
 
 	pid = fork();
 	if (!pid) {
diff --git a/tools/testing/selftests/powerpc/tm/tm-trap.c b/tools/testing/selftests/powerpc/tm/tm-trap.c
index 601f0c1d450d..c75960af8018 100644
--- a/tools/testing/selftests/powerpc/tm/tm-trap.c
+++ b/tools/testing/selftests/powerpc/tm/tm-trap.c
@@ -247,8 +247,7 @@ void *pong(void *not_used)
 int tm_trap_test(void)
 {
 	uint16_t k = 1;
-
-	int rc;
+	int cpu, rc;
 
 	pthread_attr_t attr;
 	cpu_set_t cpuset;
@@ -267,9 +266,12 @@ int tm_trap_test(void)
 	usr1_sa.sa_sigaction = usr1_signal_handler;
 	sigaction(SIGUSR1, &usr1_sa, NULL);
 
-	/* Set only CPU 0 in the mask. Both threads will be bound to cpu 0. */
+	cpu = pick_online_cpu();
+	FAIL_IF(cpu < 0);
+
+	// Set only one CPU in the mask. Both threads will be bound to that CPU.
 	CPU_ZERO(&cpuset);
-	CPU_SET(0, &cpuset);
+	CPU_SET(cpu, &cpuset);
 
 	/* Init pthread attribute */
 	rc = pthread_attr_init(&attr);
diff --git a/tools/testing/selftests/powerpc/tm/tm-unavailable.c b/tools/testing/selftests/powerpc/tm/tm-unavailable.c
index 2ca2fccb0a3e..a1348a5f721a 100644
--- a/tools/testing/selftests/powerpc/tm/tm-unavailable.c
+++ b/tools/testing/selftests/powerpc/tm/tm-unavailable.c
@@ -338,16 +338,19 @@ void test_fp_vec(int fp, int vec, pthread_attr_t *attr)
 
 int tm_unavailable_test(void)
 {
-	int rc, exception; /* FP = 0, VEC = 1, VSX = 2 */
+	int cpu, rc, exception; /* FP = 0, VEC = 1, VSX = 2 */
 	pthread_t t1;
 	pthread_attr_t attr;
 	cpu_set_t cpuset;
 
 	SKIP_IF(!have_htm());
 
-	/* Set only CPU 0 in the mask. Both threads will be bound to CPU 0. */
+	cpu = pick_online_cpu();
+	FAIL_IF(cpu < 0);
+
+	// Set only one CPU in the mask. Both threads will be bound to that CPU.
 	CPU_ZERO(&cpuset);
-	CPU_SET(0, &cpuset);
+	CPU_SET(cpu, &cpuset);
 
 	/* Init pthread attribute. */
 	rc = pthread_attr_init(&attr);
-- 
2.25.1

