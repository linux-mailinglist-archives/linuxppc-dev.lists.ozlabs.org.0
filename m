Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D27356B46
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 13:33:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFj2n45LBz3btH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 21:33:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PaKYhf+G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=PaKYhf+G; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFj2Q23qbz2yRD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 21:33:34 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FFj2K26Yrz9sPf;
 Wed,  7 Apr 2021 21:33:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1617795209;
 bh=y0l2cj5THm1KD/rp1s2DbbyiQ8447KTyycDVAMuWir0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=PaKYhf+GI2NFfbUpaIVQvGYfB4g+oN/FQuz0XqD7E19sCrBZ0qdwOYiBBLFyWBlvN
 8Gk2+7nQSBnvR6zs5R4dH6Nlg5lqxjYUEPe4pgeUCQpgIQAL6l+WF9jmblUcT9IPkb
 oW2cXKMKxUXI9ap/rmWeN3mMJ5KzXDVXevEPIWFWaL7F4/FLpcotBrIDn4ZvoUXOcS
 v3kS2R6uvLH0aNxq92/BtxRvtyvbOUymuTrmFjRlCLB+iKTvCY/dRFPJ0JJBDxozSf
 b1fkC3R0+4Mgm+b3IYqEZfkAkT1rPYgzxSIdbVOIvQVGGaB0Q4/Tlli1y6QsRTxdZu
 vhfksNsLHIC/g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/powernv: Enable HAIL (HV AIL) for ISA v3.1
 processors
In-Reply-To: <20210402024124.545826-1-npiggin@gmail.com>
References: <20210402024124.545826-1-npiggin@gmail.com>
Date: Wed, 07 Apr 2021 21:33:28 +1000
Message-ID: <87v98ye3cn.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Starting with ISA v3.1, LPCR[AIL] no longer controls the interrupt
> mode for HV=1 interrupts. Instead, a new LPCR[HAIL] bit is defined
> which behaves like AIL=3 for HV interrupts when set.
>
> Set HAIL on bare metal to give us mmu-on interrupts and improve
> performance.
>
> This also fixes an scv bug: we don't implement scv real mode (AIL=0)
> vectors because they are at an inconvenient location, so we just
> disable scv support when AIL can not be set. However powernv assumes
> that LPCR[AIL] will enable AIL mode so it enables scv support despite
> HV interrupts being AIL=0, which causes scv interrupts to go off into
> the weeds.

Should we tag this as fixing the initial P10 support, or the scv
support? Or neither?

cheers

> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> index 1be20bc8dce2..9086a2644c89 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -441,6 +441,7 @@
>  #define   LPCR_VRMA_LP1		ASM_CONST(0x0000800000000000)
>  #define   LPCR_RMLS		0x1C000000	/* Implementation dependent RMO limit sel */
>  #define   LPCR_RMLS_SH		26
> +#define   LPCR_HAIL		ASM_CONST(0x0000000004000000)   /* HV AIL (ISAv3.1) */
>  #define   LPCR_ILE		ASM_CONST(0x0000000002000000)   /* !HV irqs set MSR:LE */
>  #define   LPCR_AIL		ASM_CONST(0x0000000001800000)	/* Alternate interrupt location */
>  #define   LPCR_AIL_0		ASM_CONST(0x0000000000000000)	/* MMU off exception offset 0x0 */
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 04a31586f760..671192afcdfd 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -233,10 +233,23 @@ static void cpu_ready_for_interrupts(void)
>  	 * If we are not in hypervisor mode the job is done once for
>  	 * the whole partition in configure_exceptions().
>  	 */
> -	if (cpu_has_feature(CPU_FTR_HVMODE) &&
> -	    cpu_has_feature(CPU_FTR_ARCH_207S)) {
> +	if (cpu_has_feature(CPU_FTR_HVMODE)) {
>  		unsigned long lpcr = mfspr(SPRN_LPCR);
> -		mtspr(SPRN_LPCR, lpcr | LPCR_AIL_3);
> +		unsigned long new_lpcr = lpcr;
> +
> +		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> +			/* P10 DD1 does not have HAIL */
> +			if (pvr_version_is(PVR_POWER10) &&
> +					(mfspr(SPRN_PVR) & 0xf00) == 0x100)
> +				new_lpcr |= LPCR_AIL_3;
> +			else
> +				new_lpcr |= LPCR_HAIL;
> +		} else if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
> +			new_lpcr |= LPCR_AIL_3;
> +		}
> +
> +		if (new_lpcr != lpcr)
> +			mtspr(SPRN_LPCR, new_lpcr);
>  	}
>  
>  	/*
> -- 
> 2.23.0
