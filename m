Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF18258940
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 09:33:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgf1P3fSCzDqHY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 17:32:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgdzB2L5TzDqM1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 17:31:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=a/bpJOhS; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bgdz92lPxz9sTC;
 Tue,  1 Sep 2020 17:31:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1598945461;
 bh=03sHYm631sdFvHM5NaS/cwjM4VK1GZ0RfuJMTFnqpEc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=a/bpJOhSiqrggdqpabXGJruLmgoojqIjNOtKdWPNocerR0Tx+kpxlpwOBXWByNo/u
 4MMDvjMJXHZd3qpIFjDpNQwir2JtlbC9QuIRNfQv7+DKiRCdMAqVS2zB0NNm3xvlxi
 hvo4hfX2X+T6n9TewBPyqOaQPF1dB6lLff4nNk3wepYL7lE7hDv4mTN4tfQemSqXSJ
 WI1dVOLHIsHxXYqamewX3UAYivUNxFlBxI1JOPhVmYtR5K6iqZSaxTQcLo/zn3B6PJ
 QNOduqvxUP/5omK0ZAxn1i6wfTDPjM1ab8plb48Tm0DDJw3DYQUCXwF5Hbpl36yYaa
 HcDxgeuynTQ2A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 16/23] powerpc: use asm-generic/mmu_context.h for no-op
 implementations
In-Reply-To: <20200826145249.745432-17-npiggin@gmail.com>
References: <20200826145249.745432-1-npiggin@gmail.com>
 <20200826145249.745432-17-npiggin@gmail.com>
Date: Tue, 01 Sep 2020 17:30:59 +1000
Message-ID: <87sgc20x8s.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@ozlabs.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/mmu_context.h | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers


> diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
> index 7f3658a97384..bc22e247ab55 100644
> --- a/arch/powerpc/include/asm/mmu_context.h
> +++ b/arch/powerpc/include/asm/mmu_context.h
> @@ -14,7 +14,9 @@
>  /*
>   * Most if the context management is out of line
>   */
> +#define init_new_context init_new_context
>  extern int init_new_context(struct task_struct *tsk, struct mm_struct *mm);
> +#define destroy_context destroy_context
>  extern void destroy_context(struct mm_struct *mm);
>  #ifdef CONFIG_SPAPR_TCE_IOMMU
>  struct mm_iommu_table_group_mem_t;
> @@ -235,27 +237,15 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>  }
>  #define switch_mm_irqs_off switch_mm_irqs_off
>  
> -
> -#define deactivate_mm(tsk,mm)	do { } while (0)
> -
> -/*
> - * After we have set current->mm to a new value, this activates
> - * the context for the new mm so we see the new mappings.
> - */
> -static inline void activate_mm(struct mm_struct *prev, struct mm_struct *next)
> -{
> -	switch_mm(prev, next, current);
> -}
> -
> -/* We don't currently use enter_lazy_tlb() for anything */
> +#ifdef CONFIG_PPC_BOOK3E_64
> +#define enter_lazy_tlb enter_lazy_tlb
>  static inline void enter_lazy_tlb(struct mm_struct *mm,
>  				  struct task_struct *tsk)
>  {
>  	/* 64-bit Book3E keeps track of current PGD in the PACA */
> -#ifdef CONFIG_PPC_BOOK3E_64
>  	get_paca()->pgd = NULL;
> -#endif
>  }
> +#endif
>  
>  extern void arch_exit_mmap(struct mm_struct *mm);
>  
> @@ -298,5 +288,7 @@ static inline int arch_dup_mmap(struct mm_struct *oldmm,
>  	return 0;
>  }
>  
> +#include <asm-generic/mmu_context.h>
> +
>  #endif /* __KERNEL__ */
>  #endif /* __ASM_POWERPC_MMU_CONTEXT_H */
> -- 
> 2.23.0
