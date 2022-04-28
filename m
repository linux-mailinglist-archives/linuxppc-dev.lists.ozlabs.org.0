Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BF35133FC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 14:42:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpwHn4BZ1z3bdY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 22:42:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D+E/fEb2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpwH822Ftz2xsP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 22:41:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=D+E/fEb2; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KpwH80lSkz4ySf;
 Thu, 28 Apr 2022 22:41:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1651149716;
 bh=jEN/12qWDNbAh8oG7UOJqLKNkzHizTaIgYfRVxSH9bw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D+E/fEb2fFj8F+iRVSPZtEhxufijue+qYn4L4s8J7zBexKAfnlmbonBjWqAMdjDm5
 9zU8tTFpDuK2G44dWzO3j1NOFwPVJ9DxL6gTWMl4x1xAc29sgdBp7bWi4z0R8z3kcJ
 jIQ38p5RDl1UPg5QzmRtW/nvsYgvrvaT93sMdxDgQoiFSVHJE3+uy8FWj0eUcy0GOa
 G1eEn6uoRpWvvDpVYN4p5FSUQOMJr/VXoXkdNz70fznJojxtQa5t5GEynBiUW/AMOz
 SnXgdg2kmP4KJLidQaPWkV6hO/OkO5tiG5OiNFnZn9gpuqIZLP9G0izijtMKHNzEzW
 8GPFYZiICkrWw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <stable@vger.kernel.org>,
	<gregkh@linuxfoundation.org>
Subject: [PATCH v4.19 1/2] powerpc/64/interrupt: Temporarily save PPR on stack
 to fix register corruption due to SLB miss
Date: Thu, 28 Apr 2022 22:41:49 +1000
Message-Id: <20220428124150.375623-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428124150.375623-1-mpe@ellerman.id.au>
References: <20220428124150.375623-1-mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

This is a minimal stable kernel fix for the problem solved by
4c2de74cc869 ("powerpc/64: Interrupts save PPR on stack rather than
thread_struct").

Upstream kernels between 4.17-4.20 have this bug, so I propose this
patch for 4.19 stable.

Longer description from mpe:

In commit f384796c4 ("powerpc/mm: Add support for handling > 512TB
address in SLB miss") we added support for using multiple context ids
per process. Previously accessing past the first context id was a fatal
error for the process. With the new support it became non-fatal, and so
the previous "bad_addr_slb" handler was changed to be the
"large_addr_slb" handler.

That handler uses the EXCEPTION_PROLOG_COMMON() macro, which in-turn
calls the SAVE_PPR() macro. At the point where SAVE_PPR() is used, the
r9-13 register values from the original user fault are saved in
paca->exslb. It's not until later in EXCEPTION_PROLOG_COMMON_2() that
they are saved from paca->exslb onto the kernel stack.

The PPR is saved into current->thread.ppr, which is notably not on the
kernel stack the way pt_regs are. This means we can take an SLB miss on
current->thread.ppr. If that happens in the "large_addr_slb" case we
will clobber the saved user r9-r13 in paca->exslb with kernel values.
Later we will save those clobbered values into the pt_regs on the stack,
and when we return to userspace those kernel values will be restored.

Typically this appears as some sort of segfault in userspace, with an
address that looks like a kernel address. In dmesg it can appear as:

  [19117.440331] some_program[1869625]: unhandled signal 11 at c00000000f6bda10 nip 00007fff780d559c lr 00007fff781ae56c code 30001

The upstream fix for this issue was to move PPR into pt_regs, on the
kernel stack, avoiding the possibility of an SLB fault when saving it.

However changing the size of pt_regs is an intrusive change, and has
side effects in other parts of the kernel. A minimal fix is to
temporarily save the PPR in an unused part of pt_regs, then save the
user register values from paca->exslb into pt_regs, and then move the
saved PPR into thread.ppr.

Fixes: f384796c40dc ("powerpc/mm: Add support for handling > 512TB address in SLB miss")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220316033235.903657-1-npiggin@gmail.com
---
 arch/powerpc/include/asm/exception-64s.h | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 35fb5b11955a..f0424c6fdeca 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -243,10 +243,22 @@
  * PPR save/restore macros used in exceptions_64s.S  
  * Used for P7 or later processors
  */
-#define SAVE_PPR(area, ra, rb)						\
+#define SAVE_PPR(area, ra)						\
+BEGIN_FTR_SECTION_NESTED(940)						\
+	ld	ra,area+EX_PPR(r13);	/* Read PPR from paca */	\
+	std	ra,RESULT(r1);		/* Store PPR in RESULT for now */ \
+END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,940)
+
+/*
+ * This is called after we are finished accessing 'area', so we can now take
+ * SLB faults accessing the thread struct, which will use PACA_EXSLB area.
+ * This is required because the large_addr_slb handler uses EXSLB and it also
+ * uses the common exception macros including this PPR saving.
+ */
+#define MOVE_PPR_TO_THREAD(ra, rb)					\
 BEGIN_FTR_SECTION_NESTED(940)						\
 	ld	ra,PACACURRENT(r13);					\
-	ld	rb,area+EX_PPR(r13);	/* Read PPR from paca */	\
+	ld	rb,RESULT(r1);		/* Read PPR from stack */	\
 	std	rb,TASKTHREADPPR(ra);					\
 END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,940)
 
@@ -515,9 +527,11 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 3:	EXCEPTION_PROLOG_COMMON_1();					   \
 	beq	4f;			/* if from kernel mode		*/ \
 	ACCOUNT_CPU_USER_ENTRY(r13, r9, r10);				   \
-	SAVE_PPR(area, r9, r10);					   \
+	SAVE_PPR(area, r9);						   \
 4:	EXCEPTION_PROLOG_COMMON_2(area)					   \
-	EXCEPTION_PROLOG_COMMON_3(n)					   \
+	beq	5f;			/* if from kernel mode		*/ \
+	MOVE_PPR_TO_THREAD(r9, r10);					   \
+5:	EXCEPTION_PROLOG_COMMON_3(n)					   \
 	ACCOUNT_STOLEN_TIME
 
 /* Save original regs values from save area to stack frame. */
-- 
2.35.1

