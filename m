Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA9417B727
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 08:02:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Ydpd3stfzDq9d
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 18:02:17 +1100 (AEDT)
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
 header.s=mail header.b=Jz35VSqC; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Ydh06sqPzDqjy
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 17:56:31 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48Ydgt3B8Hz9txgh;
 Fri,  6 Mar 2020 07:56:26 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Jz35VSqC; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id FyjWRpBQZ4C9; Fri,  6 Mar 2020 07:56:26 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48Ydgt206Pz9txgZ;
 Fri,  6 Mar 2020 07:56:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1583477786; bh=H55nzcmxh7V1cddi0UhKfI61T6Z6P/Eblvkn6q2IeGA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Jz35VSqCtC5bJghsDpbJwtCkfUQxPVtusOPGOj8Lircxn2BSUDyzTN2ynWXXi/dq+
 K4vmRkwxSO1GvH+X+RGt1vKT2wjeLdwH5NPMNo0KhpjGlI+dG/rwU2gED8Tw3s/Bx5
 tIxB6RG/JdszizpCWwPDG0g0k8YHaxhD/w/N4RbQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2025C8B77E;
 Fri,  6 Mar 2020 07:56:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Dg2xiB3HEfHY; Fri,  6 Mar 2020 07:56:27 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E552E8B752;
 Fri,  6 Mar 2020 07:56:26 +0100 (CET)
Subject: Re: [PATCH v3] powerpc/64s/pgtable: fix an undefined behaviour
To: Qian Cai <cai@lca.pw>, mpe@ellerman.id.au
References: <20200306044852.3236-1-cai@lca.pw>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <952c3921-5aa8-bff5-9a87-baf5f901c535@c-s.fr>
Date: Fri, 6 Mar 2020 07:56:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306044852.3236-1-cai@lca.pw>
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
Cc: linuxppc-dev@lists.ozlabs.org, rashmicy@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/03/2020 à 05:48, Qian Cai a écrit :
> Booting a power9 server with hash MMU could trigger an undefined
> behaviour because pud_offset(p4d, 0) will do,
> 
> 0 >> (PAGE_SHIFT:16 + PTE_INDEX_SIZE:8 + H_PMD_INDEX_SIZE:10)
> 
> Fix it by converting pud_index() and friends to static inline
> functions.
> 
> UBSAN: shift-out-of-bounds in arch/powerpc/mm/ptdump/ptdump.c:282:15
> shift exponent 34 is too large for 32-bit type 'int'
> CPU: 6 PID: 1 Comm: swapper/0 Not tainted 5.6.0-rc4-next-20200303+ #13
> Call Trace:
> dump_stack+0xf4/0x164 (unreliable)
> ubsan_epilogue+0x18/0x78
> __ubsan_handle_shift_out_of_bounds+0x160/0x21c
> walk_pagetables+0x2cc/0x700
> walk_pud at arch/powerpc/mm/ptdump/ptdump.c:282
> (inlined by) walk_pagetables at arch/powerpc/mm/ptdump/ptdump.c:311
> ptdump_check_wx+0x8c/0xf0
> mark_rodata_ro+0x48/0x80
> kernel_init+0x74/0x194
> ret_from_kernel_thread+0x5c/0x74
> 
> Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Qian Cai <cai@lca.pw>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
> 
> v3: convert pud_index() etc to static inline functions.
> v2: convert pud_offset() etc to static inline functions.
> 
>   arch/powerpc/include/asm/book3s/64/pgtable.h | 23 ++++++++++++++++----
>   1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index 201a69e6a355..bd432c6706b9 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -998,10 +998,25 @@ extern struct page *pgd_page(pgd_t pgd);
>   #define pud_page_vaddr(pud)	__va(pud_val(pud) & ~PUD_MASKED_BITS)
>   #define pgd_page_vaddr(pgd)	__va(pgd_val(pgd) & ~PGD_MASKED_BITS)
>   
> -#define pgd_index(address) (((address) >> (PGDIR_SHIFT)) & (PTRS_PER_PGD - 1))
> -#define pud_index(address) (((address) >> (PUD_SHIFT)) & (PTRS_PER_PUD - 1))
> -#define pmd_index(address) (((address) >> (PMD_SHIFT)) & (PTRS_PER_PMD - 1))
> -#define pte_index(address) (((address) >> (PAGE_SHIFT)) & (PTRS_PER_PTE - 1))
> +static inline unsigned long pgd_index(unsigned long address)
> +{
> +	return (address >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1);
> +}
> +
> +static inline unsigned long pud_index(unsigned long address)
> +{
> +	return (address >> PUD_SHIFT) & (PTRS_PER_PUD - 1);
> +}
> +
> +static inline unsigned long pmd_index(unsigned long address)
> +{
> +	return (address >> PMD_SHIFT) & (PTRS_PER_PMD - 1);
> +}
> +
> +static inline unsigned long pte_index(unsigned long address)
> +{
> +	return (address >> PAGE_SHIFT) & (PTRS_PER_PTE - 1);
> +}
>   
>   /*
>    * Find an entry in a page-table-directory.  We combine the address region
> 
