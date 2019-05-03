Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD7F12FE7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 16:16:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wZ1t4VYFzDqmX
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2019 00:16:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="jHCc5UQx"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wYzF3qt0zDqmK
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2019 00:14:17 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44wYz80WThz9v0Qq;
 Fri,  3 May 2019 16:14:12 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jHCc5UQx; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Yx8th_9waD_9; Fri,  3 May 2019 16:14:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44wYz76bMVz9v0Qp;
 Fri,  3 May 2019 16:14:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556892851; bh=N3KiaUcLEYk9KtUTqID0+uxRqzqncKCSAqZErSc4wZU=;
 h=Subject:From:Cc:References:Date:In-Reply-To:From;
 b=jHCc5UQxXyp3CjmUelIH1ksgeYE2ii1qsiokDBpgvdvv20aNLhbiiKXkcI/H80FGG
 WtHysthrfPglNv99uEcS7kjzCuXN9DdMVjbdkse/j4WzjgQX9KHDrhBGqb587ZkFy7
 Nba5LA3Cda9sD84Dv3YT5d7lAPJ65EPlrZTLu11I=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 65DF58B91F;
 Fri,  3 May 2019 16:14:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3hvfyBn0pboA; Fri,  3 May 2019 16:14:13 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3C8328B906;
 Fri,  3 May 2019 16:14:13 +0200 (CEST)
Subject: Re: [PATCH] powerpc/32: Remove memory clobber asm constraint on
 dcbX() functions
From: Christophe Leroy <christophe.leroy@c-s.fr>
References: <20180109065759.4E54B6C73D@localhost.localdomain>
Message-ID: <e482662f-254c-4ab7-b0a8-966a3159d705@c-s.fr>
Date: Fri, 3 May 2019 16:14:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20180109065759.4E54B6C73D@localhost.localdomain>
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
Cc: linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher,

A while ago I proposed the following patch, and didn't get any comment 
back on it.

Do you have any opinion on it ? Is it good and worth it ?

Thanks
Christophe

Le 09/01/2018 à 07:57, Christophe Leroy a écrit :
> Instead of just telling GCC that dcbz(), dcbi(), dcbf() and dcbst()
> clobber memory, tell it what it clobbers:
> * dcbz(), dcbi() and dcbf() clobbers one cacheline as output
> * dcbf() and dcbst() clobbers one cacheline as input
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>   arch/powerpc/include/asm/cache.h | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/cache.h b/arch/powerpc/include/asm/cache.h
> index c1d257aa4c2d..fc8fe18acf8c 100644
> --- a/arch/powerpc/include/asm/cache.h
> +++ b/arch/powerpc/include/asm/cache.h
> @@ -82,22 +82,31 @@ extern void _set_L3CR(unsigned long);
>   
>   static inline void dcbz(void *addr)
>   {
> -	__asm__ __volatile__ ("dcbz 0, %0" : : "r"(addr) : "memory");
> +	__asm__ __volatile__ ("dcbz 0, %1" :
> +			      "=m"(*(char (*)[L1_CACHE_BYTES])addr) :
> +			      "r"(addr) :);
>   }
>   
>   static inline void dcbi(void *addr)
>   {
> -	__asm__ __volatile__ ("dcbi 0, %0" : : "r"(addr) : "memory");
> +	__asm__ __volatile__ ("dcbi 0, %1" :
> +			      "=m"(*(char (*)[L1_CACHE_BYTES])addr) :
> +			      "r"(addr) :);
>   }
>   
>   static inline void dcbf(void *addr)
>   {
> -	__asm__ __volatile__ ("dcbf 0, %0" : : "r"(addr) : "memory");
> +	__asm__ __volatile__ ("dcbf 0, %1" :
> +			      "=m"(*(char (*)[L1_CACHE_BYTES])addr) :
> +			      "r"(addr), "m"(*(char (*)[L1_CACHE_BYTES])addr) :
> +			     );
>   }
>   
>   static inline void dcbst(void *addr)
>   {
> -	__asm__ __volatile__ ("dcbst 0, %0" : : "r"(addr) : "memory");
> +	__asm__ __volatile__ ("dcbst 0, %0" : :
> +			      "r"(addr), "m"(*(char (*)[L1_CACHE_BYTES])addr) :
> +			     );
>   }
>   #endif /* !__ASSEMBLY__ */
>   #endif /* __KERNEL__ */
> 
