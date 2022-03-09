Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E50054D2BBF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 10:23:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KD6Dg50K6z3bgh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 20:22:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KD6DH1ZSHz2xtv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 20:22:36 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KD6DC1RGGz9sSX;
 Wed,  9 Mar 2022 10:22:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id alQAWZ3kP2SI; Wed,  9 Mar 2022 10:22:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KD6DC0WVLz9sSV;
 Wed,  9 Mar 2022 10:22:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F3A048B77E;
 Wed,  9 Mar 2022 10:22:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xVav9NaNiTXZ; Wed,  9 Mar 2022 10:22:34 +0100 (CET)
Received: from [192.168.202.3] (unknown [192.168.202.3])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 629838B763;
 Wed,  9 Mar 2022 10:22:34 +0100 (CET)
Message-ID: <1c6276d5-6e9e-3ad4-a7d5-c5a70031259f@csgroup.eu>
Date: Wed, 9 Mar 2022 10:22:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/3] powerpc/mce: Bug fixes for MCE handling in kernel
 space
Content-Language: fr-FR
To: Balbir Singh <bsingharora@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20180405071500.22320-1-bsingharora@gmail.com>
 <20180405071500.22320-2-bsingharora@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20180405071500.22320-2-bsingharora@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: oohall@gmail.com, npiggin@gmail.com, linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/04/2018 à 09:14, Balbir Singh a écrit :
> The code currently assumes PAGE_SHIFT as the shift value of
> the pfn, this works correctly (mostly) for user space pages,
> but the correct thing to do is
> 
> 1. Extract the shift value returned via the pte-walk API's
> 2. Use the shift value to access the instruction address.
> 
> Note, the final physical address still use PAGE_SHIFT for
> computation. handle_ierror() is not modified and handle_derror()
> is modified just for extracting the correct instruction
> address.
> 
> This is largely due to __find_linux_pte() returning pfn's
> shifted by pdshift. The code is much more generic and can
> handle shift values returned.
> 
> Fixes: ba41e1e1ccb9 ("powerpc/mce: Hookup derror (load/store) UE errors")
> 
> Signed-off-by: Balbir Singh <bsingharora@gmail.com>

Series superseded by 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=126132&state=*

> ---
>   arch/powerpc/kernel/mce_power.c | 26 ++++++++++++++++----------
>   1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
> index fe6fc63251fe..bd9754def479 100644
> --- a/arch/powerpc/kernel/mce_power.c
> +++ b/arch/powerpc/kernel/mce_power.c
> @@ -36,7 +36,8 @@
>    * Convert an address related to an mm to a PFN. NOTE: we are in real
>    * mode, we could potentially race with page table updates.
>    */
> -static unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr)
> +static unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr,
> +		unsigned int *shift)
>   {
>   	pte_t *ptep;
>   	unsigned long flags;
> @@ -49,13 +50,15 @@ static unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr)
>   
>   	local_irq_save(flags);
>   	if (mm == current->mm)
> -		ptep = find_current_mm_pte(mm->pgd, addr, NULL, NULL);
> +		ptep = find_current_mm_pte(mm->pgd, addr, NULL, shift);
>   	else
> -		ptep = find_init_mm_pte(addr, NULL);
> +		ptep = find_init_mm_pte(addr, shift);
>   	local_irq_restore(flags);
>   	if (!ptep || pte_special(*ptep))
>   		return ULONG_MAX;
> -	return pte_pfn(*ptep);
> +	if (!*shift)
> +		*shift = PAGE_SHIFT;
> +	return (pte_val(*ptep) & PTE_RPN_MASK) >> *shift;
>   }
>   
>   /* flush SLBs and reload */
> @@ -353,15 +356,16 @@ static int mce_find_instr_ea_and_pfn(struct pt_regs *regs, uint64_t *addr,
>   	unsigned long pfn, instr_addr;
>   	struct instruction_op op;
>   	struct pt_regs tmp = *regs;
> +	unsigned int shift;
>   
> -	pfn = addr_to_pfn(regs, regs->nip);
> +	pfn = addr_to_pfn(regs, regs->nip, &shift);
>   	if (pfn != ULONG_MAX) {
> -		instr_addr = (pfn << PAGE_SHIFT) + (regs->nip & ~PAGE_MASK);
> +		instr_addr = (pfn << shift) + (regs->nip & ((1 << shift) - 1));
>   		instr = *(unsigned int *)(instr_addr);
>   		if (!analyse_instr(&op, &tmp, instr)) {
> -			pfn = addr_to_pfn(regs, op.ea);
> +			pfn = addr_to_pfn(regs, op.ea, &shift);
>   			*addr = op.ea;
> -			*phys_addr = (pfn << PAGE_SHIFT);
> +			*phys_addr = (pfn << shift);
>   			return 0;
>   		}
>   		/*
> @@ -435,12 +439,14 @@ static int mce_handle_ierror(struct pt_regs *regs,
>   			if (mce_err->severity == MCE_SEV_ERROR_SYNC &&
>   				table[i].error_type == MCE_ERROR_TYPE_UE) {
>   				unsigned long pfn;
> +				unsigned int shift;
>   
>   				if (get_paca()->in_mce < MAX_MCE_DEPTH) {
> -					pfn = addr_to_pfn(regs, regs->nip);
> +					pfn = addr_to_pfn(regs, regs->nip,
> +							&shift);
>   					if (pfn != ULONG_MAX) {
>   						*phys_addr =
> -							(pfn << PAGE_SHIFT);
> +							(pfn << shift);
>   						handled = 1;
>   					}
>   				}
