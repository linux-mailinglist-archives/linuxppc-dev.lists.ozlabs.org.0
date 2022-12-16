Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C23B864EBC2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 14:00:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYTj82x1pz3bfX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Dec 2022 00:00:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HswMII1K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYThD2GpRz3bV1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 23:59:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HswMII1K;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NYTh8510bz4xFy;
	Fri, 16 Dec 2022 23:59:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1671195560;
	bh=DUb2g9fJ0M6MD7WWiN5bt3wwNPDzvVNbc6I4dN197nk=;
	h=From:To:Cc:Subject:Date:From;
	b=HswMII1Ki6HTuNMK+2jOWaDloSiHWYVZudNEfWABMnxKYMveWVYtmLWB5cPGMG3/5
	 9XpEIiBXceQqe5lqc7uLBE/D/2RegUzrvyzut4wkmmGxQ4bXrVKOvxskh19OKyY1+x
	 z7Tf3oSmHMKiJHGUNH4+bemzOklzZg40u/GRXE/wPX7WPlTqIbO/niVvWjgQrnUNQD
	 2zIbNQZ49PHl9poLvPKoUlCG2SxNc7n4hZVQNcuY+Jxsvwrv8bLIkBtM/OLrJgufwS
	 0I/TyPSCqAD9CvsA7Dkvzbz8KIrFKLYLHR7Lbh2o1Hif7FzWIbiwlXhz+U4QGuC6NH
	 xSG866LoWKPZA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/code-patching: Fix oops with DEBUG_VM enabled
Date: Fri, 16 Dec 2022 23:59:13 +1100
Message-Id: <20221216125913.990972-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.38.1
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
Cc: nathan@kernel.org, npiggin@gmail.com, bgray@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan reported that the new per-cpu mm patching oopses if DEBUG_VM is
enabled:

  ------------[ cut here ]------------
  kernel BUG at arch/powerpc/mm/pgtable.c:333!
  Oops: Exception in kernel mode, sig: 5 [#1]
  LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
  Modules linked in:
  CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.1.0-rc2+ #1
  Hardware name: IBM PowerNV (emulated by qemu) POWER9 0x4e1200 opal:v7.0 PowerNV
  ...
  NIP assert_pte_locked+0x180/0x1a0
  LR  assert_pte_locked+0x170/0x1a0
  Call Trace:
    0x60000000 (unreliable)
    patch_instruction+0x618/0x6d0
    arch_prepare_kprobe+0xfc/0x2d0
    register_kprobe+0x520/0x7c0
    arch_init_kprobes+0x28/0x3c
    init_kprobes+0x108/0x184
    do_one_initcall+0x60/0x2e0
    kernel_init_freeable+0x1f0/0x3e0
    kernel_init+0x34/0x1d0
    ret_from_kernel_thread+0x5c/0x64

It's caused by the assert_spin_locked() failing in assert_pte_locked().
The assert fails because the PTE was unlocked in text_area_cpu_up_mm(),
and never relocked.

The PTE page shouldn't be freed, the patching_mm is only used for
patching on this CPU, only that single PTE is ever mapped, and it's only
unmapped at CPU offline.

In fact assert_pte_locked() has a special case to ignore init_mm
entirely, and the patching_mm is more-or-less like init_mm, so possibly
the check could be skipped for patching_mm too.

But for now be conservative, and use the proper PTE accessors at
patching time, so that the PTE lock is held while the PTE is used. That
also avoids the warning in assert_pte_locked().

With that it's no longer necessary to save the PTE in
cpu_patching_context for the mm_patch_enabled() case.

Fixes: c28c15b6d28a ("powerpc/code-patching: Use temporary mm for Radix MMU")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/lib/code-patching.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 73ce4b90bb1b..b00112d7ad46 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -178,7 +178,6 @@ static int text_area_cpu_up_mm(unsigned int cpu)
 
 	this_cpu_write(cpu_patching_context.mm, mm);
 	this_cpu_write(cpu_patching_context.addr, addr);
-	this_cpu_write(cpu_patching_context.pte, pte);
 
 	return 0;
 
@@ -195,7 +194,6 @@ static int text_area_cpu_down_mm(unsigned int cpu)
 
 	this_cpu_write(cpu_patching_context.mm, NULL);
 	this_cpu_write(cpu_patching_context.addr, 0);
-	this_cpu_write(cpu_patching_context.pte, NULL);
 
 	return 0;
 }
@@ -289,12 +287,16 @@ static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
 	unsigned long pfn = get_patch_pfn(addr);
 	struct mm_struct *patching_mm;
 	struct mm_struct *orig_mm;
+	spinlock_t *ptl;
 
 	patching_mm = __this_cpu_read(cpu_patching_context.mm);
-	pte = __this_cpu_read(cpu_patching_context.pte);
 	text_poke_addr = __this_cpu_read(cpu_patching_context.addr);
 	patch_addr = (u32 *)(text_poke_addr + offset_in_page(addr));
 
+	pte = get_locked_pte(patching_mm, text_poke_addr, &ptl);
+	if (!pte)
+		return -ENOMEM;
+
 	__set_pte_at(patching_mm, text_poke_addr, pte, pfn_pte(pfn, PAGE_KERNEL), 0);
 
 	/* order PTE update before use, also serves as the hwsync */
@@ -321,6 +323,8 @@ static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
 	 */
 	local_flush_tlb_page_psize(patching_mm, text_poke_addr, mmu_virtual_psize);
 
+	pte_unmap_unlock(pte, ptl);
+
 	return err;
 }
 
-- 
2.38.1

