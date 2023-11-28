Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F967FBB99
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 14:31:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Yon52dsn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sfjyf2px1z3vXg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 00:31:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Yon52dsn;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sfjv50M86z2yVh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 00:28:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701178081;
	bh=fP6PW1cYztqgcWDIKFDeHv4SLJUm1esV35G2u0yLbo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yon52dsngfeomiUA+jG2HL06kFsc3CbGaPj5OTN8hI64AWlA7Z0WVtOq5qkdVgnJA
	 uZ3ae6V1IO4cpwvFdCcYqrZEtle+qahlkAbBoMS+WrjqA0oWCvcVk3o8/2lFuzkJfC
	 ZX7vy2SKkf53pZxUUC28jItGpPFF/Ly564QfCll6Fwg4f/rzIEYYnM7YrYQf/T8KwU
	 560yTtg6+TCARhggdAg/u2PExHa9jd/kksd3XsqpoNQm6a8WPIYzETpkGR2zvaLFIq
	 znnm2CqCGo9Ew70GA71byYJLqRViQNGTkfCq1cywRY7B28T30wui2B69pt48kVCymr
	 yuXXnmQjE6wQQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sfjv46fndz4x5w;
	Wed, 29 Nov 2023 00:28:00 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 5/5] selftests/powerpc: Check all FPRs in fpu_syscall test
Date: Wed, 29 Nov 2023 00:27:48 +1100
Message-ID: <20231128132748.1990179-5-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231128132748.1990179-1-mpe@ellerman.id.au>
References: <20231128132748.1990179-1-mpe@ellerman.id.au>
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
Cc: tpearson@raptorengineering.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is a selftest that checks if FPRs are corrupted across a fork, aka
clone. It was added as part of the series that optimised the clone path
to save the parent's FP state without "giving up" (turning off FP).

See commit 8792468da5e1 ("powerpc: Add the ability to save FPU without
giving it up").

The test encodes the assumption that FPRs 0-13 are volatile across the
syscall, by only checking the volatile FPRs are not changed by the fork.
There was also a comment in the fpu_preempt test alluding to that:

  The check_fpu function in asm only checks the non volatile registers
  as it is reused from the syscall test

It is true that the function call ABI treats f0-f13 as volatile,
however the syscall ABI has since been documented as *not* treating those
registers as volatile. See commit 7b8845a2a2ec ("powerpc/64: Document
the syscall ABI").

So change the test to check all FPRs are not corrupted by the syscall.
Note that this currently fails, because save_fpu() etc. do not restore
f0/vsr0.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/math/fpu_asm.S     | 7 ++++---
 tools/testing/selftests/powerpc/math/fpu_syscall.c | 8 +++++---
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/powerpc/math/fpu_asm.S b/tools/testing/selftests/powerpc/math/fpu_asm.S
index 051392ad3ce7..efe1e1be4695 100644
--- a/tools/testing/selftests/powerpc/math/fpu_asm.S
+++ b/tools/testing/selftests/powerpc/math/fpu_asm.S
@@ -109,8 +109,9 @@ FUNC_START(test_fpu)
 	std	r3,STACK_FRAME_PARAM(0)(sp) # Address of darray
 	std r4,STACK_FRAME_PARAM(1)(sp) # Address of pid
 
-	bl load_fpu
-	nop
+	// Load FPRs with expected values
+	OP_REGS lfd, 8, 0, 31, r3
+
 	li	r0,__NR_fork
 	sc
 
@@ -119,7 +120,7 @@ FUNC_START(test_fpu)
 	std	r3,0(r9)
 
 	ld r3,STACK_FRAME_PARAM(0)(sp)
-	bl check_fpu
+	bl check_all_fprs
 	nop
 
 	POP_FPU(256)
diff --git a/tools/testing/selftests/powerpc/math/fpu_syscall.c b/tools/testing/selftests/powerpc/math/fpu_syscall.c
index 694f225c7e45..751d46b133fc 100644
--- a/tools/testing/selftests/powerpc/math/fpu_syscall.c
+++ b/tools/testing/selftests/powerpc/math/fpu_syscall.c
@@ -14,12 +14,11 @@
 #include <stdlib.h>
 
 #include "utils.h"
+#include "fpu.h"
 
 extern int test_fpu(double *darray, pid_t *pid);
 
-double darray[] = {0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0,
-		     1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2.0,
-		     2.1};
+double darray[32];
 
 int syscall_fpu(void)
 {
@@ -27,6 +26,9 @@ int syscall_fpu(void)
 	int i;
 	int ret;
 	int child_ret;
+
+	randomise_darray(darray, ARRAY_SIZE(darray));
+
 	for (i = 0; i < 1000; i++) {
 		/* test_fpu will fork() */
 		ret = test_fpu(darray, &fork_pid);
-- 
2.41.0

