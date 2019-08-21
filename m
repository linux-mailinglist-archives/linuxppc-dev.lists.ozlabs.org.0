Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9561097712
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 12:23:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D3fN5FMJzDqbw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 20:23:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="OxDGpzXf"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D3ZQ5QkVzDqVS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 20:20:14 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46D3ZK5S3hz9v00g;
 Wed, 21 Aug 2019 12:20:09 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=OxDGpzXf; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 7F13rvAROkVW; Wed, 21 Aug 2019 12:20:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46D3ZK4Nq0z9v00d;
 Wed, 21 Aug 2019 12:20:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566382809; bh=rZVlTdqrwhEXlCkt9Vj1Y6E4KryGDc3gs4QkyJ6OinU=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=OxDGpzXf6JOYTIoTs2F1Bm0N7BfKBE7apAutqjvyxLwa+IkS9uLZX56AFIn0fTyX/
 0rddlnI6BnXI04wiwHJWVs1c+TLfjaROzs8cHyoYzLSOdWbX0NhgBh1hMn6/BCTg3b
 ULf7PeMlq9FQ8Yo/tYqsdoCCr3i2jEltB81O4IUY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 834C88B7E2;
 Wed, 21 Aug 2019 12:20:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8HFbUmtVmh4l; Wed, 21 Aug 2019 12:20:11 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5D8278B7E0;
 Wed, 21 Aug 2019 12:20:11 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 525F36B73E; Wed, 21 Aug 2019 10:20:11 +0000 (UTC)
Message-Id: <fe86886fb8db44360417cee0dc515ad47ca6ef72.1566382750.git.christophe.leroy@c-s.fr>
In-Reply-To: <9f33f44b9cd741c4a02b3dce7b8ef9438fe2cd2a.1566382750.git.christophe.leroy@c-s.fr>
References: <9f33f44b9cd741c4a02b3dce7b8ef9438fe2cd2a.1566382750.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 2/2] powerpc/mm: Fix an Oops in kasan_mmu_init()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 21 Aug 2019 10:20:11 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

   Uncompressing Kernel Image ... OK
   Loading Device Tree to 01ff7000, end 01fff74f ... OK
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] BUG: Unable to handle kernel data access at 0xf818c000
[    0.000000] Faulting instruction address: 0xc0013c7c
[    0.000000] Thread overran stack, or stack corrupted
[    0.000000] Oops: Kernel access of bad area, sig: 11 [#1]
[    0.000000] BE PAGE_SIZE=16K PREEMPT
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.0-rc4-s3k-dev-00743-g5abe4a3e8fd3-dirty #2080
[    0.000000] NIP:  c0013c7c LR: c0013310 CTR: 00000000
[    0.000000] REGS: c0c5ff38 TRAP: 0300   Not tainted  (5.3.0-rc4-s3k-dev-00743-g5abe4a3e8fd3-dirty)
[    0.000000] MSR:  00001032 <ME,IR,DR,RI>  CR: 99033955  XER: 80002100
[    0.000000] DAR: f818c000 DSISR: 82000000
[    0.000000] GPR00: c0013310 c0c5fff0 c0ad6ac0 c0c600c0 f818c031 82000000 00000000 ffffffff
[    0.000000] GPR08: 00000000 f1f1f1f1 c0013c2c c0013304 99033955 00400008 00000000 07ff9598
[    0.000000] GPR16: 00000000 07ffb94c 00000000 00000000 00000000 00000000 00000000 f818cfb2
[    0.000000] GPR24: 00000000 00000000 00001000 ffffffff 00000000 c07dbf80 00000000 f818c000
[    0.000000] NIP [c0013c7c] do_page_fault+0x50/0x904
[    0.000000] LR [c0013310] handle_page_fault+0xc/0x38
[    0.000000] Call Trace:
[    0.000000] Instruction dump:
[    0.000000] be010080 91410014 553fe8fe 3d40c001 3d20f1f1 7d800026 394a3c2c 3fffe000
[    0.000000] 6129f1f1 900100c4 9181007c 91410018 <913f0000> 3d2001f4 6129f4f4 913f0004

Don't map the early shadow page read-only yet when creating the new
page tables for the real shadow memory, otherwise the memblock
allocations that immediately follows to create the real shadow pages
that are about to replace the early shadow page trigger a page fault
if they fall into the region being worked on at the moment.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Fixes: 2edb16efc899 ("powerpc/32: Add KASAN support")
Cc: stable@vger.kernel.org
---
 arch/powerpc/mm/kasan/kasan_init_32.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index e8ab3cc5f6e4..0e6ed4413eea 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -34,7 +34,7 @@ static int __ref kasan_init_shadow_page_tables(unsigned long k_start, unsigned l
 {
 	pmd_t *pmd;
 	unsigned long k_cur, k_next;
-	pgprot_t prot = kasan_prot_ro();
+	pgprot_t prot = slab_is_available() ? kasan_prot_ro() : PAGE_KERNEL;
 
 	pmd = pmd_offset(pud_offset(pgd_offset_k(k_start), k_start), k_start);
 
@@ -110,9 +110,22 @@ static int __ref kasan_init_region(void *start, size_t size)
 static void __init kasan_remap_early_shadow_ro(void)
 {
 	pgprot_t prot = kasan_prot_ro();
+	unsigned long k_start = KASAN_SHADOW_START;
+	unsigned long k_end = KASAN_SHADOW_END;
+	unsigned long k_cur;
+	phys_addr_t pa = __pa(kasan_early_shadow_page);
 
 	kasan_populate_pte(kasan_early_shadow_pte, prot);
 
+	for (k_cur = k_start & PAGE_MASK; k_cur < k_end; k_cur += PAGE_SIZE) {
+		pmd_t *pmd = pmd_offset(pud_offset(pgd_offset_k(k_cur), k_cur), k_cur);
+		pte_t *ptep = pte_offset_kernel(pmd, k_cur);
+
+		if ((pte_val(*ptep) & PTE_RPN_MASK) != pa)
+			continue;
+
+		__set_pte_at(&init_mm, k_cur, ptep, pfn_pte(PHYS_PFN(pa), prot), 0);
+	}
 	flush_tlb_kernel_range(KASAN_SHADOW_START, KASAN_SHADOW_END);
 }
 
-- 
2.13.3

