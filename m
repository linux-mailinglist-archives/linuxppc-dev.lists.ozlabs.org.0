Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11775275ED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 08:15:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458fPH1jR8zDqTd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 16:15:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="tSEQjR2z"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458fMx1HwfzDqB0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 16:14:05 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 458fMr5QZvz9v1QZ;
 Thu, 23 May 2019 08:14:00 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tSEQjR2z; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id L1eBFB46FJlu; Thu, 23 May 2019 08:14:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 458fMr3sbxz9v1QY;
 Thu, 23 May 2019 08:14:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558592040; bh=bJM0wa5PIChnW6Ph46pdZkFkuJZ6GsPcNIEizvfBwFY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=tSEQjR2zHNEe/cmI7/n7STJtnZQ9mHub7jklMSmLDUNNtbpN6S35t/gyCxp7xi3iO
 NxRR+43ix8SoHW8k+5niUoz+5By5DXz55JQQEA4gzZo32L9oka88uR+vc2fbu5LIIA
 CnU6e/TwtOKSsEUNKiarcm/kCO9MtXVZjt9IpZz0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6D69C8B77D;
 Thu, 23 May 2019 08:14:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1sUZdWyEonZB; Thu, 23 May 2019 08:14:01 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0DE7F8B75A;
 Thu, 23 May 2019 08:14:01 +0200 (CEST)
Subject: Re: [RFC PATCH 3/7] kasan: allow architectures to provide an outline
 readiness check
To: Daniel Axtens <dja@axtens.net>, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
References: <20190523052120.18459-1-dja@axtens.net>
 <20190523052120.18459-4-dja@axtens.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <cad64ea3-9c7b-6fdd-318a-3d4aae1782fe@c-s.fr>
Date: Thu, 23 May 2019 08:14:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523052120.18459-4-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
 kasan-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/05/2019 à 07:21, Daniel Axtens a écrit :
> In powerpc (as I understand it), we spend a lot of time in boot
> running in real mode before MMU paging is initialised. During
> this time we call a lot of generic code, including printk(). If
> we try to access the shadow region during this time, things fail.
> 
> My attempts to move early init before the first printk have not
> been successful. (Both previous RFCs for ppc64 - by 2 different
> people - have needed this trick too!)

I have been able to do it successfully for BOOK3E/64, see 
https://patchwork.ozlabs.org/patch/1068260/ for the details.

Christophe

> 
> So, allow architectures to define a kasan_arch_is_ready()
> hook that bails out of check_memory_region_inline() unless the
> arch has done all of the init.
> 
> Link: https://lore.kernel.org/patchwork/patch/592820/ # ppc64 hash series
> Link: https://patchwork.ozlabs.org/patch/795211/      # ppc radix series
> Originally-by: Balbir Singh <bsingharora@gmail.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> [check_return_arch_not_ready() ==> static inline kasan_arch_is_ready()]
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>   include/linux/kasan.h | 4 ++++
>   mm/kasan/generic.c    | 3 +++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index f6261840f94c..a630d53f1a36 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -14,6 +14,10 @@ struct task_struct;
>   #include <asm/kasan.h>
>   #include <asm/pgtable.h>
>   
> +#ifndef kasan_arch_is_ready
> +static inline bool kasan_arch_is_ready(void)	{ return true; }
> +#endif
> +
>   extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
>   extern pte_t kasan_early_shadow_pte[PTRS_PER_PTE];
>   extern pmd_t kasan_early_shadow_pmd[PTRS_PER_PMD];
> diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
> index a5b28e3ceacb..0336f31bbae3 100644
> --- a/mm/kasan/generic.c
> +++ b/mm/kasan/generic.c
> @@ -170,6 +170,9 @@ static __always_inline void check_memory_region_inline(unsigned long addr,
>   						size_t size, bool write,
>   						unsigned long ret_ip)
>   {
> +	if (!kasan_arch_is_ready())
> +		return;
> +
>   	if (unlikely(size == 0))
>   		return;
>   
> 
