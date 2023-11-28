Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D557FBB8B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 14:28:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nMhXuo5c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sfjvt3RB1z3cW7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 00:28:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nMhXuo5c;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sfjv34d4Lz2yVh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 00:27:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701178079;
	bh=oZx4p5c1czKmkPHmDwhbX+TPujCNhITYCoO/TJfqgUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nMhXuo5c982g+D9HXA4/PZsPRl3m40m13x2DqJBlLdcvSrj4VeX9elOGcT3Zk5fDc
	 DCtCHb+4IgKFs1HDUNeXzsVqSKahO1XPHH5yE22tHTsrCoFketM98EubDGrTkIpRSb
	 7QBpOhaPBZRsrdvLJua61kwZEio85hH5TWsGOu9MilOuRd9GZvEr7YYXk1+YMCX7R8
	 0yYGmg9M166HkqDYf89fyhGg1Q9IFaJr8NUXAFNZ855TidMcDH/1tjpMR6SlFWNmJ7
	 JKf6e0GJ41tTzpUC/XqQdig+lXgefAX3yDTAkB+7kxdIDrPXuOBJ1xe9XLY8p+eRPn
	 3pzx3g5ePaJdA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sfjv33RqZz4x2N;
	Wed, 29 Nov 2023 00:27:59 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/5] selftests/powerpc: Check all FPRs in fpu_preempt
Date: Wed, 29 Nov 2023 00:27:45 +1100
Message-ID: <20231128132748.1990179-2-mpe@ellerman.id.au>
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

There's a selftest that checks FPRs aren't corrupted by preemption, or
just process scheduling. However it only checks the non-volatile FPRs,
meaning corruption of the volatile FPRs could go undetected.

The check_fpu function it calls is used by several other tests, so for
now add a new routine to check all the FPRs. Increase the size of the
array of FPRs to 32, and initialise them all with random values.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../testing/selftests/powerpc/math/fpu_asm.S  | 41 +++++++++++++++++--
 .../selftests/powerpc/math/fpu_preempt.c      | 15 +++----
 2 files changed, 43 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/powerpc/math/fpu_asm.S b/tools/testing/selftests/powerpc/math/fpu_asm.S
index 9dc0c158f871..051392ad3ce7 100644
--- a/tools/testing/selftests/powerpc/math/fpu_asm.S
+++ b/tools/testing/selftests/powerpc/math/fpu_asm.S
@@ -66,6 +66,40 @@ FUNC_START(check_fpu)
 	li	r3,0 # Success!!!
 1:	blr
 
+
+// int check_all_fprs(double darray[32])
+FUNC_START(check_all_fprs)
+	PUSH_BASIC_STACK(8)
+	mr	r4, r3	// r4 = darray
+	li	r3, 1	// prepare for failure
+
+	stfd	f31, STACK_FRAME_LOCAL(0, 0)(sp) // backup f31
+
+	// Check regs f0-f30, using f31 as scratch
+	.set i, 0
+	.rept 31
+	lfd	f31, (8 * i)(r4)	// load expected value
+	fcmpu	cr0, i, f31		// compare
+	bne	cr0, 1f			// bail if mismatch
+	.set i, i + 1
+	.endr
+
+	lfd	f31, STACK_FRAME_LOCAL(0, 0)(sp) // reload f31
+	stfd	f30, STACK_FRAME_LOCAL(0, 0)(sp) // backup f30
+
+	lfd	f30, (8 * 31)(r4)	// load expected value of f31
+	fcmpu	cr0, f30, f31		// compare
+	bne	cr0, 1f			// bail if mismatch
+
+	lfd	f30, STACK_FRAME_LOCAL(0, 0)(sp) // reload f30
+
+	// Success
+	li	r3, 0
+
+1:	POP_BASIC_STACK(8)
+	blr
+FUNC_END(check_all_fprs)
+
 FUNC_START(test_fpu)
 	# r3 holds pointer to where to put the result of fork
 	# r4 holds pointer to the pid
@@ -104,8 +138,8 @@ FUNC_START(preempt_fpu)
 	std r4,STACK_FRAME_PARAM(1)(sp) # int *threads_starting
 	std r5,STACK_FRAME_PARAM(2)(sp) # int *running
 
-	bl load_fpu
-	nop
+	// Load FPRs with expected values
+	OP_REGS lfd, 8, 0, 31, r3
 
 	sync
 	# Atomic DEC
@@ -116,8 +150,7 @@ FUNC_START(preempt_fpu)
 	bne- 1b
 
 2:	ld r3,STACK_FRAME_PARAM(0)(sp)
-	bl check_fpu
-	nop
+	bl check_all_fprs
 	cmpdi r3,0
 	bne 3f
 	ld r4,STACK_FRAME_PARAM(2)(sp)
diff --git a/tools/testing/selftests/powerpc/math/fpu_preempt.c b/tools/testing/selftests/powerpc/math/fpu_preempt.c
index 3e5b5663d244..24b5abacccdc 100644
--- a/tools/testing/selftests/powerpc/math/fpu_preempt.c
+++ b/tools/testing/selftests/powerpc/math/fpu_preempt.c
@@ -1,13 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright 2015, Cyril Bur, IBM Corp.
+ * Copyright 2023, Michael Ellerman, IBM Corp.
  *
  * This test attempts to see if the FPU registers change across preemption.
- * Two things should be noted here a) The check_fpu function in asm only checks
- * the non volatile registers as it is reused from the syscall test b) There is
- * no way to be sure preemption happened so this test just uses many threads
- * and a long wait. As such, a successful test doesn't mean much but a failure
- * is bad.
+ * There is no way to be sure preemption happened so this test just uses many
+ * threads and a long wait. As such, a successful test doesn't mean much but
+ * a failure is bad.
  */
 
 #include <stdio.h>
@@ -30,9 +29,7 @@
 #define THREAD_FACTOR 8
 
 
-__thread double darray[] = {0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0,
-		     1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2.0,
-		     2.1};
+__thread double darray[32];
 
 int threads_starting;
 int running;
@@ -45,7 +42,7 @@ void *preempt_fpu_c(void *p)
 	int i;
 
 	srand(pthread_self());
-	for (i = 0; i < 21; i++)
+	for (i = 0; i < ARRAY_SIZE(darray); i++)
 		darray[i] = rand();
 
 	rc = preempt_fpu(darray, &threads_starting, &running);
-- 
2.41.0

