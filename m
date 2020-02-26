Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2123D16F88E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 08:31:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S6sr689MzDqXs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 18:30:56 +1100 (AEDT)
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
 header.s=mail header.b=cs0L8wZs; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S6r34VNdzDqJB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 18:29:23 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48S6qz2wrNz9txkm;
 Wed, 26 Feb 2020 08:29:19 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=cs0L8wZs; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id j9_mpiIHAS2l; Wed, 26 Feb 2020 08:29:19 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48S6qz1kTfz9txkl;
 Wed, 26 Feb 2020 08:29:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582702159; bh=a8SYvzvnlOIBi57mqwe6Lh2gVEDqxoLQIno02IN+QIQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cs0L8wZsiYQVCfe7j0+wjVQwXQAry4k+c6dHNTKJL+uvvVDyNX0TilLfnWlFglYz+
 lUh13DUEJ68FXEhx65kq3/rUOiK031uQY+4z1FsZ262j6yP8wLJoHoqMkv08Llka8g
 ZDndOONLrHGyTKh4LqV+DeiQ3BHdzBoOzkIxxxHw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2B3DD8B835;
 Wed, 26 Feb 2020 08:29:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ef64PH4e5mef; Wed, 26 Feb 2020 08:29:20 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8EEC18B776;
 Wed, 26 Feb 2020 08:29:19 +0100 (CET)
Subject: Re: [PATCH v5 8/8] powerpc/mm: Disable set_memory() routines when
 strict RWX isn't enabled
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
References: <20200226063551.65363-1-ruscur@russell.cc>
 <20200226063551.65363-9-ruscur@russell.cc>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <0c858bb2-9be8-ff77-d5ec-7f74700cdb85@c-s.fr>
Date: Wed, 26 Feb 2020 08:29:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226063551.65363-9-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, jniethe5@gmail.com,
 npiggin@gmail.com, joel@jms.id.au, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/02/2020 à 07:35, Russell Currey a écrit :
> There are a couple of reasons that the set_memory() functions are
> problematic when STRICT_KERNEL_RWX isn't enabled:
> 
>   - The linear mapping is a different size and apply_to_page_range()
> 	may modify a giant section, breaking everything
>   - patch_instruction() doesn't know to work around a page being marked
>   	RO, and will subsequently crash
> 
> The latter can be replicated by building a kernel with the set_memory()
> patches but with STRICT_KERNEL_RWX off and running ftracetest.

I agree with Andrew, those changes should go into patch 1.

> 
> Reported-by: Jordan Niethe <jniethe5@gmail.com>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> ---
> v5: Apply to both set_memory_attr() and change_memory_attr()

See my comments of v4, additional comments below

> v4: New
> 
>   arch/powerpc/mm/pageattr.c | 22 ++++++++++++++++------
>   1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> index ee6b5e3b7604..49b8e2e0581d 100644
> --- a/arch/powerpc/mm/pageattr.c
> +++ b/arch/powerpc/mm/pageattr.c
> @@ -64,13 +64,18 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
>   
>   int change_memory_attr(unsigned long addr, int numpages, long action)
>   {
> -	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
> -	unsigned long sz = numpages * PAGE_SIZE;
> +	unsigned long start, size;
> +
> +	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> +		return 0;
>   
>   	if (!numpages)
>   		return 0;
>   
> -	return apply_to_page_range(&init_mm, start, sz, change_page_attr, (void *)action);
> +	start = ALIGN_DOWN(addr, PAGE_SIZE);
> +	size = numpages * PAGE_SIZE;
> +
> +	return apply_to_page_range(&init_mm, start, size, change_page_attr, (void *)action);

You don't need to move start and sz initialisation, neither you need to 
change the name of sz to size.

If you want to rename sz to size, do it in the initial patch, but take 
care of the length of the lines. IIRC I used a short name to have the 
line fit on a single line with no more than 90 chars.

Christophe

>   }
>   
>   /*
> @@ -96,12 +101,17 @@ static int set_page_attr(pte_t *ptep, unsigned long addr, void *data)
>   
>   int set_memory_attr(unsigned long addr, int numpages, pgprot_t prot)
>   {
> -	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
> -	unsigned long sz = numpages * PAGE_SIZE;
> +	unsigned long start, size;
> +
> +	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> +		return 0;
>   
>   	if (!numpages)
>   		return 0;
>   
> -	return apply_to_page_range(&init_mm, start, sz, set_page_attr,
> +	start = ALIGN_DOWN(addr, PAGE_SIZE);
> +	size = numpages * PAGE_SIZE;
> +
> +	return apply_to_page_range(&init_mm, start, size, set_page_attr,
>   				   (void *)pgprot_val(prot));
>   }
> 
