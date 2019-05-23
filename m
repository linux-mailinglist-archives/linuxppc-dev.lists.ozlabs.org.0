Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C7B27601
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 08:32:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458fnJ1pNrzDqWJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 16:32:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="aOw7NxVc"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458flz68DPzDqTZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 16:31:27 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 458flt2tznz9txk2;
 Thu, 23 May 2019 08:31:22 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=aOw7NxVc; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id yb1S7UvGIIko; Thu, 23 May 2019 08:31:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 458flt1HD7z9v22s;
 Thu, 23 May 2019 08:31:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558593082; bh=iBoSTQJduiJdnBswQSZH7SOr2FcQubFRQAMzBT72zbE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=aOw7NxVcoF4Qezmkd4YGMcpuIYwYKEIkep4paM7eZyD4v7CTA7scVmJ6/nkNd9LNU
 yHjmXjKB6C9XTTAepjO65y2k1YhblaB8ttxc9X9qTGSmSCPkZNBfMjheS/MrugkaBj
 wlW+HBcspcSSjwjbsBALG0a1fMNR4yrJMYYPRAHE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1D8838B77D;
 Thu, 23 May 2019 08:31:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id x9aLulBf7QaB; Thu, 23 May 2019 08:31:23 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B5C9B8B75A;
 Thu, 23 May 2019 08:31:22 +0200 (CEST)
Subject: Re: [RFC PATCH 6/7] kasan: allow arches to hook into global
 registration
To: Daniel Axtens <dja@axtens.net>, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
References: <20190523052120.18459-1-dja@axtens.net>
 <20190523052120.18459-7-dja@axtens.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <b7f23406-c1dc-de50-d477-86cdf8f0d471@c-s.fr>
Date: Thu, 23 May 2019 08:31:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523052120.18459-7-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/05/2019 à 07:21, Daniel Axtens a écrit :
> Not all arches have a specific space carved out for modules -
> some, such as powerpc, just use regular vmalloc space. Therefore,
> globals in these modules cannot be backed by real shadow memory.

Can you explain in more details the reason why ?

PPC32 also uses regular vmalloc space, and it has been possible to 
manage globals on it, by simply implementing a module_alloc() function.

See 
https://elixir.bootlin.com/linux/v5.2-rc1/source/arch/powerpc/mm/kasan/kasan_init_32.c#L135

It is also possible to easily define a different area for modules, by 
replacing the call to vmalloc_exec() by a call to __vmalloc_node_range() 
as done by vmalloc_exec(), but with different bounds than 
VMALLOC_START/VMALLOC_END

See https://elixir.bootlin.com/linux/v5.2-rc1/source/mm/vmalloc.c#L2633

Today in PPC64 (unlike PPC32), there is already a split between VMALLOC 
space and IOREMAP space. I'm sure it would be easy to split it once more 
for modules.

Christophe

> 
> In order to allow arches to perform this check, add a hook.
> 
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> ---
>   include/linux/kasan.h | 5 +++++
>   mm/kasan/generic.c    | 3 +++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index dfee2b42d799..4752749e4797 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -18,6 +18,11 @@ struct task_struct;
>   static inline bool kasan_arch_is_ready(void)	{ return true; }
>   #endif
>   
> +#ifndef kasan_arch_can_register_global
> +static inline bool kasan_arch_can_register_global(const void * addr)	{ return true; }
> +#endif
> +
> +
>   #ifndef ARCH_HAS_KASAN_EARLY_SHADOW
>   extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
>   extern pte_t kasan_early_shadow_pte[PTRS_PER_PTE];
> diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
> index 0336f31bbae3..935b06f659a0 100644
> --- a/mm/kasan/generic.c
> +++ b/mm/kasan/generic.c
> @@ -208,6 +208,9 @@ static void register_global(struct kasan_global *global)
>   {
>   	size_t aligned_size = round_up(global->size, KASAN_SHADOW_SCALE_SIZE);
>   
> +	if (!kasan_arch_can_register_global(global->beg))
> +		return;
> +
>   	kasan_unpoison_shadow(global->beg, global->size);
>   
>   	kasan_poison_shadow(global->beg + aligned_size,
> 
