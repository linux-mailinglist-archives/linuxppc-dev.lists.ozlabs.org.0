Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A19F22C23A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 11:27:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCkPV4dK8zF0Rv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 19:27:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCkMJ02RgzDrRS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 19:25:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=LWa7njuG; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BCkMH6TKTz9sSn; Fri, 24 Jul 2020 19:25:31 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCkMH5gf4z9sSt; Fri, 24 Jul 2020 19:25:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595582731;
 bh=db7R72ZCTisKVf7zjg1eF+11M6bWtithNyKdSD6Yy7Q=;
 h=From:To:Cc:Subject:Date:From;
 b=LWa7njuGH8XC/7WYQ9I+Fvz4wp1NfljqIs2M3eJ+hh9RMLYq4UyydX36ygZfTH2jy
 8Js6U/Lj59593SngNB/9f4XRyoi5cKwIn/p07pTz26TpSAHo0D/CW5ht48yLqhlN+v
 /1Z4tN1y96jNduFccmLpVvC8BQTYl8mIjXdTPTHnonkhWVUhMMEw3uc3Kvf0gY4m5L
 6vAGvvBTwYY8MWiJ5sTinSzpwM4aioWUgiYNakujRenhERh6j4q6PMdF6FHpjW0mgu
 uAncQh2oQbKQD1e+0+4bHeRI852mIep0LHrh8SNqNvlIeEiz4pG1F5vlobMMA8L8Hv
 Qv5nMcKzj3gpg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 1/5] selftests/powerpc: Add test of stack expansion logic
Date: Fri, 24 Jul 2020 19:25:24 +1000
Message-Id: <20200724092528.1578671-1-mpe@ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We have custom stack expansion checks that it turns out are extremely
badly tested and contain bugs, surprise. So add some tests that
exercise the code and capture the current boundary conditions.

The signal test currently fails on 64-bit kernels because the 2048
byte allowance for the signal frame is too small, we will fix that in
a subsequent patch.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---

v2:
 - Concentrate on used stack around the 1MB size, as that's where our
   custom logic kicks in.
 - Increment the used stack size by 64 so we can exercise the case
   where we overflow the page by less than 128 (__SIGNAL_FRAMESIZE).

---
 tools/testing/selftests/powerpc/mm/.gitignore |   2 +
 tools/testing/selftests/powerpc/mm/Makefile   |   9 +-
 .../powerpc/mm/stack_expansion_ldst.c         | 233 ++++++++++++++++++
 .../powerpc/mm/stack_expansion_signal.c       | 118 +++++++++
 tools/testing/selftests/powerpc/pmu/lib.h     |   1 +
 5 files changed, 362 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c
 create mode 100644 tools/testing/selftests/powerpc/mm/stack_expansion_signal.c

diff --git a/tools/testing/selftests/powerpc/mm/.gitignore b/tools/testing/selftests/powerpc/mm/.gitignore
index 8d041f508a51..52308f42b7de 100644
--- a/tools/testing/selftests/powerpc/mm/.gitignore
+++ b/tools/testing/selftests/powerpc/mm/.gitignore
@@ -8,3 +8,5 @@ large_vm_fork_separation
 bad_accesses
 tlbie_test
 pkey_exec_prot
+stack_expansion_ldst
+stack_expansion_signal
diff --git a/tools/testing/selftests/powerpc/mm/Makefile b/tools/testing/selftests/powerpc/mm/Makefile
index 5a86d59441dc..6cd772e0e374 100644
--- a/tools/testing/selftests/powerpc/mm/Makefile
+++ b/tools/testing/selftests/powerpc/mm/Makefile
@@ -3,7 +3,9 @@
 	$(MAKE) -C ../
 
 TEST_GEN_PROGS := hugetlb_vs_thp_test subpage_prot segv_errors wild_bctr \
-		  large_vm_fork_separation bad_accesses pkey_exec_prot
+		  large_vm_fork_separation bad_accesses pkey_exec_prot stack_expansion_signal \
+		  stack_expansion_ldst
+
 TEST_GEN_PROGS_EXTENDED := tlbie_test
 TEST_GEN_FILES := tempfile
 
@@ -17,6 +19,11 @@ $(OUTPUT)/large_vm_fork_separation: CFLAGS += -m64
 $(OUTPUT)/bad_accesses: CFLAGS += -m64
 $(OUTPUT)/pkey_exec_prot: CFLAGS += -m64
 
+$(OUTPUT)/stack_expansion_signal: ../utils.c ../pmu/lib.c
+
+$(OUTPUT)/stack_expansion_ldst: CFLAGS += -fno-stack-protector
+$(OUTPUT)/stack_expansion_ldst: ../utils.c
+
 $(OUTPUT)/tempfile:
 	dd if=/dev/zero of=$@ bs=64k count=1
 
diff --git a/tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c b/tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c
new file mode 100644
index 000000000000..0587e11437f5
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test that loads/stores expand the stack segment, or trigger a SEGV, in
+ * various conditions.
+ *
+ * Based on test code by Tom Lane.
+ */
+
+#undef NDEBUG
+#include <assert.h>
+
+#include <err.h>
+#include <errno.h>
+#include <stdio.h>
+#include <signal.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/resource.h>
+#include <sys/time.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#define _KB (1024)
+#define _MB (1024 * 1024)
+
+volatile char *stack_top_ptr;
+volatile unsigned long stack_top_sp;
+volatile char c;
+
+enum access_type {
+	LOAD,
+	STORE,
+};
+
+/*
+ * Consume stack until the stack pointer is below @target_sp, then do an access
+ * (load or store) at offset @delta from either the base of the stack or the
+ * current stack pointer.
+ */
+__attribute__ ((noinline))
+int consume_stack(unsigned long target_sp, unsigned long stack_high, int delta, enum access_type type)
+{
+	unsigned long target;
+	char stack_cur;
+
+	if ((unsigned long)&stack_cur > target_sp)
+		return consume_stack(target_sp, stack_high, delta, type);
+	else {
+		// We don't really need this, but without it GCC might not
+		// generate a recursive call above.
+		stack_top_ptr = &stack_cur;
+
+#ifdef __powerpc__
+		asm volatile ("mr %[sp], %%r1" : [sp] "=r" (stack_top_sp));
+#else
+		asm volatile ("mov %%rsp, %[sp]" : [sp] "=r" (stack_top_sp));
+#endif
+
+		// Kludge, delta < 0 indicates relative to SP
+		if (delta < 0)
+			target = stack_top_sp + delta;
+		else
+			target = stack_high - delta + 1;
+
+		volatile char *p = (char *)target;
+
+		if (type == STORE)
+			*p = c;
+		else
+			c = *p;
+
+		// Do something to prevent the stack frame being popped prior to
+		// our access above.
+		getpid();
+	}
+
+	return 0;
+}
+
+static int search_proc_maps(char *needle, unsigned long *low, unsigned long *high)
+{
+	unsigned long start, end;
+	static char buf[4096];
+	char name[128];
+	FILE *f;
+	int rc;
+
+	f = fopen("/proc/self/maps", "r");
+	if (!f) {
+		perror("fopen");
+		return -1;
+	}
+
+	while (fgets(buf, sizeof(buf), f)) {
+		rc = sscanf(buf, "%lx-%lx %*c%*c%*c%*c %*x %*d:%*d %*d %127s\n",
+			    &start, &end, name);
+		if (rc == 2)
+			continue;
+
+		if (rc != 3) {
+			printf("sscanf errored\n");
+			rc = -1;
+			break;
+		}
+
+		if (strstr(name, needle)) {
+			*low = start;
+			*high = end - 1;
+			rc = 0;
+			break;
+		}
+	}
+
+	fclose(f);
+
+	return rc;
+}
+
+int child(unsigned int stack_used, int delta, enum access_type type)
+{
+	unsigned long low, stack_high;
+
+	assert(search_proc_maps("[stack]", &low, &stack_high) == 0);
+
+	assert(consume_stack(stack_high - stack_used, stack_high, delta, type) == 0);
+
+	printf("Access OK: %s delta %-7d used size 0x%06x stack high 0x%lx top_ptr %p top sp 0x%lx actual used 0x%lx\n",
+	       type == LOAD ? "load" : "store", delta, stack_used, stack_high,
+	       stack_top_ptr, stack_top_sp, stack_high - stack_top_sp + 1);
+
+	return 0;
+}
+
+static int test_one(unsigned int stack_used, int delta, enum access_type type)
+{
+	pid_t pid;
+	int rc;
+
+	pid = fork();
+	if (pid == 0)
+		exit(child(stack_used, delta, type));
+
+	assert(waitpid(pid, &rc, 0) != -1);
+
+	if (WIFEXITED(rc) && WEXITSTATUS(rc) == 0)
+		return 0;
+
+	// We don't expect a non-zero exit that's not a signal
+	assert(!WIFEXITED(rc));
+
+	printf("Faulted:   %s delta %-7d used size 0x%06x signal %d\n",
+	       type == LOAD ? "load" : "store", delta, stack_used,
+	       WTERMSIG(rc));
+
+	return 1;
+}
+
+// This is fairly arbitrary but is well below any of the targets below,
+// so that the delta between the stack pointer and the target is large.
+#define DEFAULT_SIZE	(32 * _KB)
+
+static void test_one_type(enum access_type type, unsigned long page_size, unsigned long rlim_cur)
+{
+	assert(test_one(DEFAULT_SIZE, 512 * _KB, type) == 0);
+
+	// powerpc has a special case to allow up to 1MB
+	assert(test_one(DEFAULT_SIZE, 1 * _MB, type) == 0);
+
+#ifdef __powerpc__
+	// This fails on powerpc because it's > 1MB and is not a stdu &
+	// not close to r1
+	assert(test_one(DEFAULT_SIZE, 1 * _MB + 8, type) != 0);
+#else
+	assert(test_one(DEFAULT_SIZE, 1 * _MB + 8, type) == 0);
+#endif
+
+#ifdef __powerpc__
+	// Accessing way past the stack pointer is not allowed on powerpc
+	assert(test_one(DEFAULT_SIZE, rlim_cur, type) != 0);
+#else
+	// We should be able to access anywhere within the rlimit
+	assert(test_one(DEFAULT_SIZE, rlim_cur, type) == 0);
+#endif
+
+	// But if we go past the rlimit it should fail
+	assert(test_one(DEFAULT_SIZE, rlim_cur + 1, type) != 0);
+
+	// Above 1MB powerpc only allows accesses within 2048 bytes of
+	// r1 for accesses that aren't stdu
+	assert(test_one(1 * _MB + page_size - 128, -2048, type) == 0);
+#ifdef __powerpc__
+	assert(test_one(1 * _MB + page_size - 128, -2049, type) != 0);
+#else
+	assert(test_one(1 * _MB + page_size - 128, -2049, type) == 0);
+#endif
+
+	// By consuming 2MB of stack we test the stdu case
+	assert(test_one(2 * _MB + page_size - 128, -2048, type) == 0);
+}
+
+static int test(void)
+{
+	unsigned long page_size;
+	struct rlimit rlimit;
+
+	page_size = getpagesize();
+	getrlimit(RLIMIT_STACK, &rlimit);
+	printf("Stack rlimit is 0x%lx\n", rlimit.rlim_cur);
+
+	printf("Testing loads ...\n");
+	test_one_type(LOAD, page_size, rlimit.rlim_cur);
+	printf("Testing stores ...\n");
+	test_one_type(STORE, page_size, rlimit.rlim_cur);
+
+	printf("All OK\n");
+
+	return 0;
+}
+
+#ifdef __powerpc__
+#include "utils.h"
+
+int main(void)
+{
+	return test_harness(test, "stack_expansion_ldst");
+}
+#else
+int main(void)
+{
+	return test();
+}
+#endif
diff --git a/tools/testing/selftests/powerpc/mm/stack_expansion_signal.c b/tools/testing/selftests/powerpc/mm/stack_expansion_signal.c
new file mode 100644
index 000000000000..c8b32a29e274
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mm/stack_expansion_signal.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test that signal delivery is able to expand the stack segment without
+ * triggering a SEGV.
+ *
+ * Based on test code by Tom Lane.
+ */
+
+#include <err.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <signal.h>
+#include <sys/types.h>
+#include <unistd.h>
+
+#include "../pmu/lib.h"
+#include "utils.h"
+
+#define _KB (1024)
+#define _MB (1024 * 1024)
+
+static char *stack_base_ptr;
+static char *stack_top_ptr;
+
+static volatile sig_atomic_t sig_occurred = 0;
+
+static void sigusr1_handler(int signal_arg)
+{
+	sig_occurred = 1;
+}
+
+static int consume_stack(unsigned int stack_size, union pipe write_pipe)
+{
+	char stack_cur;
+
+	if ((stack_base_ptr - &stack_cur) < stack_size)
+		return consume_stack(stack_size, write_pipe);
+	else {
+		stack_top_ptr = &stack_cur;
+
+		FAIL_IF(notify_parent(write_pipe));
+
+		while (!sig_occurred)
+			barrier();
+	}
+
+	return 0;
+}
+
+static int child(unsigned int stack_size, union pipe write_pipe)
+{
+	struct sigaction act;
+	char stack_base;
+
+	act.sa_handler = sigusr1_handler;
+	sigemptyset(&act.sa_mask);
+	act.sa_flags = 0;
+	if (sigaction(SIGUSR1, &act, NULL) < 0)
+		err(1, "sigaction");
+
+	stack_base_ptr = (char *) (((size_t) &stack_base + 65535) & ~65535UL);
+
+	FAIL_IF(consume_stack(stack_size, write_pipe));
+
+	printf("size 0x%06x: OK, stack base %p top %p (%zx used)\n",
+		stack_size, stack_base_ptr, stack_top_ptr,
+		stack_base_ptr - stack_top_ptr);
+
+	return 0;
+}
+
+static int test_one_size(unsigned int stack_size)
+{
+	union pipe read_pipe, write_pipe;
+	pid_t pid;
+
+	FAIL_IF(pipe(read_pipe.fds) == -1);
+	FAIL_IF(pipe(write_pipe.fds) == -1);
+
+	pid = fork();
+	if (pid == 0) {
+		close(read_pipe.read_fd);
+		close(write_pipe.write_fd);
+		exit(child(stack_size, read_pipe));
+	}
+
+	close(read_pipe.write_fd);
+	close(write_pipe.read_fd);
+	FAIL_IF(sync_with_child(read_pipe, write_pipe));
+
+	kill(pid, SIGUSR1);
+
+	FAIL_IF(wait_for_child(pid));
+
+	close(read_pipe.read_fd);
+	close(write_pipe.write_fd);
+
+	return 0;
+}
+
+int test(void)
+{
+	unsigned int i, size;
+
+	// Test with used stack from 1MB - 64K to 1MB + 64K
+	// Increment by 64 to get more coverage of odd sizes
+	for (i = 0; i < (128 * _KB); i += 64) {
+		size = i + (1 * _MB) - (64 * _KB);
+		FAIL_IF(test_one_size(size));
+	}
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(test, "stack_expansion_signal");
+}
diff --git a/tools/testing/selftests/powerpc/pmu/lib.h b/tools/testing/selftests/powerpc/pmu/lib.h
index fa12e7d0b4d3..bf1bec013bbb 100644
--- a/tools/testing/selftests/powerpc/pmu/lib.h
+++ b/tools/testing/selftests/powerpc/pmu/lib.h
@@ -6,6 +6,7 @@
 #ifndef __SELFTESTS_POWERPC_PMU_LIB_H
 #define __SELFTESTS_POWERPC_PMU_LIB_H
 
+#include <stdbool.h>
 #include <stdio.h>
 #include <stdint.h>
 #include <string.h>
-- 
2.25.1

