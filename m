Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C00118ABE6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 05:42:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jZ5n2wRpzDrQq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 15:42:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jYZZ68q7zDrJD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 15:19:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZqxOYYlt; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48jYZZ3tb1z9sPF;
 Thu, 19 Mar 2020 15:19:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584591558;
 bh=BImETbxzOaIj90zC7U8sK/pp/Wx9f0/AgvV1p1x+VDA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZqxOYYlt3gS91WRdkIAgxPOp7sep2MACE0TwJAf91g+PJfzgyiY93aD6WNEPIm+UM
 FD4QUWVsdNvIUmK9DOLLmb0/+03uX63WwPu84VW791GyuW9OntlKE89KSVu6tNdSEV
 ayuzvxlSAvhtf7Cya5OodzpCsHtL4UipmN6UtcFRuXqUHjb8O6kuHPh5rECHBATX+y
 aPNrVLOt2MTDswMKwFD34TPqy5+1NLVNPCPyADxvLZsBYaul7+lS1dqvEySkuI9l9W
 cLT25qM9xByJtvVICYMzqF8+H53hvOjKIyUphhxvJp0VF5irIjVJsLcdDuimTVICsE
 zbbhfK+13f5fQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com
Subject: Re: [PATCH v4] powerpc: setup_64: set up PACA before parsing device
 tree
In-Reply-To: <20200316042227.12445-1-dja@axtens.net>
References: <20200316042227.12445-1-dja@axtens.net>
Date: Thu, 19 Mar 2020 15:19:21 +1100
Message-ID: <875zf1dliu.fsf@mpe.ellerman.id.au>
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
Cc: ajd@linux.ibm.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:
> Currently, we set up the PACA after parsing the device tree for CPU
> features. Before that, r13 contains random data, which means there is
> random data in r13 while we're running the generic dt parsing code.
>
> This random data varies depending on whether we boot through a vmlinux or a
> zImage: for the vmlinux case it's usually around zero, but for zImages we
> see random values like 912a72603d420015.
>
> This is poor practice, and can also lead to difficult-to-debug crashes. For
> example, when kcov is enabled, the kcov instrumentation attempts to read
> preempt_count out of the current task, which goes via the PACA. This then
> crashes in the zImage case.
>
> To resolve this:
>
>  - move the PACA setup to before the cpu feature parsing.
>
>  - because we no longer have access to cpu feature flags in PACA setup,
>    change the HV feature test in the PACA setup path to consider the actual
>    value of the MSR rather than the CPU feature.
>
> Translations get switched on once we leave early_setup, so I think we'd
> already catch any other cases where the PACA or task aren't set up.
>
> Boot tested on a P9 guest and host.
>
> Fixes: fb0b0a73b223 ("powerpc: Enable kcov")
> Cc: Andrew Donnellan <ajd@linux.ibm.com>
> Cc: stable@vger.kernel.org
> Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Daniel Axtens <dja@axtens.net>
>
> ---
>
> Regarding moving the comment about printk()-safety:
> I am about 75% sure that the thing that makes printk() safe is the PACA,
> not the CPU features. That's what commit 24d9649574fb ("[POWERPC] Document
> when printk is useable") seems to indicate, but as someone wise recently
> told me, "bootstrapping is hard", so I may be totally wrong.

Yeah:
    When debugging early boot problems, it's common to sprinkle printk's
    all over the place.  However, on 64-bit powerpc, this can lead to
    memory corruption if done too early due to the PACA pointer and
    lockdep core not being initialized.

ie. printk was calling into lockdep and that was blowing chunks. My
recollection is that lockdep was crashing because it wasn't initialised
rather than anything to do with the paca, but I could be wrong.

Presumably the lockdep issue was actually fixed in:

  06bea3dbfe6a ("locking/lockdep: Eliminate lockdep_init()") (Feb 2016)

Which removed the lockdep_init() call entirely.

And that's why we haven't noticed any issues despite the fact that
dt_cpu_ftrs_init() *is* calling printk:

  13190702: (13190702): [    0.013183435,5] INIT: Starting kernel at 0x20010000, fdt at 0x3054c230 15395 bytes
  41352186: (41352186): [    0.000000][    T0] dt-cpu-ftrs: setup for ISA 3000
  41479101: (41479101): [    0.000000][    T0] dt-cpu-ftrs: not enabling: system-call-vectored (disabled or unsupported by kernel)
  41718546: (41718546): [    0.000000][    T0] dt-cpu-ftrs: final cpu/mmu features = 0x0001986f8f5fb1a7 0x3c006041
  41923251: (41923251): [    0.000000][    T0] radix-mmu: Page sizes from device-tree:


As you've seen I pulled on this string and found problems with stack
protector. But I didn't actually see any problems with printk.

So possibly we should update that comment to not refer to printk but
instead say something like "don't call generic code".

cheers


> v4: Update commit message and clarify that the mfmsr() approach is not
>      for general use. Thanks Nick Piggin.
>
> v3: Update comment, thanks Christophe Leroy.
>     Remove a comment in dt_cpu_ftrs.c that is no longer accurate - thanks
>       Andrew. I think we want to retain all the code still, but I'm open to
>       being told otherwise.
> ---
>  arch/powerpc/kernel/dt_cpu_ftrs.c |  1 -
>  arch/powerpc/kernel/paca.c        | 10 +++++++---
>  arch/powerpc/kernel/setup_64.c    | 20 +++++++++++++++-----
>  3 files changed, 22 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
> index 182b4047c1ef..36bc0d5c4f3a 100644
> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> @@ -139,7 +139,6 @@ static void __init cpufeatures_setup_cpu(void)
>  	/* Initialize the base environment -- clear FSCR/HFSCR.  */
>  	hv_mode = !!(mfmsr() & MSR_HV);
>  	if (hv_mode) {
> -		/* CPU_FTR_HVMODE is used early in PACA setup */
>  		cur_cpu_spec->cpu_features |= CPU_FTR_HVMODE;
>  		mtspr(SPRN_HFSCR, 0);
>  	}
> diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
> index 949eceb254d8..0ee6308541b1 100644
> --- a/arch/powerpc/kernel/paca.c
> +++ b/arch/powerpc/kernel/paca.c
> @@ -214,11 +214,15 @@ void setup_paca(struct paca_struct *new_paca)
>  	/* On Book3E, initialize the TLB miss exception frames */
>  	mtspr(SPRN_SPRG_TLB_EXFRAME, local_paca->extlb);
>  #else
> -	/* In HV mode, we setup both HPACA and PACA to avoid problems
> +	/*
> +	 * In HV mode, we setup both HPACA and PACA to avoid problems
>  	 * if we do a GET_PACA() before the feature fixups have been
> -	 * applied
> +	 * applied.
> +	 *
> +	 * Normally you should test against CPU_FTR_HVMODE, but CPU features
> +	 * are not yet set up when we first reach here.
>  	 */
> -	if (early_cpu_has_feature(CPU_FTR_HVMODE))
> +	if (mfmsr() & MSR_HV)
>  		mtspr(SPRN_SPRG_HPACA, local_paca);
>  #endif
>  	mtspr(SPRN_SPRG_PACA, local_paca);
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index e05e6dd67ae6..2259da8e8685 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -285,18 +285,28 @@ void __init early_setup(unsigned long dt_ptr)
>  
>  	/* -------- printk is _NOT_ safe to use here ! ------- */
>  
> -	/* Try new device tree based feature discovery ... */
> -	if (!dt_cpu_ftrs_init(__va(dt_ptr)))
> -		/* Otherwise use the old style CPU table */
> -		identify_cpu(0, mfspr(SPRN_PVR));
> +	/*
> +	 * Assume we're on cpu 0 for now.
> +	 *
> +	 * We need to load a PACA very early if we are using kcov. kcov will
> +	 * call in_task() in its instrumentation, which relies on the current
> +	 * task from the PACA. dt_cpu_ftrs_init is coveraged-enabled and also
> +	 * calls into the coverage-enabled generic dt library.
> +	 *
> +	 * Set up a temporary paca. It is going to be replaced below.
> +	 */
>  
> -	/* Assume we're on cpu 0 for now. Don't write to the paca yet! */
>  	initialise_paca(&boot_paca, 0);
>  	setup_paca(&boot_paca);
>  	fixup_boot_paca();
>  
>  	/* -------- printk is now safe to use ------- */
>  
> +	/* Try new device tree based feature discovery ... */
> +	if (!dt_cpu_ftrs_init(__va(dt_ptr)))
> +		/* Otherwise use the old style CPU table */
> +		identify_cpu(0, mfspr(SPRN_PVR));
> +
>  	/* Enable early debugging if any specified (see udbg.h) */
>  	udbg_early_init();
>  
> -- 
> 2.20.1
