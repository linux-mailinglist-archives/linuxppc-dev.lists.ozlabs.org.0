Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C093055BA4B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 16:09:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWqNv540Sz3fD0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 00:09:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZFjsS8Cs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWqF228y9z3bx5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 00:03:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZFjsS8Cs;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LWqF21Y3gz4xZY;
	Tue, 28 Jun 2022 00:03:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656338582;
	bh=q+XAO1x240Ufv25VwGsGSVc54ri++hCaguAoXCPYLfU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZFjsS8CscJX75D/tEnLMaqCCrcWykIzBFhMF6ndHUv81wX4V7VQQqLTi7pGv/Y4+c
	 Y2727o+VvxqABXz3bX97LmXlBW72JbkcnU/rV80BUur+pWL8putvkiN1QH7oralBkj
	 zqAifwx5A8UvAEF+JfgiYZgJTznZui8ugqO3MQgcSGqQTQ5AAuQ+Yl4YcChz/LoBhL
	 TOKYSuZ22djkzRf2RYh56MRB0JFoRanqwF3wteCx5VZM6HEcXbvyMGOrhMCqk37eVV
	 0Ihk5jkWpz8SDXU90jL/nwpcb5nwbleaAt7iXoiPG1E2a8uolAYpVjrgJPVbg6cogu
	 WZrFCHw7FYphQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 13/13] selftests/powerpc/ptrace: Add peek/poke of FPRs
Date: Tue, 28 Jun 2022 00:02:39 +1000
Message-Id: <20220627140239.2464900-13-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220627140239.2464900-1-mpe@ellerman.id.au>
References: <20220627140239.2464900-1-mpe@ellerman.id.au>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently the ptrace-gpr test only tests the GET/SET(FP)REGS ptrace
APIs. But there's an alternate (older) API, called PEEK/POKEUSR.

Add some minimal testing of PEEK/POKEUSR of the FPRs. This is sufficient
to detect the bug that was fixed recently in the 32-bit ptrace FPR
handling.

Depends-on: 8e1278444446 ("powerpc/32: Fix overread/overwrite of thread_struct via ptrace")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../selftests/powerpc/ptrace/ptrace-gpr.c     | 24 ++++++-
 .../testing/selftests/powerpc/ptrace/ptrace.h | 65 +++++++++++++++++++
 2 files changed, 87 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c b/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c
index c5dcb8c02616..9ed87d297799 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c
@@ -46,22 +46,42 @@ static int child(void)
 
 int trace_gpr(pid_t child)
 {
+	__u64 tmp, fpr[32], *peeked_fprs;
 	unsigned long gpr[18];
-	__u64 tmp, fpr[32];
 
 	FAIL_IF(start_trace(child));
+
+	// Check child GPRs match what we expect using GETREGS
 	FAIL_IF(show_gpr(child, gpr));
 	FAIL_IF(validate_gpr(gpr, child_gpr_val));
-	FAIL_IF(show_fpr(child, fpr));
 
+	// Check child FPRs match what we expect using GETFPREGS
+	FAIL_IF(show_fpr(child, fpr));
 	memcpy(&tmp, &child_fpr_val, sizeof(tmp));
 	FAIL_IF(validate_fpr(fpr, tmp));
 
+	// Check child FPRs match what we expect using PEEKUSR
+	peeked_fprs = peek_fprs(child);
+	FAIL_IF(!peeked_fprs);
+	FAIL_IF(validate_fpr(peeked_fprs, tmp));
+	free(peeked_fprs);
+
+	// Write child GPRs using SETREGS
 	FAIL_IF(write_gpr(child, parent_gpr_val));
 
+	// Write child FPRs using SETFPREGS
 	memcpy(&tmp, &parent_fpr_val, sizeof(tmp));
 	FAIL_IF(write_fpr(child, tmp));
 
+	// Check child FPRs match what we just set, using PEEKUSR
+	peeked_fprs = peek_fprs(child);
+	FAIL_IF(!peeked_fprs);
+	FAIL_IF(validate_fpr(peeked_fprs, tmp));
+
+	// Write child FPRs using POKEUSR
+	FAIL_IF(poke_fprs(child, (unsigned long *)peeked_fprs));
+
+	// Child will check its FPRs match before exiting
 	FAIL_IF(stop_trace(child));
 
 	return TEST_PASS;
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace.h b/tools/testing/selftests/powerpc/ptrace/ptrace.h
index 4672e848604f..4e0233c0f2b3 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace.h
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace.h
@@ -23,6 +23,7 @@
 #include <sys/ipc.h>
 #include <sys/shm.h>
 #include <sys/user.h>
+#include <sys/syscall.h>
 #include <linux/elf.h>
 #include <linux/types.h>
 #include <linux/auxvec.h>
@@ -440,6 +441,70 @@ int show_gpr(pid_t child, unsigned long *gpr)
 	return TEST_PASS;
 }
 
+long sys_ptrace(enum __ptrace_request request, pid_t pid, unsigned long addr, unsigned long data)
+{
+	return syscall(__NR_ptrace, request, pid, (void *)addr, data);
+}
+
+// 33 because of FPSCR
+#define PT_NUM_FPRS	(33 * (sizeof(__u64) / sizeof(unsigned long)))
+
+__u64 *peek_fprs(pid_t child)
+{
+	unsigned long *fprs, *p, addr;
+	long ret;
+	int i;
+
+	fprs = malloc(sizeof(unsigned long) * PT_NUM_FPRS);
+	if (!fprs) {
+		perror("malloc() failed");
+		return NULL;
+	}
+
+	for (i = 0, p = fprs; i < PT_NUM_FPRS; i++, p++) {
+		addr = sizeof(unsigned long) * (PT_FPR0 + i);
+		ret = sys_ptrace(PTRACE_PEEKUSER, child, addr, (unsigned long)p);
+		if (ret) {
+			perror("ptrace(PTRACE_PEEKUSR) failed");
+			return NULL;
+		}
+	}
+
+	addr = sizeof(unsigned long) * (PT_FPR0 + i);
+	ret = sys_ptrace(PTRACE_PEEKUSER, child, addr, (unsigned long)&addr);
+	if (!ret) {
+		printf("ptrace(PTRACE_PEEKUSR) succeeded unexpectedly!\n");
+		return NULL;
+	}
+
+	return (__u64 *)fprs;
+}
+
+int poke_fprs(pid_t child, unsigned long *fprs)
+{
+	unsigned long *p, addr;
+	long ret;
+	int i;
+
+	for (i = 0, p = fprs; i < PT_NUM_FPRS; i++, p++) {
+		addr = sizeof(unsigned long) * (PT_FPR0 + i);
+		ret = sys_ptrace(PTRACE_POKEUSER, child, addr, *p);
+		if (ret) {
+			perror("ptrace(PTRACE_POKEUSR) failed");
+			return -1;
+		}
+	}
+
+	addr = sizeof(unsigned long) * (PT_FPR0 + i);
+	ret = sys_ptrace(PTRACE_POKEUSER, child, addr, addr);
+	if (!ret) {
+		printf("ptrace(PTRACE_POKEUSR) succeeded unexpectedly!\n");
+		return -1;
+	}
+
+	return 0;
+}
+
 int write_gpr(pid_t child, unsigned long val)
 {
 	struct pt_regs *regs;
-- 
2.35.3

