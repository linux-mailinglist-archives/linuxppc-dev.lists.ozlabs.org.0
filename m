Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 368D624E40
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 13:44:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457Ynf5djBzDqP7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 21:44:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=brauner.io
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=christian@brauner.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="Kg5eAwKu"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457Yjv5YVdzDqLV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 21:40:51 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id c5so8300413pll.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 04:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Md/SEV623PH8+Ut8zUc7zYx2Wn6pyFc2gwGLva1wC8M=;
 b=Kg5eAwKuepKyHoZb0HIBpHsOjkWQvVsLqc8VN/0VGDOq5PzBKsxI6IQr7kDH3bEbgs
 zZWW728d/N9Bayktnz43WT4cIbAqKqGG4stcXL4mZNI8ES5QddufVPmSAuxeP8h85EI0
 P4Jsl7YCYQfB4KNxPtE1r1FJJ943rbcT0S0la0XuVbmH5sbe4qTS2zoyharGmQ1S6cNn
 XqxluNBYBUVpO8xiVXLWd2HQmKkM+rxu86S2nPC7PchCjCY7Mlz2A9e2+qbpajUYcvB9
 aOSugtRc7aWe9b52gavavVVbFhMs5KONMsqn/1YCylCHuC3IrXbWbyqvpjpzp1Aywh8X
 IFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Md/SEV623PH8+Ut8zUc7zYx2Wn6pyFc2gwGLva1wC8M=;
 b=Zk772GiUXJNWdkALoFy3VCK/U1x3jyrv9VSj+d7cxmorKmZTO6uKtr+5lIosunaoj6
 TpQ4VXwU4KcWipFHbXM36eD0aZbZcwrWYDr9PTeaNjmCslcMO5TH5LyQyZYmuwfX0SKw
 HbLotGOVKiFfJx394qox/JRnnvTcitXVKtlvbtMPshdMZbZq476cAUuYf0I3jrGnhgNt
 dV3AmwcsUqRmUF+LvS9TqZQu6COOPOT6FT7saRsXoRgzNatqrSHI4ZDZ1w2NLMejLZLm
 9fG0TvjEPgKWmajgdgE2ZYByFLTjVSLdh4v20WBD9rFNI/mwf83xQke0RJd2n41GWqRA
 ePUg==
X-Gm-Message-State: APjAAAWN3a3EekGa5VCFcou0+kFdiGcauprVwAEbbvBZBj/tPy82FGsw
 iIxaDJwtDRo9GLPZ13ykr6eAMQ==
X-Google-Smtp-Source: APXvYqzbXBIlQ2z2g72ZEC89uyp74lq3y/Ysp7sahtfrvXFl1YlEL04tAQWbw1P6O9siRCL+PpC15g==
X-Received: by 2002:a17:902:184:: with SMTP id b4mr55569251plb.2.1558438848409; 
 Tue, 21 May 2019 04:40:48 -0700 (PDT)
Received: from localhost.localdomain ([208.54.39.182])
 by smtp.gmail.com with ESMTPSA id s9sm34103515pfa.31.2019.05.21.04.40.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 May 2019 04:40:47 -0700 (PDT)
From: Christian Brauner <christian@brauner.io>
To: viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org
Subject: [PATCH 2/2] tests: add close_range() tests
Date: Tue, 21 May 2019 13:34:48 +0200
Message-Id: <20190521113448.20654-2-christian@brauner.io>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521113448.20654-1-christian@brauner.io>
References: <20190521113448.20654-1-christian@brauner.io>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, ldv@altlinux.org,
 dhowells@redhat.com, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, shuah@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, miklos@szeredi.hu, x86@kernel.org,
 Christian Brauner <christian@brauner.io>, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, tkjos@android.com, arnd@arndb.de,
 jannh@google.com, linux-m68k@lists.linux-m68k.org, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, fweimer@redhat.com,
 linux-parisc@vger.kernel.org, torvalds@linux-foundation.org, oleg@redhat.com,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds basic tests for the new close_range() syscall.
- test that no invalid flags can be passed
- test that a range of file descriptors is correctly closed
- test that a range of file descriptors is correctly closed if there there
  are already closed file descriptors in the range
- test that max_fd is correctly capped to the current fdtable maximum

Signed-off-by: Christian Brauner <christian@brauner.io>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Jann Horn <jannh@google.com>
Cc: David Howells <dhowells@redhat.com>
Cc: Dmitry V. Levin <ldv@altlinux.org>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Florian Weimer <fweimer@redhat.com>
Cc: linux-api@vger.kernel.org
---
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/core/.gitignore       |   1 +
 tools/testing/selftests/core/Makefile         |   6 +
 .../testing/selftests/core/close_range_test.c | 128 ++++++++++++++++++
 4 files changed, 136 insertions(+)
 create mode 100644 tools/testing/selftests/core/.gitignore
 create mode 100644 tools/testing/selftests/core/Makefile
 create mode 100644 tools/testing/selftests/core/close_range_test.c

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 9781ca79794a..06e57fabbff9 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -4,6 +4,7 @@ TARGETS += bpf
 TARGETS += breakpoints
 TARGETS += capabilities
 TARGETS += cgroup
+TARGETS += core
 TARGETS += cpufreq
 TARGETS += cpu-hotplug
 TARGETS += drivers/dma-buf
diff --git a/tools/testing/selftests/core/.gitignore b/tools/testing/selftests/core/.gitignore
new file mode 100644
index 000000000000..6e6712ce5817
--- /dev/null
+++ b/tools/testing/selftests/core/.gitignore
@@ -0,0 +1 @@
+close_range_test
diff --git a/tools/testing/selftests/core/Makefile b/tools/testing/selftests/core/Makefile
new file mode 100644
index 000000000000..de3ae68aa345
--- /dev/null
+++ b/tools/testing/selftests/core/Makefile
@@ -0,0 +1,6 @@
+CFLAGS += -g -I../../../../usr/include/ -I../../../../include
+
+TEST_GEN_PROGS := close_range_test
+
+include ../lib.mk
+
diff --git a/tools/testing/selftests/core/close_range_test.c b/tools/testing/selftests/core/close_range_test.c
new file mode 100644
index 000000000000..ab10cd205ab9
--- /dev/null
+++ b/tools/testing/selftests/core/close_range_test.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <linux/kernel.h>
+#include <limits.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <syscall.h>
+#include <unistd.h>
+
+#include "../kselftest.h"
+
+static inline int sys_close_range(unsigned int fd, unsigned int max_fd,
+				  unsigned int flags)
+{
+	return syscall(__NR_close_range, fd, max_fd, flags);
+}
+
+#ifndef ARRAY_SIZE
+#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
+#endif
+
+int main(int argc, char **argv)
+{
+	const char *test_name = "close_range";
+	int i, ret;
+	int open_fds[100];
+	int fd_max, fd_mid, fd_min;
+
+	ksft_set_plan(7);
+
+	for (i = 0; i < ARRAY_SIZE(open_fds); i++) {
+		int fd;
+
+		fd = open("/dev/null", O_RDONLY | O_CLOEXEC);
+		if (fd < 0) {
+			if (errno == ENOENT)
+				ksft_exit_skip(
+					"%s test: skipping test since /dev/null does not exist\n",
+					test_name);
+
+			ksft_exit_fail_msg(
+				"%s test: %s - failed to open /dev/null\n",
+				strerror(errno), test_name);
+		}
+
+		open_fds[i] = fd;
+	}
+
+	fd_min = open_fds[0];
+	fd_max = open_fds[99];
+
+	ret = sys_close_range(fd_min, fd_max, 1);
+	if (!ret)
+		ksft_exit_fail_msg(
+			"%s test: managed to pass invalid flag value\n",
+			test_name);
+	ksft_test_result_pass("do not allow invalid flag values for close_range()\n");
+
+	fd_mid = open_fds[50];
+	ret = sys_close_range(fd_min, fd_mid, 0);
+	if (ret < 0)
+		ksft_exit_fail_msg(
+			"%s test: Failed to close range of file descriptors from 4 to 50\n",
+			test_name);
+	ksft_test_result_pass("close_range() from %d to %d\n", fd_min, fd_mid);
+
+	for (i = 0; i <= 50; i++) {
+		ret = fcntl(open_fds[i], F_GETFL);
+		if (ret >= 0)
+			ksft_exit_fail_msg(
+				"%s test: Failed to close range of file descriptors from 4 to 50\n",
+				test_name);
+	}
+	ksft_test_result_pass("fcntl() verify closed range from %d to %d\n", fd_min, fd_mid);
+
+	/* create a couple of gaps */
+	close(57);
+	close(78);
+	close(81);
+	close(82);
+	close(84);
+	close(90);
+
+	fd_mid = open_fds[51];
+	/* Choose slightly lower limit and leave some fds for a later test */
+	fd_max = open_fds[92];
+	ret = sys_close_range(fd_mid, fd_max, 0);
+	if (ret < 0)
+		ksft_exit_fail_msg(
+			"%s test: Failed to close range of file descriptors from 51 to 100\n",
+			test_name);
+	ksft_test_result_pass("close_range() from %d to %d\n", fd_mid, fd_max);
+
+	for (i = 51; i <= 92; i++) {
+		ret = fcntl(open_fds[i], F_GETFL);
+		if (ret >= 0)
+			ksft_exit_fail_msg(
+				"%s test: Failed to close range of file descriptors from 51 to 100\n",
+				test_name);
+	}
+	ksft_test_result_pass("fcntl() verify closed range from %d to %d\n", fd_mid, fd_max);
+
+	fd_mid = open_fds[93];
+	fd_max = open_fds[99];
+	/* test that the kernel caps and still closes all fds */
+	ret = sys_close_range(fd_mid, UINT_MAX, 0);
+	if (ret < 0)
+		ksft_exit_fail_msg(
+			"%s test: Failed to close range of file descriptors from 51 to 100\n",
+			test_name);
+	ksft_test_result_pass("close_range() from %d to %d\n", fd_mid, fd_max);
+
+	for (i = 93; i < 100; i++) {
+		ret = fcntl(open_fds[i], F_GETFL);
+		if (ret >= 0)
+			ksft_exit_fail_msg(
+				"%s test: Failed to close range of file descriptors from 51 to 100\n",
+				test_name);
+	}
+	ksft_test_result_pass("fcntl() verify closed range from %d to %d\n", fd_mid, fd_max);
+
+	return ksft_exit_pass();
+}
-- 
2.21.0

