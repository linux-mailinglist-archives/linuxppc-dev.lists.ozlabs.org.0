Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F52678A0A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 13:03:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xxcN2DqhzDqLD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 21:03:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="leQUpB9X"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xxY333ftzDqJq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 21:00:07 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45xxXs1Mfbz9v9MV;
 Mon, 29 Jul 2019 12:59:57 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=leQUpB9X; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id pqQ-asZwJxQ2; Mon, 29 Jul 2019 12:59:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45xxXs04sfz9v9MP;
 Mon, 29 Jul 2019 12:59:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1564397997; bh=Q6zyw4EZJ5gEddzqQzUfic9Tvl1l+HpodOi7ui8iTfk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=leQUpB9Xqg7PNZa+MMm508ZZMjjdEQ6GYlCSGxwOOFuR2y9NMrKz2TKUAy8cfIEfk
 ypofah6XTB1nRdPum1An5DrULnmuHjws9Rf6JkUJuvYLTh04QOwqiznc8+E2zLJKYR
 8D4lvMcw5Dm3rVjq6ATjqK+f0LVsO6abMnMOJKvI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D4D758B7CB;
 Mon, 29 Jul 2019 13:00:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wz0I_dwkhhke; Mon, 29 Jul 2019 13:00:01 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9DD3E8B7B3;
 Mon, 29 Jul 2019 13:00:01 +0200 (CEST)
Subject: Re: [RFC PATCH 02/10] powerpc: move memstart_addr and kernstart_addr
 to init-common.c
To: Jason Yan <yanaijie@huawei.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, diana.craciun@nxp.com,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 keescook@chromium.org, kernel-hardening@lists.openwall.com
References: <20190717080621.40424-1-yanaijie@huawei.com>
 <20190717080621.40424-3-yanaijie@huawei.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <28797c00-8ab7-207b-554a-e8dc3a457c6a@c-s.fr>
Date: Mon, 29 Jul 2019 13:00:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717080621.40424-3-yanaijie@huawei.com>
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
Cc: wangkefeng.wang@huawei.com, linux-kernel@vger.kernel.org,
 jingxiangfeng@huawei.com, thunder.leizhen@huawei.com, fanchengyang@huawei.com,
 yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/07/2019 à 10:06, Jason Yan a écrit :
> These two variables are both defined in init_32.c and init_64.c. Move
> them to init-common.c.
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> Cc: Diana Craciun <diana.craciun@nxp.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Kees Cook <keescook@chromium.org>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>


> ---
>   arch/powerpc/mm/init-common.c | 5 +++++
>   arch/powerpc/mm/init_32.c     | 5 -----
>   arch/powerpc/mm/init_64.c     | 5 -----
>   3 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
> index a84da92920f7..9273c38009cb 100644
> --- a/arch/powerpc/mm/init-common.c
> +++ b/arch/powerpc/mm/init-common.c
> @@ -21,6 +21,11 @@
>   #include <asm/pgtable.h>
>   #include <asm/kup.h>
>   
> +phys_addr_t memstart_addr = (phys_addr_t)~0ull;
> +EXPORT_SYMBOL(memstart_addr);
> +phys_addr_t kernstart_addr;
> +EXPORT_SYMBOL(kernstart_addr);
> +
>   static bool disable_kuep = !IS_ENABLED(CONFIG_PPC_KUEP);
>   static bool disable_kuap = !IS_ENABLED(CONFIG_PPC_KUAP);
>   
> diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
> index b04896a88d79..872df48ae41b 100644
> --- a/arch/powerpc/mm/init_32.c
> +++ b/arch/powerpc/mm/init_32.c
> @@ -56,11 +56,6 @@
>   phys_addr_t total_memory;
>   phys_addr_t total_lowmem;
>   
> -phys_addr_t memstart_addr = (phys_addr_t)~0ull;
> -EXPORT_SYMBOL(memstart_addr);
> -phys_addr_t kernstart_addr;
> -EXPORT_SYMBOL(kernstart_addr);
> -
>   #ifdef CONFIG_RELOCATABLE
>   /* Used in __va()/__pa() */
>   long long virt_phys_offset;
> diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
> index a44f6281ca3a..c836f1269ee7 100644
> --- a/arch/powerpc/mm/init_64.c
> +++ b/arch/powerpc/mm/init_64.c
> @@ -63,11 +63,6 @@
>   
>   #include <mm/mmu_decl.h>
>   
> -phys_addr_t memstart_addr = ~0;
> -EXPORT_SYMBOL_GPL(memstart_addr);
> -phys_addr_t kernstart_addr;
> -EXPORT_SYMBOL_GPL(kernstart_addr);
> -
>   #ifdef CONFIG_SPARSEMEM_VMEMMAP
>   /*
>    * Given an address within the vmemmap, determine the pfn of the page that
> 
