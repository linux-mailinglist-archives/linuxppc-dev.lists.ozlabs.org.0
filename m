Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4A01CC295
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 18:19:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49KC8T3j5HzDr1j
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 02:19:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49KC6f3XKTzDqwY
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 May 2020 02:18:16 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49KC6V5rdgz9v0b6;
 Sat,  9 May 2020 18:18:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id BzLqXVjCH2t8; Sat,  9 May 2020 18:18:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49KC6V402Qz9v0b3;
 Sat,  9 May 2020 18:18:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CBD0E8B775;
 Sat,  9 May 2020 18:18:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RscsG8tyHa6h; Sat,  9 May 2020 18:18:12 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6E5658B75F;
 Sat,  9 May 2020 18:18:12 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5369265770; Sat,  9 May 2020 16:18:12 +0000 (UTC)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: nathanl@linux.ibm.com, arnd@arndb.de
Subject: [PATCH vdsotest] Add support for clock_gettime64() on powerpc32
Message-Id: <20200509161812.5369265770@pc16570vm.idsi0.si.c-s.fr>
Date: Sat,  9 May 2020 16:18:12 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

libc test is commented out because at the time being
very few libc if any supports clock_gettime64()

syscall number is hardcoded when it doesn't exists in unistd.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
Based on master from https://github.com/nathanlynch/vdsotest.git

 src/clock-boottime.c           |   4 +
 src/clock-monotonic-coarse.c   |   4 +
 src/clock-monotonic-raw.c      |   4 +
 src/clock-monotonic.c          |   4 +
 src/clock-realtime-coarse.c    |   4 +
 src/clock-realtime.c           |   4 +
 src/clock-tai.c                |   4 +
 src/clock_gettime64_template.c | 401 +++++++++++++++++++++++++++++++++
 8 files changed, 429 insertions(+)
 create mode 100644 src/clock_gettime64_template.c

diff --git a/src/clock-boottime.c b/src/clock-boottime.c
index 9fb1ac48501d..07ef31d08614 100644
--- a/src/clock-boottime.c
+++ b/src/clock-boottime.c
@@ -3,3 +3,7 @@
 
 #include "clock_gettime_template.c"
 #include "clock_getres_template.c"
+
+#if defined(__powerpc__) && !defined(__powerpc64__)
+#include "clock_gettime64_template.c"
+#endif
diff --git a/src/clock-monotonic-coarse.c b/src/clock-monotonic-coarse.c
index ca1df58691ca..da064188756f 100644
--- a/src/clock-monotonic-coarse.c
+++ b/src/clock-monotonic-coarse.c
@@ -3,3 +3,7 @@
 
 #include "clock_gettime_template.c"
 #include "clock_getres_template.c"
+
+#if defined(__powerpc__) && !defined(__powerpc64__)
+#include "clock_gettime64_template.c"
+#endif
diff --git a/src/clock-monotonic-raw.c b/src/clock-monotonic-raw.c
index 5dbb1842e698..55373b94ecfd 100644
--- a/src/clock-monotonic-raw.c
+++ b/src/clock-monotonic-raw.c
@@ -3,3 +3,7 @@
 
 #include "clock_gettime_template.c"
 #include "clock_getres_template.c"
+
+#if defined(__powerpc__) && !defined(__powerpc64__)
+#include "clock_gettime64_template.c"
+#endif
diff --git a/src/clock-monotonic.c b/src/clock-monotonic.c
index 44318ae1e1c2..a900d24598a1 100644
--- a/src/clock-monotonic.c
+++ b/src/clock-monotonic.c
@@ -3,3 +3,7 @@
 
 #include "clock_gettime_template.c"
 #include "clock_getres_template.c"
+
+#if defined(__powerpc__) && !defined(__powerpc64__)
+#include "clock_gettime64_template.c"
+#endif
diff --git a/src/clock-realtime-coarse.c b/src/clock-realtime-coarse.c
index 8f33f9a2d30b..8f2e6242bf0d 100644
--- a/src/clock-realtime-coarse.c
+++ b/src/clock-realtime-coarse.c
@@ -3,3 +3,7 @@
 
 #include "clock_gettime_template.c"
 #include "clock_getres_template.c"
+
+#if defined(__powerpc__) && !defined(__powerpc64__)
+#include "clock_gettime64_template.c"
+#endif
diff --git a/src/clock-realtime.c b/src/clock-realtime.c
index 079fd801e654..ab76329a6676 100644
--- a/src/clock-realtime.c
+++ b/src/clock-realtime.c
@@ -3,3 +3,7 @@
 
 #include "clock_gettime_template.c"
 #include "clock_getres_template.c"
+
+#if defined(__powerpc__) && !defined(__powerpc64__)
+#include "clock_gettime64_template.c"
+#endif
diff --git a/src/clock-tai.c b/src/clock-tai.c
index ad0448adeba5..cb2511039ddc 100644
--- a/src/clock-tai.c
+++ b/src/clock-tai.c
@@ -7,3 +7,7 @@
 
 #include "clock_gettime_template.c"
 #include "clock_getres_template.c"
+
+#if defined(__powerpc__) && !defined(__powerpc64__)
+#include "clock_gettime64_template.c"
+#endif
diff --git a/src/clock_gettime64_template.c b/src/clock_gettime64_template.c
new file mode 100644
index 000000000000..4752845148d6
--- /dev/null
+++ b/src/clock_gettime64_template.c
@@ -0,0 +1,401 @@
+/*
+ * Copyright 2014 Mentor Graphics Corporation.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; version 2 of the
+ * License.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+ */
+
+#include <errno.h>
+#include <error.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/mman.h>
+#include <sys/syscall.h>
+#include <sys/time.h>
+#include <unistd.h>
+
+#include "compiler.h"
+#include "vdsotest.h"
+
+struct timespec64 {
+	long long tv_sec;
+	long tv_nsec;
+};
+
+#ifndef SYS_clock_gettime64
+#define SYS_clock_gettime64 403
+#endif
+
+static int (*clock_gettime64_vdso)(clockid_t id, struct timespec64 *ts);
+
+static bool vdso_has_clock_gettime64(void)
+{
+	return clock_gettime64_vdso != NULL;
+}
+
+static int clock_gettime64_syscall_wrapper(clockid_t id, struct timespec64 *ts)
+{
+	return syscall(SYS_clock_gettime64, id, ts);
+}
+
+static void clock_gettime64_syscall_nofail(clockid_t id, struct timespec64 *ts)
+{
+	int err;
+
+	err = clock_gettime64_syscall_wrapper(id, ts);
+	if (err)
+		error(EXIT_FAILURE, errno, "SYS_clock_gettime64");
+}
+
+static int clock_gettime64_vdso_wrapper(clockid_t id, struct timespec64 *ts)
+{
+	return DO_VDSO_CALL(clock_gettime64_vdso, int, 2, id, ts);
+}
+
+static void clock_gettime64_vdso_nofail(clockid_t id, struct timespec64 *ts)
+{
+	int err;
+
+	err = clock_gettime64_vdso_wrapper(id, ts);
+	if (err)
+		error(EXIT_FAILURE, errno, "clock_gettime");
+}
+
+static bool timespecs64_ordered(const struct timespec64 *first,
+				const struct timespec64 *second)
+{
+	if (first->tv_sec < second->tv_sec)
+		return true;
+
+	if (first->tv_sec == second->tv_sec)
+		return first->tv_nsec <= second->tv_nsec;
+
+	return false;
+}
+
+static bool timespec64_normalized(const struct timespec64 *ts)
+{
+	if (ts->tv_sec < 0)
+		return false;
+	if (ts->tv_nsec < 0)
+		return false;
+	if (ts->tv_nsec >= NSEC_PER_SEC)
+		return false;
+	return true;
+}
+
+static void clock_gettime64_verify(struct ctx *ctx)
+{
+	struct timespec64 now;
+
+	clock_gettime64_syscall_nofail(CLOCK_ID, &now);
+
+	ctx_start_timer(ctx);
+
+	while (!test_should_stop(ctx)) {
+		struct timespec64 prev;
+
+		if (!vdso_has_clock_gettime64())
+			goto skip_vdso;
+
+		prev = now;
+
+		clock_gettime64_vdso_nofail(CLOCK_ID, &now);
+
+		if (!timespec64_normalized(&now)) {
+			log_failure(ctx, "timestamp obtained from libc/vDSO "
+				    "not normalized:\n"
+				    "\t[%ld, %ld]\n",
+				    (long int)now.tv_sec, (long int)now.tv_nsec);
+		}
+
+		if (!timespecs64_ordered(&prev, &now)) {
+			log_failure(ctx, "timestamp obtained from libc/vDSO "
+				    "predates timestamp\n"
+				    "previously obtained from kernel:\n"
+				    "\t[%ld, %ld] (kernel)\n"
+				    "\t[%ld, %ld] (vDSO)\n",
+				    (long int)prev.tv_sec, (long int)prev.tv_nsec,
+				    (long int)now.tv_sec, (long int)now.tv_nsec);
+		}
+
+	skip_vdso:
+		prev = now;
+
+		clock_gettime64_syscall_nofail(CLOCK_ID, &now);
+
+		if (!timespec64_normalized(&now)) {
+			log_failure(ctx, "timestamp obtained from kernel "
+				    "not normalized:\n"
+				    "\t[%ld, %ld]\n",
+				    (long int)now.tv_sec, (long int)now.tv_nsec);
+		}
+
+		if (!timespecs64_ordered(&prev, &now)) {
+			log_failure(ctx, "timestamp obtained from kernel "
+				    "predates timestamp\n"
+				    "previously obtained from libc/vDSO:\n"
+				    "\t[%ld, %ld] (vDSO)\n"
+				    "\t[%ld, %ld] (kernel)\n",
+				    (long int)prev.tv_sec, (long int)prev.tv_nsec,
+				    (long int)now.tv_sec, (long int)now.tv_nsec);
+		}
+
+	}
+
+	ctx_cleanup_timer(ctx);
+}
+
+static void clock_gettime64_bench(struct ctx *ctx, struct bench_results *res)
+{
+	struct timespec64 ts;
+
+	if (vdso_has_clock_gettime64()) {
+		BENCH(ctx, clock_gettime64_vdso_wrapper(CLOCK_ID, &ts),
+		      &res->vdso_interval);
+	}
+
+/*	BENCH(ctx, clock_gettime64(CLOCK_ID, &ts),
+	      &res->libc_interval);
+*/
+	BENCH(ctx, clock_gettime64_syscall_wrapper(CLOCK_ID, &ts),
+	      &res->sys_interval);
+}
+
+static void sys_clock_gettime64_simple(void *arg, struct syscall_result *res)
+{
+	int err;
+
+	syscall_prepare();
+	err = clock_gettime64_syscall_wrapper(CLOCK_ID, arg);
+	record_syscall_result(res, err, errno);
+}
+
+static void sys_clock_gettime64_prot(void *arg, struct syscall_result *res)
+{
+	void *buf;
+	int err;
+
+	buf = alloc_page((int)(unsigned long)arg);
+	syscall_prepare();
+	err = clock_gettime64_syscall_wrapper(CLOCK_ID, buf);
+	record_syscall_result(res, err, errno);
+	free_page(buf);
+}
+
+static void vdso_clock_gettime64_simple(void *arg, struct syscall_result *res)
+{
+	int err;
+
+	syscall_prepare();
+	err = clock_gettime64_vdso_wrapper(CLOCK_ID, arg);
+	record_syscall_result(res, err, errno);
+}
+
+static void vdso_clock_gettime64_prot(void *arg, struct syscall_result *res)
+{
+	void *buf;
+	int err;
+
+	buf = alloc_page((int)(unsigned long)arg);
+	syscall_prepare();
+	err = clock_gettime64_vdso_wrapper(CLOCK_ID, buf);
+	record_syscall_result(res, err, errno);
+	free_page(buf);
+}
+
+static void clock_gettime64_bogus_id(void *arg, struct syscall_result *res)
+{
+	struct timespec64 ts;
+	int err;
+
+	syscall_prepare();
+	err = arg ? clock_gettime64_syscall_wrapper((clockid_t)-1, &ts) :
+		clock_gettime64_vdso_wrapper((clockid_t)-1, &ts);
+
+	record_syscall_result(res, err, errno);
+}
+
+static void clock_gettime64_bogus_id_null(void *arg, struct syscall_result *res)
+{
+	int err;
+
+	syscall_prepare();
+	err = arg ? clock_gettime64_syscall_wrapper((clockid_t)-1, NULL) :
+		clock_gettime64_vdso_wrapper((clockid_t)-1, NULL);
+
+	record_syscall_result(res, err, errno);
+}
+
+static const struct child_params sys_clock_gettime64_abi_params[] = {
+
+	/* Kernel sanity checks */
+
+	{
+		.desc = "passing NULL to clock_gettime (syscall)",
+		.func = sys_clock_gettime64_simple,
+		.arg = NULL,
+		.expected_ret = -1,
+		.expected_errno = EFAULT,
+	},
+	{
+		.desc = "passing UINTPTR_MAX to clock_gettime (syscall)",
+		.func = sys_clock_gettime64_simple,
+		.arg = (void *)ADDR_SPACE_END,
+		.expected_ret = -1,
+		.expected_errno = EFAULT,
+	},
+	{
+		.desc = "passing PROT_NONE page to clock_gettime (syscall)",
+		.func = sys_clock_gettime64_prot,
+		.arg = (void *)PROT_NONE,
+		.expected_ret = -1,
+		.expected_errno = EFAULT,
+	},
+	{
+		.desc = "passing PROT_READ page to clock_gettime (syscall)",
+		.func = sys_clock_gettime64_prot,
+		.arg = (void *)PROT_READ,
+		.expected_ret = -1,
+		.expected_errno = EFAULT,
+	},
+	{
+		/* This will be duplicated across the different clock
+		 * id modules.  Oh well.
+		 */
+		.desc = "passing bogus clock id to clock_gettime (syscall)",
+		.func = clock_gettime64_bogus_id,
+		.arg = (void *)true, /* force syscall */
+		.expected_ret = -1,
+		.expected_errno = EINVAL,
+	},
+	{
+		/* This one too. */
+		.desc = "passing bogus clock id and NULL to clock_gettime (syscall)",
+		.func = clock_gettime64_bogus_id_null,
+		.arg = (void *)true, /* force syscall */
+		.expected_ret = -1,
+		.expected_errno = EINVAL,
+	},
+};
+
+static const struct child_params vdso_clock_gettime64_abi_params[] = {
+	/* The below will be serviced by a vDSO, if present. */
+
+	{
+		.desc = "passing NULL to clock_gettime (VDSO)",
+		.func = vdso_clock_gettime64_simple,
+		.arg = NULL,
+		.expected_ret = -1,
+		.expected_errno = EFAULT,
+		.signal_set = {
+			.mask = SIGNO_TO_BIT(SIGSEGV),
+		},
+	},
+	{
+		.desc = "passing UINTPTR_MAX to clock_gettime (VDSO)",
+		.func = vdso_clock_gettime64_simple,
+		.arg = (void *)ADDR_SPACE_END,
+		.expected_ret = -1,
+		.expected_errno = EFAULT,
+		.signal_set = {
+			.mask = SIGNO_TO_BIT(SIGSEGV),
+		},
+	},
+	{
+		.desc = "passing PROT_NONE page to clock_gettime (VDSO)",
+		.func = vdso_clock_gettime64_prot,
+		.arg = (void *)PROT_NONE,
+		.expected_ret = -1,
+		.expected_errno = EFAULT,
+		.signal_set = {
+			.mask = SIGNO_TO_BIT(SIGSEGV),
+		},
+	},
+	{
+		.desc = "passing PROT_READ page to clock_gettime (VDSO)",
+		.func = vdso_clock_gettime64_prot,
+		.arg = (void *)PROT_READ,
+		.expected_ret = -1,
+		.expected_errno = EFAULT,
+		.signal_set = {
+			.mask = SIGNO_TO_BIT(SIGSEGV),
+		},
+	},
+	{
+		/* This will be duplicated across the different clock
+		 * id modules.  Oh well.
+		 */
+		.desc = "passing bogus clock id to clock_gettime (VDSO)",
+		.func = clock_gettime64_bogus_id,
+		.arg = (void *)false, /* use vdso */
+		.expected_ret = -1,
+		.expected_errno = EINVAL,
+	},
+	{
+		/* This one too. */
+		.desc = "passing bogus clock id and NULL to clock_gettime (VDSO)",
+		.func = clock_gettime64_bogus_id_null,
+		.arg = (void *)false, /* use vdso */
+		.expected_ret = -1,
+		.expected_errno = EINVAL,
+	},
+};
+
+static void clock_gettime64_abi(struct ctx *ctx)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(sys_clock_gettime64_abi_params); i++)
+		run_as_child(ctx, &sys_clock_gettime64_abi_params[i]);
+
+	if (vdso_has_clock_gettime64()) {
+		for (i = 0; i < ARRAY_SIZE(vdso_clock_gettime64_abi_params); i++)
+			run_as_child(ctx, &vdso_clock_gettime64_abi_params[i]);
+	}
+}
+
+static void clock_gettime64_notes(struct ctx *ctx)
+{
+	if (!vdso_has_clock_gettime64())
+		printf("Note: vDSO version of clock_gettime64 not found\n");
+}
+
+static const char *clock_gettime64_vdso_names[] = {
+	"__kernel_clock_gettime64",
+	"__vdso_clock_gettime64",
+	NULL,
+};
+
+static void clock_gettime64_bind(void *sym)
+{
+	clock_gettime64_vdso = sym;
+}
+
+static const struct test_suite clock_gettime64_ts = {
+	.name = "clock-gettime64-" TS_SFX,
+	.bench = clock_gettime64_bench,
+	.verify = clock_gettime64_verify,
+	.abi = clock_gettime64_abi,
+	.notes = clock_gettime64_notes,
+	.vdso_names = clock_gettime64_vdso_names,
+	.bind = clock_gettime64_bind,
+};
+
+static void __constructor clock_gettime64_init(void)
+{
+	register_testsuite(&clock_gettime64_ts);
+}

base-commit: 7e4796a0695bdff3daca22630761264f5dff4680
-- 
2.25.0

