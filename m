Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 562FB84CE7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 15:27:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463XNp4cQYzDqB3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 23:27:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463X4b6sf9zDqV8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 23:13:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 463X4b1wbfz9sNm;
 Wed,  7 Aug 2019 23:13:19 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jason Yan <yanaijie@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 diana.craciun@nxp.com, christophe.leroy@c-s.fr, benh@kernel.crashing.org,
 paulus@samba.org, npiggin@gmail.com, keescook@chromium.org,
 kernel-hardening@lists.openwall.com
Subject: Re: [PATCH v5 01/10] powerpc: unify definition of M_IF_NEEDED
In-Reply-To: <20190807065706.11411-2-yanaijie@huawei.com>
References: <20190807065706.11411-1-yanaijie@huawei.com>
 <20190807065706.11411-2-yanaijie@huawei.com>
Date: Wed, 07 Aug 2019 23:13:15 +1000
Message-ID: <87sgqdt8yc.fsf@concordia.ellerman.id.au>
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
Cc: wangkefeng.wang@huawei.com, Jason Yan <yanaijie@huawei.com>,
 linux-kernel@vger.kernel.org, jingxiangfeng@huawei.com,
 zhaohongjiang@huawei.com, thunder.leizhen@huawei.com, fanchengyang@huawei.com,
 yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jason Yan <yanaijie@huawei.com> writes:
> M_IF_NEEDED is defined too many times. Move it to a common place.

The name is not great, can you call it MAS2_M_IF_NEEDED, which at least
gives a clue what it's for?

cheers

> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> Cc: Diana Craciun <diana.craciun@nxp.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Kees Cook <keescook@chromium.org>
> Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Reviewed-by: Diana Craciun <diana.craciun@nxp.com>
> Tested-by: Diana Craciun <diana.craciun@nxp.com>
> ---
>  arch/powerpc/include/asm/nohash/mmu-book3e.h  | 10 ++++++++++
>  arch/powerpc/kernel/exceptions-64e.S          | 10 ----------
>  arch/powerpc/kernel/fsl_booke_entry_mapping.S | 10 ----------
>  arch/powerpc/kernel/misc_64.S                 |  5 -----
>  4 files changed, 10 insertions(+), 25 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/nohash/mmu-book3e.h b/arch/powerpc/include/asm/nohash/mmu-book3e.h
> index 4c9777d256fb..0877362e48fa 100644
> --- a/arch/powerpc/include/asm/nohash/mmu-book3e.h
> +++ b/arch/powerpc/include/asm/nohash/mmu-book3e.h
> @@ -221,6 +221,16 @@
>  #define TLBILX_T_CLASS2			6
>  #define TLBILX_T_CLASS3			7
>  
> +/*
> + * The mapping only needs to be cache-coherent on SMP, except on
> + * Freescale e500mc derivatives where it's also needed for coherent DMA.
> + */
> +#if defined(CONFIG_SMP) || defined(CONFIG_PPC_E500MC)
> +#define M_IF_NEEDED	MAS2_M
> +#else
> +#define M_IF_NEEDED	0
> +#endif
> +
>  #ifndef __ASSEMBLY__
>  #include <asm/bug.h>
>  
> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
> index 1cfb3da4a84a..fd49ec07ce4a 100644
> --- a/arch/powerpc/kernel/exceptions-64e.S
> +++ b/arch/powerpc/kernel/exceptions-64e.S
> @@ -1342,16 +1342,6 @@ skpinv:	addi	r6,r6,1				/* Increment */
>  	sync
>  	isync
>  
> -/*
> - * The mapping only needs to be cache-coherent on SMP, except on
> - * Freescale e500mc derivatives where it's also needed for coherent DMA.
> - */
> -#if defined(CONFIG_SMP) || defined(CONFIG_PPC_E500MC)
> -#define M_IF_NEEDED	MAS2_M
> -#else
> -#define M_IF_NEEDED	0
> -#endif
> -
>  /* 6. Setup KERNELBASE mapping in TLB[0]
>   *
>   * r3 = MAS0 w/TLBSEL & ESEL for the entry we started in
> diff --git a/arch/powerpc/kernel/fsl_booke_entry_mapping.S b/arch/powerpc/kernel/fsl_booke_entry_mapping.S
> index ea065282b303..de0980945510 100644
> --- a/arch/powerpc/kernel/fsl_booke_entry_mapping.S
> +++ b/arch/powerpc/kernel/fsl_booke_entry_mapping.S
> @@ -153,16 +153,6 @@ skpinv:	addi	r6,r6,1				/* Increment */
>  	tlbivax 0,r9
>  	TLBSYNC
>  
> -/*
> - * The mapping only needs to be cache-coherent on SMP, except on
> - * Freescale e500mc derivatives where it's also needed for coherent DMA.
> - */
> -#if defined(CONFIG_SMP) || defined(CONFIG_PPC_E500MC)
> -#define M_IF_NEEDED	MAS2_M
> -#else
> -#define M_IF_NEEDED	0
> -#endif
> -
>  #if defined(ENTRY_MAPPING_BOOT_SETUP)
>  
>  /* 6. Setup KERNELBASE mapping in TLB1[0] */
> diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
> index b55a7b4cb543..26074f92d4bc 100644
> --- a/arch/powerpc/kernel/misc_64.S
> +++ b/arch/powerpc/kernel/misc_64.S
> @@ -432,11 +432,6 @@ kexec_create_tlb:
>  	rlwimi	r9,r10,16,4,15		/* Setup MAS0 = TLBSEL | ESEL(r9) */
>  
>  /* Set up a temp identity mapping v:0 to p:0 and return to it. */
> -#if defined(CONFIG_SMP) || defined(CONFIG_PPC_E500MC)
> -#define M_IF_NEEDED	MAS2_M
> -#else
> -#define M_IF_NEEDED	0
> -#endif
>  	mtspr	SPRN_MAS0,r9
>  
>  	lis	r9,(MAS1_VALID|MAS1_IPROT)@h
> -- 
> 2.17.2
