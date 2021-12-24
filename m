Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DED5347EF24
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Dec 2021 14:24:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JL78R5jK9z305v
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 00:24:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JL7810kHFz2x9b
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 00:24:30 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4JL77s35fFz9sSb;
 Fri, 24 Dec 2021 14:24:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7jpGFkVta4MA; Fri, 24 Dec 2021 14:24:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4JL77s2MD1z9sSG;
 Fri, 24 Dec 2021 14:24:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 413F98B78C;
 Fri, 24 Dec 2021 14:24:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id f6_VEmgpR73p; Fri, 24 Dec 2021 14:24:25 +0100 (CET)
Received: from [192.168.234.3] (unknown [192.168.234.3])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E5E5D8B764;
 Fri, 24 Dec 2021 14:24:24 +0100 (CET)
Message-ID: <8926c850-a28b-0600-9116-1c794f80b532@csgroup.eu>
Date: Fri, 24 Dec 2021 14:24:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 4/5] powerpc/64: Add VIRTUAL_BUG_ON checks for __va and
 __pa addresses
Content-Language: fr-FR
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190724084638.24982-1-npiggin@gmail.com>
 <20190724084638.24982-4-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20190724084638.24982-4-npiggin@gmail.com>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nic,

Le 24/07/2019 à 10:46, Nicholas Piggin a écrit :
> Ensure __va is given a physical address below PAGE_OFFSET, and __pa is
> given a virtual address above PAGE_OFFSET.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/page.h | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
> index 0d52f57fca04..c8bb14ff4713 100644
> --- a/arch/powerpc/include/asm/page.h
> +++ b/arch/powerpc/include/asm/page.h
> @@ -215,9 +215,19 @@ static inline bool pfn_valid(unsigned long pfn)
>   /*
>    * gcc miscompiles (unsigned long)(&static_var) - PAGE_OFFSET
>    * with -mcmodel=medium, so we use & and | instead of - and + on 64-bit.
> + * This also results in better code generation.
>    */
> -#define __va(x) ((void *)(unsigned long)((phys_addr_t)(x) | PAGE_OFFSET))
> -#define __pa(x) ((unsigned long)(x) & 0x0fffffffffffffffUL)
> +#define __va(x)								\
> +({									\
> +	VIRTUAL_BUG_ON((unsigned long)(x) >= PAGE_OFFSET);		\
> +	(void *)(unsigned long)((phys_addr_t)(x) | PAGE_OFFSET);	\
> +})
> +
> +#define __pa(x)								\
> +({									\
> +	VIRTUAL_BUG_ON((unsigned long)(x) < PAGE_OFFSET);		\

With this, it is likely that virt_addr_valid() BUGs on a non valid address.

I think the purpose of virt_addr_valid() is to check addresses 
seamlessly, see check_heap_object()


> +	(unsigned long)(x) & 0x0fffffffffffffffUL;			\
> +})
>   
>   #else /* 32-bit, non book E */
>   #define __va(x) ((void *)(unsigned long)((phys_addr_t)(x) + PAGE_OFFSET - MEMORY_START))
