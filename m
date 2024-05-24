Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 78C1A8CE182
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 09:31:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ByOKk0V7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlxRB35nyz87ZJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 17:25:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ByOKk0V7;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlxQT2rlDz3cbQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 17:25:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1716535518;
	bh=6Nxzlvh6hi/K9obT/OWbCZiouMvR46Xa9Rav7X3CLf0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ByOKk0V7ZEccbM3hSsVjeYiyQfMGD14qpRTg9787+rmXSGvxNYhpt/FkKoBZT6pFb
	 ONsGC97njz2dXaztOnEyCwHTdBC7Ho8dGBHffh5fZTFjh1ZCjsCwetR9ezghEBY2kG
	 zuxRO3Bqm22lj6cNVCBH0K+3f2+31JyB7YUN28655vsElCurpxtqp7LOZJKWdk721b
	 UcheUeZVS9LquznNQs1qlKhvDNfhBPxW24QfHthpjLEnI6Gi/u7xJWaytfN9n2NFbq
	 GGkQy1qq3mW/Lstk3DYMcVrsczv9aGsF9/AxkS3S3Qk00r9JWJqNrhDNdR8TCuVhZa
	 VWLcRzwgAfEJQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VlxQQ2Frvz4wc5;
	Fri, 24 May 2024 17:25:18 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Anjali K <anjalik@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/perf: Set cpumode flags using sample address
In-Reply-To: <20240517094607.422166-1-anjalik@linux.ibm.com>
References: <20240517094607.422166-1-anjalik@linux.ibm.com>
Date: Fri, 24 May 2024 17:25:17 +1000
Message-ID: <87ed9r4qoy.fsf@mail.lhotse>
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
Cc: anjalik@linux.ibm.com, kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Anjali,

Anjali K <anjalik@linux.ibm.com> writes:
> Currently in some cases, when the sampled instruction address register
> latches to a specific address during sampling, there is an inconsistency
> in the privilege bits captured in the sampled event register.
 
I don't really like "inconsistency", it's vague.

The sampled address is correct, and the privilege bits are incorrect.

If someone is offended by that wording you can direct them to me :)

> For example, a snippet from the perf report on a power10 system is:
> Overhead  Address             Command       Shared Object      Symbol
> ........  ..................  ............  .................  .......................
>      2.41%  0x7fff9f94a02c      null_syscall  [unknown]          [k] 0x00007fff9f94a02c
>      2.20%  0x7fff9f94a02c      null_syscall  libc.so.6          [.] syscall
>
> perf_get_misc_flags() function looks at the privilege bits to return
> the corresponding flags to be used for the address symbol and these
> privilege bit details are read from the sampled event register. In the
> above snippet, address "0x00007fff9f94a02c" is shown as "k" (kernel) due
> to the inconsistent privilege bits captured in the sampled event register.
 
"incorrect privilege bits"

> To address this case, the proposed fix is to additionally check whether the
 
"To address this case check whether the"

> sampled address is in the kernel area. Since this is specific to the latest
> platform, a new pmu flag is added called "PPMU_P10" and is used to
> contain the proposed fix.

You should explain why this fix replaces the existing P10_DD1 logic.

> Signed-off-by: Anjali K <anjalik@linux.ibm.com>
> ---
> Changelog:
> V1->V2:
> Fixed the build warning reported by the kernel test bot
> Added a new flag PPMU_P10 and used it instead of PPMU_ARCH_31 to restrict
> the changes to the current platform (Power10)
>
>  arch/powerpc/include/asm/perf_event_server.h |  1 +
>  arch/powerpc/perf/core-book3s.c              | 43 ++++++++------------
>  arch/powerpc/perf/power10-pmu.c              |  3 +-
>  3 files changed, 20 insertions(+), 27 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
> index e2221d29fdf9..12f7bfb4cab1 100644
> --- a/arch/powerpc/include/asm/perf_event_server.h
> +++ b/arch/powerpc/include/asm/perf_event_server.h
> @@ -90,6 +90,7 @@ struct power_pmu {
>  #define PPMU_ARCH_31		0x00000200 /* Has MMCR3, SIER2 and SIER3 */
>  #define PPMU_P10_DD1		0x00000400 /* Is power10 DD1 processor version */
>  #define PPMU_HAS_ATTR_CONFIG1	0x00000800 /* Using config1 attribute */
> +#define PPMU_P10			0x00001000 /* For power10 pmu */
  
Can you put PPMU_P10 immediately after PPMU_P10_DD1. It's OK to renumber
PPMU_HAS_ATTR_CONFIG1.

> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index 6b5f8a94e7d8..8a2677463a73 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -266,31 +266,12 @@ static inline u32 perf_flags_from_msr(struct pt_regs *regs)
>  static inline u32 perf_get_misc_flags(struct pt_regs *regs)
>  {
>  	bool use_siar = regs_use_siar(regs);
> -	unsigned long mmcra = regs->dsisr;
> -	int marked = mmcra & MMCRA_SAMPLE_ENABLE;
> +	unsigned long siar = mfspr(SPRN_SIAR);
 
We shouldn't read SPRN_SIAR until we know it will be used.

> +	unsigned long addr;
>  
>  	if (!use_siar)
>  		return perf_flags_from_msr(regs);
>  
> -	/*
> -	 * Check the address in SIAR to identify the
> -	 * privilege levels since the SIER[MSR_HV, MSR_PR]
> -	 * bits are not set for marked events in power10
> -	 * DD1.
> -	 */
> -	if (marked && (ppmu->flags & PPMU_P10_DD1)) {
> -		unsigned long siar = mfspr(SPRN_SIAR);
> -		if (siar) {
> -			if (is_kernel_addr(siar))
> -				return PERF_RECORD_MISC_KERNEL;
> -			return PERF_RECORD_MISC_USER;
> -		} else {
> -			if (is_kernel_addr(regs->nip))
> -				return PERF_RECORD_MISC_KERNEL;
> -			return PERF_RECORD_MISC_USER;
> -		}
> -	}
> -
>  	/*
>  	 * If we don't have flags in MMCRA, rather than using
>  	 * the MSR, we intuit the flags from the address in
> @@ -298,19 +279,29 @@ static inline u32 perf_get_misc_flags(struct pt_regs *regs)
>  	 * results
>  	 */
>  	if (ppmu->flags & PPMU_NO_SIPR) {
> -		unsigned long siar = mfspr(SPRN_SIAR);
>  		if (is_kernel_addr(siar))
>  			return PERF_RECORD_MISC_KERNEL;
>  		return PERF_RECORD_MISC_USER;
>  	}
>  
>  	/* PR has priority over HV, so order below is important */
> -	if (regs_sipr(regs))
> -		return PERF_RECORD_MISC_USER;
> -
> -	if (regs_sihv(regs) && (freeze_events_kernel != MMCR0_FCHV))
> +	if (regs_sipr(regs)) {
> +		if (!(ppmu->flags & PPMU_P10))
> +			return PERF_RECORD_MISC_USER;
> +	} else if (regs_sihv(regs) && (freeze_events_kernel != MMCR0_FCHV))
>  		return PERF_RECORD_MISC_HYPERVISOR;
>  
> +	/*
> +	 * Check the address in SIAR to identify the
> +	 * privilege levels since the SIER[MSR_HV, MSR_PR]
> +	 * bits are not set correctly in power10 sometimes
> +	 */
> +	if (ppmu->flags & PPMU_P10) {
> +		addr = siar ? siar : regs->nip;
> +		if (!is_kernel_addr(addr))
> +			return PERF_RECORD_MISC_USER;
> +	}
> +
>  	return PERF_RECORD_MISC_KERNEL;
>  }

cheers
