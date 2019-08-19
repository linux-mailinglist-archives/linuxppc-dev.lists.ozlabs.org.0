Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A990691AEC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 04:02:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BcdS43XczDq7c
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 12:02:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BcZW5FvdzDr9Q
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 12:00:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46BcZW3LDcz9s3Z;
 Mon, 19 Aug 2019 12:00:19 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/3] powerpc/64s/radix: all CPUs should flush local
 translation structure before turning MMU on
In-Reply-To: <20190816040733.5737-3-npiggin@gmail.com>
References: <20190816040733.5737-1-npiggin@gmail.com>
 <20190816040733.5737-3-npiggin@gmail.com>
Date: Mon, 19 Aug 2019 12:00:19 +1000
Message-ID: <87zhk56hjg.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Rather than sprinkle various translation structure invalidations
> around different places in early boot, have each CPU flush everything
> from its local translation structures before enabling its MMU.
>
> Radix guests can execute tlbie(l), so have them tlbiel_all in the same
> place as radix host does.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index d60cfa05447a..839e01795211 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -382,11 +382,6 @@ static void __init radix_init_pgtable(void)
>  	 */
>  	register_process_table(__pa(process_tb), 0, PRTB_SIZE_SHIFT - 12);
>  	pr_info("Process table %p and radix root for kernel: %p\n", process_tb, init_mm.pgd);
> -	asm volatile("ptesync" : : : "memory");
> -	asm volatile(PPC_TLBIE_5(%0,%1,2,1,1) : :
> -		     "r" (TLBIEL_INVAL_SET_LPID), "r" (0));
> -	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
> -	trace_tlbie(0, 0, TLBIEL_INVAL_SET_LPID, 0, 2, 1, 1);
>  
>  	/*
>  	 * The init_mm context is given the first available (non-zero) PID,
> @@ -633,8 +628,7 @@ void __init radix__early_init_mmu(void)
>  	radix_init_pgtable();
>  	/* Switch to the guard PID before turning on MMU */
>  	radix__switch_mmu_context(NULL, &init_mm);
> -	if (cpu_has_feature(CPU_FTR_HVMODE))
> -		tlbiel_all();
> +	tlbiel_all();
>  }

This is oopsing for me in a guest on Power9:

  [    0.000000] radix-mmu: Page sizes from device-tree:
  [    0.000000] radix-mmu: Page size shift = 12 AP=0x0
  [    0.000000] radix-mmu: Page size shift = 16 AP=0x5
  [    0.000000] radix-mmu: Page size shift = 21 AP=0x1
  [    0.000000] radix-mmu: Page size shift = 30 AP=0x2
  [    0.000000]  -> fw_vec5_feature_init()
  [    0.000000]  <- fw_vec5_feature_init()
  [    0.000000]  -> fw_hypertas_feature_init()
  [    0.000000]  <- fw_hypertas_feature_init()
  [    0.000000] radix-mmu: Activating Kernel Userspace Execution Prevention
  [    0.000000] radix-mmu: Activating Kernel Userspace Access Prevention
  [    0.000000] lpar: Using radix MMU under hypervisor
  [    0.000000] radix-mmu: Mapped 0x0000000000000000-0x0000000040000000 with 1.00 GiB pages (exec)
  [    0.000000] radix-mmu: Mapped 0x0000000040000000-0x0000000100000000 with 1.00 GiB pages
  [    0.000000] radix-mmu: Process table (____ptrval____) and radix root for kernel: (____ptrval____)
  [    0.000000] Oops: Exception in kernel mode, sig: 4 [#1]
  [    0.000000] LE PAGE_SIZE=64K MMU=Radix MMU=Hash SMP NR_CPUS=2048 NUMA 
  [    0.000000] Modules linked in:
  [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.0-rc2-gcc-8.2.0-00063-gef906dcf7b75 #633
  [    0.000000] NIP:  c0000000000838f8 LR: c000000001066864 CTR: c0000000000838c0
  [    0.000000] REGS: c000000001647c40 TRAP: 0700   Not tainted  (5.3.0-rc2-gcc-8.2.0-00063-gef906dcf7b75)
  [    0.000000] MSR:  8000000000043003 <SF,FP,ME,RI,LE>  CR: 48000222  XER: 20040000
  [    0.000000] CFAR: c0000000000839b4 IRQMASK: 1 
  [    0.000000] GPR00: c000000001066864 c000000001647ed0 c000000001649700 0000000000000000 
  [    0.000000] GPR04: c000000001608830 0000000000000000 0000000000000010 2000000000000000 
  [    0.000000] GPR08: 0000000000000c00 0000000000000000 0000000000000002 726f6620746f6f72 
  [    0.000000] GPR12: c0000000000838c0 c000000001930000 000000000dc5bef0 0000000001309e10 
  [    0.000000] GPR16: 0000000001309c90 fffffffffffffffd 000000000dc5bef0 0000000001339800 
  [    0.000000] GPR20: 0000000000000014 0000000001ac0000 000000000dc5bf38 000000000daf0000 
  [    0.000000] GPR24: 0000000001f4000c c000000000000000 0000000000400000 c000000001802858 
  [    0.000000] GPR28: c007ffffffffffff c000000001803954 c000000001681cb0 c000000001608830 
  [    0.000000] NIP [c0000000000838f8] radix__tlbiel_all+0x48/0x110
  [    0.000000] LR [c000000001066864] radix__early_init_mmu+0x494/0x4c8
  [    0.000000] Call Trace:
  [    0.000000] [c000000001647ed0] [c000000001066820] radix__early_init_mmu+0x450/0x4c8 (unreliable)
  [    0.000000] [c000000001647f60] [c00000000105c628] early_setup+0x160/0x198
  [    0.000000] [c000000001647f90] [000000000000b460] 0xb460
  [    0.000000] Instruction dump:
  [    0.000000] 2b830001 39000002 409e00e8 3d220003 3929c318 e9290000 e9290010 75290002 
  [    0.000000] 41820088 7c4004ac 39200000 79085564 <7d294224> 3940007f 39201000 38e00000 
  [    0.000000] random: get_random_bytes called from print_oops_end_marker+0x40/0x80 with crng_init=0
  [    0.000000] ---[ end trace 0000000000000000 ]---


So I think we still need a HV check in there somewhere.

cheers
