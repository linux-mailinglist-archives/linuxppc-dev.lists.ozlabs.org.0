Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CD63DFB23
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 07:35:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfgSY6bQYz3cW7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 15:35:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfgSD1rgSz2yXM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 15:35:22 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GfgS75PdGz9sWD;
 Wed,  4 Aug 2021 07:35:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HeBoqYtd2p4x; Wed,  4 Aug 2021 07:35:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GfgS74KYSz9sVr;
 Wed,  4 Aug 2021 07:35:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 794E88B79A;
 Wed,  4 Aug 2021 07:35:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id he4hr54i3zxE; Wed,  4 Aug 2021 07:35:19 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2759D8B764;
 Wed,  4 Aug 2021 07:35:19 +0200 (CEST)
Subject: Re: [PATCH] powerpc: Always inline radix_enabled() to fix build
 failure
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210804013724.514468-1-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <b359dca4-5d16-37ad-a849-a65956690a40@csgroup.eu>
Date: Wed, 4 Aug 2021 07:35:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210804013724.514468-1-jniethe5@gmail.com>
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
Cc: erhard_f@mailbox.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/08/2021 à 03:37, Jordan Niethe a écrit :
> This is the same as commit acdad8fb4a15 ("powerpc: Force inlining of
> mmu_has_feature to fix build failure") but for radix_enabled().  The
> config in the linked bugzilla causes the following build failure:
> 
> LD      .tmp_vmlinux.kallsyms1
> powerpc64-linux-ld: arch/powerpc/mm/pgtable.o: in function `.__ptep_set_access_flags':
> pgtable.c:(.text+0x17c): undefined reference to `.radix__ptep_set_access_flags'
> 
> This is due to radix_enabled() not being inlined. See extract from building with -Winline:
> 
> In file included from arch/powerpc/include/asm/lppaca.h:46,
>                   from arch/powerpc/include/asm/paca.h:17,
>                   from arch/powerpc/include/asm/current.h:13,
>                   from include/linux/thread_info.h:23,
>                   from include/asm-generic/preempt.h:5,
>                   from ./arch/powerpc/include/generated/asm/preempt.h:1,
>                   from include/linux/preempt.h:78,
>                   from include/linux/spinlock.h:51,
>                   from include/linux/mmzone.h:8,
>                   from include/linux/gfp.h:6,
>                   from arch/powerpc/mm/pgtable.c:21:
> arch/powerpc/include/asm/book3s/64/pgtable.h: In function '__ptep_set_access_flags':
> arch/powerpc/include/asm/mmu.h:327:20: error: inlining failed in call to 'radix_enabled': call is unlikely and code size would grow [-Werror=inline]
> 
> The code relies on constant folding of MMU_FTRS_POSSIBLE at buildtime
> and elimination of non possible parts of code at compile time. For this
> to work radix_enabled() must be inlined so make it __always_inline.

Thanks for looking at that. I also got a few notifications of that problem by kernel test robot but 
I didn't look at it yet.

https://lkml.org/lkml/2021/7/31/257
https://lkml.org/lkml/2021/7/25/271

> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=213803
> Reported-by: Erhard F. <erhard_f@mailbox.org>
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>   arch/powerpc/include/asm/mmu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
> index 27016b98ecb2..8abe8e42e045 100644
> --- a/arch/powerpc/include/asm/mmu.h
> +++ b/arch/powerpc/include/asm/mmu.h
> @@ -324,7 +324,7 @@ static inline void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
>   }
>   #endif /* !CONFIG_DEBUG_VM */
>   
> -static inline bool radix_enabled(void)
> +static __always_inline bool radix_enabled(void)
>   {
>   	return mmu_has_feature(MMU_FTR_TYPE_RADIX);
>   }
> 
