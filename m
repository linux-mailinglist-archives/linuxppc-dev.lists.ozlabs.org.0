Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 985593824C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 08:49:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk8rf4VmQz2ysq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 16:49:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk8qv65lSz2yyL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 16:49:12 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fk8qn3952z9sYn;
 Mon, 17 May 2021 08:49:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P-FxGwx3UZoK; Mon, 17 May 2021 08:49:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fk8qn26qYz9sYN;
 Mon, 17 May 2021 08:49:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 138C88B781;
 Mon, 17 May 2021 08:49:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id POi295Uflh4H; Mon, 17 May 2021 08:49:09 +0200 (CEST)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C8C2B8B780;
 Mon, 17 May 2021 08:49:08 +0200 (CEST)
Subject: Re: [PATCH v14 7/9] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210517032810.129949-1-jniethe5@gmail.com>
 <20210517032810.129949-8-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <5c592104-2018-a36d-61a3-e2039b1563eb@csgroup.eu>
Date: Mon, 17 May 2021 08:48:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210517032810.129949-8-jniethe5@gmail.com>
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, cmr@codefail.de,
 aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/05/2021 à 05:28, Jordan Niethe a écrit :
> From: Russell Currey <ruscur@russell.cc>
> 
> To enable strict module RWX on powerpc, set:
> 
>      CONFIG_STRICT_MODULE_RWX=y
> 
> You should also have CONFIG_STRICT_KERNEL_RWX=y set to have any real
> security benefit.
> 
> ARCH_HAS_STRICT_MODULE_RWX is set to require ARCH_HAS_STRICT_KERNEL_RWX.
> This is due to a quirk in arch/Kconfig and arch/powerpc/Kconfig that
> makes STRICT_MODULE_RWX *on by default* in configurations where
> STRICT_KERNEL_RWX is *unavailable*.
> 
> Since this doesn't make much sense, and module RWX without kernel RWX
> doesn't make much sense, having the same dependencies as kernel RWX
> works around this problem.
> 
> Book32s/32 processors with a hash mmu (i.e. 604 core) can not set memory
   ^^^^^^

Book32s ==> Book3s

> protection on a page by page basis so do not enable.

It is not exactly that. The problem on 604 is for _exec_ protection.

Note that on book3s/32, on both 603 and 604 core, it is not possible to write protect kernel pages. 
So maybe it would make sense to disable ARCH_HAS_STRICT_MODULE_RWX on CONFIG_PPC_BOOK3S_32 
completely, I'm not sure.


> 
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> [jpn: - predicate on !PPC_BOOK3S_604
>        - make module_alloc() use PAGE_KERNEL protection]
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
> v10: - Predicate on !PPC_BOOK3S_604
>       - Make module_alloc() use PAGE_KERNEL protection
> v11: - Neaten up
> v13: Use strict_kernel_rwx_enabled()
> v14: Make changes to module_alloc() its own commit
> ---
>   arch/powerpc/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index cce0a137b046..cb5d9d862c35 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -140,6 +140,7 @@ config PPC
>   	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
>   	select ARCH_HAS_SET_MEMORY
>   	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !HIBERNATION)
> +	select ARCH_HAS_STRICT_MODULE_RWX	if ARCH_HAS_STRICT_KERNEL_RWX && !PPC_BOOK3S_604
>   	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
>   	select ARCH_HAS_UACCESS_FLUSHCACHE
>   	select ARCH_HAS_COPY_MC			if PPC64
> 
