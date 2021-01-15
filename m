Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F20E82F8487
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 19:35:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHVHW0p5HzDsQH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 05:35:51 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHSMz0qCMzDqyB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 04:09:27 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DHSMb4dNhz9tyFN;
 Fri, 15 Jan 2021 18:09:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id mCmDzucNLA7p; Fri, 15 Jan 2021 18:09:15 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DHSMb3BY5z9tyF6;
 Fri, 15 Jan 2021 18:09:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 130A48B82F;
 Fri, 15 Jan 2021 18:09:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BomduMrBh07W; Fri, 15 Jan 2021 18:09:16 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 780F68B82C;
 Fri, 15 Jan 2021 18:09:15 +0100 (CET)
Subject: Re: [PATCH v6 07/39] powerpc: bad_page_fault get registers from regs
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210115165012.1260253-1-npiggin@gmail.com>
 <20210115165012.1260253-8-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9120125b-6dce-4e89-7113-dfdcea43e191@csgroup.eu>
Date: Fri, 15 Jan 2021 18:09:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210115165012.1260253-8-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/01/2021 à 17:49, Nicholas Piggin a écrit :
> Similar to the previous patch this makes interrupt handler function
> types more regular so they can be wrapped with the next patch.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/bug.h             |  5 +++--
>   arch/powerpc/kernel/entry_32.S             |  3 +--
>   arch/powerpc/kernel/exceptions-64e.S       |  3 +--
>   arch/powerpc/kernel/exceptions-64s.S       |  4 +---
>   arch/powerpc/kernel/traps.c                |  2 +-
>   arch/powerpc/mm/book3s64/hash_utils.c      |  4 ++--
>   arch/powerpc/mm/book3s64/slb.c             |  2 +-
>   arch/powerpc/mm/fault.c                    | 13 ++++++++++---
>   arch/powerpc/platforms/8xx/machine_check.c |  2 +-
>   9 files changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> index f7827e993196..8f09ddae9305 100644
> --- a/arch/powerpc/include/asm/bug.h
> +++ b/arch/powerpc/include/asm/bug.h
> @@ -112,8 +112,9 @@
>   
>   struct pt_regs;
>   long do_page_fault(struct pt_regs *);
> -extern void bad_page_fault(struct pt_regs *, unsigned long, int);
> -void __bad_page_fault(struct pt_regs *regs, unsigned long address, int sig);
> +void bad_page_fault(struct pt_regs *, int);
> +void __bad_page_fault(struct pt_regs *regs, int sig);
> +void do_bad_page_fault_segv(struct pt_regs *regs);

What is that do_bad_page_fault_segv() ? Shouldn't it be in a separate patch ?

>   extern void _exception(int, struct pt_regs *, int, unsigned long);
>   extern void _exception_pkey(struct pt_regs *, unsigned long, int);
>   extern void die(const char *, struct pt_regs *, long);
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
> index d6ea3f2d6cc0..b102b40c4988 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -672,9 +672,8 @@ handle_page_fault:
>   	lwz	r0,_TRAP(r1)
>   	clrrwi	r0,r0,1
>   	stw	r0,_TRAP(r1)
> -	mr	r5,r3
> +	mr	r4,r3		/* err arg for bad_page_fault */
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
> -	lwz	r4,_DAR(r1)
>   	bl	__bad_page_fault
>   	b	ret_from_except_full
>   
> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
> index 43e71d86dcbf..52421042a020 100644
> --- a/arch/powerpc/kernel/exceptions-64e.S
> +++ b/arch/powerpc/kernel/exceptions-64e.S
> @@ -1018,9 +1018,8 @@ storage_fault_common:
>   	bne-	1f
>   	b	ret_from_except_lite
>   1:	bl	save_nvgprs
> -	mr	r5,r3
> +	mr	r4,r3
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
> -	ld	r4,_DAR(r1)
>   	bl	__bad_page_fault
>   	b	ret_from_except
>   
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 839dcb94eea7..b90d3cde14cf 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -2151,9 +2151,7 @@ EXC_COMMON_BEGIN(h_data_storage_common)
>   	GEN_COMMON h_data_storage
>   	addi    r3,r1,STACK_FRAME_OVERHEAD
>   BEGIN_MMU_FTR_SECTION
> -	ld	r4,_DAR(r1)
> -	li	r5,SIGSEGV
> -	bl      bad_page_fault
> +	bl      do_bad_page_fault_segv
>   MMU_FTR_SECTION_ELSE
>   	bl      unknown_exception
>   ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_TYPE_RADIX)
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 3ec7b443fe6b..f3f6af3141ee 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -1612,7 +1612,7 @@ void alignment_exception(struct pt_regs *regs)
>   	if (user_mode(regs))
>   		_exception(sig, regs, code, regs->dar);
>   	else
> -		bad_page_fault(regs, regs->dar, sig);
> +		bad_page_fault(regs, sig);
>   
>   bail:
>   	exception_exit(prev_state);
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 9a499af3eebf..1a270cc37d97 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1539,7 +1539,7 @@ long do_hash_fault(struct pt_regs *regs)
>   	 * the access, or panic if there isn't a handler.
>   	 */
>   	if (unlikely(in_nmi())) {
> -		bad_page_fault(regs, ea, SIGSEGV);
> +		bad_page_fault(regs, SIGSEGV);
>   		return 0;
>   	}
>   
> @@ -1578,7 +1578,7 @@ long do_hash_fault(struct pt_regs *regs)
>   			else
>   				_exception(SIGBUS, regs, BUS_ADRERR, ea);
>   		} else {
> -			bad_page_fault(regs, ea, SIGBUS);
> +			bad_page_fault(regs, SIGBUS);
>   		}
>   		err = 0;
>   
> diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
> index 985902ce0272..c581548b533f 100644
> --- a/arch/powerpc/mm/book3s64/slb.c
> +++ b/arch/powerpc/mm/book3s64/slb.c
> @@ -874,7 +874,7 @@ void do_bad_slb_fault(struct pt_regs *regs)
>   		if (user_mode(regs))
>   			_exception(SIGSEGV, regs, SEGV_BNDERR, regs->dar);
>   		else
> -			bad_page_fault(regs, regs->dar, SIGSEGV);
> +			bad_page_fault(regs, SIGSEGV);
>   	} else if (err == -EINVAL) {
>   		unrecoverable_exception(regs);
>   	} else {
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 273ff845eccf..e476d7701413 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -566,7 +566,7 @@ NOKPROBE_SYMBOL(do_page_fault);
>    * It is called from the DSI and ISI handlers in head.S and from some
>    * of the procedures in traps.c.
>    */
> -void __bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
> +void __bad_page_fault(struct pt_regs *regs, int sig)
>   {
>   	int is_write = page_fault_is_write(regs->dsisr);
>   
> @@ -604,7 +604,7 @@ void __bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
>   	die("Kernel access of bad area", regs, sig);
>   }
>   
> -void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
> +void bad_page_fault(struct pt_regs *regs, int sig)
>   {
>   	const struct exception_table_entry *entry;
>   
> @@ -613,5 +613,12 @@ void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
>   	if (entry)
>   		instruction_pointer_set(regs, extable_fixup(entry));
>   	else
> -		__bad_page_fault(regs, address, sig);
> +		__bad_page_fault(regs, sig);
>   }
> +
> +#ifdef CONFIG_PPC_BOOK3S_64
> +void do_bad_page_fault_segv(struct pt_regs *regs)
> +{
> +	bad_page_fault(regs, SIGSEGV);
> +}
> +#endif
> diff --git a/arch/powerpc/platforms/8xx/machine_check.c b/arch/powerpc/platforms/8xx/machine_check.c
> index 88dedf38eccd..656365975895 100644
> --- a/arch/powerpc/platforms/8xx/machine_check.c
> +++ b/arch/powerpc/platforms/8xx/machine_check.c
> @@ -26,7 +26,7 @@ int machine_check_8xx(struct pt_regs *regs)
>   	 * to deal with that than having a wart in the mcheck handler.
>   	 * -- BenH
>   	 */
> -	bad_page_fault(regs, regs->dar, SIGBUS);
> +	bad_page_fault(regs, SIGBUS);
>   	return 1;
>   #else
>   	return 0;
> 
