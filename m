Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA75415A15F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 07:37:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HVLL57w0zDqLx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 17:37:14 +1100 (AEDT)
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
 header.s=mail header.b=gFtlJ2xh; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HVJX4FNmzDqKl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 17:35:38 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48HVJN3wSdz9v06n;
 Wed, 12 Feb 2020 07:35:32 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=gFtlJ2xh; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id PvBBu-t-JaUP; Wed, 12 Feb 2020 07:35:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48HVJN2lyTz9v06f;
 Wed, 12 Feb 2020 07:35:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581489332; bh=mlBXvnRSGUCMJcLvyWdPUsSnuUQABm7mYvYTkvnlvKQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gFtlJ2xhwbWh4Vdp/x6dY5YLM1BIT7PaMh3LwZ3vY6YtDgtifOwEessIltwhksQ5J
 Pil+ErH8sbKpTy4eVbENdNudj4LU302HjybNQV8MqKMPPxbTTw1DWFoJrCMJpCcc5B
 GUKsSkzRdsVdvXTkWfVdMAJ4kPxs7L1ZgloAr9cI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 37B568B7FF;
 Wed, 12 Feb 2020 07:35:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mOVzraGcf1N3; Wed, 12 Feb 2020 07:35:33 +0100 (CET)
Received: from [172.25.230.102] (po15451.idsi0.si.c-s.fr [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0D1FD8B75B;
 Wed, 12 Feb 2020 07:35:33 +0100 (CET)
Subject: Re: [PATCH v6 4/4] powerpc: Book3S 64-bit "heavyweight" KASAN support
To: Daniel Axtens <dja@axtens.net>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 kasan-dev@googlegroups.com, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
References: <20200212054724.7708-1-dja@axtens.net>
 <20200212054724.7708-5-dja@axtens.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <224745f3-db66-fe46-1459-d1d41867b4f3@c-s.fr>
Date: Wed, 12 Feb 2020 07:35:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200212054724.7708-5-dja@axtens.net>
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

Le 12/02/2020 à 06:47, Daniel Axtens a écrit :
> diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
> index fbff9ff9032e..2911fdd3a6a0 100644
> --- a/arch/powerpc/include/asm/kasan.h
> +++ b/arch/powerpc/include/asm/kasan.h
> @@ -2,6 +2,8 @@
>   #ifndef __ASM_KASAN_H
>   #define __ASM_KASAN_H
>   
> +#include <asm/page.h>
> +
>   #ifdef CONFIG_KASAN
>   #define _GLOBAL_KASAN(fn)	_GLOBAL(__##fn)
>   #define _GLOBAL_TOC_KASAN(fn)	_GLOBAL_TOC(__##fn)
> @@ -14,29 +16,41 @@
>   
>   #ifndef __ASSEMBLY__
>   
> -#include <asm/page.h>
> -
>   #define KASAN_SHADOW_SCALE_SHIFT	3
>   
>   #define KASAN_SHADOW_START	(KASAN_SHADOW_OFFSET + \
>   				 (PAGE_OFFSET >> KASAN_SHADOW_SCALE_SHIFT))
>   
> +#ifdef CONFIG_KASAN_SHADOW_OFFSET
>   #define KASAN_SHADOW_OFFSET	ASM_CONST(CONFIG_KASAN_SHADOW_OFFSET)
> +#endif
>   
> +#ifdef CONFIG_PPC32
>   #define KASAN_SHADOW_END	0UL
>   
> -#define KASAN_SHADOW_SIZE	(KASAN_SHADOW_END - KASAN_SHADOW_START)
> +#ifdef CONFIG_KASAN
> +void kasan_late_init(void);
> +#else
> +static inline void kasan_late_init(void) { }
> +#endif
> +
> +#endif
> +
> +#ifdef CONFIG_PPC_BOOK3S_64
> +#define KASAN_SHADOW_END	(KASAN_SHADOW_OFFSET + \
> +				 (RADIX_VMEMMAP_END >> KASAN_SHADOW_SCALE_SHIFT))
> +
> +static inline void kasan_late_init(void) { }
> +#endif
>   
>   #ifdef CONFIG_KASAN
>   void kasan_early_init(void);
>   void kasan_mmu_init(void);
>   void kasan_init(void);
> -void kasan_late_init(void);
>   #else
>   static inline void kasan_init(void) { }
>   static inline void kasan_mmu_init(void) { }
> -static inline void kasan_late_init(void) { }
>   #endif

Why modify all this kasan_late_init() stuff ?

This function is only called from kasan init_32.c, it is never called by 
PPC64, so you should not need to modify anything at all.

Christophe

