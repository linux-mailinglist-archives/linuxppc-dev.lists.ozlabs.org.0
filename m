Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A929012984
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 10:07:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wPrF1p1YzDqtQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 18:07:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="g6fjTQ0J"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wPBB4DCDzDqkw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 17:38:10 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44wPB63Wcfz9vFVp;
 Fri,  3 May 2019 09:38:06 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=g6fjTQ0J; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Q6TCMmlYgt_T; Fri,  3 May 2019 09:38:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44wPB62PVJz9vFVk;
 Fri,  3 May 2019 09:38:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556869086; bh=22Xq3HEvd6Yru88xMDUMXzEqbO1waVFeR8bEmAMWSqI=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=g6fjTQ0JL6fwAUUHq8KpW3v/DHKD9rNsQD9jXKP6PVsqfF71wJQKid60dMBEjOjo/
 CoL7j3j9LGBMaJdHGjv1jKHgt9s8cdw2G2D4RCHc+zjKGifCuOHw1si6VIDL07vOJg
 jd6jSKg4onNj6/g1KOMELNwy1JLElux28bsad5iw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 556958B888;
 Fri,  3 May 2019 09:38:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ppmZKOEr5jsr; Fri,  3 May 2019 09:38:07 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0CA268B853;
 Fri,  3 May 2019 09:38:07 +0200 (CEST)
Subject: Re: [PATCH v11 09/13] powerpc: disable KASAN instrumentation on
 early/critical files.
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Daniel Axtens <dja@axtens.net>
References: <cover.1556295459.git.christophe.leroy@c-s.fr>
 <867c149e77f80e855a9310a490fb15ca03ffd63d.1556295461.git.christophe.leroy@c-s.fr>
Message-ID: <5cff9551-e0ce-a2a4-989c-6b55825fa171@c-s.fr>
Date: Fri, 3 May 2019 09:38:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <867c149e77f80e855a9310a490fb15ca03ffd63d.1556295461.git.christophe.leroy@c-s.fr>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/04/2019 à 18:23, Christophe Leroy a écrit :
> All files containing functions run before kasan_early_init() is called
> must have KASAN instrumentation disabled.
> 
> For those file, branch profiling also have to be disabled otherwise
> each if () generates a call to ftrace_likely_update().
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>   arch/powerpc/kernel/Makefile             | 12 ++++++++++++
>   arch/powerpc/lib/Makefile                |  8 ++++++++
>   arch/powerpc/mm/Makefile                 |  6 ++++++
>   arch/powerpc/platforms/powermac/Makefile |  6 ++++++
>   arch/powerpc/purgatory/Makefile          |  3 +++
>   arch/powerpc/xmon/Makefile               |  1 +
>   6 files changed, 36 insertions(+)
> 

[...]

> diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
> index 3c1bd9fa23cd..dd945ca869b2 100644
> --- a/arch/powerpc/mm/Makefile
> +++ b/arch/powerpc/mm/Makefile
> @@ -7,6 +7,12 @@ ccflags-$(CONFIG_PPC64)	:= $(NO_MINIMAL_TOC)
>   
>   CFLAGS_REMOVE_slb.o = $(CC_FLAGS_FTRACE)
>   
> +KASAN_SANITIZE_ppc_mmu_32.o := n
> +
> +ifdef CONFIG_KASAN
> +CFLAGS_ppc_mmu_32.o  		+= -DDISABLE_BRANCH_PROFILING
> +endif
> +

The above is missing in powerpc/next (should now be in 
arch/powerpc/mm/book3s32/Makefile )

Christophe
