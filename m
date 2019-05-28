Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D302C639
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 14:12:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ct4f6XcbzDqLg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 22:12:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=vincenzo.frascino@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 45Cswj0YKJzDqGJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 22:05:08 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26FEB341;
 Tue, 28 May 2019 05:05:07 -0700 (PDT)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com
 [10.1.196.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF33A3F59C;
 Tue, 28 May 2019 05:05:04 -0700 (PDT)
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
To: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v5 3/3] kselftest: Extend vDSO selftest to clock_getres
Date: Tue, 28 May 2019 13:04:46 +0100
Message-Id: <20190528120446.48911-4-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528120446.48911-1-vincenzo.frascino@arm.com>
References: <20190528120446.48911-1-vincenzo.frascino@arm.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, vincenzo.frascino@arm.com,
 Shuah Khan <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The current version of the multiarch vDSO selftest verifies only
gettimeofday.

Extend the vDSO selftest to clock_getres, to verify that the
syscall and the vDSO library function return the same information.

The extension has been used to verify the hrtimer_resoltion fix.

Cc: Shuah Khan <shuah@kernel.org>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---

Note: This patch is independent from the others in this series, hence it
can be merged singularly by the kselftest maintainers.

 tools/testing/selftests/vDSO/Makefile         |   2 +
 .../selftests/vDSO/vdso_clock_getres.c        | 124 ++++++++++++++++++
 2 files changed, 126 insertions(+)
 create mode 100644 tools/testing/selftests/vDSO/vdso_clock_getres.c

diff --git a/tools/testing/selftests/vDSO/Makefile b/tools/testing/selftests/vDSO/Makefile
index 9e03d61f52fd..d5c5bfdf1ac1 100644
--- a/tools/testing/selftests/vDSO/Makefile
+++ b/tools/testing/selftests/vDSO/Makefile
@@ -5,6 +5,7 @@ uname_M := $(shell uname -m 2>/dev/null || echo not)
 ARCH ?= $(shell echo $(uname_M) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
 
 TEST_GEN_PROGS := $(OUTPUT)/vdso_test
+TEST_GEN_PROGS += $(OUTPUT)/vdso_clock_getres
 ifeq ($(ARCH),x86)
 TEST_GEN_PROGS += $(OUTPUT)/vdso_standalone_test_x86
 endif
@@ -18,6 +19,7 @@ endif
 
 all: $(TEST_GEN_PROGS)
 $(OUTPUT)/vdso_test: parse_vdso.c vdso_test.c
+$(OUTPUT)/vdso_clock_getres: vdso_clock_getres.c
 $(OUTPUT)/vdso_standalone_test_x86: vdso_standalone_test_x86.c parse_vdso.c
 	$(CC) $(CFLAGS) $(CFLAGS_vdso_standalone_test_x86) \
 		vdso_standalone_test_x86.c parse_vdso.c \
diff --git a/tools/testing/selftests/vDSO/vdso_clock_getres.c b/tools/testing/selftests/vDSO/vdso_clock_getres.c
new file mode 100644
index 000000000000..15dcee16ff72
--- /dev/null
+++ b/tools/testing/selftests/vDSO/vdso_clock_getres.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
+/*
+ * vdso_clock_getres.c: Sample code to test clock_getres.
+ * Copyright (c) 2019 Arm Ltd.
+ *
+ * Compile with:
+ * gcc -std=gnu99 vdso_clock_getres.c
+ *
+ * Tested on ARM, ARM64, MIPS32, x86 (32-bit and 64-bit),
+ * Power (32-bit and 64-bit), S390x (32-bit and 64-bit).
+ * Might work on other architectures.
+ */
+
+#define _GNU_SOURCE
+#include <elf.h>
+#include <err.h>
+#include <fcntl.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <time.h>
+#include <sys/auxv.h>
+#include <sys/mman.h>
+#include <sys/time.h>
+#include <unistd.h>
+#include <sys/syscall.h>
+
+#include "../kselftest.h"
+
+static long syscall_clock_getres(clockid_t _clkid, struct timespec *_ts)
+{
+	long ret;
+
+	ret = syscall(SYS_clock_getres, _clkid, _ts);
+
+	return ret;
+}
+
+const char *vdso_clock_name[12] = {
+	"CLOCK_REALTIME",
+	"CLOCK_MONOTONIC",
+	"CLOCK_PROCESS_CPUTIME_ID",
+	"CLOCK_THREAD_CPUTIME_ID",
+	"CLOCK_MONOTONIC_RAW",
+	"CLOCK_REALTIME_COARSE",
+	"CLOCK_MONOTONIC_COARSE",
+	"CLOCK_BOOTTIME",
+	"CLOCK_REALTIME_ALARM",
+	"CLOCK_BOOTTIME_ALARM",
+	"CLOCK_SGI_CYCLE",
+	"CLOCK_TAI",
+};
+
+/*
+ * This function calls clock_getres in vdso and by system call
+ * with different values for clock_id.
+ *
+ * Example of output:
+ *
+ * clock_id: CLOCK_REALTIME [PASS]
+ * clock_id: CLOCK_BOOTTIME [PASS]
+ * clock_id: CLOCK_TAI [PASS]
+ * clock_id: CLOCK_REALTIME_COARSE [PASS]
+ * clock_id: CLOCK_MONOTONIC [PASS]
+ * clock_id: CLOCK_MONOTONIC_RAW [PASS]
+ * clock_id: CLOCK_MONOTONIC_COARSE [PASS]
+ */
+static inline int vdso_test_clock(unsigned int clock_id)
+{
+	struct timespec x, y;
+
+	printf("clock_id: %s", vdso_clock_name[clock_id]);
+	clock_getres(clock_id, &x);
+	syscall_clock_getres(clock_id, &y);
+
+	if ((x.tv_sec != y.tv_sec) || (x.tv_nsec != y.tv_nsec)) {
+		printf(" [FAIL]\n");
+		return KSFT_FAIL;
+	}
+
+	printf(" [PASS]\n");
+	return KSFT_PASS;
+}
+
+int main(int argc, char **argv)
+{
+	int ret;
+
+#if _POSIX_TIMERS > 0
+
+#ifdef CLOCK_REALTIME
+	ret = vdso_test_clock(CLOCK_REALTIME);
+#endif
+
+#ifdef CLOCK_BOOTTIME
+	ret += vdso_test_clock(CLOCK_BOOTTIME);
+#endif
+
+#ifdef CLOCK_TAI
+	ret += vdso_test_clock(CLOCK_TAI);
+#endif
+
+#ifdef CLOCK_REALTIME_COARSE
+	ret += vdso_test_clock(CLOCK_REALTIME_COARSE);
+#endif
+
+#ifdef CLOCK_MONOTONIC
+	ret += vdso_test_clock(CLOCK_MONOTONIC);
+#endif
+
+#ifdef CLOCK_MONOTONIC_RAW
+	ret += vdso_test_clock(CLOCK_MONOTONIC_RAW);
+#endif
+
+#ifdef CLOCK_MONOTONIC_COARSE
+	ret += vdso_test_clock(CLOCK_MONOTONIC_COARSE);
+#endif
+
+#endif
+	if (ret > 0)
+		return KSFT_FAIL;
+
+	return KSFT_PASS;
+}
-- 
2.21.0

