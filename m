Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC585144F2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 10:58:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqRH00XYpz3cBn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 18:58:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=M4lHi+pd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=M4lHi+pd; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqRFm0M97z3bdq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 18:57:32 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 56948621DB;
 Fri, 29 Apr 2022 08:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D7DC385A4;
 Fri, 29 Apr 2022 08:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1651222649;
 bh=wyTdr9jvT7V3LA6rXQQ3Y/Pb/7ndihDo78ilRiquIWU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=M4lHi+pdgBOQFZIlVkFDSDLIx1UHIaLKd31uOw9d8GBaNXDbYYWH3oPKq5vb3+vl3
 TrlSdXPCUtwC+ZSkJYlFfdenSvhpwD1mJhX3YYBU1C5Zx/j+sdGHuHshOfEs4BNrH/
 C+nEqPqikpK5oCsvJxtZhjrCn7B5+ykx7RwkzxKo=
Subject: Patch "powerpc/64s: Unmerge EX_LR and EX_DAR" has been added to the
 4.19-stable tree
To: gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, npiggin@gmail.com
From: <gregkh@linuxfoundation.org>
Date: Fri, 29 Apr 2022 10:57:16 +0200
In-Reply-To: <20220428124150.375623-3-mpe@ellerman.id.au>
Message-ID: <16512226368413@kroah.com>
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

    powerpc/64s: Unmerge EX_LR and EX_DAR

to the 4.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     powerpc-64s-unmerge-ex_lr-and-ex_dar.patch
and it can be found in the queue-4.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Fri Apr 29 10:56:14 AM CEST 2022
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 28 Apr 2022 22:41:50 +1000
Subject: powerpc/64s: Unmerge EX_LR and EX_DAR
To: <stable@vger.kernel.org>, <gregkh@linuxfoundation.org>
Cc: <linuxppc-dev@lists.ozlabs.org>, <npiggin@gmail.com>
Message-ID: <20220428124150.375623-3-mpe@ellerman.id.au>

From: Michael Ellerman <mpe@ellerman.id.au>

The SLB miss handler is not fully re-entrant, it is able to work because
we ensure that the SLB entries for the kernel text and data segment, as
well as the kernel stack are pinned in the SLB. Accesses to kernel data
outside of those areas has to be carefully managed and can only occur in
certain parts of the code. One way we deal with that is by storing some
values in temporary slots in the paca.

In v4.13 in commit dbeea1d6b4bd ("powerpc/64s/paca: EX_LR can be merged
with EX_DAR") we merged the storage for two temporary slots for register
storage during SLB miss handling. That was safe at the time because the
two slots were never used at the same time.

Unfortunately in v4.17 in commit c2b4d8b7417a ("powerpc/mm/hash64:
Increase the VA range") we broke that condition, and introduced a case
where the two slots could be in use at the same time, leading to one
being corrupted.

Specifically in slb_miss_common() when we detect that we're handling a
fault for a large virtual address (> 512TB) we go to the "8" label,
there we store the original fault address into paca->exslb[EX_DAR],
before jumping to large_addr_slb() (using rfid).

We then use the EXCEPTION_PROLOG_COMMON and RECONCILE_IRQ_STATE macros
to do exception setup, before reloading the fault address from
paca->exslb[EX_DAR] and storing it into pt_regs->dar (Data Address
Register).

However the code generated by those macros can cause a recursive SLB
miss on a kernel address in three places.

Firstly is the saving of the PPR (Program Priority Register), which
happens on all CPUs since Power7, the PPR is saved to the thread struct
which can be anywhere in memory. There is also the call to
accumulate_stolen_time() if CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y and
CONFIG_PPC_SPLPAR=y, and also the call to trace_hardirqs_off() if
CONFIG_TRACE_IRQFLAGS=y. The latter two call into generic C code and can
lead to accesses anywhere in memory.

On modern 64-bit CPUs we have 1TB segments, so for any of those accesses
to cause an SLB fault they must access memory more than 1TB away from
the kernel text, data and kernel stack. That typically only happens on
machines with more than 1TB of RAM. However it is possible on multi-node
Power9 systems, because memory on the 2nd node begins at 32TB in the
linear mapping.

If we take a recursive SLB fault then we will corrupt the original fault
address with the LR (Link Register) value, because the EX_DAR and EX_LR
slots share storage. Subsequently we will think we're trying to fault
that LR address, which is the wrong address, and will also mostly likely
lead to a segfault because the LR address will be < 512TB and so will be
rejected by slb_miss_large_addr().

This appears as a spurious segfault to userspace, and if
show_unhandled_signals is enabled you will see a fault reported in dmesg
with the LR address, not the expected fault address, eg:

  prog[123]: segfault (11) at 128a61808 nip 128a618cc lr 128a61808 code 3 in prog[128a60000+10000]
  prog[123]: code: 4bffffa4 39200040 3ce00004 7d2903a6 3c000200 78e707c6 780083e4 7d3b4b78
  prog[123]: code: 7d455378 7d7d5b78 7d9f6378 7da46b78 <f8670000> 7d3a4b78 7d465378 7d7c5b78

Notice that the fault address == the LR, and the faulting instruction is
a simple store that should never use LR.

In upstream this was fixed in v4.20 in commit
48e7b7695745 ("powerpc/64s/hash: Convert SLB miss handlers to C"),
however that is a huge rewrite and not backportable.

The minimal fix for stable is to just unmerge the EX_LR and EX_DAR slots
again, avoiding the corruption of the DAR value. This uses an extra 8
bytes per CPU, which is negligble.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/include/asm/exception-64s.h |   15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -48,11 +48,12 @@
 #define EX_CCR		52
 #define EX_CFAR		56
 #define EX_PPR		64
+#define EX_LR		72
 #if defined(CONFIG_RELOCATABLE)
-#define EX_CTR		72
-#define EX_SIZE		10	/* size in u64 units */
+#define EX_CTR		80
+#define EX_SIZE		11	/* size in u64 units */
 #else
-#define EX_SIZE		9	/* size in u64 units */
+#define EX_SIZE		10	/* size in u64 units */
 #endif
 
 /*
@@ -61,14 +62,6 @@
 #define MAX_MCE_DEPTH	4
 
 /*
- * EX_LR is only used in EXSLB and where it does not overlap with EX_DAR
- * EX_CCR similarly with DSISR, but being 4 byte registers there is a hole
- * in the save area so it's not necessary to overlap them. Could be used
- * for future savings though if another 4 byte register was to be saved.
- */
-#define EX_LR		EX_DAR
-
-/*
  * EX_R3 is only used by the bad_stack handler. bad_stack reloads and
  * saves DAR from SPRN_DAR, and EX_DAR is not used. So EX_R3 can overlap
  * with EX_DAR.


Patches currently in stable-queue which might be from mpe@ellerman.id.au are

queue-4.19/powerpc-64s-unmerge-ex_lr-and-ex_dar.patch
queue-4.19/powerpc-64-interrupt-temporarily-save-ppr-on-stack-to-fix-register-corruption-due-to-slb-miss.patch
