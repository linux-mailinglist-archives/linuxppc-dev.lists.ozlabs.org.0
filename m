Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A6543A63D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 23:54:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdTHq4wjxz3f7Y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 08:54:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdTHJ6JsCz3cc1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 08:53:48 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HdTHD4m47z9sTQ;
 Mon, 25 Oct 2021 23:53:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CE44DdC69V01; Mon, 25 Oct 2021 23:53:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HdTHD3Mfbz9sTK;
 Mon, 25 Oct 2021 23:53:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 44B108B76D;
 Mon, 25 Oct 2021 23:53:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pHcE_ofUi_WZ; Mon, 25 Oct 2021 23:53:44 +0200 (CEST)
Received: from [192.168.203.118] (unknown [192.168.203.118])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 765018B763;
 Mon, 25 Oct 2021 23:53:43 +0200 (CEST)
Message-ID: <5794f254-0523-7f2f-f9e7-ff64a7fe400d@csgroup.eu>
Date: Mon, 25 Oct 2021 23:53:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 02/10] powerpc/book3e: Fix set_memory_x() and
 set_memory_nx()
Content-Language: fr-FR
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <33e7fe0f6134c58e044eb63d3925cd34aa120104.1634983809.git.christophe.leroy@csgroup.eu>
 <7e7b0688c907e54f3b11ddfb9a8f44511d475fd7.1634983809.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <7e7b0688c907e54f3b11ddfb9a8f44511d475fd7.1634983809.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 23/10/2021 13:47, Christophe Leroy wrote:
> set_memory_x() calls pte_mkexec() which sets _PAGE_EXEC.
> set_memory_nx() calls pte_exprotec() which clears _PAGE_EXEC.
> 
> Book3e has 2 bits, UX and SX, which defines the exec rights
> resp. for user (PR=1) and for kernel (PR=0).
> 
> _PAGE_EXEC is defined as UX only.
> 
> An executable kernel page is set with either _PAGE_KERNEL_RWX
> or _PAGE_KERNEL_ROX, which both have SX set and UX cleared.
> 
> So set_memory_nx() call for an executable kernel page does
> nothing because UX is already cleared.
> 
> And set_memory_x() on a non-executable kernel page makes it
> executable for the user and keeps it non-executable for kernel.
> 
> Also, pte_exec() always returns 'false' on kernel pages, because
> it checks _PAGE_EXEC which doesn't include SX, so for instance
> the W+X check doesn't work.
> 
> To fix this:
> - change tlb_low_64e.S to use _PAGE_BAP_UX instead of _PAGE_USER
> - sets both UX and SX in _PAGE_EXEC so that pte_user() returns
> true whenever one of the two bits is set and pte_exprotect()
> clears both bits.
> - Define a book3e specific version of pte_mkexec() which sets
> either SX or UX based on UR.
> 
> Fixes: 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: New

pte_mkexec() in nohash/64/pgtable.h conflicts with the one in 
nohash/pte_book3e.h

Should guard it with  #ifndef pte_mkexec(), but as pte_book3e is the 
only user in 64 bits, then just remove it from there.

Send v3 with only that change compared to v2.

Christophe

> ---
>   arch/powerpc/include/asm/nohash/32/pgtable.h |  2 ++
>   arch/powerpc/include/asm/nohash/pte-book3e.h | 18 ++++++++++++++----
>   arch/powerpc/mm/nohash/tlb_low_64e.S         |  8 ++++----
>   3 files changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
> index ac0a5ff48c3a..d6ba821a56ce 100644
> --- a/arch/powerpc/include/asm/nohash/32/pgtable.h
> +++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
> @@ -193,10 +193,12 @@ static inline pte_t pte_wrprotect(pte_t pte)
>   }
>   #endif
>   
> +#ifndef pte_mkexec
>   static inline pte_t pte_mkexec(pte_t pte)
>   {
>   	return __pte(pte_val(pte) | _PAGE_EXEC);
>   }
> +#endif
>   
>   #define pmd_none(pmd)		(!pmd_val(pmd))
>   #define	pmd_bad(pmd)		(pmd_val(pmd) & _PMD_BAD)
> diff --git a/arch/powerpc/include/asm/nohash/pte-book3e.h b/arch/powerpc/include/asm/nohash/pte-book3e.h
> index 813918f40765..f798640422c2 100644
> --- a/arch/powerpc/include/asm/nohash/pte-book3e.h
> +++ b/arch/powerpc/include/asm/nohash/pte-book3e.h
> @@ -48,7 +48,7 @@
>   #define _PAGE_WRITETHRU	0x800000 /* W: cache write-through */
>   
>   /* "Higher level" linux bit combinations */
> -#define _PAGE_EXEC		_PAGE_BAP_UX /* .. and was cache cleaned */
> +#define _PAGE_EXEC		(_PAGE_BAP_SX | _PAGE_BAP_UX) /* .. and was cache cleaned */
>   #define _PAGE_RW		(_PAGE_BAP_SW | _PAGE_BAP_UW) /* User write permission */
>   #define _PAGE_KERNEL_RW		(_PAGE_BAP_SW | _PAGE_BAP_SR | _PAGE_DIRTY)
>   #define _PAGE_KERNEL_RO		(_PAGE_BAP_SR)
> @@ -93,11 +93,11 @@
>   /* Permission masks used to generate the __P and __S table */
>   #define PAGE_NONE	__pgprot(_PAGE_BASE)
>   #define PAGE_SHARED	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_RW)
> -#define PAGE_SHARED_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_RW | _PAGE_EXEC)
> +#define PAGE_SHARED_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_RW | _PAGE_BAP_UX)
>   #define PAGE_COPY	__pgprot(_PAGE_BASE | _PAGE_USER)
> -#define PAGE_COPY_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_EXEC)
> +#define PAGE_COPY_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_BAP_UX)
>   #define PAGE_READONLY	__pgprot(_PAGE_BASE | _PAGE_USER)
> -#define PAGE_READONLY_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_EXEC)
> +#define PAGE_READONLY_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_BAP_UX)
>   
>   #ifndef __ASSEMBLY__
>   static inline pte_t pte_mkprivileged(pte_t pte)
> @@ -113,6 +113,16 @@ static inline pte_t pte_mkuser(pte_t pte)
>   }
>   
>   #define pte_mkuser pte_mkuser
> +
> +static inline pte_t pte_mkexec(pte_t pte)
> +{
> +	if (pte_val(pte) & _PAGE_BAP_UR)
> +		return __pte((pte_val(pte) & ~_PAGE_BAP_SX) | _PAGE_BAP_UX);
> +	else
> +		return __pte((pte_val(pte) & ~_PAGE_BAP_UX) | _PAGE_BAP_SX);
> +}
> +#define pte_mkexec pte_mkexec
> +
>   #endif /* __ASSEMBLY__ */
>   
>   #endif /* __KERNEL__ */
> diff --git a/arch/powerpc/mm/nohash/tlb_low_64e.S b/arch/powerpc/mm/nohash/tlb_low_64e.S
> index bf24451f3e71..9235e720e357 100644
> --- a/arch/powerpc/mm/nohash/tlb_low_64e.S
> +++ b/arch/powerpc/mm/nohash/tlb_low_64e.S
> @@ -222,7 +222,7 @@ tlb_miss_kernel_bolted:
>   
>   tlb_miss_fault_bolted:
>   	/* We need to check if it was an instruction miss */
> -	andi.	r10,r11,_PAGE_EXEC|_PAGE_BAP_SX
> +	andi.	r10,r11,_PAGE_BAP_UX|_PAGE_BAP_SX
>   	bne	itlb_miss_fault_bolted
>   dtlb_miss_fault_bolted:
>   	tlb_epilog_bolted
> @@ -239,7 +239,7 @@ itlb_miss_fault_bolted:
>   	srdi	r15,r16,60		/* get region */
>   	bne-	itlb_miss_fault_bolted
>   
> -	li	r11,_PAGE_PRESENT|_PAGE_EXEC	/* Base perm */
> +	li	r11,_PAGE_PRESENT|_PAGE_BAP_UX	/* Base perm */
>   
>   	/* We do the user/kernel test for the PID here along with the RW test
>   	 */
> @@ -614,7 +614,7 @@ itlb_miss_fault_e6500:
>   
>   	/* We do the user/kernel test for the PID here along with the RW test
>   	 */
> -	li	r11,_PAGE_PRESENT|_PAGE_EXEC	/* Base perm */
> +	li	r11,_PAGE_PRESENT|_PAGE_BAP_UX	/* Base perm */
>   	oris	r11,r11,_PAGE_ACCESSED@h
>   
>   	cmpldi	cr0,r15,0			/* Check for user region */
> @@ -734,7 +734,7 @@ normal_tlb_miss_done:
>   
>   normal_tlb_miss_access_fault:
>   	/* We need to check if it was an instruction miss */
> -	andi.	r10,r11,_PAGE_EXEC
> +	andi.	r10,r11,_PAGE_BAP_UX
>   	bne	1f
>   	ld	r14,EX_TLB_DEAR(r12)
>   	ld	r15,EX_TLB_ESR(r12)
> 
