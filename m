Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CE75144EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 10:58:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqRGJ6MJVz3bqv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 18:58:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=fHFhoQLO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=fHFhoQLO; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqRFk0pJyz3bYS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 18:57:29 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 71C07621BE;
 Fri, 29 Apr 2022 08:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787B1C385A4;
 Fri, 29 Apr 2022 08:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1651222646;
 bh=hV5Vwae2pn8OFDCmuD/JwjUV7vhAeuDyqbdKiOF1pjo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=fHFhoQLOzbgUl6hEikih3u2QCjOdBuBKzlC0pte63Nr61TxGqB/Tzdex+t9lGQWMB
 LUlSchVdx0vWOi463H+tNUH2sSDBsrWu87dy6GOCvyew40nDttOGrg6lZSrR3zt/uC
 gP2gpdRLnu49QilHul4OUCLhiOsyQE6cClatciJM=
Subject: Patch "powerpc/64/interrupt: Temporarily save PPR on stack to fix
 register corruption due to SLB miss" has been added to the 4.19-stable tree
To: gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, npiggin@gmail.com
From: <gregkh@linuxfoundation.org>
Date: Fri, 29 Apr 2022 10:57:15 +0200
In-Reply-To: <20220428124150.375623-2-mpe@ellerman.id.au>
Message-ID: <165122263521974@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This is a note to let you know that I've just added the patch titled

    powerpc/64/interrupt: Temporarily save PPR on stack to fix register corruption due to SLB miss

to the 4.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     powerpc-64-interrupt-temporarily-save-ppr-on-stack-to-fix-register-corruption-due-to-slb-miss.patch
and it can be found in the queue-4.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Fri Apr 29 10:56:14 AM CEST 2022
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 28 Apr 2022 22:41:49 +1000
Subject: powerpc/64/interrupt: Temporarily save PPR on stack to fix register corruption due to SLB miss
To: <stable@vger.kernel.org>, <gregkh@linuxfoundation.org>
Cc: <linuxppc-dev@lists.ozlabs.org>, <npiggin@gmail.com>
Message-ID: <20220428124150.375623-2-mpe@ellerman.id.au>

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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/include/asm/exception-64s.h |   22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

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


Patches currently in stable-queue which might be from mpe@ellerman.id.au are

queue-4.19/powerpc-64s-unmerge-ex_lr-and-ex_dar.patch
queue-4.19/powerpc-64-interrupt-temporarily-save-ppr-on-stack-to-fix-register-corruption-due-to-slb-miss.patch
