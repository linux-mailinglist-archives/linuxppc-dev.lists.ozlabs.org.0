Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E36741FE97
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 06:48:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454Jp60QVXzDqd1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 14:48:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="n+YVsJwF"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454Jmt04sRzDqXW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 14:47:08 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 454Jmj3gS9z9vBnJ;
 Thu, 16 May 2019 06:47:01 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=n+YVsJwF; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YwJhsuGVOdRK; Thu, 16 May 2019 06:47:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 454Jmj2Qy7z9vBnH;
 Thu, 16 May 2019 06:47:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557982021; bh=qDZRFp8I367+tTugkVOB68KlPMzfOq8sVaaTd5Xh6o8=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=n+YVsJwFV8c/CLl/0rdkrcTS+I6up0Snl/58n1hSMBnA0AmBgRINzYvW0DHMO+LUo
 xVCLYc8K7q1iMhmqDFiorZD6ECUdFc/r5I0SAUxCGzDiSmosl+B4nG8GwJlitbU5zh
 GDE6Zo+SfnGfDNuuXLn43GnmrhKD4iC+Qu/x77EI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1F7E98B7F8;
 Thu, 16 May 2019 06:47:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id N_O8DI_gBYQV; Thu, 16 May 2019 06:47:02 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 599308B74F;
 Thu, 16 May 2019 06:47:01 +0200 (CEST)
Subject: Re: [PATCH] powerpc/64s: Make boot look nice(r)
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190516020437.11783-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d65ae686-c117-ae1c-1d48-498fdd1ea0eb@c-s.fr>
Date: Thu, 16 May 2019 06:47:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190516020437.11783-1-npiggin@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/05/2019 à 04:04, Nicholas Piggin a écrit :
> Radix boot looks like this:
> 
>   -----------------------------------------------------
>   phys_mem_size     = 0x200000000
>   dcache_bsize      = 0x80
>   icache_bsize      = 0x80
>   cpu_features      = 0x0000c06f8f5fb1a7
>     possible        = 0x0000fbffcf5fb1a7
>     always          = 0x00000003800081a1
>   cpu_user_features = 0xdc0065c2 0xaee00000
>   mmu_features      = 0xbc006041
>   firmware_features = 0x0000000010000000
>   hash-mmu: ppc64_pft_size    = 0x0
>   hash-mmu: kernel vmalloc start   = 0xc008000000000000
>   hash-mmu: kernel IO start        = 0xc00a000000000000
>   hash-mmu: kernel vmemmap start   = 0xc00c000000000000
>   -----------------------------------------------------
> 
> Fix:
> 
>   -----------------------------------------------------
>   phys_mem_size     = 0x200000000
>   dcache_bsize      = 0x80
>   icache_bsize      = 0x80
>   cpu_features      = 0x0000c06f8f5fb1a7
>     possible        = 0x0000fbffcf5fb1a7
>     always          = 0x00000003800081a1
>   cpu_user_features = 0xdc0065c2 0xaee00000
>   mmu_features      = 0xbc006041
>   firmware_features = 0x0000000010000000
>   vmalloc start     = 0xc008000000000000
>   IO start          = 0xc00a000000000000
>   vmemmap start     = 0xc00c000000000000
>   -----------------------------------------------------
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

I fear your change defeats most of the purpose of commit 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20190515&id=e4dccf9092ab48a6f902003b9558c0e45d0e849a

As far as I understand, the main issue is the "hash-mmu:" prefix ?
That's due to the following define in top of book3s64/hash_utils.c:

#define pr_fmt(fmt) "hash-mmu: " fmt

Could we simply undef it just before print_system_hash_info() ?
Or move print_system_hash_info() in another book3s64 specific file which 
doesn't set pr_fmt ?

Christophe

> ---
>   arch/powerpc/kernel/setup-common.c    | 8 +++++++-
>   arch/powerpc/mm/book3s64/hash_utils.c | 3 ---
>   2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index aad9f5df6ab6..f2da8c809c85 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -810,9 +810,15 @@ static __init void print_system_info(void)
>   	pr_info("mmu_features      = 0x%08x\n", cur_cpu_spec->mmu_features);
>   #ifdef CONFIG_PPC64
>   	pr_info("firmware_features = 0x%016lx\n", powerpc_firmware_features);
> +#ifdef CONFIG_PPC_BOOK3S
> +	pr_info("vmalloc start     = 0x%lx\n", KERN_VIRT_START);
> +	pr_info("IO start          = 0x%lx\n", KERN_IO_START);
> +	pr_info("vmemmap start     = 0x%lx\n", (unsigned long)vmemmap);
> +#endif
>   #endif
>   
> -	print_system_hash_info();
> +	if (!early_radix_enabled())
> +		print_system_hash_info();
>   
>   	if (PHYSICAL_START > 0)
>   		pr_info("physical_start    = 0x%llx\n",
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 919a861a8ec0..8b307b796b83 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1954,7 +1954,4 @@ void __init print_system_hash_info(void)
>   
>   	if (htab_hash_mask)
>   		pr_info("htab_hash_mask    = 0x%lx\n", htab_hash_mask);
> -	pr_info("kernel vmalloc start   = 0x%lx\n", KERN_VIRT_START);
> -	pr_info("kernel IO start        = 0x%lx\n", KERN_IO_START);
> -	pr_info("kernel vmemmap start   = 0x%lx\n", (unsigned long)vmemmap);
>   }
> 
