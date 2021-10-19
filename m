Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F14C743362E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 14:42:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYYLP4PdYz3cVh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 23:42:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYYKv2R1Rz2yn2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 23:42:25 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HYYKn6vlrz9sSR;
 Tue, 19 Oct 2021 14:42:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WlIIjZ17ezb6; Tue, 19 Oct 2021 14:42:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HYYKn5vttz9sSP;
 Tue, 19 Oct 2021 14:42:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B5DCC8B786;
 Tue, 19 Oct 2021 14:42:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fj0D7dev5eC7; Tue, 19 Oct 2021 14:42:21 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.83])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3BF398B77E;
 Tue, 19 Oct 2021 14:42:21 +0200 (CEST)
Subject: Re: [PATCH v3 05/18] powerpc/85xx: Load all early TLB entries at once
To: Scott Wood <oss@buserror.net>
References: <1445572476-17192-1-git-send-email-scottwood@freescale.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c63e4dff-5212-5800-9407-db5e580035ce@csgroup.eu>
Date: Tue, 19 Oct 2021 14:42:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1445572476-17192-1-git-send-email-scottwood@freescale.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
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
Cc: Laurentiu Tudor <b10716@freescale.com>, linuxppc-dev@lists.ozlabs.org,
 kexec@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Scott,

Le 23/10/2015 à 05:54, Scott Wood a écrit :
> Use an AS=1 trampoline TLB entry to allow all normal TLB1 entries to
> be loaded at once.  This avoids the need to keep the translation that
> code is executing from in the same TLB entry in the final TLB
> configuration as during early boot, which in turn is helpful for
> relocatable kernels (e.g. kdump) where the kernel is not running from
> what would be the first TLB entry.
> 
> On e6500, we limit map_mem_in_cams() to the primary hwthread of a
> core (the boot cpu is always considered primary, as a kdump kernel
> can be entered on any cpu).  Each TLB only needs to be set up once,
> and when we do, we don't want another thread to be running when we
> create a temporary trampoline TLB1 entry.


Isn't that redundant with commit 78a235efdc42 ("powerpc/fsl_booke: set 
the tlb entry for the kernel address in AS1") ?

Should we revert commit 78a235efdc42 ?

Christophe

> 
> Signed-off-by: Scott Wood <scottwood@freescale.com>
> ---
> v3: Drop rename of settlbcam to preptlbcam, as the settlbcam wrapper
> was unused.
> 
>   arch/powerpc/kernel/setup_64.c   |  8 +++++
>   arch/powerpc/mm/fsl_booke_mmu.c  |  4 +--
>   arch/powerpc/mm/mmu_decl.h       |  1 +
>   arch/powerpc/mm/tlb_nohash.c     | 19 +++++++++++-
>   arch/powerpc/mm/tlb_nohash_low.S | 63 ++++++++++++++++++++++++++++++++++++++++
>   5 files changed, 92 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index bdcbb71..505ec2c 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -108,6 +108,14 @@ static void setup_tlb_core_data(void)
>   	for_each_possible_cpu(cpu) {
>   		int first = cpu_first_thread_sibling(cpu);
>   
> +		/*
> +		 * If we boot via kdump on a non-primary thread,
> +		 * make sure we point at the thread that actually
> +		 * set up this TLB.
> +		 */
> +		if (cpu_first_thread_sibling(boot_cpuid) == first)
> +			first = boot_cpuid;
> +
>   		paca[cpu].tcd_ptr = &paca[first].tcd;
>   
>   		/*
> diff --git a/arch/powerpc/mm/fsl_booke_mmu.c b/arch/powerpc/mm/fsl_booke_mmu.c
> index 354ba3c..bb1f88c 100644
> --- a/arch/powerpc/mm/fsl_booke_mmu.c
> +++ b/arch/powerpc/mm/fsl_booke_mmu.c
> @@ -141,8 +141,6 @@ static void settlbcam(int index, unsigned long virt, phys_addr_t phys,
>   	tlbcam_addrs[index].start = virt;
>   	tlbcam_addrs[index].limit = virt + size - 1;
>   	tlbcam_addrs[index].phys = phys;
> -
> -	loadcam_entry(index);
>   }
>   
>   unsigned long calc_cam_sz(unsigned long ram, unsigned long virt,
> @@ -188,6 +186,8 @@ static unsigned long map_mem_in_cams_addr(phys_addr_t phys, unsigned long virt,
>   		virt += cam_sz;
>   		phys += cam_sz;
>   	}
> +
> +	loadcam_multi(0, i, max_cam_idx);
>   	tlbcam_index = i;
>   
>   #ifdef CONFIG_PPC64
> diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
> index 085b66b..27c3a2d 100644
> --- a/arch/powerpc/mm/mmu_decl.h
> +++ b/arch/powerpc/mm/mmu_decl.h
> @@ -152,6 +152,7 @@ extern int switch_to_as1(void);
>   extern void restore_to_as0(int esel, int offset, void *dt_ptr, int bootcpu);
>   #endif
>   extern void loadcam_entry(unsigned int index);
> +extern void loadcam_multi(int first_idx, int num, int tmp_idx);
>   
>   struct tlbcam {
>   	u32	MAS0;
> diff --git a/arch/powerpc/mm/tlb_nohash.c b/arch/powerpc/mm/tlb_nohash.c
> index 723a099..a7381fb 100644
> --- a/arch/powerpc/mm/tlb_nohash.c
> +++ b/arch/powerpc/mm/tlb_nohash.c
> @@ -42,6 +42,7 @@
>   #include <asm/tlbflush.h>
>   #include <asm/tlb.h>
>   #include <asm/code-patching.h>
> +#include <asm/cputhreads.h>
>   #include <asm/hugetlb.h>
>   #include <asm/paca.h>
>   
> @@ -628,10 +629,26 @@ static void early_init_this_mmu(void)
>   #ifdef CONFIG_PPC_FSL_BOOK3E
>   	if (mmu_has_feature(MMU_FTR_TYPE_FSL_E)) {
>   		unsigned int num_cams;
> +		int __maybe_unused cpu = smp_processor_id();
> +		bool map = true;
>   
>   		/* use a quarter of the TLBCAM for bolted linear map */
>   		num_cams = (mfspr(SPRN_TLB1CFG) & TLBnCFG_N_ENTRY) / 4;
> -		linear_map_top = map_mem_in_cams(linear_map_top, num_cams);
> +
> +		/*
> +		 * Only do the mapping once per core, or else the
> +		 * transient mapping would cause problems.
> +		 */
> +#ifdef CONFIG_SMP
> +		if (cpu != boot_cpuid &&
> +		    (cpu != cpu_first_thread_sibling(cpu) ||
> +		     cpu == cpu_first_thread_sibling(boot_cpuid)))
> +			map = false;
> +#endif
> +
> +		if (map)
> +			linear_map_top = map_mem_in_cams(linear_map_top,
> +							 num_cams);
>   	}
>   #endif
>   
> diff --git a/arch/powerpc/mm/tlb_nohash_low.S b/arch/powerpc/mm/tlb_nohash_low.S
> index 43ff3c7..68c4775 100644
> --- a/arch/powerpc/mm/tlb_nohash_low.S
> +++ b/arch/powerpc/mm/tlb_nohash_low.S
> @@ -400,6 +400,7 @@ _GLOBAL(set_context)
>    * extern void loadcam_entry(unsigned int index)
>    *
>    * Load TLBCAM[index] entry in to the L2 CAM MMU
> + * Must preserve r7, r8, r9, and r10
>    */
>   _GLOBAL(loadcam_entry)
>   	mflr	r5
> @@ -423,4 +424,66 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_BIG_PHYS)
>   	tlbwe
>   	isync
>   	blr
> +
> +/*
> + * Load multiple TLB entries at once, using an alternate-space
> + * trampoline so that we don't have to care about whether the same
> + * TLB entry maps us before and after.
> + *
> + * r3 = first entry to write
> + * r4 = number of entries to write
> + * r5 = temporary tlb entry
> + */
> +_GLOBAL(loadcam_multi)
> +	mflr	r8
> +
> +	/*
> +	 * Set up temporary TLB entry that is the same as what we're
> +	 * running from, but in AS=1.
> +	 */
> +	bl	1f
> +1:	mflr	r6
> +	tlbsx	0,r8
> +	mfspr	r6,SPRN_MAS1
> +	ori	r6,r6,MAS1_TS
> +	mtspr	SPRN_MAS1,r6
> +	mfspr	r6,SPRN_MAS0
> +	rlwimi	r6,r5,MAS0_ESEL_SHIFT,MAS0_ESEL_MASK
> +	mr	r7,r5
> +	mtspr	SPRN_MAS0,r6
> +	isync
> +	tlbwe
> +	isync
> +
> +	/* Switch to AS=1 */
> +	mfmsr	r6
> +	ori	r6,r6,MSR_IS|MSR_DS
> +	mtmsr	r6
> +	isync
> +
> +	mr	r9,r3
> +	add	r10,r3,r4
> +2:	bl	loadcam_entry
> +	addi	r9,r9,1
> +	cmpw	r9,r10
> +	mr	r3,r9
> +	blt	2b
> +
> +	/* Return to AS=0 and clear the temporary entry */
> +	mfmsr	r6
> +	rlwinm.	r6,r6,0,~(MSR_IS|MSR_DS)
> +	mtmsr	r6
> +	isync
> +
> +	li	r6,0
> +	mtspr	SPRN_MAS1,r6
> +	rlwinm	r6,r7,MAS0_ESEL_SHIFT,MAS0_ESEL_MASK
> +	oris	r6,r6,MAS0_TLBSEL(1)@h
> +	mtspr	SPRN_MAS0,r6
> +	isync
> +	tlbwe
> +	isync
> +
> +	mtlr	r8
> +	blr
>   #endif
> 
