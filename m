Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0592492CA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 04:12:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWWWb0vWrzDqtv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 12:12:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWWBS3CyQzDqsp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 11:57:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Ktx+b3uH; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BWWBQ4wPkz9sTm; Wed, 19 Aug 2020 11:57:34 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BWWBQ1CV9z9sTh; Wed, 19 Aug 2020 11:57:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597802254;
 bh=bHUASLZHj+Xq0qxLbKcrw9Zmw/Epl1Spvj51Am/t+r8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Ktx+b3uH+ZapQWqPWzEFyFlZ1IKBzb74u15aXP+/BYUvbIipbCiznKNgvgSnzbAUa
 bIAV2wQMpP5tU+cHDCX7mh2cQ9k5is0OqU/KzqIhMw5HZHnaZbRYiAs3Pb4a0flC2q
 5OPQ6sDoFTp6eaI64hqmSU7VrbZ+E6tI7J2U8smuiDF7SQMJCLrvW+St9ikyL47vVx
 eB2iuZ5oYJJeIaWPNwMa8M6yEzLxH8CaeMqg9knZFsRvcDazONrJIXz2BTQNJQ5rmS
 HGFRDYEanqQRQFnPBLeg260LqHo5u6fFMlGhPAzwCGcDV4XZ78EoO7Z4KulYVFBUOp
 b0dxigJ8nZLpQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 3/9] selftests/powerpc: Move set_dscr() into rfi_flush.c
Date: Wed, 19 Aug 2020 11:57:21 +1000
Message-Id: <20200819015727.1977134-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200819015727.1977134-1-mpe@ellerman.id.au>
References: <20200819015727.1977134-1-mpe@ellerman.id.au>
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

This version of set_dscr() was added for the RFI flush test, and is
fairly specific to it. It also clashes with the version of set_dscr()
in dscr/dscr.h. So move it into the RFI flush test where it's used.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../testing/selftests/powerpc/include/utils.h |  1 -
 .../selftests/powerpc/security/rfi_flush.c    | 35 +++++++++++++++++++
 tools/testing/selftests/powerpc/utils.c       | 35 -------------------
 3 files changed, 35 insertions(+), 36 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
index 71d2924f5b8b..bba400d1bb90 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -35,7 +35,6 @@ int pick_online_cpu(void);
 int read_debugfs_file(char *debugfs_file, int *result);
 int write_debugfs_file(char *debugfs_file, int result);
 int read_sysfs_file(char *debugfs_file, char *result, size_t result_size);
-void set_dscr(unsigned long val);
 int perf_event_open_counter(unsigned int type,
 			    unsigned long config, int group_fd);
 int perf_event_enable(int fd);
diff --git a/tools/testing/selftests/powerpc/security/rfi_flush.c b/tools/testing/selftests/powerpc/security/rfi_flush.c
index 0a7d0afb26b8..fd37ff9b1c45 100644
--- a/tools/testing/selftests/powerpc/security/rfi_flush.c
+++ b/tools/testing/selftests/powerpc/security/rfi_flush.c
@@ -10,6 +10,7 @@
 #include <stdint.h>
 #include <malloc.h>
 #include <unistd.h>
+#include <signal.h>
 #include <stdlib.h>
 #include <string.h>
 #include <stdio.h>
@@ -41,6 +42,40 @@ static void syscall_loop(char *p, unsigned long iterations,
 	}
 }
 
+static void sigill_handler(int signr, siginfo_t *info, void *unused)
+{
+	static int warned = 0;
+	ucontext_t *ctx = (ucontext_t *)unused;
+	unsigned long *pc = &UCONTEXT_NIA(ctx);
+
+	/* mtspr 3,RS to check for move to DSCR below */
+	if ((*((unsigned int *)*pc) & 0xfc1fffff) == 0x7c0303a6) {
+		if (!warned++)
+			printf("WARNING: Skipping over dscr setup. Consider running 'ppc64_cpu --dscr=1' manually.\n");
+		*pc += 4;
+	} else {
+		printf("SIGILL at %p\n", pc);
+		abort();
+	}
+}
+
+static void set_dscr(unsigned long val)
+{
+	static int init = 0;
+	struct sigaction sa;
+
+	if (!init) {
+		memset(&sa, 0, sizeof(sa));
+		sa.sa_sigaction = sigill_handler;
+		sa.sa_flags = SA_SIGINFO;
+		if (sigaction(SIGILL, &sa, NULL))
+			perror("sigill_handler");
+		init = 1;
+	}
+
+	asm volatile("mtspr %1,%0" : : "r" (val), "i" (SPRN_DSCR));
+}
+
 int rfi_flush_test(void)
 {
 	char *p;
diff --git a/tools/testing/selftests/powerpc/utils.c b/tools/testing/selftests/powerpc/utils.c
index 638ffacc90aa..1f36ee1a909a 100644
--- a/tools/testing/selftests/powerpc/utils.c
+++ b/tools/testing/selftests/powerpc/utils.c
@@ -10,7 +10,6 @@
 #include <fcntl.h>
 #include <link.h>
 #include <sched.h>
-#include <signal.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -273,40 +272,6 @@ int perf_event_reset(int fd)
 	return 0;
 }
 
-static void sigill_handler(int signr, siginfo_t *info, void *unused)
-{
-	static int warned = 0;
-	ucontext_t *ctx = (ucontext_t *)unused;
-	unsigned long *pc = &UCONTEXT_NIA(ctx);
-
-	/* mtspr 3,RS to check for move to DSCR below */
-	if ((*((unsigned int *)*pc) & 0xfc1fffff) == 0x7c0303a6) {
-		if (!warned++)
-			printf("WARNING: Skipping over dscr setup. Consider running 'ppc64_cpu --dscr=1' manually.\n");
-		*pc += 4;
-	} else {
-		printf("SIGILL at %p\n", pc);
-		abort();
-	}
-}
-
-void set_dscr(unsigned long val)
-{
-	static int init = 0;
-	struct sigaction sa;
-
-	if (!init) {
-		memset(&sa, 0, sizeof(sa));
-		sa.sa_sigaction = sigill_handler;
-		sa.sa_flags = SA_SIGINFO;
-		if (sigaction(SIGILL, &sa, NULL))
-			perror("sigill_handler");
-		init = 1;
-	}
-
-	asm volatile("mtspr %1,%0" : : "r" (val), "i" (SPRN_DSCR));
-}
-
 int using_hash_mmu(bool *using_hash)
 {
 	char line[128];
-- 
2.25.1

