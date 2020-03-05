Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D12179FB3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 06:59:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Y0S95mBZzDqq7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 16:59:05 +1100 (AEDT)
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
 header.s=mail header.b=pHHIxu+p; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Y0PM4tKSzDqjM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 16:56:39 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48Y0PH23ZTz9v0xf;
 Thu,  5 Mar 2020 06:56:35 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=pHHIxu+p; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id s9KFcENT85ew; Thu,  5 Mar 2020 06:56:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48Y0PH10gQz9v0xd;
 Thu,  5 Mar 2020 06:56:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1583387795; bh=Z0UD98IxbqBaiuaVklCQ1qAh/kKOqkXFHSdToBuM/38=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pHHIxu+p6SvLOjMUKls9TTSin3xoS1sPtQCZuJ4L/CLI/D1CXLNwziilL4+lUVp+4
 +kwyRvveqFA+gSbY93TJ+tnn2zFr/2LrtMLwCrg6M04AHIz541APRxu1qEVWaPpmyu
 7GeQOh1JY6nhCgcYuG3fHXhRcTCdKNAZoaAJvtN8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 382908B790;
 Thu,  5 Mar 2020 06:56:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HWPfKwU2Yntd; Thu,  5 Mar 2020 06:56:35 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7A8E18B756;
 Thu,  5 Mar 2020 06:56:33 +0100 (CET)
Subject: Re: [PATCH -next] powerpc/mm/ptdump: fix an undefined behaviour
To: Qian Cai <cai@lca.pw>, mpe@ellerman.id.au, akpm@linux-foundation.org
References: <20200305044759.1279-1-cai@lca.pw>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <3b724167-6bd2-f281-c6ee-fcb39cb9e24b@c-s.fr>
Date: Thu, 5 Mar 2020 06:56:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305044759.1279-1-cai@lca.pw>
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



Le 05/03/2020 à 05:47, Qian Cai a écrit :
> Booting a power9 server with hash MMU could trigger an undefined
> behaviour because pud_offset(p4d, 0) will do,
> 
> 0 >> (PAGE_SHIFT:16 + PTE_INDEX_SIZE:8 + H_PMD_INDEX_SIZE:10)
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
> Fixes: 8eb07b187000 ("powerpc/mm: Dump linux pagetables")
> Signed-off-by: Qian Cai <cai@lca.pw>
> ---
> 
> Notes for maintainers:
> 
> This is on the top of the linux-next commit "powerpc: add support for
> folded p4d page tables" which is in the Andrew's tree.
> 
>   arch/powerpc/mm/ptdump/ptdump.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
> index 9d6256b61df3..b530f81398a7 100644
> --- a/arch/powerpc/mm/ptdump/ptdump.c
> +++ b/arch/powerpc/mm/ptdump/ptdump.c
> @@ -279,7 +279,7 @@ static void walk_pmd(struct pg_state *st, pud_t *pud, unsigned long start)
>   
>   static void walk_pud(struct pg_state *st, p4d_t *p4d, unsigned long start)
>   {
> -	pud_t *pud = pud_offset(p4d, 0);
> +	pud_t *pud = pud_offset(p4d, 0UL);

Is that the only place we have to do this ?

(In 5.6-rc) I see the same in:
/arch/powerpc/mm/ptdump/hashpagetable.c
/arch/powerpc/kvm/book3s_64_mmu_radix.c

Wouldn't it be better to:
- Either cast addr to unsigned long in pud_index() macro
- Or change pud_index() macro to a static inline function as x86 ?

Christophe
