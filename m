Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BC759685C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 07:09:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6wzn1hJFz3dsS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 15:09:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=WyT6XZbE;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=wE6bl26p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=WyT6XZbE;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=wE6bl26p;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6wyS6t4Bz3c1p
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 15:08:16 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id D6A645C0135;
	Wed, 17 Aug 2022 01:08:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 17 Aug 2022 01:08:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1660712894; x=1660799294; bh=kJ
	um6qEmtx3/0cosns7E2T5qaz2Pzaa0sjeSv0wEteY=; b=WyT6XZbEo/V71bt8LK
	KatRRSt0+z5rAeUq1DcoDq0we5YHkDEeG1HWJbg7yUnzvwp8wr8V1/k0WmcmVfEo
	mdYhWCeJ5AAreULIOi/wmjb5NwLZhqQITsCjFZN9Rop6N/f8HU9od7I6l0n1wN3I
	rIz13oTg51eYWOJB+Qj/LS3TAnNx3d7x8lxIrac47D00CvKOkWf8mqvsV20BH1DC
	Phw2ajXZjHWgcUJstQwqlGIWswe6PZ8J1uFx1arlbXIs1DkInrsY45T8x0RquPcW
	ucS7WvcnD6VSK1DAqv6HYBmSIRUqXSoUnS0UzbrBMPnpVrxgQtr4tLe8/eniYnFZ
	bnrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1660712894; x=1660799294; bh=kJum6qEmtx3/0
	cosns7E2T5qaz2Pzaa0sjeSv0wEteY=; b=wE6bl26pX64K1L9qy83BHsMYtAxkS
	oExi/3yhQ+S3gkG6UCnIgtUgEIfK3nA7tlbNWSuXVfaTX0ErH770doG+oTcIcV6G
	5LQmza3MfGLU6q7+zIYswfbPK/mqsMfVZgde8t/Tydy1jK7QJ+GzK73YdhnUWMc+
	Qs9acazWYw9V3jpl0K/r6YEtas91DCsS8fZzhxapHzTVdYdZhyOCz2CoKu/EoQ0L
	CBsw0j2/0M5bBquVXB92jajqw8Ihyr32TwpoimI10VjoOgiVB06QsYYF/wtZ+/Pa
	Qhb9SAqeusGawWBpSp5Z9IS8tFTchp+lsn44mCUyRXbf+PlRRShRytPuA==
X-ME-Sender: <xms:vXf8YvJuob0UED-MkwtjNKjg3tIuIyPN6sIRa-spRcNCqdCFi9x64g>
    <xme:vXf8YjLFdzIGKK2x4AVfyUWJx_lV6TQ_pPFkO-c-Jrc1s3PZQUnJCGoo9TVVXEljp
    9ZS1L3yW3JOjgHt5w>
X-ME-Received: <xmr:vXf8Yns6ojWk9iDYf3RjNgty63t2ECuJnAaOogfrQYfy9oT5u2WnUYvwB_tPmMnHpyZZcF7GhULDG44nRCVIRNpT4arb5dcsN2zULjUg8LjEEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehhedgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdludehmdenucfjughrpefhvf
    evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhr
    rhgvhicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpe
    fhvdeugfdtvdeiieegffefffekieegvdfgiedtjeetffevfefhtdehjeffieeivdenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurh
    esrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:vXf8YobU5G6kW3b59x6zJAikYhx2QmBltqF3k3zTKjSGU4JYoFIg6w>
    <xmx:vXf8YmalKip2D3KsSpsatKVbxoqFuo9i2iLwFb6pwaivpD2C_gtQTg>
    <xmx:vXf8YsCssLN7fG_hOxZb42lK3QjP9KNEUr0NPIROtSiETzARal0aCQ>
    <xmx:vnf8YsO3ELr9Tf1JOi6QUFettFD93fGm13szrZy9K8vAcBUxfGNV5w>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 01:08:10 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 2/2] selftests/powerpc: Add a test for execute-only memory
Date: Wed, 17 Aug 2022 15:06:40 +1000
Message-Id: <20220817050640.406017-2-ruscur@russell.cc>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220817050640.406017-1-ruscur@russell.cc>
References: <20220817050640.406017-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, anshuman.khandual@arm.com, Russell Currey <ruscur@russell.cc>, nicholas@linux.ibm.com, npiggin@gmail.com, aneesh.kumar@linux.ibm.com, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Miehlbradt <nicholas@linux.ibm.com>

This selftest is designed to cover execute-only protections
on the Radix MMU but will also work with Hash.

The tests are based on those found in pkey_exec_test with modifications
to use the generic mprotect() instead of the pkey variants.

Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
Signed-off-by: Russell Currey <ruscur@russell.cc>
---
v4: new

 tools/testing/selftests/powerpc/mm/Makefile   |   3 +-
 .../testing/selftests/powerpc/mm/exec_prot.c  | 231 ++++++++++++++++++
 2 files changed, 233 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/mm/exec_prot.c

diff --git a/tools/testing/selftests/powerpc/mm/Makefile b/tools/testing/selftests/powerpc/mm/Makefile
index 27dc09d0bfee..19dd0b2ea397 100644
--- a/tools/testing/selftests/powerpc/mm/Makefile
+++ b/tools/testing/selftests/powerpc/mm/Makefile
@@ -3,7 +3,7 @@ noarg:
 	$(MAKE) -C ../
 
 TEST_GEN_PROGS := hugetlb_vs_thp_test subpage_prot prot_sao segv_errors wild_bctr \
-		  large_vm_fork_separation bad_accesses pkey_exec_prot \
+		  large_vm_fork_separation bad_accesses exec_prot pkey_exec_prot \
 		  pkey_siginfo stack_expansion_signal stack_expansion_ldst \
 		  large_vm_gpr_corruption
 TEST_PROGS := stress_code_patching.sh
@@ -22,6 +22,7 @@ $(OUTPUT)/wild_bctr: CFLAGS += -m64
 $(OUTPUT)/large_vm_fork_separation: CFLAGS += -m64
 $(OUTPUT)/large_vm_gpr_corruption: CFLAGS += -m64
 $(OUTPUT)/bad_accesses: CFLAGS += -m64
+$(OUTPUT)/exec_prot: CFLAGS += -m64
 $(OUTPUT)/pkey_exec_prot: CFLAGS += -m64
 $(OUTPUT)/pkey_siginfo: CFLAGS += -m64
 
diff --git a/tools/testing/selftests/powerpc/mm/exec_prot.c b/tools/testing/selftests/powerpc/mm/exec_prot.c
new file mode 100644
index 000000000000..db75b2225de1
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mm/exec_prot.c
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright 2022, Nicholas Miehlbradt, IBM Corporation
+ * based on pkey_exec_prot.c
+ *
+ * Test if applying execute protection on pages works as expected.
+ */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <signal.h>
+
+#include <unistd.h>
+#include <sys/mman.h>
+
+#include "pkeys.h"
+
+
+#define PPC_INST_NOP	0x60000000
+#define PPC_INST_TRAP	0x7fe00008
+#define PPC_INST_BLR	0x4e800020
+
+static volatile sig_atomic_t fault_code;
+static volatile sig_atomic_t remaining_faults;
+static volatile unsigned int *fault_addr;
+static unsigned long pgsize, numinsns;
+static unsigned int *insns;
+static bool pkeys_supported;
+
+static bool is_fault_expected(int fault_code)
+{
+	if (fault_code == SEGV_ACCERR)
+		return true;
+
+	/* Assume any pkey error is fine since pkey_exec_prot test covers them */
+	if (fault_code == SEGV_PKUERR && pkeys_supported)
+		return true;
+
+	return false;
+}
+
+static void trap_handler(int signum, siginfo_t *sinfo, void *ctx)
+{
+	/* Check if this fault originated from the expected address */
+	if (sinfo->si_addr != (void *)fault_addr)
+		sigsafe_err("got a fault for an unexpected address\n");
+
+	_exit(1);
+}
+
+static void segv_handler(int signum, siginfo_t *sinfo, void *ctx)
+{
+	fault_code = sinfo->si_code;
+
+	/* Check if this fault originated from the expected address */
+	if (sinfo->si_addr != (void *)fault_addr) {
+		sigsafe_err("got a fault for an unexpected address\n");
+		_exit(1);
+	}
+
+	/* Check if too many faults have occurred for a single test case */
+	if (!remaining_faults) {
+		sigsafe_err("got too many faults for the same address\n");
+		_exit(1);
+	}
+
+
+	/* Restore permissions in order to continue */
+	if (is_fault_expected(fault_code)) {
+		if (mprotect(insns, pgsize, PROT_READ | PROT_WRITE | PROT_EXEC)) {
+			sigsafe_err("failed to set access permissions\n");
+			_exit(1);
+		}
+	} else {
+		sigsafe_err("got a fault with an unexpected code\n");
+		_exit(1);
+	}
+
+	remaining_faults--;
+}
+
+static int check_exec_fault(int rights)
+{
+	/*
+	 * Jump to the executable region.
+	 *
+	 * The first iteration also checks if the overwrite of the
+	 * first instruction word from a trap to a no-op succeeded.
+	 */
+	fault_code = -1;
+	remaining_faults = 0;
+	if (!(rights & PROT_EXEC))
+		remaining_faults = 1;
+
+	FAIL_IF(mprotect(insns, pgsize, rights) != 0);
+	asm volatile("mtctr	%0; bctrl" : : "r"(insns));
+
+	FAIL_IF(remaining_faults != 0);
+	if (!(rights & PROT_EXEC))
+		FAIL_IF(!is_fault_expected(fault_code));
+
+	return 0;
+}
+
+static int test(void)
+{
+	struct sigaction segv_act, trap_act;
+	int i;
+
+	/* Skip the test if the CPU doesn't support Radix */
+	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_00));
+
+	/* Check if pkeys are supported */
+	pkeys_supported = pkeys_unsupported() == 0;
+
+	/* Setup SIGSEGV handler */
+	segv_act.sa_handler = 0;
+	segv_act.sa_sigaction = segv_handler;
+	FAIL_IF(sigprocmask(SIG_SETMASK, 0, &segv_act.sa_mask) != 0);
+	segv_act.sa_flags = SA_SIGINFO;
+	segv_act.sa_restorer = 0;
+	FAIL_IF(sigaction(SIGSEGV, &segv_act, NULL) != 0);
+
+	/* Setup SIGTRAP handler */
+	trap_act.sa_handler = 0;
+	trap_act.sa_sigaction = trap_handler;
+	FAIL_IF(sigprocmask(SIG_SETMASK, 0, &trap_act.sa_mask) != 0);
+	trap_act.sa_flags = SA_SIGINFO;
+	trap_act.sa_restorer = 0;
+	FAIL_IF(sigaction(SIGTRAP, &trap_act, NULL) != 0);
+
+	/* Setup executable region */
+	pgsize = getpagesize();
+	numinsns = pgsize / sizeof(unsigned int);
+	insns = (unsigned int *)mmap(NULL, pgsize, PROT_READ | PROT_WRITE,
+				      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	FAIL_IF(insns == MAP_FAILED);
+
+	/* Write the instruction words */
+	for (i = 1; i < numinsns - 1; i++)
+		insns[i] = PPC_INST_NOP;
+
+	/*
+	 * Set the first instruction as an unconditional trap. If
+	 * the last write to this address succeeds, this should
+	 * get overwritten by a no-op.
+	 */
+	insns[0] = PPC_INST_TRAP;
+
+	/*
+	 * Later, to jump to the executable region, we use a branch
+	 * and link instruction (bctrl) which sets the return address
+	 * automatically in LR. Use that to return back.
+	 */
+	insns[numinsns - 1] = PPC_INST_BLR;
+
+	/*
+	 * Pick the first instruction's address from the executable
+	 * region.
+	 */
+	fault_addr = insns;
+
+	/*
+	 * Read an instruction word from the address when the page
+	 * is execute only. This should generate an access fault.
+	 */
+	fault_code = -1;
+	remaining_faults = 1;
+	printf("Testing read on --x, should fault...");
+	FAIL_IF(mprotect(insns, pgsize, PROT_EXEC) != 0);
+	i = *fault_addr;
+	FAIL_IF(remaining_faults != 0 || !is_fault_expected(fault_code));
+	printf("ok!\n");
+
+	/*
+	 * Write an instruction word to the address when the page
+	 * execute only. This should also generate an access fault.
+	 */
+	fault_code = -1;
+	remaining_faults = 1;
+	printf("Testing write on --x, should fault...");
+	FAIL_IF(mprotect(insns, pgsize, PROT_EXEC) != 0);
+	*fault_addr = PPC_INST_NOP;
+	FAIL_IF(remaining_faults != 0 || !is_fault_expected(fault_code));
+	printf("ok!\n");
+
+	printf("Testing exec on ---, should fault...");
+	FAIL_IF(check_exec_fault(PROT_NONE));
+	printf("ok!\n");
+
+	printf("Testing exec on r--, should fault...");
+	FAIL_IF(check_exec_fault(PROT_READ));
+	printf("ok!\n");
+
+	printf("Testing exec on -w-, should fault...");
+	FAIL_IF(check_exec_fault(PROT_WRITE));
+	printf("ok!\n");
+
+	printf("Testing exec on rw-, should fault...");
+	FAIL_IF(check_exec_fault(PROT_READ | PROT_WRITE));
+	printf("ok!\n");
+
+	printf("Testing exec on --x, should succeed...");
+	FAIL_IF(check_exec_fault(PROT_EXEC));
+	printf("ok!\n");
+
+	printf("Testing exec on r-x, should succeed...");
+	FAIL_IF(check_exec_fault(PROT_READ | PROT_EXEC));
+	printf("ok!\n");
+
+	printf("Testing exec on -wx, should succeed...");
+	FAIL_IF(check_exec_fault(PROT_WRITE | PROT_EXEC));
+	printf("ok!\n");
+
+	printf("Testing exec on rwx, should succeed...");
+	FAIL_IF(check_exec_fault(PROT_READ | PROT_WRITE | PROT_EXEC));
+	printf("ok!\n");
+
+	/* Cleanup */
+	FAIL_IF(munmap((void *)insns, pgsize));
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(test, "exec_prot");
+}
-- 
2.37.2

