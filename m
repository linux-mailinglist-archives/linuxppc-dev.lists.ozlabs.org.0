Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B77AF72E7B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 17:59:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgYBt4Kcqz30gj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 01:59:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 332 seconds by postgrey-1.37 at boromir; Wed, 14 Jun 2023 01:58:32 AEST
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgYBJ71QKz302F
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 01:58:32 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 44BA762F0B;
	Tue, 13 Jun 2023 15:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710A6C433D9;
	Tue, 13 Jun 2023 15:58:28 +0000 (UTC)
Date: Tue, 13 Jun 2023 16:58:25 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <ZIiSITqP1cXkR8Uz@arm.com>
References: <20230613162119.4a7a7d3c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613162119.4a7a7d3c@canb.auug.org.au>
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
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Stephen,

On Tue, Jun 13, 2023 at 04:21:19PM +1000, Stephen Rothwell wrote:
> After merging the mm tree, today's linux-next build (powerpc
> ppc44x_defconfig) failed like this:
> 
> In file included from arch/powerpc/include/asm/page.h:247,
>                  from arch/powerpc/include/asm/thread_info.h:13,
>                  from include/linux/thread_info.h:60,
>                  from include/asm-generic/preempt.h:5,
>                  from ./arch/powerpc/include/generated/asm/preempt.h:1,
>                  from include/linux/preempt.h:78,
>                  from include/linux/spinlock.h:56,
>                  from include/linux/ipc.h:5,
>                  from include/uapi/linux/sem.h:5,
>                  from include/linux/sem.h:5,
>                  from include/linux/compat.h:14,
>                  from arch/powerpc/kernel/asm-offsets.c:12:
> arch/powerpc/include/asm/page_32.h:16: warning: "ARCH_DMA_MINALIGN" redefined
>    16 | #define ARCH_DMA_MINALIGN       L1_CACHE_BYTES
>       | 
> In file included from include/linux/time.h:5,
>                  from include/linux/compat.h:10:
> include/linux/cache.h:104: note: this is the location of the previous definition
>   104 | #define ARCH_DMA_MINALIGN __alignof__(unsigned long long)
>       | 
> 
> (lots of theses)
> 
> Caused by commit
> 
>   cc7335787e73 ("mm/slab: decouple ARCH_KMALLOC_MINALIGN from ARCH_DMA_MINALIGN")
> 
> I have applied the following hack for today - we need something better.

I just posted this series fixing it for powerpc, microblaze and sh. I
did not add the #ifndef __powerpc64__ line since
CONFIG_NOT_COHERENT_CACHE should not be enabled for those builds.

https://lore.kernel.org/r/20230613155245.1228274-1-catalin.marinas@arm.com

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 13 Jun 2023 16:07:16 +1000
> Subject: [PATCH] fix up for "mm/slab: decouple ARCH_KMALLOC_MINALIGN from ARCH_DMA_MINALIGN"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/include/asm/cache.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/cache.h b/arch/powerpc/include/asm/cache.h
> index ae0a68a838e8..e9be1396dfd1 100644
> --- a/arch/powerpc/include/asm/cache.h
> +++ b/arch/powerpc/include/asm/cache.h
> @@ -142,5 +142,14 @@ static inline void iccci(void *addr)
>  }
>  
>  #endif /* !__ASSEMBLY__ */
> +
> +#ifndef __powerpc64__
> +#ifdef CONFIG_NOT_COHERENT_CACHE
> +#ifndef ARCH_DMA_MINALIGN
> +#define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
> +#endif
> +#endif
> +#endif
> +
>  #endif /* __KERNEL__ */
>  #endif /* _ASM_POWERPC_CACHE_H */

I think it should also remove the ARCH_DMA_MINALIGN from asm/page.h (as
I did in my series; sorry I did not cc you, only noticed now that you
reported it as well).

-- 
Catalin
