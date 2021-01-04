Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CC12E9563
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 13:59:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8bLH1cbSzDq7W
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 23:59:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=gwWyuVpH; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8bDY45jnzDqD7
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jan 2021 23:54:19 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B5DB207B1;
 Mon,  4 Jan 2021 12:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1609764857;
 bh=o7uryaidOHeA0EtVzCNfEhaxgxoZgOQpbeMfHVwjz9w=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=gwWyuVpHM+i0meH56KM2E3nrpBRs4PuTUTrYeYscbkRSjUj5JzSxWjU0N0pnL0GXj
 Xkawnra9GV4HTUKD7tcCngdxuMkMwIfeilD1Iv+w0/6O3GsBWkPmh9h/3MhFz8U6Yc
 LYZWIthFGVQgyV3joct1tUEcky2I7aMwg3+KTWrM=
Subject: Patch "asm-generic/tlb,
 arch: Invert CONFIG_HAVE_RCU_TABLE_INVALIDATE" has been added to the
 4.19-stable tree
To: greg@kroah.com, gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, peterz@infradead.org, santosh@fossix.org,
 sashal@kernel.org
From: <gregkh@linuxfoundation.org>
Date: Mon, 04 Jan 2021 13:55:43 +0100
In-Reply-To: <20200312132740.225241-4-santosh@fossix.org>
Message-ID: <160976494313579@kroah.com>
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

    asm-generic/tlb, arch: Invert CONFIG_HAVE_RCU_TABLE_INVALIDATE

to the 4.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     asm-generic-tlb-arch-invert-config_have_rcu_table_invalidate.patch
and it can be found in the queue-4.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon Jan  4 01:45:29 PM CET 2021
From: Santosh Sivaraj <santosh@fossix.org>
Date: Thu, 12 Mar 2020 18:57:37 +0530
Subject: asm-generic/tlb, arch: Invert CONFIG_HAVE_RCU_TABLE_INVALIDATE
To: <stable@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Greg KH <greg@kroah.com>, Sasha Levin <sashal@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Message-ID: <20200312132740.225241-4-santosh@fossix.org>

From: Peter Zijlstra <peterz@infradead.org>

commit 96bc9567cbe112e9320250f01b9c060c882e8619 upstream.

Make issuing a TLB invalidate for page-table pages the normal case.

The reason is twofold:

 - too many invalidates is safer than too few,
 - most architectures use the linux page-tables natively
   and would thus require this.

Make it an opt-out, instead of an opt-in.

No change in behavior intended.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: <stable@vger.kernel.org> # 4.19
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
[santosh: prerequisite for upcoming tlbflush backports]
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/Kconfig         |    2 +-
 arch/powerpc/Kconfig |    1 +
 arch/sparc/Kconfig   |    1 +
 arch/x86/Kconfig     |    1 -
 mm/memory.c          |    2 +-
 5 files changed, 4 insertions(+), 3 deletions(-)

--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -363,7 +363,7 @@ config HAVE_ARCH_JUMP_LABEL
 config HAVE_RCU_TABLE_FREE
 	bool
 
-config HAVE_RCU_TABLE_INVALIDATE
+config HAVE_RCU_TABLE_NO_INVALIDATE
 	bool
 
 config ARCH_WANT_IRQS_OFF_ACTIVATE_MM
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -217,6 +217,7 @@ config PPC
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_RCU_TABLE_FREE		if SMP
+	select HAVE_RCU_TABLE_NO_INVALIDATE	if HAVE_RCU_TABLE_FREE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE		if PPC64 && CPU_LITTLE_ENDIAN
 	select HAVE_SYSCALL_TRACEPOINTS
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -64,6 +64,7 @@ config SPARC64
 	select HAVE_KRETPROBES
 	select HAVE_KPROBES
 	select HAVE_RCU_TABLE_FREE if SMP
+	select HAVE_RCU_TABLE_NO_INVALIDATE if HAVE_RCU_TABLE_FREE
 	select HAVE_MEMBLOCK_NODE_MAP
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select HAVE_DYNAMIC_FTRACE
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -181,7 +181,6 @@ config X86
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_RCU_TABLE_FREE		if PARAVIRT
-	select HAVE_RCU_TABLE_INVALIDATE	if HAVE_RCU_TABLE_FREE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE		if X86_64 && (UNWINDER_FRAME_POINTER || UNWINDER_ORC) && STACK_VALIDATION
 	select HAVE_STACKPROTECTOR		if CC_HAS_SANE_STACKPROTECTOR
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -339,7 +339,7 @@ bool __tlb_remove_page_size(struct mmu_g
  */
 static inline void tlb_table_invalidate(struct mmu_gather *tlb)
 {
-#ifdef CONFIG_HAVE_RCU_TABLE_INVALIDATE
+#ifndef CONFIG_HAVE_RCU_TABLE_NO_INVALIDATE
 	/*
 	 * Invalidate page-table caches used by hardware walkers. Then we still
 	 * need to RCU-sched wait while freeing the pages because software


Patches currently in stable-queue which might be from santosh@fossix.org are

queue-4.19/asm-generic-tlb-track-which-levels-of-the-page-tables-have-been-cleared.patch
queue-4.19/asm-generic-tlb-track-freeing-of-page-table-directories-in-struct-mmu_gather.patch
queue-4.19/asm-generic-tlb-avoid-potential-double-flush.patch
queue-4.19/mm-mmu_gather-invalidate-tlb-correctly-on-batch-allocation-failure-and-flush.patch
queue-4.19/powerpc-mmu_gather-enable-rcu_table_free-even-for-smp-case.patch
queue-4.19/asm-generic-tlb-arch-invert-config_have_rcu_table_invalidate.patch
