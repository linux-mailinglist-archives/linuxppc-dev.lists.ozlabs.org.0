Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D7D16F87B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 08:22:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S6gq3dqszDqSr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 18:22:15 +1100 (AEDT)
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
 header.s=mail header.b=C//uJEes; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S6ch3Y7vzDqNJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 18:19:32 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48S6cY144Jz9txkj;
 Wed, 26 Feb 2020 08:19:25 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=C//uJEes; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hE4zh4ppXCnA; Wed, 26 Feb 2020 08:19:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48S6cX6gMMz9txkh;
 Wed, 26 Feb 2020 08:19:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582701564; bh=TWcuATkJZ00ABnX/nWFwyVvB74ey5GHCEqWBA7CWIfQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=C//uJEesIFl3kP4gVOBgARMRL7k7AMSJwKJHqNbJCiXlEWjAvPIoXs42tLwObi23Q
 3knXXUyu7RmaoVZ8TSBQuFRPXDgTMOAMqzM+qXu0i6qpAuED4gKx/1Fd4pqtoAyWdh
 nHxMKLYPUEcc06pmeRLN4Cd82sBJU6rpN08thzRA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CCF4D8B835;
 Wed, 26 Feb 2020 08:19:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id jMZVJHRWNoTy; Wed, 26 Feb 2020 08:19:25 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E6E668B776;
 Wed, 26 Feb 2020 08:19:24 +0100 (CET)
Subject: Re: [PATCH v4 8/8] powerpc/mm: Disable set_memory() routines when
 strict RWX isn't enabled
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
References: <20200226062403.63790-1-ruscur@russell.cc>
 <20200226062403.63790-9-ruscur@russell.cc>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <2a9988ec-c115-8fe8-4c68-82eb2fa43d6b@c-s.fr>
Date: Wed, 26 Feb 2020 08:19:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226062403.63790-9-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 joel@jms.id.au, Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/02/2020 à 07:24, Russell Currey a écrit :
> There are a couple of reasons that the set_memory() functions are
> problematic when STRICT_KERNEL_RWX isn't enabled:
> 
>   - The linear mapping is a different size and apply_to_page_range()
> 	may modify a giant section, breaking everything

I don't understand.

>   - patch_instruction() doesn't know to work around a page being marked
>   	RO, and will subsequently crash

Is patch_instruction() involved at all ?

> 
> The latter can be replicated by building a kernel with the set_memory()
> patches but with STRICT_KERNEL_RWX off and running ftracetest.
> 
> Reported-by: Jordan Niethe <jniethe5@gmail.com>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> ---
> v4: new
> 
>   arch/powerpc/mm/pageattr.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> index ee6b5e3b7604..ff111930cf5e 100644
> --- a/arch/powerpc/mm/pageattr.c
> +++ b/arch/powerpc/mm/pageattr.c
> @@ -96,12 +96,17 @@ static int set_page_attr(pte_t *ptep, unsigned long addr, void *data)
>   
>   int set_memory_attr(unsigned long addr, int numpages, pgprot_t prot)

Isn't it change_memory_attr() that is a problem for you ?

>   {
> -	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
> -	unsigned long sz = numpages * PAGE_SIZE;
> +	unsigned long start, size;
> +
> +	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> +		return 0;


Doing this you break patch 7:
mark_initmem_nx() is called regardless of CONFIG_STRICT_KERNEL_RWX
__kernel_map_pages() depends on CONFIG_DEBUG_PAGEALLOC which doesn't 
depend on CONFIG_STRICT_KERNEL_RWX


>   
>   	if (!numpages)
>   		return 0;
>   
> -	return apply_to_page_range(&init_mm, start, sz, set_page_attr,
> +	start = ALIGN_DOWN(addr, PAGE_SIZE);
> +	size = numpages * PAGE_SIZE;
> +
> +	return apply_to_page_range(&init_mm, start, size, set_page_attr,

You don't need to move start and size calculation and change the above.

>   				   (void *)pgprot_val(prot));
>   }
> 

Christophe
