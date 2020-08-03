Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E26239D60
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 04:09:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKhCK0WBBzDqSQ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 12:09:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKh980dzWzDqPf
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 12:07:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=DM7RFR3U; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BKh975Qb2z9sRN; Mon,  3 Aug 2020 12:07:23 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BKh973z76z9sTY; Mon,  3 Aug 2020 12:07:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596420443;
 bh=kuLcb2e518JhJGlYVX5irk4rT3HQAc2BSptERYSLTpo=;
 h=From:To:Subject:Date:From;
 b=DM7RFR3UA+gEJ5BGlvZZTUN3al8b9/UNiBf62cFAZdaV0/Rr/WPPn5WTFdfDAfugW
 AbNGXR0bzJSvoAiib0OfquuJms0Mvh+Eh7YIHFNyzeu1dobNQdv+auI5l95q1MCA6C
 wRafHRnMxGHHFqYc5dqof5IamCprT799D/nNh1N18gC8lK93BnJUYWA/BIAD9bFR8e
 T+sqUSTYOOT8k9ujHEUkW6DwMF8wj7+zOvysnzyF2btHe5BpYSNP5UVY/0ZOfzksQi
 o2n08ay3O5MlPtDWJTEIDdp0wK+ypTohsN906stdfda6p1gYN7x8YjODN9o+fIaunC
 Nvhs+KGusGczA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2] selftests/powerpc: Skip vmx/vsx/tar/etc tests on older CPUs
Date: Mon,  3 Aug 2020 12:07:19 +1000
Message-Id: <20200803020719.96114-1-mpe@ellerman.id.au>
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

Some of our tests use VSX or newer VMX instructions, so need to be
skipped on older CPUs to avoid SIGILL'ing.

Similarly TAR was added in v2.07, and the PMU event used in the stcx
fail test only works on Power8 or later.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/math/Makefile         | 8 ++++----
 tools/testing/selftests/powerpc/math/vmx_preempt.c    | 3 +++
 tools/testing/selftests/powerpc/math/vmx_signal.c     | 3 +++
 tools/testing/selftests/powerpc/math/vmx_syscall.c    | 7 ++++++-
 tools/testing/selftests/powerpc/math/vsx_preempt.c    | 2 ++
 tools/testing/selftests/powerpc/pmu/count_stcx_fail.c | 4 ++++
 tools/testing/selftests/powerpc/ptrace/ptrace-tar.c   | 3 +++
 tools/testing/selftests/powerpc/ptrace/ptrace-vsx.c   | 2 ++
 tools/testing/selftests/powerpc/stringloops/Makefile  | 2 +-
 tools/testing/selftests/powerpc/stringloops/memcmp.c  | 6 ++++++
 10 files changed, 34 insertions(+), 6 deletions(-)

v2: Skip a few more tests.

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
diff --git a/tools/testing/selftests/powerpc/pmu/count_stcx_fail.c b/tools/testing/selftests/powerpc/pmu/count_stcx_fail.c
index 7b4ac4537702..2980abca31e0 100644
--- a/tools/testing/selftests/powerpc/pmu/count_stcx_fail.c
+++ b/tools/testing/selftests/powerpc/pmu/count_stcx_fail.c
@@ -9,6 +9,7 @@
 #include <stdbool.h>
 #include <string.h>
 #include <sys/prctl.h>
+#include <asm/cputable.h>
 
 #include "event.h"
 #include "utils.h"
@@ -104,6 +105,9 @@ static int test_body(void)
 	struct event events[3];
 	u64 overhead;
 
+	// The STCX_FAIL event we use works on Power8 or later
+	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_2_07));
+
 	setup_event(&events[0], PERF_COUNT_HW_INSTRUCTIONS, PERF_TYPE_HARDWARE, "instructions");
 	setup_event(&events[1], PERF_COUNT_HW_CPU_CYCLES, PERF_TYPE_HARDWARE, "cycles");
 	setup_event(&events[2], PM_STCX_FAIL, PERF_TYPE_RAW, "stcx_fail");
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tar.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tar.c
index 58cb1a860cc9..4436ca9d3caf 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tar.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tar.c
@@ -78,6 +78,9 @@ int ptrace_tar(void)
 	pid_t pid;
 	int ret, status;
 
+	// TAR was added in v2.07
+	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_2_07));
+
 	shm_id = shmget(IPC_PRIVATE, sizeof(int) * 3, 0777|IPC_CREAT);
 	pid = fork();
 	if (pid < 0) {
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-vsx.c b/tools/testing/selftests/powerpc/ptrace/ptrace-vsx.c
index c4fe0e893306..cb9875f764ca 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-vsx.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-vsx.c
@@ -61,6 +61,8 @@ int ptrace_vsx(void)
 	pid_t pid;
 	int ret, status, i;
 
+	SKIP_IF(!have_hwcap(PPC_FEATURE_HAS_VSX));
+
 	shm_id = shmget(IPC_PRIVATE, sizeof(int) * 2, 0777|IPC_CREAT);
 
 	for (i = 0; i < VEC_MAX; i++)
diff --git a/tools/testing/selftests/powerpc/stringloops/Makefile b/tools/testing/selftests/powerpc/stringloops/Makefile
index 7fc0623d85c3..9c39f55a58ff 100644
--- a/tools/testing/selftests/powerpc/stringloops/Makefile
+++ b/tools/testing/selftests/powerpc/stringloops/Makefile
@@ -8,7 +8,7 @@ build_32bit = $(shell if ($(CC) $(CFLAGS) -m32 -o /dev/null memcmp.c >/dev/null
 
 TEST_GEN_PROGS := memcmp_64 strlen
 
-$(OUTPUT)/memcmp_64: memcmp.c
+$(OUTPUT)/memcmp_64: memcmp.c ../utils.c
 $(OUTPUT)/memcmp_64: CFLAGS += -m64 -maltivec
 
 ifeq ($(build_32bit),1)
diff --git a/tools/testing/selftests/powerpc/stringloops/memcmp.c b/tools/testing/selftests/powerpc/stringloops/memcmp.c
index e4605ca850dc..979df3d98368 100644
--- a/tools/testing/selftests/powerpc/stringloops/memcmp.c
+++ b/tools/testing/selftests/powerpc/stringloops/memcmp.c
@@ -4,6 +4,7 @@
 #include <string.h>
 #include <sys/mman.h>
 #include <time.h>
+#include <asm/cputable.h>
 #include "utils.h"
 
 #define SIZE 256
@@ -151,6 +152,11 @@ static int testcase(bool islarge)
 
 static int testcases(void)
 {
+#ifdef __powerpc64__
+	// vcmpequd used in memcmp_64.S is v2.07
+	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_2_07));
+#endif
+
 	testcase(0);
 	testcase(1);
 	return 0;
-- 
2.25.1

