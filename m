Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A94C62D86F3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Dec 2020 14:43:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CtTPV1ppwzDql0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Dec 2020 00:43:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CtTMj31wJzDqfs
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Dec 2020 00:41:32 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CtTMS6XzkzB09Zf;
 Sat, 12 Dec 2020 14:41:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xGQ7G9eZ9jcv; Sat, 12 Dec 2020 14:41:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CtTMS3DCXzB09Zd;
 Sat, 12 Dec 2020 14:41:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DFA1E8B782;
 Sat, 12 Dec 2020 14:41:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 2dCtmEZkHX1W; Sat, 12 Dec 2020 14:41:25 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 96EEF8B75B;
 Sat, 12 Dec 2020 14:41:25 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6FA1B655C6; Sat, 12 Dec 2020 13:41:25 +0000 (UTC)
Message-Id: <56feccd7b6fcd98e353361a233fa7bb8e67c3164.1607780469.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/mm: Fix hugetlb_free_pmd_range() and
 hugetlb_free_pud_range()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 qcai@redhat.com
Date: Sat, 12 Dec 2020 13:41:25 +0000 (UTC)
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

Commit 7bfe54b5f165 ("powerpc/mm: Refactor the floor/ceiling check in
hugetlb range freeing functions") inadvertely removed the mask
applied to start parameter in those two functions, leading to the
following crash on power9.

[ 7703.114640][T58070] LTP: starting hugemmap05_1 (hugemmap05 -m)
[ 7703.157792][   C99] ------------[ cut here ]------------
[ 7703.158279][   C99] kernel BUG at arch/powerpc/mm/book3s64/pgtable.c:387!
[ 7703.158306][   C99] Oops: Exception in kernel mode, sig: 5 [#1]
[ 7703.158330][   C99] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=256 NUMA PowerNV
[ 7703.158343][   C99] Modules linked in: vfio_pci vfio_virqfd vfio_iommu_spapr_tce vfio vfio_spapr_eeh loop kvm_hv kvm ip_tables x_tables sd_mod ahci libahci tg3 libata firmware_class libphy dm_mirror dm_region_hash dm_log dm_mod [last unloaded: dummy_del_mod]
[ 7703.158435][   C99] CPU: 99 PID: 308 Comm: ksoftirqd/99 Tainted: G           O      5.10.0-rc7-next-20201211 #1
[ 7703.158464][   C99] NIP:  c00000000005dbec LR: c0000000003352f4 CTR: 0000000000000000
[ 7703.158489][   C99] REGS: c00020000bb6f830 TRAP: 0700   Tainted: G           O       (5.10.0-rc7-next-20201211)
[ 7703.158528][   C99] MSR:  900000000282b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24002284  XER: 20040000
[ 7703.158570][   C99] GPR00: c0000000003352f4 c00020000bb6fad0 c000000007f70b00 c0002000385b3ff0
[ 7703.158570][   C99] GPR04: 0000000000000000 0000000000000003 c00020000bb6f8b4 0000000000000001
[ 7703.158570][   C99] GPR08: 0000000000000001 0000000000000009 0000000000000008 0000000000000002
[ 7703.158570][   C99] GPR12: 0000000024002488 c000201fff649c00 c000000007f2a20c 0000000000000000
[ 7703.158570][   C99] GPR16: 0000000000000007 0000000000000000 c000000000194d10 c000000000194d10
[ 7703.158570][   C99] GPR24: 0000000000000014 0000000000000015 c000201cc6e72398 c000000007fac4b4
[ 7703.158570][   C99] GPR28: c000000007f2bf80 c000000007fac2f8 0000000000000008 c000200033870000
[ 7703.158766][   C99] NIP [c00000000005dbec] __tlb_remove_table+0x1dc/0x1e0
pgtable_free at arch/powerpc/mm/book3s64/pgtable.c:387
(inlined by) __tlb_remove_table at arch/powerpc/mm/book3s64/pgtable.c:405
[ 7703.158805][   C99] LR [c0000000003352f4] tlb_remove_table_rcu+0x54/0xa0
[ 7703.158853][   C99] Call Trace:
[ 7703.158872][   C99] [c00020000bb6fad0] [c00000000005db4c] __tlb_remove_table+0x13c/0x1e0 (unreliable)
[ 7703.158890][   C99] [c00020000bb6fb00] [c0000000003352f4] tlb_remove_table_rcu+0x54/0xa0
__tlb_remove_table_free at mm/mmu_gather.c:101
(inlined by) tlb_remove_table_rcu at mm/mmu_gather.c:156
[ 7703.158927][   C99] [c00020000bb6fb30] [c000000000194d7c] rcu_core+0x35c/0xbb0
rcu_do_batch at kernel/rcu/tree.c:2502
(inlined by) rcu_core at kernel/rcu/tree.c:2737
[ 7703.158966][   C99] [c00020000bb6fbf0] [c00000000095a3d0] __do_softirq+0x480/0x704
[ 7703.159006][   C99] [c00020000bb6fd10] [c0000000000cc1f4] run_ksoftirqd+0x74/0xd0
run_ksoftirqd at kernel/softirq.c:651
(inlined by) run_ksoftirqd at kernel/softirq.c:642
[ 7703.159046][   C99] [c00020000bb6fd30] [c0000000001040c8] smpboot_thread_fn+0x278/0x320
[ 7703.159096][   C99] [c00020000bb6fda0] [c0000000000fc8a4] kthread+0x1c4/0x1d0
[ 7703.159145][   C99] [c00020000bb6fe10] [c00000000000d9fc] ret_from_kernel_thread+0x5c/0x80
[ 7703.159183][   C99] Instruction dump:
[ 7703.159204][   C99] 60000000 7c0802a6 3c82f8b4 7fe3fb78 38847470 f8010040 482b4fc5 60000000
[ 7703.159248][   C99] 0fe00000 7c0802a6 fbe10028 f8010040 <0fe00000> 3c4c07f1 38422f10 7c0802a6
[ 7703.159293][   C99] ---[ end trace 1d92a5231ba6a0d5 ]---

Properly apply the masks before calling pmd_free_tlb() and
pud_free_tlb() respectively.

Reported-by: Qian Cai <qcai@redhat.com>
Fixes: 7bfe54b5f165 ("powerpc/mm: Refactor the floor/ceiling check in hugetlb range freeing functions")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/hugetlbpage.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index f8d8a4988e15..8b3cc4d688e8 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -396,9 +396,9 @@ static void hugetlb_free_pmd_range(struct mmu_gather *tlb, pud_t *pud,
 	if (range_is_outside_limits(start, end, floor, ceiling, PUD_MASK))
 		return;
 
-	pmd = pmd_offset(pud, start);
+	pmd = pmd_offset(pud, start & PUD_MASK);
 	pud_clear(pud);
-	pmd_free_tlb(tlb, pmd, start);
+	pmd_free_tlb(tlb, pmd, start & PUD_MASK);
 	mm_dec_nr_pmds(tlb->mm);
 }
 
@@ -439,9 +439,9 @@ static void hugetlb_free_pud_range(struct mmu_gather *tlb, p4d_t *p4d,
 	if (range_is_outside_limits(start, end, floor, ceiling, PGDIR_MASK))
 		return;
 
-	pud = pud_offset(p4d, start);
+	pud = pud_offset(p4d, start & PGDIR_MASK);
 	p4d_clear(p4d);
-	pud_free_tlb(tlb, pud, start);
+	pud_free_tlb(tlb, pud, start & PGDIR_MASK);
 	mm_dec_nr_puds(tlb->mm);
 }
 
-- 
2.25.0

