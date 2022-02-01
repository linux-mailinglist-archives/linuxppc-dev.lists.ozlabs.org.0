Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1484A5B5F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 12:45:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp35M3VYRz3cNP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 22:45:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hJczMQJP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp34m4YdDz2xb8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 22:44:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hJczMQJP; 
 dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix)
 id 4Jp34m3VCBz4xcR; Tue,  1 Feb 2022 22:44:40 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Jp34m1B4Gz4xRB;
 Tue,  1 Feb 2022 22:44:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1643715880;
 bh=Div0dp+UpQIo3Vf7ZlAvG8IPgpk+h1RoZk/o67WPt4s=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=hJczMQJPVKOWPIv/B+VI1ke5WCwy8ycrRv0h5WoCg3GIO/l+MldbTEYsm0YZ8VQDB
 hWPsQHOsQlM4OChkJwyM6mtpsv/Iwt4Ioxqg41dr5LaCQFsflP10mtzuP3g5hbbLHE
 wejeVatJ6V7wpGKIQLFMzLRpnIDFn8zahXI3vcS//sNVDDgzrPkRbUKJggvRXluE+T
 QM27ONIR5i+W+plY2yHwuv4NEavdGNWGHVLX+GKIE1PyW7Vks4tJkdrbOc/nkE6h39
 tdouL/MwpAuvQ2/25CId2pgdvFxGDH89nm4oyf/VB8l89b12BjAk28xyCdN0eb0CDp
 0GNPKOwQzT3XQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: powerpc: Set crashkernel offset to mid of RMA region
In-Reply-To: <20220128100445.251233-1-sourabhjain@linux.ibm.com>
References: <20220128100445.251233-1-sourabhjain@linux.ibm.com>
Date: Tue, 01 Feb 2022 22:44:36 +1100
Message-ID: <87r18mn74r.fsf@mpe.ellerman.id.au>
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
Cc: mahesh@linux.vnet.ibm.com, hbathini@linux.ibm.com,
 Abdul haleem <abdhalee@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sourabh Jain <sourabhjain@linux.ibm.com> writes:
> On large config LPARs (having 192 and more cores), Linux fails to boot
> due to insufficient memory in the first memblock. It is due to the
> memory reservation for the crash kernel which starts at 128MB offset of
> the first memblock. This memory reservation for the crash kernel doesn't
> leave enough space in the first memblock to accommodate other essential
> system resources.
>
> The crash kernel start address was set to 128MB offset by default to
> ensure that the crash kernel get some memory below the RMA region which
> is used to be of size 256MB. But given that the RMA region size can be
> 512MB or more, setting the crash kernel offset to mid of RMA size will
> leave enough space for kernel to allocate memory for other system
> resources.
>
> Since the above crash kernel offset change is only applicable to the LPAR
> platform, the LPAR feature detection is pushed before the crash kernel
> reservation. The rest of LPAR specific initialization will still
> be done during pseries_probe_fw_features as usual.
>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Reported-and-tested-by: Abdul haleem <abdhalee@linux.vnet.ibm.com>
>
> ---
>  arch/powerpc/kernel/rtas.c |  4 ++++
>  arch/powerpc/kexec/core.c  | 15 +++++++++++----
>  2 files changed, 15 insertions(+), 4 deletions(-)
>
>  ---
>  Change in v3:
> 	Dropped 1st and 2nd patch from v2. 1st and 2nd patch from v2 patch
> 	series [1] try to discover 1T segment MMU feature support
> 	BEFORE boot CPU paca allocation ([1] describes why it is needed).
> 	MPE has posted a patch [2] that archives a similar objective by moving
> 	boot CPU paca allocation after mmu_early_init_devtree().
>
> NOTE: This patch is dependent on the patch [2].
>
> [1] https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20211018084434.217772-3-sourabhjain@linux.ibm.com/
> [2] https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-January/239175.html
>  ---
>
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 733e6ef36758..06df7464fb57 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -1313,6 +1313,10 @@ int __init early_init_dt_scan_rtas(unsigned long node,
>  	entryp = of_get_flat_dt_prop(node, "linux,rtas-entry", NULL);
>  	sizep  = of_get_flat_dt_prop(node, "rtas-size", NULL);
>  
> +	/* need this feature to decide the crashkernel offset */
> +	if (of_get_flat_dt_prop(node, "ibm,hypertas-functions", NULL))
> +		powerpc_firmware_features |= FW_FEATURE_LPAR;
> +

As you'd have seen this breaks the 32-bit build. It will need an #ifdef
CONFIG_PPC64 around it.

>  	if (basep && entryp && sizep) {
>  		rtas.base = *basep;
>  		rtas.entry = *entryp;
> diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
> index 8b68d9f91a03..abf5897ae88c 100644
> --- a/arch/powerpc/kexec/core.c
> +++ b/arch/powerpc/kexec/core.c
> @@ -134,11 +134,18 @@ void __init reserve_crashkernel(void)
>  	if (!crashk_res.start) {
>  #ifdef CONFIG_PPC64
>  		/*
> -		 * On 64bit we split the RMO in half but cap it at half of
> -		 * a small SLB (128MB) since the crash kernel needs to place
> -		 * itself and some stacks to be in the first segment.
> +		 * On the LPAR platform place the crash kernel to mid of
> +		 * RMA size (512MB or more) to ensure the crash kernel
> +		 * gets enough space to place itself and some stack to be
> +		 * in the first segment. At the same time normal kernel
> +		 * also get enough space to allocate memory for essential
> +		 * system resource in the first segment. Keep the crash
> +		 * kernel starts at 128MB offset on other platforms.
>  		 */
> -		crashk_res.start = min(0x8000000ULL, (ppc64_rma_size / 2));
> +		if (firmware_has_feature(FW_FEATURE_LPAR))
> +			crashk_res.start = ppc64_rma_size / 2;
> +		else
> +			crashk_res.start = min(0x8000000ULL, (ppc64_rma_size / 2));

I think this will break on machines using Radix won't it? At this point
in boot ppc64_rma_size will be == 0. Because we won't call into 
hash__setup_initial_memory_limit().

That's not changed by your patch, but seems like this code needs to be
more careful/clever.

cheers

>  #else
>  		crashk_res.start = KDUMP_KERNELBASE;
>  #endif
> -- 
> 2.34.1
