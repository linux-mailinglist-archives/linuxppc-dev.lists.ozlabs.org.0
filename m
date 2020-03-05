Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 622C617AEE6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 20:24:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YLK061d3zDqlm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 06:24:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=ASgy7a0Z; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YLH85SC9zDqkJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 06:22:28 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48YLH26gCqz9txHb;
 Thu,  5 Mar 2020 20:22:22 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ASgy7a0Z; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id fd6PBkBp02eH; Thu,  5 Mar 2020 20:22:22 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48YLH25D6Gz9txHc;
 Thu,  5 Mar 2020 20:22:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1583436142; bh=O7DpUFv/GFeL+4wPoRSCt6mdhdbvppZhJ64ANxysAUo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ASgy7a0ZqLkxRdb3DceHvO+mLgQKU1tMbZ07u7XCKHkkS4nXidpiHFN9k8MuwbRIE
 l/Q/M1sYuJlStSTJbl2Nn7+/4284wKMuasRg4hYceHY0SBe8UMVTKAog1cGcaEvmgp
 L9LIH9gWcqY2nIhw5m4y14tMiG9EQbEsN+cNbFlQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AA4F38B880;
 Thu,  5 Mar 2020 20:22:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0fQKJ7guOVrA; Thu,  5 Mar 2020 20:22:22 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DF5948B87E;
 Thu,  5 Mar 2020 20:22:21 +0100 (CET)
Subject: Re: [PATCH -next v2] powerpc/64s/pgtable: fix an undefined behaviour
To: Qian Cai <cai@lca.pw>, mpe@ellerman.id.au, akpm@linux-foundation.org
References: <1583418759-16105-1-git-send-email-cai@lca.pw>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a082f4c3-db68-6ca3-c832-b1abb5363e3a@c-s.fr>
Date: Thu, 5 Mar 2020 20:22:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1583418759-16105-1-git-send-email-cai@lca.pw>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, rashmicy@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/03/2020 à 15:32, Qian Cai a écrit :
> Booting a power9 server with hash MMU could trigger an undefined
> behaviour because pud_offset(p4d, 0) will do,
> 
> 0 >> (PAGE_SHIFT:16 + PTE_INDEX_SIZE:8 + H_PMD_INDEX_SIZE:10)
> 
> Fix it by converting pud_offset() and friends to static inline
> functions.

I was suggesting to convert pud_index() to static inline, because that's 
where the shift sits. Is it not possible ?

Here you seems to fix the problem for now, but if someone reuses 
pud_index() in another macro one day, the same problem may happen again.

Christophe

> 
>   UBSAN: shift-out-of-bounds in arch/powerpc/mm/ptdump/ptdump.c:282:15
>   shift exponent 34 is too large for 32-bit type 'int'
>   CPU: 6 PID: 1 Comm: swapper/0 Not tainted 5.6.0-rc4-next-20200303+ #13
>   Call Trace:
>   dump_stack+0xf4/0x164 (unreliable)
>   ubsan_epilogue+0x18/0x78
>   __ubsan_handle_shift_out_of_bounds+0x160/0x21c
>   walk_pagetables+0x2cc/0x700
>   walk_pud at arch/powerpc/mm/ptdump/ptdump.c:282
>   (inlined by) walk_pagetables at arch/powerpc/mm/ptdump/ptdump.c:311
>   ptdump_check_wx+0x8c/0xf0
>   mark_rodata_ro+0x48/0x80
>   kernel_init+0x74/0x194
>   ret_from_kernel_thread+0x5c/0x74
> 
> Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Qian Cai <cai@lca.pw>
> ---
>   arch/powerpc/include/asm/book3s/64/pgtable.h | 20 ++++++++++++++------
>   1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index fa60e8594b9f..4967bc9e25e2 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -1016,12 +1016,20 @@ static inline bool p4d_access_permitted(p4d_t p4d, bool write)
>   
>   #define pgd_offset(mm, address)	 ((mm)->pgd + pgd_index(address))
>   
> -#define pud_offset(p4dp, addr)	\
> -	(((pud_t *) p4d_page_vaddr(*(p4dp))) + pud_index(addr))
> -#define pmd_offset(pudp,addr) \
> -	(((pmd_t *) pud_page_vaddr(*(pudp))) + pmd_index(addr))
> -#define pte_offset_kernel(dir,addr) \
> -	(((pte_t *) pmd_page_vaddr(*(dir))) + pte_index(addr))
> +static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
> +{
> +	return (pud_t *)p4d_page_vaddr(*p4d) + pud_index(address);
> +}
> +
> +static inline pmd_t *pmd_offset(pud_t *pud, unsigned long address)
> +{
> +	return (pmd_t *)pud_page_vaddr(*pud) + pmd_index(address);
> +}
> +
> +static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address)
> +{
> +	return (pte_t *)pmd_page_vaddr(*pmd) + pte_index(address);
> +}
>   
>   #define pte_offset_map(dir,addr)	pte_offset_kernel((dir), (addr))
>   
> 
