Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CDB2313F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 12:22:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456w2H6GxTzDqJY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 20:22:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456w063f7SzDqLD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 20:20:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 456w060jGdz9s55; Mon, 20 May 2019 20:20:54 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 456w0601snz9s9N; Mon, 20 May 2019 20:20:53 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2] selftests/powerpc: Add a test of bad (out-of-range)
 accesses
Date: Mon, 20 May 2019 20:20:51 +1000
Message-Id: <20190520102051.12103-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Userspace isn't allowed to access certain address ranges, make sure we
actually test that to at least some degree.

This would have caught the recent bug where the SLB fault handler was
incorrectly called on an out-of-range access when using the Radix MMU.
It also would have caught the bug we had in get_region_id() where we
were inserting SLB entries for bad addresses.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
v2: Incorporate changes from Nick's version. Check the faulted address,
    and make sure we get BNDERR for things that are completely out of
    bounds.

 tools/testing/selftests/powerpc/mm/.gitignore |   3 +-
 tools/testing/selftests/powerpc/mm/Makefile   |   4 +-
 .../selftests/powerpc/mm/bad_accesses.c       | 167 ++++++++++++++++++
 3 files changed, 172 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/mm/bad_accesses.c

diff --git a/tools/testing/selftests/powerpc/mm/.gitignore b/tools/testing/selftests/powerpc/mm/.gitignore
index ba919308fe30..c189170ba041 100644
--- a/tools/testing/selftests/powerpc/mm/.gitignore
+++ b/tools/testing/selftests/powerpc/mm/.gitignore
@@ -3,4 +3,5 @@ subpage_prot
 tempfile
 prot_sao
 segv_errors
-wild_bctr
\ No newline at end of file
+wild_bctr
+bad_accesses
\ No newline at end of file
diff --git a/tools/testing/selftests/powerpc/mm/Makefile b/tools/testing/selftests/powerpc/mm/Makefile
index 43d68420e363..f9667f980241 100644
--- a/tools/testing/selftests/powerpc/mm/Makefile
+++ b/tools/testing/selftests/powerpc/mm/Makefile
@@ -2,7 +2,8 @@
 noarg:
 	$(MAKE) -C ../
 
-TEST_GEN_PROGS := hugetlb_vs_thp_test subpage_prot prot_sao segv_errors wild_bctr
+TEST_GEN_PROGS := hugetlb_vs_thp_test subpage_prot prot_sao segv_errors \
+		  wild_bctr bad_accesses
 TEST_GEN_FILES := tempfile
 
 top_srcdir = ../../../../..
@@ -13,6 +14,7 @@ $(TEST_GEN_PROGS): ../harness.c
 $(OUTPUT)/prot_sao: ../utils.c
 
 $(OUTPUT)/wild_bctr: CFLAGS += -m64
+$(OUTPUT)/bad_accesses: CFLAGS += -m64
 
 $(OUTPUT)/tempfile:
 	dd if=/dev/zero of=$@ bs=64k count=1
diff --git a/tools/testing/selftests/powerpc/mm/bad_accesses.c b/tools/testing/selftests/powerpc/mm/bad_accesses.c
new file mode 100644
index 000000000000..f18b2b91b263
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mm/bad_accesses.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright 2019, Michael Ellerman, IBM Corp.
+//
+// Test that out-of-bounds reads/writes behave as expected.
+
+#include <setjmp.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "utils.h"
+
+
+// 64-bit kernel is always here
+#define PAGE_OFFSET	(0xcul << 60)
+
+static unsigned long kernel_virt_end;
+
+static volatile int fault_code;
+static volatile unsigned long fault_addr;
+static jmp_buf setjmp_env;
+
+static void segv_handler(int n, siginfo_t *info, void *ctxt_v)
+{
+	fault_code = info->si_code;
+	fault_addr = (unsigned long)info->si_addr;
+	siglongjmp(setjmp_env, 1);
+}
+
+int bad_access(char *p, bool write)
+{
+	char x;
+
+	fault_code = 0;
+	fault_addr = 0;
+
+	if (sigsetjmp(setjmp_env, 1) == 0) {
+		if (write)
+			*p = 1;
+		else
+			x = *p;
+
+		printf("Bad - no SEGV! (%c)\n", x);
+		return 1;
+	}
+
+	// If we see MAPERR that means we took a page fault rather than an SLB
+	// miss. We only expect to take page faults for addresses within the
+	// valid kernel range.
+	FAIL_IF(fault_code == SEGV_MAPERR && \
+		(fault_addr < PAGE_OFFSET || fault_addr >= kernel_virt_end));
+
+	FAIL_IF(fault_code != SEGV_MAPERR && fault_code != SEGV_BNDERR);
+
+	return 0;
+}
+
+static int using_hash_mmu(bool *using_hash)
+{
+	char line[128];
+	FILE *f;
+	int rc;
+
+	f = fopen("/proc/cpuinfo", "r");
+	FAIL_IF(!f);
+
+	rc = 0;
+	while (fgets(line, sizeof(line), f) != NULL) {
+		if (strcmp(line, "MMU		: Hash\n") == 0) {
+			*using_hash = true;
+			goto out;
+		}
+
+		if (strcmp(line, "MMU		: Radix\n") == 0) {
+			*using_hash = false;
+			goto out;
+		}
+	}
+
+	rc = -1;
+out:
+	fclose(f);
+	return rc;
+}
+
+static int test(void)
+{
+	unsigned long i, j, addr, region_shift, page_shift, page_size;
+	struct sigaction sig;
+	bool hash_mmu;
+
+	sig = (struct sigaction) {
+		.sa_sigaction = segv_handler,
+		.sa_flags = SA_SIGINFO,
+	};
+
+	FAIL_IF(sigaction(SIGSEGV, &sig, NULL) != 0);
+
+	FAIL_IF(using_hash_mmu(&hash_mmu));
+
+	page_size = sysconf(_SC_PAGESIZE);
+	if (page_size == (64 * 1024))
+		page_shift = 16;
+	else
+		page_shift = 12;
+
+	if (page_size == (64 * 1024) || !hash_mmu) {
+		region_shift = 52;
+
+		// We have 7 512T regions (4 kernel linear, vmalloc, io, vmemmap)
+		kernel_virt_end = PAGE_OFFSET + (7 * (512ul << 40));
+	} else if (page_size == (4 * 1024) && hash_mmu) {
+		region_shift = 46;
+
+		// We have 7 64T regions (4 kernel linear, vmalloc, io, vmemmap)
+		kernel_virt_end = PAGE_OFFSET + (7 * (64ul << 40));
+	} else
+		FAIL_IF(true);
+
+	printf("Using %s MMU, PAGE_SIZE = %dKB start address 0x%016lx\n",
+	       hash_mmu ? "hash" : "radix",
+	       (1 << page_shift) >> 10,
+	       1ul << region_shift);
+
+	// This generates access patterns like:
+	//   0x0010000000000000
+	//   0x0010000000010000
+	//   0x0010000000020000
+	//   ...
+	//   0x0014000000000000
+	//   0x0018000000000000
+	//   0x0020000000000000
+	//   0x0020000000010000
+	//   0x0020000000020000
+	//   ...
+	//   0xf400000000000000
+	//   0xf800000000000000
+
+	for (i = 1; i <= ((0xful << 60) >> region_shift); i++) {
+		for (j = page_shift - 1; j < 60; j++) {
+			unsigned long base, delta;
+
+			base  = i << region_shift;
+			delta = 1ul << j;
+
+			if (delta >= base)
+				break;
+
+			addr = (base | delta) & ~((1 << page_shift) - 1);
+
+			FAIL_IF(bad_access((char *)addr, false));
+			FAIL_IF(bad_access((char *)addr, true));
+		}
+	}
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(test, "bad_accesses");
+}
-- 
2.20.1

