Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F4B21580E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 15:10:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0mC54TwvzDqd7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 23:10:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0m8G234ZzDqZL
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 23:07:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mMLLnh6N; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B0m8F2kKVz9sQt;
 Mon,  6 Jul 2020 23:07:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594040877;
 bh=PwZfLcnH36kL1A2e34+V4qwasSVY7TJT1IpGNK4NNFw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mMLLnh6N9cefLytHjWEJQ9GEB6U6WY1rZyM1TcKxTi0dDZ9FRAFTLy1RyOi8IfwOe
 6ogpnCpuDE53G9AbkM4JeX2WPU2L1SdUiE5Bi4s9mAipRWrvOz1Dau/FDxGHwTh5sj
 MtZ4f2QkyllgXVYGbOgb5QED7aGR7DCvOctCwepmmgVtNLpuQTi999XjalzqLx+SCR
 9sD3pfQrlG2NXNJs6a6hoyNr3WtgMZFurRRvJW6w5PxUr8jT+h80/8RHAPxA1NYabI
 2eoy1GG5vZIm8L+y4fXnjGAwwHNz3Ye2+iPMI5unVx1AeCnJR7s7ObajHadxvdY5lj
 IzIqcUn1BYyrw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 13/26] powerpc/book3s64/pkeys: Enable MMU_FTR_PKEY
In-Reply-To: <20200619135850.47155-14-aneesh.kumar@linux.ibm.com>
References: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
 <20200619135850.47155-14-aneesh.kumar@linux.ibm.com>
Date: Mon, 06 Jul 2020 23:10:12 +1000
Message-ID: <878sfw6b7v.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxram@us.ibm.com,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> Parse storage keys related device tree entry in early_init_devtree
> and enable MMU feature MMU_FTR_PKEY if pkeys are supported.
>
> MMU feature is used instead of CPU feature because this enables us
> to group MMU_FTR_KUAP and MMU_FTR_PKEY in asm feature fixup code.

Subject should probably be "Add MMU_FTR_PKEY".

> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
> index f4ac25d4df05..72966d3d8f64 100644
> --- a/arch/powerpc/include/asm/mmu.h
> +++ b/arch/powerpc/include/asm/mmu.h
> @@ -23,6 +23,7 @@
>  
>  /* Radix page table supported and enabled */
>  #define MMU_FTR_TYPE_RADIX		ASM_CONST(0x00000040)
> +#define MMU_FTR_PKEY			ASM_CONST(0x00000080)

It's not a type, so it should be with the individual feature bits below:

>  /*
>   * Individual features below.

> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 6a3bac357e24..6d70797352d8 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -815,6 +815,11 @@ void __init early_init_devtree(void *params)
>  	/* Now try to figure out if we are running on LPAR and so on */
>  	pseries_probe_fw_features();
>  
> +	/*
> +	 * Initialize pkey features and default AMR/IAMR values
> +	 */
> +	pkey_early_init_devtree();

Not your fault, but the fact that we're having to do more and more
initialisation this early, based on the flat device tree, makes me
wonder if we need to rethink how we're doing the CPU/MMU feature setup.

> diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
> index 0ff59acdbb84..bbba9c601e14 100644
> --- a/arch/powerpc/mm/book3s64/pkeys.c
> +++ b/arch/powerpc/mm/book3s64/pkeys.c
> @@ -38,38 +39,45 @@ static int execute_only_key = 2;
>  #define PKEY_REG_BITS (sizeof(u64) * 8)
>  #define pkeyshift(pkey) (PKEY_REG_BITS - ((pkey+1) * AMR_BITS_PER_PKEY))
>  
> +static int __init dt_scan_storage_keys(unsigned long node,
> +				       const char *uname, int depth,
> +				       void *data)
> +{
> +	const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
> +	const __be32 *prop;
> +	int pkeys_total;
> +
> +	/* We are scanning "cpu" nodes only */
> +	if (type == NULL || strcmp(type, "cpu") != 0)
> +		return 0;
> +
> +	prop = of_get_flat_dt_prop(node, "ibm,processor-storage-keys", NULL);
> +	if (!prop)
> +		return 0;
> +	pkeys_total = be32_to_cpu(prop[0]);
> +	return pkeys_total;

That's not really the way the return value is meant to be used for these
scanning functions.

The usual return values are 0 to keep scanning and !0 means we've found
the node we're looking for and we should stop scanning.

Doing it this way means if you find 0 pkeys it will keep scanning.

Instead you should pass &pkeys_total as the data pointer and set that.

> +}
> +
>  static int scan_pkey_feature(void)
>  {
> -	u32 vals[2];
> -	int pkeys_total = 0;
> -	struct device_node *cpu;
> +	int pkeys_total;
>  
>  	/*
>  	 * Pkey is not supported with Radix translation.
>  	 */
> -	if (radix_enabled())
> +	if (early_radix_enabled())
>  		return 0;
>  
> -	cpu = of_find_node_by_type(NULL, "cpu");
> -	if (!cpu)
> -		return 0;
> +	pkeys_total = of_scan_flat_dt(dt_scan_storage_keys, NULL);
> +	if (pkeys_total == 0) {
>  
> -	if (of_property_read_u32_array(cpu,
> -				       "ibm,processor-storage-keys", vals, 2) == 0) {
> -		/*
> -		 * Since any pkey can be used for data or execute, we will
> -		 * just treat all keys as equal and track them as one entity.
> -		 */
> -		pkeys_total = vals[0];
> -		/*  Should we check for IAMR support FIXME!! */

???

> -	} else {

This loses the ability to differentiate between no storage-keys property
at all vs a property that specifies zero keys, which I don't think is a
good change.

>  		/*
>  		 * Let's assume 32 pkeys on P8 bare metal, if its not defined by device
>  		 * tree. We make this exception since skiboot forgot to expose this
>  		 * property on power8.
>  		 */
>  		if (!firmware_has_feature(FW_FEATURE_LPAR) &&
> -		    cpu_has_feature(CPU_FTRS_POWER8))
> +		    early_cpu_has_feature(CPU_FTRS_POWER8))
>  			pkeys_total = 32;

That's not how cpu_has_feature() works, we'll need to fix that.

cheers
