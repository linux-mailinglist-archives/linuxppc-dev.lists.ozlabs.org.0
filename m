Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E2039EA3C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 01:37:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzVCw3lwJz3bnj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 09:37:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oFv9+Hsv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oFv9+Hsv; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzVCT2QQ8z2yjJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 09:37:23 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso1089892pji.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Jun 2021 16:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tsv7dpLY93zK6Lea6D6lLnOYSGka8nbtSmsG17l/+L0=;
 b=oFv9+Hsvmg9PV/tz0922c/7Z9q5cO5+b2/ssXeAKBlQGjcIA6G/bB+8UIYdGZ0txCM
 vzJadV3foqX6n8O1YWIbFelToW0Mj95pmcABszs/vACXioXU6/2ARJhlZpdjya6SR9uY
 1XOHgtZA5c1WPDK6QO2plB3u46Nz3tURCqscOzxMqNp6N/IEQx30slpEMtTKPb10zeJR
 WcS0Y/N/K3WtvOHXdioi7hd/bmhTg3HeWG0fDi7M0OffMbxlgcZMyVJC33NZGlcs6im5
 jP3nlKr+5zRR8bcr2ndL0FVlpq8UEQfQc3PzrqcQGlG3eQ7rk+qiQUu+29WvapmgFbyI
 h9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tsv7dpLY93zK6Lea6D6lLnOYSGka8nbtSmsG17l/+L0=;
 b=m+FQw6SjOi8akPExg81gAPqFeZETzPGxJWQa0DBx76WNpH2XxG4UTR3mwlA82rfbkc
 w7ZeQSwuyvUkoWOEzKI5pGqkldpIz6yCJSE6jOQKvRRTqmVgFA1Vsd/2RjoFsopfVOco
 4KlKSg2vYdnl11jjvxGd8rpLCYl9P9aiSWOKhg+4kMe1vWjf2xKNJKgDuO93YhBJuB+7
 4wJoZHiveUHbyPNGSnxEoerYTTXdBHQ3ZXanEE+1y6htG6JPScHXxyHsm8990jpgGvgT
 /MB5tvvB8upJ4NX+zgBmJ7341UEV6xNSFGgEZLiQ3yoAgeHWUfgGNv504e3lbNIc2Jny
 4asg==
X-Gm-Message-State: AOAM5314RIRP2kpqeyh7GFhEmb/B7RbC7jOGJjCj3nnv3n7yzz1FoCJp
 MtbxIe3pdaurghk3Ytq6pjjdzMrDMSc=
X-Google-Smtp-Source: ABdhPJwykHV+f8gdKTZ93StH2q4RLDo44B5B9GPS4dPcWWJUtUfYiNGzCO6vr4pOqPqq63LG0X+juQ==
X-Received: by 2002:a17:90b:354:: with SMTP id
 fh20mr23084627pjb.67.1623109040244; 
 Mon, 07 Jun 2021 16:37:20 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id j5sm7450679pgl.70.2021.06.07.16.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 16:37:19 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] selftests: Skip TM tests on synthetic TM implementations
Date: Tue,  8 Jun 2021 09:37:09 +1000
Message-Id: <20210607233709.941102-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607233709.941102-1-jniethe5@gmail.com>
References: <20210607233709.941102-1-jniethe5@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, mikey@neuling.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Transactional Memory was removed from the architecture in ISA v3.1. For
threads running in P8/P9 compatibility mode on P10 a synthetic TM
implementation is provided. In this implementation, tbegin. always sets
cr0 eq meaning the abort handler is always called. This is not an issue
as users of TM are expected to have a fallback non transactional way to
make forward progress in the abort handler.

As the TM self tests exist only to test TM, no alternative path forward
is provided, leading to them timing out and failing on the synthetic TM
implementation.

The TEXASR indicates if a transaction failure is due to a synthetic
implementation. Check for a synthetic implementation and skip the TM
tests if so.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 .../selftests/powerpc/ptrace/ptrace-tm-gpr.c  |  1 +
 .../powerpc/ptrace/ptrace-tm-spd-gpr.c        |  1 +
 .../powerpc/ptrace/ptrace-tm-spd-tar.c        |  1 +
 .../selftests/powerpc/ptrace/ptrace-tm-tar.c  |  1 +
 .../selftests/powerpc/tm/tm-resched-dscr.c    |  1 +
 .../selftests/powerpc/tm/tm-signal-stack.c    |  1 +
 .../testing/selftests/powerpc/tm/tm-syscall.c |  2 +-
 tools/testing/selftests/powerpc/tm/tm.h       | 36 +++++++++++++++++++
 8 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c
index 7df7100a29be..67ca297c5cca 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c
@@ -113,6 +113,7 @@ int ptrace_tm_gpr(void)
 	int ret, status;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 	shm_id = shmget(IPC_PRIVATE, sizeof(int) * 2, 0777|IPC_CREAT);
 	pid = fork();
 	if (pid < 0) {
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c
index 8706bea5d015..6f2bce1b6c5d 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c
@@ -119,6 +119,7 @@ int ptrace_tm_spd_gpr(void)
 	int ret, status;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 	shm_id = shmget(IPC_PRIVATE, sizeof(int) * 3, 0777|IPC_CREAT);
 	pid = fork();
 	if (pid < 0) {
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c
index 2ecfa1158e2b..e112a34fbe59 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c
@@ -129,6 +129,7 @@ int ptrace_tm_spd_tar(void)
 	int ret, status;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 	shm_id = shmget(IPC_PRIVATE, sizeof(int) * 3, 0777|IPC_CREAT);
 	pid = fork();
 	if (pid == 0)
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c
index 46ef378a15ec..d0db6df0f0ea 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c
@@ -117,6 +117,7 @@ int ptrace_tm_tar(void)
 	int ret, status;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 	shm_id = shmget(IPC_PRIVATE, sizeof(int) * 2, 0777|IPC_CREAT);
 	pid = fork();
 	if (pid == 0)
diff --git a/tools/testing/selftests/powerpc/tm/tm-resched-dscr.c b/tools/testing/selftests/powerpc/tm/tm-resched-dscr.c
index 4cdb83964bb3..85c940ae6ff8 100644
--- a/tools/testing/selftests/powerpc/tm/tm-resched-dscr.c
+++ b/tools/testing/selftests/powerpc/tm/tm-resched-dscr.c
@@ -40,6 +40,7 @@ int test_body(void)
 	uint64_t rv, dscr1 = 1, dscr2, texasr;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 
 	printf("Check DSCR TM context switch: ");
 	fflush(stdout);
diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-stack.c b/tools/testing/selftests/powerpc/tm/tm-signal-stack.c
index cdcf8c5bbbc7..68807aac8dd3 100644
--- a/tools/testing/selftests/powerpc/tm/tm-signal-stack.c
+++ b/tools/testing/selftests/powerpc/tm/tm-signal-stack.c
@@ -35,6 +35,7 @@ int tm_signal_stack()
 	int pid;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 
 	pid = fork();
 	if (pid < 0)
diff --git a/tools/testing/selftests/powerpc/tm/tm-syscall.c b/tools/testing/selftests/powerpc/tm/tm-syscall.c
index becb8207b432..467a6b3134b2 100644
--- a/tools/testing/selftests/powerpc/tm/tm-syscall.c
+++ b/tools/testing/selftests/powerpc/tm/tm-syscall.c
@@ -25,7 +25,6 @@ extern int getppid_tm_suspended(void);
 unsigned retries = 0;
 
 #define TEST_DURATION 10 /* seconds */
-#define TM_RETRIES 100
 
 pid_t getppid_tm(bool suspend)
 {
@@ -67,6 +66,7 @@ int tm_syscall(void)
 	struct timeval end, now;
 
 	SKIP_IF(!have_htm_nosc());
+	SKIP_IF(htm_is_synthetic());
 
 	setbuf(stdout, NULL);
 
diff --git a/tools/testing/selftests/powerpc/tm/tm.h b/tools/testing/selftests/powerpc/tm/tm.h
index c5a1e5c163fc..c03c6e778876 100644
--- a/tools/testing/selftests/powerpc/tm/tm.h
+++ b/tools/testing/selftests/powerpc/tm/tm.h
@@ -10,6 +10,9 @@
 #include <asm/tm.h>
 
 #include "utils.h"
+#include "reg.h"
+
+#define TM_RETRIES 100
 
 static inline bool have_htm(void)
 {
@@ -31,6 +34,39 @@ static inline bool have_htm_nosc(void)
 #endif
 }
 
+/*
+ * Transactional Memory was removed in ISA 3.1. A synthetic TM implementation
+ * is provided on P10 for threads running in P8/P9 compatibility  mode. The
+ * synthetic implementation immediately fails after tbegin. This failure sets
+ * Bit 7 (Failure Persistent) and Bit 15 (Implementation-specific).
+ */
+static inline bool htm_is_synthetic(void)
+{
+	int i;
+
+	/*
+	 * Per the ISA, the Failure Persistent bit may be incorrect. Try a few
+	 * times in case we got an Implementation-specific failure on a non ISA
+	 * v3.1 system. On these systems the Implementation-specific failure
+	 * should not be persistent.
+	 */
+	for (i = 0; i < TM_RETRIES; i++) {
+		asm volatile(
+		"tbegin.;"
+		"beq 1f;"
+		"tend.;"
+		"1:"
+		:
+		:
+		: "memory");
+
+		if ((__builtin_get_texasr() & (TEXASR_FP | TEXASR_IC)) !=
+		    (TEXASR_FP | TEXASR_IC))
+			break;
+	}
+	return i == TM_RETRIES;
+}
+
 static inline long failure_code(void)
 {
 	return __builtin_get_texasru() >> 24;
-- 
2.25.1

