Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE3C86DF08
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 11:11:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aRkqWoR0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmP4h2rjnz3vdh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 21:11:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aRkqWoR0;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmP3y6Vczz3dhR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 21:10:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709287838;
	bh=XpsrD7HhX/mY9vmxzirX/Cl3jQBnrcntBZY1ETrGTvQ=;
	h=From:To:Cc:Subject:Date:From;
	b=aRkqWoR0PSCubSDCu5mIJ+Nw/IrQ50Xgwj4LaAg8oXetE+d7Mm8IlBMRCzH8npAsu
	 kRlRWJ68+20gzXpkK9kE0mRvbL4ZNJYoN1Ubl0qpwTRCKPsj4redQ5dk6b5hoxFDIo
	 MCeQAHmmlXtD3Kq4JqlfOot5kz4uaWgx1wiq7BjvrPQpE8fXGpH6LQGmuZ8JdNKi2R
	 AiEuIjHyKVU2m3WZFMTT1PYYeElgRTiW5Yh1L++UXDI9w4abbr0Vm5V4lTKKpe3N/E
	 6YeeGk9rMnNC2MhufFVci3JutCP/qayDT0NA8tsqq+BA/M1DW8NKg2LgTTEL5InKBJ
	 JxCa4xafXb6xA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TmP3y53X3z4wbh;
	Fri,  1 Mar 2024 21:10:38 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] selftests/powerpc: Fix fpu_signal failures
Date: Fri,  1 Mar 2024 21:10:35 +1100
Message-ID: <20240301101035.1230024-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.2
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
Cc: spoorthy@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

My recent commit e5d00aaac651 ("selftests/powerpc: Check all FPRs in
fpu_preempt") inadvertently broke the fpu_signal test.

It needs to take into account that fpu_preempt now loads 32 FPRs, so
enlarge darray.

Also use the newly added randomise_darray() to properly randomise darray.

Finally the checking done in signal_fpu_sig() needs to skip checking
f30/f31, because they are used as scratch registers in check_all_fprs(),
called by preempt_fpu(), and so could hold other values when the signal
is taken.

Fixes: e5d00aaac651 ("selftests/powerpc: Check all FPRs in fpu_preempt")
Depends-on: 2ba107f6795d ("selftests/powerpc: Generate better bit patterns for FPU tests")
Reported-by: Spoorthy <spoorthy@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../testing/selftests/powerpc/math/fpu_signal.c  | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/powerpc/math/fpu_signal.c b/tools/testing/selftests/powerpc/math/fpu_signal.c
index 7b1addd50420..8a64f63e37ce 100644
--- a/tools/testing/selftests/powerpc/math/fpu_signal.c
+++ b/tools/testing/selftests/powerpc/math/fpu_signal.c
@@ -18,6 +18,7 @@
 #include <pthread.h>
 
 #include "utils.h"
+#include "fpu.h"
 
 /* Number of times each thread should receive the signal */
 #define ITERATIONS 10
@@ -27,9 +28,7 @@
  */
 #define THREAD_FACTOR 8
 
-__thread double darray[] = {0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0,
-		     1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2.0,
-		     2.1};
+__thread double darray[32];
 
 bool bad_context;
 int threads_starting;
@@ -43,9 +42,9 @@ void signal_fpu_sig(int sig, siginfo_t *info, void *context)
 	ucontext_t *uc = context;
 	mcontext_t *mc = &uc->uc_mcontext;
 
-	/* Only the non volatiles were loaded up */
-	for (i = 14; i < 32; i++) {
-		if (mc->fp_regs[i] != darray[i - 14]) {
+	// Don't check f30/f31, they're used as scratches in check_all_fprs()
+	for (i = 0; i < 30; i++) {
+		if (mc->fp_regs[i] != darray[i]) {
 			bad_context = true;
 			break;
 		}
@@ -54,7 +53,6 @@ void signal_fpu_sig(int sig, siginfo_t *info, void *context)
 
 void *signal_fpu_c(void *p)
 {
-	int i;
 	long rc;
 	struct sigaction act;
 	act.sa_sigaction = signal_fpu_sig;
@@ -64,9 +62,7 @@ void *signal_fpu_c(void *p)
 		return p;
 
 	srand(pthread_self());
-	for (i = 0; i < 21; i++)
-		darray[i] = rand();
-
+	randomise_darray(darray, ARRAY_SIZE(darray));
 	rc = preempt_fpu(darray, &threads_starting, &running);
 
 	return (void *) rc;
-- 
2.43.2

