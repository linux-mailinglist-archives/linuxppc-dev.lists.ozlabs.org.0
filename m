Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB676270BC0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 10:13:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Btk3h2ZywzDqs6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 18:13:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=f0OFDsET; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtjwD2KS7zDqrn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 18:06:51 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id g29so4866475pgl.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 01:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4mjAsO6i14BLDGSTSdDKCE/ErMpri2AIzn0P8gVWa8M=;
 b=f0OFDsETa78EaeXMDCZ1RlCfxiwXc9SrnugxfxtZMcxjpwzsQZOe/tYIDistENL+3n
 8aJ8UY7gOEmoL3ldEcxG/KpWw2K2lmPViEdyK2GebPCprnlzSQiPqZqOPp3m2hjzte7U
 XTdyC+J3wSoKeBaYrzyy/kuZdk1+t7cxQEEzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4mjAsO6i14BLDGSTSdDKCE/ErMpri2AIzn0P8gVWa8M=;
 b=XolilUAZ+c7B/0Vq6Fyf3Fvf9FsGjk8U0b9bECR07Ogab7NBg5vSMhvfElopiAwWdk
 WUSyZJwhsGH5dBcQR16GzUGHdbVtI4v/p6BGs+V+iqOX1wTWRXrxOvdKzOrlDQPVjKOv
 JeNIPDjgjtHNPy607Tl+eWDAe1/9IN0GrP7UbcL5iFkTIv1T2H8vtdvDVJdE4vA5uM7G
 uOCUM0jMp4vPuo76Em1njxeMtdtYcY+Arw5u8Z+8S/qCydP37fTMazpowtjA4+G4ZeNu
 Hn9ABwtXgQOWHQQT256XDQUZ8dSv3ZSrDu68DXrFbWHgFFJ2nDVCce8Xv7l0jU0Ccacf
 dE1w==
X-Gm-Message-State: AOAM530EJHdsfpHcOJq+oBM6L3bCCflabSlUuUlHZMwnxK4AOIuOmQ9E
 r3zTziRM1MEKpdFe/wAiGnloUQ==
X-Google-Smtp-Source: ABdhPJzoDBiiDd/qwVg2H2idKKM+EA63R2fRTH/k5PeOCGXyrSeLjPAUUIbnlIzg8EvmDnpbjiiFuA==
X-Received: by 2002:a63:491:: with SMTP id 139mr13312846pge.147.1600502808858; 
 Sat, 19 Sep 2020 01:06:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id s3sm5443116pgc.61.2020.09.19.01.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 01:06:45 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] selftests/clone3: Avoid OS-defined clone_args
Date: Sat, 19 Sep 2020 01:06:37 -0700
Message-Id: <20200919080637.259478-5-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200919080637.259478-1-keescook@chromium.org>
References: <20200919080637.259478-1-keescook@chromium.org>
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christian Brauner <christian@brauner.io>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As the UAPI headers start to appear in distros, we need to avoid outdated
versions of struct clone_args to be able to test modern features;
rename to "struct __clone_args". Additionally update the struct size
macro names to match UAPI names.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/clone3/clone3.c       | 45 ++++++++-----------
 .../clone3/clone3_cap_checkpoint_restore.c    |  4 +-
 .../selftests/clone3/clone3_clear_sighand.c   |  2 +-
 .../selftests/clone3/clone3_selftests.h       | 24 +++++-----
 .../testing/selftests/clone3/clone3_set_tid.c |  4 +-
 tools/testing/selftests/seccomp/seccomp_bpf.c |  4 +-
 6 files changed, 40 insertions(+), 43 deletions(-)

diff --git a/tools/testing/selftests/clone3/clone3.c b/tools/testing/selftests/clone3/clone3.c
index b7e6dec36173..42be3b925830 100644
--- a/tools/testing/selftests/clone3/clone3.c
+++ b/tools/testing/selftests/clone3/clone3.c
@@ -20,13 +20,6 @@
 #include "../kselftest.h"
 #include "clone3_selftests.h"
 
-/*
- * Different sizes of struct clone_args
- */
-#ifndef CLONE3_ARGS_SIZE_V0
-#define CLONE3_ARGS_SIZE_V0 64
-#endif
-
 enum test_mode {
 	CLONE3_ARGS_NO_TEST,
 	CLONE3_ARGS_ALL_0,
@@ -38,13 +31,13 @@ enum test_mode {
 
 static int call_clone3(uint64_t flags, size_t size, enum test_mode test_mode)
 {
-	struct clone_args args = {
+	struct __clone_args args = {
 		.flags = flags,
 		.exit_signal = SIGCHLD,
 	};
 
 	struct clone_args_extended {
-		struct clone_args args;
+		struct __clone_args args;
 		__aligned_u64 excess_space[2];
 	} args_ext;
 
@@ -52,11 +45,11 @@ static int call_clone3(uint64_t flags, size_t size, enum test_mode test_mode)
 	int status;
 
 	memset(&args_ext, 0, sizeof(args_ext));
-	if (size > sizeof(struct clone_args))
+	if (size > sizeof(struct __clone_args))
 		args_ext.excess_space[1] = 1;
 
 	if (size == 0)
-		size = sizeof(struct clone_args);
+		size = sizeof(struct __clone_args);
 
 	switch (test_mode) {
 	case CLONE3_ARGS_ALL_0:
@@ -77,9 +70,9 @@ static int call_clone3(uint64_t flags, size_t size, enum test_mode test_mode)
 		break;
 	}
 
-	memcpy(&args_ext.args, &args, sizeof(struct clone_args));
+	memcpy(&args_ext.args, &args, sizeof(struct __clone_args));
 
-	pid = sys_clone3((struct clone_args *)&args_ext, size);
+	pid = sys_clone3((struct __clone_args *)&args_ext, size);
 	if (pid < 0) {
 		ksft_print_msg("%s - Failed to create new process\n",
 				strerror(errno));
@@ -144,14 +137,14 @@ int main(int argc, char *argv[])
 	else
 		ksft_test_result_skip("Skipping clone3() with CLONE_NEWPID\n");
 
-	/* Do a clone3() with CLONE3_ARGS_SIZE_V0. */
-	test_clone3(0, CLONE3_ARGS_SIZE_V0, 0, CLONE3_ARGS_NO_TEST);
+	/* Do a clone3() with CLONE_ARGS_SIZE_VER0. */
+	test_clone3(0, CLONE_ARGS_SIZE_VER0, 0, CLONE3_ARGS_NO_TEST);
 
-	/* Do a clone3() with CLONE3_ARGS_SIZE_V0 - 8 */
-	test_clone3(0, CLONE3_ARGS_SIZE_V0 - 8, -EINVAL, CLONE3_ARGS_NO_TEST);
+	/* Do a clone3() with CLONE_ARGS_SIZE_VER0 - 8 */
+	test_clone3(0, CLONE_ARGS_SIZE_VER0 - 8, -EINVAL, CLONE3_ARGS_NO_TEST);
 
 	/* Do a clone3() with sizeof(struct clone_args) + 8 */
-	test_clone3(0, sizeof(struct clone_args) + 8, 0, CLONE3_ARGS_NO_TEST);
+	test_clone3(0, sizeof(struct __clone_args) + 8, 0, CLONE3_ARGS_NO_TEST);
 
 	/* Do a clone3() with exit_signal having highest 32 bits non-zero */
 	test_clone3(0, 0, -EINVAL, CLONE3_ARGS_INVAL_EXIT_SIGNAL_BIG);
@@ -165,31 +158,31 @@ int main(int argc, char *argv[])
 	/* Do a clone3() with NSIG < exit_signal < CSIG */
 	test_clone3(0, 0, -EINVAL, CLONE3_ARGS_INVAL_EXIT_SIGNAL_NSIG);
 
-	test_clone3(0, sizeof(struct clone_args) + 8, 0, CLONE3_ARGS_ALL_0);
+	test_clone3(0, sizeof(struct __clone_args) + 8, 0, CLONE3_ARGS_ALL_0);
 
-	test_clone3(0, sizeof(struct clone_args) + 16, -E2BIG,
+	test_clone3(0, sizeof(struct __clone_args) + 16, -E2BIG,
 			CLONE3_ARGS_ALL_0);
 
-	test_clone3(0, sizeof(struct clone_args) * 2, -E2BIG,
+	test_clone3(0, sizeof(struct __clone_args) * 2, -E2BIG,
 			CLONE3_ARGS_ALL_0);
 
 	/* Do a clone3() with > page size */
 	test_clone3(0, getpagesize() + 8, -E2BIG, CLONE3_ARGS_NO_TEST);
 
-	/* Do a clone3() with CLONE3_ARGS_SIZE_V0 in a new PID NS. */
+	/* Do a clone3() with CLONE_ARGS_SIZE_VER0 in a new PID NS. */
 	if (uid == 0)
-		test_clone3(CLONE_NEWPID, CLONE3_ARGS_SIZE_V0, 0,
+		test_clone3(CLONE_NEWPID, CLONE_ARGS_SIZE_VER0, 0,
 				CLONE3_ARGS_NO_TEST);
 	else
 		ksft_test_result_skip("Skipping clone3() with CLONE_NEWPID\n");
 
-	/* Do a clone3() with CLONE3_ARGS_SIZE_V0 - 8 in a new PID NS */
-	test_clone3(CLONE_NEWPID, CLONE3_ARGS_SIZE_V0 - 8, -EINVAL,
+	/* Do a clone3() with CLONE_ARGS_SIZE_VER0 - 8 in a new PID NS */
+	test_clone3(CLONE_NEWPID, CLONE_ARGS_SIZE_VER0 - 8, -EINVAL,
 			CLONE3_ARGS_NO_TEST);
 
 	/* Do a clone3() with sizeof(struct clone_args) + 8 in a new PID NS */
 	if (uid == 0)
-		test_clone3(CLONE_NEWPID, sizeof(struct clone_args) + 8, 0,
+		test_clone3(CLONE_NEWPID, sizeof(struct __clone_args) + 8, 0,
 				CLONE3_ARGS_NO_TEST);
 	else
 		ksft_test_result_skip("Skipping clone3() with CLONE_NEWPID\n");
diff --git a/tools/testing/selftests/clone3/clone3_cap_checkpoint_restore.c b/tools/testing/selftests/clone3/clone3_cap_checkpoint_restore.c
index 9562425aa0a9..55bd387ce7ec 100644
--- a/tools/testing/selftests/clone3/clone3_cap_checkpoint_restore.c
+++ b/tools/testing/selftests/clone3/clone3_cap_checkpoint_restore.c
@@ -44,13 +44,13 @@ static int call_clone3_set_tid(struct __test_metadata *_metadata,
 	int status;
 	pid_t pid = -1;
 
-	struct clone_args args = {
+	struct __clone_args args = {
 		.exit_signal = SIGCHLD,
 		.set_tid = ptr_to_u64(set_tid),
 		.set_tid_size = set_tid_size,
 	};
 
-	pid = sys_clone3(&args, sizeof(struct clone_args));
+	pid = sys_clone3(&args, sizeof(args));
 	if (pid < 0) {
 		TH_LOG("%s - Failed to create new process", strerror(errno));
 		return -errno;
diff --git a/tools/testing/selftests/clone3/clone3_clear_sighand.c b/tools/testing/selftests/clone3/clone3_clear_sighand.c
index db5fc9c5edcf..47a8c0fc3676 100644
--- a/tools/testing/selftests/clone3/clone3_clear_sighand.c
+++ b/tools/testing/selftests/clone3/clone3_clear_sighand.c
@@ -47,7 +47,7 @@ static void test_clone3_clear_sighand(void)
 {
 	int ret;
 	pid_t pid;
-	struct clone_args args = {};
+	struct __clone_args args = {};
 	struct sigaction act;
 
 	/*
diff --git a/tools/testing/selftests/clone3/clone3_selftests.h b/tools/testing/selftests/clone3/clone3_selftests.h
index 91c1a78ddb39..e81ffaaee02b 100644
--- a/tools/testing/selftests/clone3/clone3_selftests.h
+++ b/tools/testing/selftests/clone3/clone3_selftests.h
@@ -19,13 +19,11 @@
 #define CLONE_INTO_CGROUP 0x200000000ULL /* Clone into a specific cgroup given the right permissions. */
 #endif
 
-#ifndef CLONE_ARGS_SIZE_VER0
-#define CLONE_ARGS_SIZE_VER0 64
-#endif
-
 #ifndef __NR_clone3
 #define __NR_clone3 -1
-struct clone_args {
+#endif
+
+struct __clone_args {
 	__aligned_u64 flags;
 	__aligned_u64 pidfd;
 	__aligned_u64 child_tid;
@@ -34,15 +32,21 @@ struct clone_args {
 	__aligned_u64 stack;
 	__aligned_u64 stack_size;
 	__aligned_u64 tls;
-#define CLONE_ARGS_SIZE_VER1 80
+#ifndef CLONE_ARGS_SIZE_VER0
+#define CLONE_ARGS_SIZE_VER0 64	/* sizeof first published struct */
+#endif
 	__aligned_u64 set_tid;
 	__aligned_u64 set_tid_size;
-#define CLONE_ARGS_SIZE_VER2 88
+#ifndef CLONE_ARGS_SIZE_VER1
+#define CLONE_ARGS_SIZE_VER1 80	/* sizeof second published struct */
+#endif
 	__aligned_u64 cgroup;
+#ifndef CLONE_ARGS_SIZE_VER2
+#define CLONE_ARGS_SIZE_VER2 88	/* sizeof third published struct */
+#endif
 };
-#endif /* __NR_clone3 */
 
-static pid_t sys_clone3(struct clone_args *args, size_t size)
+static pid_t sys_clone3(struct __clone_args *args, size_t size)
 {
 	fflush(stdout);
 	fflush(stderr);
@@ -52,7 +56,7 @@ static pid_t sys_clone3(struct clone_args *args, size_t size)
 static inline void test_clone3_supported(void)
 {
 	pid_t pid;
-	struct clone_args args = {};
+	struct __clone_args args = {};
 
 	if (__NR_clone3 < 0)
 		ksft_exit_skip("clone3() syscall is not supported\n");
diff --git a/tools/testing/selftests/clone3/clone3_set_tid.c b/tools/testing/selftests/clone3/clone3_set_tid.c
index 5831c1082d6d..0229e9ebb995 100644
--- a/tools/testing/selftests/clone3/clone3_set_tid.c
+++ b/tools/testing/selftests/clone3/clone3_set_tid.c
@@ -46,14 +46,14 @@ static int call_clone3_set_tid(pid_t *set_tid,
 	int status;
 	pid_t pid = -1;
 
-	struct clone_args args = {
+	struct __clone_args args = {
 		.flags = flags,
 		.exit_signal = SIGCHLD,
 		.set_tid = ptr_to_u64(set_tid),
 		.set_tid_size = set_tid_size,
 	};
 
-	pid = sys_clone3(&args, sizeof(struct clone_args));
+	pid = sys_clone3(&args, sizeof(args));
 	if (pid < 0) {
 		ksft_print_msg("%s - Failed to create new process\n",
 			       strerror(errno));
diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 894c2404d321..4a180439ee9e 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -3817,7 +3817,7 @@ TEST(user_notification_filter_empty)
 	long ret;
 	int status;
 	struct pollfd pollfd;
-	struct clone_args args = {
+	struct __clone_args args = {
 		.flags = CLONE_FILES,
 		.exit_signal = SIGCHLD,
 	};
@@ -3871,7 +3871,7 @@ TEST(user_notification_filter_empty_threaded)
 	long ret;
 	int status;
 	struct pollfd pollfd;
-	struct clone_args args = {
+	struct __clone_args args = {
 		.flags = CLONE_FILES,
 		.exit_signal = SIGCHLD,
 	};
-- 
2.25.1

