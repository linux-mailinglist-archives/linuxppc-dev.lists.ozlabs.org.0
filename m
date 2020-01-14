Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA5F13A0D6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 07:02:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xfy10SKwzDqPW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 17:02:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xfw53hKnzDqLH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 17:01:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VeacHFBr; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47xfw44QqWz9s29;
 Tue, 14 Jan 2020 17:01:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1578981669;
 bh=ALUqYMWpSbT7KFgjzz53QbyoSg0qLp1ykpVazbFizZs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VeacHFBr9aPVdYAUvzFeq7NcHKql1k4vcG9bAmkdkP0pLZT7B8j9hNg3y/L2RIj9z
 BDaQF4D7aqE14D9Thn18l0FaoUHV0MaHWCuzMCISlSlohqUG5aJmgPaqSUHFG5pZDH
 FtazzpjNGDaGyyQQo9DBN6op1Tr8bmfsN1XPWXeUYzy93mOdMhtt1HwSzVUM1om7au
 CC3fquYcjZWeqzToqCOweP0/3oRjXtSeSnhe0mK50gFHFLqurE3ZpFfKwqaTm2/OG0
 2rOZERZDdudk46PoAypvGV0rRE7BUMwHg1S7rOqLB/nkd1kf9uT10bWmc1AQBFFHvh
 UMMy2sUoIk97A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/ptdump: don't entirely rebuild kernel when
 selecting CONFIG_PPC_DEBUG_WX
In-Reply-To: <176774c19b0398634e004835b9515c93030d326f.1578645835.git.christophe.leroy@c-s.fr>
References: <176774c19b0398634e004835b9515c93030d326f.1578645835.git.christophe.leroy@c-s.fr>
Date: Tue, 14 Jan 2020 16:01:10 +1000
Message-ID: <87muaqa861.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Selecting CONFIG_PPC_DEBUG_WX only impacts ptdump and pgtable_32/64
> init calls. Declaring related functions in asm/pgtable.h implies
> rebuilding almost everything.
>
> Move ptdump_check_wx() declaration in a new dedicated header file.

Can you put it in arch/powerpc/mm/mmu_decl.h ? That already exists for
things that are private to arch/powerpc/mm, which this function is
AFAICT.

cheers

>  arch/powerpc/include/asm/pgtable.h |  6 ------
>  arch/powerpc/include/asm/ptdump.h  | 15 +++++++++++++++
>  arch/powerpc/mm/pgtable_32.c       |  1 +
>  arch/powerpc/mm/pgtable_64.c       |  1 +
>  arch/powerpc/mm/ptdump/ptdump.c    |  1 +
>  5 files changed, 18 insertions(+), 6 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/ptdump.h
>
> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
> index 0e4ec8cc37b7..8cc543ed114c 100644
> --- a/arch/powerpc/include/asm/pgtable.h
> +++ b/arch/powerpc/include/asm/pgtable.h
> @@ -94,12 +94,6 @@ void mark_initmem_nx(void);
>  static inline void mark_initmem_nx(void) { }
>  #endif
>  
> -#ifdef CONFIG_PPC_DEBUG_WX
> -void ptdump_check_wx(void);
> -#else
> -static inline void ptdump_check_wx(void) { }
> -#endif
> -
>  /*
>   * When used, PTE_FRAG_NR is defined in subarch pgtable.h
>   * so we are sure it is included when arriving here.
> diff --git a/arch/powerpc/include/asm/ptdump.h b/arch/powerpc/include/asm/ptdump.h
> new file mode 100644
> index 000000000000..246b92c21729
> --- /dev/null
> +++ b/arch/powerpc/include/asm/ptdump.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_POWERPC_PTDUMP_H
> +#define _ASM_POWERPC_PTDUMP_H
> +
> +#ifndef __ASSEMBLY__
> +
> +#ifdef CONFIG_PPC_DEBUG_WX
> +void ptdump_check_wx(void);
> +#else
> +static inline void ptdump_check_wx(void) { }
> +#endif
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* _ASM_POWERPC_PTDUMP_H */
> diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
> index 73b84166d06a..6c866f1b1eeb 100644
> --- a/arch/powerpc/mm/pgtable_32.c
> +++ b/arch/powerpc/mm/pgtable_32.c
> @@ -29,6 +29,7 @@
>  #include <asm/fixmap.h>
>  #include <asm/setup.h>
>  #include <asm/sections.h>
> +#include <asm/ptdump.h>
>  
>  #include <mm/mmu_decl.h>
>  
> diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
> index e78832dce7bb..3686cd887c2f 100644
> --- a/arch/powerpc/mm/pgtable_64.c
> +++ b/arch/powerpc/mm/pgtable_64.c
> @@ -45,6 +45,7 @@
>  #include <asm/sections.h>
>  #include <asm/firmware.h>
>  #include <asm/dma.h>
> +#include <asm/ptdump.h>
>  
>  #include <mm/mmu_decl.h>
>  
> diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
> index 2f9ddc29c535..d7b02bcd0691 100644
> --- a/arch/powerpc/mm/ptdump/ptdump.c
> +++ b/arch/powerpc/mm/ptdump/ptdump.c
> @@ -23,6 +23,7 @@
>  #include <linux/const.h>
>  #include <asm/page.h>
>  #include <asm/pgalloc.h>
> +#include <asm/ptdump.h>
>  
>  #include "ptdump.h"
>  
> -- 
> 2.13.3
