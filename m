Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F73923CC2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 17:58:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4573TB3HHqzDqGZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 01:58:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=brauner.io
 (client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=christian@brauner.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="esLKW/om"; 
 dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4573Rc2DdgzDqDL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 01:56:41 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id 15so9536600wmg.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 08:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N8T3aL28oy4lTIwynzNCFzfhApKXr6vicH7lBpgxJHA=;
 b=esLKW/omJMddteonMci2qfVi7LlXy4K6bSIyPjIrjIbQCDx72GwYK6/qiGKmIrznEV
 sT5yZN02Ad2DEvdP9Y9+ApfnACL61hZTQpdEwDrPbisYqVx4JVrs2OELFytGLOr2cPyO
 kfbiVk3xTtvCtxi4B9fr7qcnv/ksxeJLFIxx7wwiMV8wEiVauRlOX8RmSV7yR6Pm2v1z
 2OfW39JpCI4G57jLGrbjM/Wyktov1GgbVOvWrg5+us9x1WDIyCWF5cvvpfCkCL7y0mHq
 vTNOdgO7vNrA+D4Ax4ihmtYzuUrq0q8zX4YN3sKRhvB8lsKuFITjDYC/fQe+D6bSEqmf
 xUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N8T3aL28oy4lTIwynzNCFzfhApKXr6vicH7lBpgxJHA=;
 b=IFRozMIJwpGRs7YbhGR8m+Yk6Le9sBYCpN6eofQnjTlFmG0d/LzXDWpKWZtkR1K/zS
 tLe00QDNnsA9uTI0tEdP/JYwJ3kl6XeBOIuDcQoyX1K8Xs5cYq8NWZJCdDgi2fV9s3Fs
 EeRXU09z3hF5fn07BiD6jyc6DBYnPFjvbzMHboavcCZdENPmxLwfpiYdjzrjswKfCqjU
 r/E//CMHsqSZXY4ok0spaCjz44+F/amhJALiB9rJEZQsx+wslPbPxYpBqUgktIsQ0p3r
 WVZmBdcGXpzSVOHOWH6s8+Omvb6NoroLIyozONhb0CSG2NnZ2gL4zMDsjACpp4tUoiSQ
 tjEA==
X-Gm-Message-State: APjAAAU51mr2ozhgyPkp0APslLRumZNWH+Abb/tNurBmirA+b1xmpRI7
 dkow+ly+pbZwLVIRlLfzV/7F2g==
X-Google-Smtp-Source: APXvYqz4rIn/BcJdLcMGcq/WCKnCmkKesTw5BAVGHwnjk1ukV2M1PfYiLIg/1h5LFtCcLROOvSgbsg==
X-Received: by 2002:a05:600c:110a:: with SMTP id
 b10mr12368594wma.125.1558367798584; 
 Mon, 20 May 2019 08:56:38 -0700 (PDT)
Received: from localhost.localdomain ([212.91.227.56])
 by smtp.gmail.com with ESMTPSA id t19sm12577789wmi.42.2019.05.20.08.56.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 08:56:37 -0700 (PDT)
From: Christian Brauner <christian@brauner.io>
To: jannh@google.com, oleg@redhat.com, viro@zeniv.linux.org.uk,
 torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Subject: [PATCH v3 2/2] tests: add pidfd_open() tests
Date: Mon, 20 May 2019 17:56:30 +0200
Message-Id: <20190520155630.21684-2-christian@brauner.io>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520155630.21684-1-christian@brauner.io>
References: <20190520155630.21684-1-christian@brauner.io>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, dhowells@redhat.com, joel@joelfernandes.org,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
 elena.reshetova@intel.com, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, dancol@google.com,
 Christian Brauner <christian@brauner.io>, kernel-team@android.com,
 serge@hallyn.com, linux-xtensa@linux-xtensa.org, keescook@chromium.org,
 linux-m68k@lists.linux-m68k.org, luto@kernel.org, tglx@linutronix.de,
 surenb@google.com, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, cyphar@cyphar.com,
 luto@amacapital.net, ebiederm@xmission.com, linux-alpha@vger.kernel.org,
 "Michael Kerrisk \(man-pages\)" <mtk.manpages@gmail.com>,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds testing for the new pidfd_open() syscalls. Specifically, we test:
- that no invalid flags can be passed to pidfd_open()
- that no invalid pid can be passed to pidfd_open()
- that a pidfd can be retrieved with pidfd_open()
- that the retrieved pidfd references the correct pid

Signed-off-by: Christian Brauner <christian@brauner.io>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Joel Fernandes (Google) <joel@joelfernandes.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jann Horn <jannh@google.com>
Cc: David Howells <dhowells@redhat.com>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Andy Lutomirsky <luto@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Aleksa Sarai <cyphar@cyphar.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-api@vger.kernel.org
---
v1: unchanged
v2:
- Christian Brauner <christian@brauner.io>:
  - set number of planned tests via ksft_set_plan()
v3: unchanged
---
 tools/testing/selftests/pidfd/.gitignore      |   1 +
 tools/testing/selftests/pidfd/Makefile        |   2 +-
 tools/testing/selftests/pidfd/pidfd.h         |  57 ++++++
 .../testing/selftests/pidfd/pidfd_open_test.c | 169 ++++++++++++++++++
 tools/testing/selftests/pidfd/pidfd_test.c    |  41 +----
 5 files changed, 229 insertions(+), 41 deletions(-)
 create mode 100644 tools/testing/selftests/pidfd/pidfd.h
 create mode 100644 tools/testing/selftests/pidfd/pidfd_open_test.c

diff --git a/tools/testing/selftests/pidfd/.gitignore b/tools/testing/selftests/pidfd/.gitignore
index 822a1e63d045..16d84d117bc0 100644
--- a/tools/testing/selftests/pidfd/.gitignore
+++ b/tools/testing/selftests/pidfd/.gitignore
@@ -1 +1,2 @@
+pidfd_open_test
 pidfd_test
diff --git a/tools/testing/selftests/pidfd/Makefile b/tools/testing/selftests/pidfd/Makefile
index deaf8073bc06..b36c0be70848 100644
--- a/tools/testing/selftests/pidfd/Makefile
+++ b/tools/testing/selftests/pidfd/Makefile
@@ -1,6 +1,6 @@
 CFLAGS += -g -I../../../../usr/include/
 
-TEST_GEN_PROGS := pidfd_test
+TEST_GEN_PROGS := pidfd_test pidfd_open_test
 
 include ../lib.mk
 
diff --git a/tools/testing/selftests/pidfd/pidfd.h b/tools/testing/selftests/pidfd/pidfd.h
new file mode 100644
index 000000000000..8452e910463f
--- /dev/null
+++ b/tools/testing/selftests/pidfd/pidfd.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __PIDFD_H
+#define __PIDFD_H
+
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <syscall.h>
+#include <sys/mount.h>
+
+#include "../kselftest.h"
+
+/*
+ * The kernel reserves 300 pids via RESERVED_PIDS in kernel/pid.c
+ * That means, when it wraps around any pid < 300 will be skipped.
+ * So we need to use a pid > 300 in order to test recycling.
+ */
+#define PID_RECYCLE 1000
+
+/*
+ * Define a few custom error codes for the child process to clearly indicate
+ * what is happening. This way we can tell the difference between a system
+ * error, a test error, etc.
+ */
+#define PIDFD_PASS 0
+#define PIDFD_FAIL 1
+#define PIDFD_ERROR 2
+#define PIDFD_SKIP 3
+#define PIDFD_XFAIL 4
+
+int wait_for_pid(pid_t pid)
+{
+	int status, ret;
+
+again:
+	ret = waitpid(pid, &status, 0);
+	if (ret == -1) {
+		if (errno == EINTR)
+			goto again;
+
+		return -1;
+	}
+
+	if (!WIFEXITED(status))
+		return -1;
+
+	return WEXITSTATUS(status);
+}
+
+
+#endif /* __PIDFD_H */
diff --git a/tools/testing/selftests/pidfd/pidfd_open_test.c b/tools/testing/selftests/pidfd/pidfd_open_test.c
new file mode 100644
index 000000000000..0377133dd6dc
--- /dev/null
+++ b/tools/testing/selftests/pidfd/pidfd_open_test.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <inttypes.h>
+#include <limits.h>
+#include <linux/types.h>
+#include <linux/wait.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <syscall.h>
+#include <sys/mount.h>
+#include <sys/prctl.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "pidfd.h"
+#include "../kselftest.h"
+
+static inline int sys_pidfd_open(pid_t pid, unsigned int flags)
+{
+	return syscall(__NR_pidfd_open, pid, flags);
+}
+
+static int safe_int(const char *numstr, int *converted)
+{
+	char *err = NULL;
+	long sli;
+
+	errno = 0;
+	sli = strtol(numstr, &err, 0);
+	if (errno == ERANGE && (sli == LONG_MAX || sli == LONG_MIN))
+		return -ERANGE;
+
+	if (errno != 0 && sli == 0)
+		return -EINVAL;
+
+	if (err == numstr || *err != '\0')
+		return -EINVAL;
+
+	if (sli > INT_MAX || sli < INT_MIN)
+		return -ERANGE;
+
+	*converted = (int)sli;
+	return 0;
+}
+
+static int char_left_gc(const char *buffer, size_t len)
+{
+	size_t i;
+
+	for (i = 0; i < len; i++) {
+		if (buffer[i] == ' ' ||
+		    buffer[i] == '\t')
+			continue;
+
+		return i;
+	}
+
+	return 0;
+}
+
+static int char_right_gc(const char *buffer, size_t len)
+{
+	int i;
+
+	for (i = len - 1; i >= 0; i--) {
+		if (buffer[i] == ' '  ||
+		    buffer[i] == '\t' ||
+		    buffer[i] == '\n' ||
+		    buffer[i] == '\0')
+			continue;
+
+		return i + 1;
+	}
+
+	return 0;
+}
+
+static char *trim_whitespace_in_place(char *buffer)
+{
+	buffer += char_left_gc(buffer, strlen(buffer));
+	buffer[char_right_gc(buffer, strlen(buffer))] = '\0';
+	return buffer;
+}
+
+static pid_t get_pid_from_fdinfo_file(int pidfd, const char *key, size_t keylen)
+{
+	int ret;
+	char path[512];
+	FILE *f;
+	size_t n = 0;
+	pid_t result = -1;
+	char *line = NULL;
+
+	snprintf(path, sizeof(path), "/proc/self/fdinfo/%d", pidfd);
+
+	f = fopen(path, "re");
+	if (!f)
+		return -1;
+
+	while (getline(&line, &n, f) != -1) {
+		char *numstr;
+
+		if (strncmp(line, key, keylen))
+			continue;
+
+		numstr = trim_whitespace_in_place(line + 4);
+		ret = safe_int(numstr, &result);
+		if (ret < 0)
+			goto out;
+
+		break;
+	}
+
+out:
+	free(line);
+	fclose(f);
+	return result;
+}
+
+int main(int argc, char **argv)
+{
+	int pidfd = -1, ret = 1;
+	pid_t pid;
+
+	ksft_set_plan(3);
+
+	pidfd = sys_pidfd_open(-1, 0);
+	if (pidfd >= 0) {
+		ksft_print_msg(
+			"%s - succeeded to open pidfd for invalid pid -1\n",
+			strerror(errno));
+		goto on_error;
+	}
+	ksft_test_result_pass("do not allow invalid pid test: passed\n");
+
+	pidfd = sys_pidfd_open(getpid(), 1);
+	if (pidfd >= 0) {
+		ksft_print_msg(
+			"%s - succeeded to open pidfd with invalid flag value specified\n",
+			strerror(errno));
+		goto on_error;
+	}
+	ksft_test_result_pass("do not allow invalid flag test: passed\n");
+
+	pidfd = sys_pidfd_open(getpid(), 0);
+	if (pidfd < 0) {
+		ksft_print_msg("%s - failed to open pidfd\n", strerror(errno));
+		goto on_error;
+	}
+	ksft_test_result_pass("open a new pidfd test: passed\n");
+
+	pid = get_pid_from_fdinfo_file(pidfd, "Pid:", sizeof("Pid:") - 1);
+	ksft_print_msg("pidfd %d refers to process with pid %d\n", pidfd, pid);
+
+	ret = 0;
+
+on_error:
+	if (pidfd >= 0)
+		close(pidfd);
+
+	return !ret ? ksft_exit_pass() : ksft_exit_fail();
+}
diff --git a/tools/testing/selftests/pidfd/pidfd_test.c b/tools/testing/selftests/pidfd/pidfd_test.c
index 5bae1792e3d6..a03387052aa7 100644
--- a/tools/testing/selftests/pidfd/pidfd_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_test.c
@@ -14,6 +14,7 @@
 #include <sys/wait.h>
 #include <unistd.h>
 
+#include "pidfd.h"
 #include "../kselftest.h"
 
 static inline int sys_pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
@@ -62,28 +63,6 @@ static int test_pidfd_send_signal_simple_success(void)
 	return 0;
 }
 
-static int wait_for_pid(pid_t pid)
-{
-	int status, ret;
-
-again:
-	ret = waitpid(pid, &status, 0);
-	if (ret == -1) {
-		if (errno == EINTR)
-			goto again;
-
-		return -1;
-	}
-
-	if (ret != pid)
-		goto again;
-
-	if (!WIFEXITED(status))
-		return -1;
-
-	return WEXITSTATUS(status);
-}
-
 static int test_pidfd_send_signal_exited_fail(void)
 {
 	int pidfd, ret, saved_errno;
@@ -128,13 +107,6 @@ static int test_pidfd_send_signal_exited_fail(void)
 	return 0;
 }
 
-/*
- * The kernel reserves 300 pids via RESERVED_PIDS in kernel/pid.c
- * That means, when it wraps around any pid < 300 will be skipped.
- * So we need to use a pid > 300 in order to test recycling.
- */
-#define PID_RECYCLE 1000
-
 /*
  * Maximum number of cycles we allow. This is equivalent to PID_MAX_DEFAULT.
  * If users set a higher limit or we have cycled PIDFD_MAX_DEFAULT number of
@@ -143,17 +115,6 @@ static int test_pidfd_send_signal_exited_fail(void)
  */
 #define PIDFD_MAX_DEFAULT 0x8000
 
-/*
- * Define a few custom error codes for the child process to clearly indicate
- * what is happening. This way we can tell the difference between a system
- * error, a test error, etc.
- */
-#define PIDFD_PASS 0
-#define PIDFD_FAIL 1
-#define PIDFD_ERROR 2
-#define PIDFD_SKIP 3
-#define PIDFD_XFAIL 4
-
 static int test_pidfd_send_signal_recycled_pid_fail(void)
 {
 	int i, ret;
-- 
2.21.0

