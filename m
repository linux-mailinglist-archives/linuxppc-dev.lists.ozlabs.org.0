Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 462892152FF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 09:19:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0cPd2DlrzDqjM
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 17:19:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0cN81fhhzDqZ3
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 17:17:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nAhhc5fk; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B0cN70XsGz9sRK;
 Mon,  6 Jul 2020 17:17:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594019863;
 bh=GzrsOKTJ4ago7zgMalL/i0IifdB2mqzPexELpUAegGY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=nAhhc5fkHKHvvTd/Hs/uJTjOA5kaAUXqLD15YdS6BA/igLlV73h/ApLWUlRxNMqF2
 kG5g3E0nEVTBaoBfUGSc6ZfIV79rqVOhCawZRhGMAS92j0mxoN0BuOPiBAATw1txE7
 NMGMXfOcCoj/d7rR1gddU9PuK6gUzF9L5DK6GjGjP3xSoXreZfo0ATqSsYWnntl+yK
 cKgE41PAzICZ3HUJnBGxIWJtkJYDj60Cslo9LQ+G1EW42MOGbQI93PizeiFLC73d/z
 hX9tMkJWSkiXYe5Hx1HH9MOtj19V4ESM2zi0qhJcmGSb0r0UbLPadFfzuNuzXyVZ6h
 BePDJl3MgkdyA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 08/26] powerpc/book3s64/pkeys: Convert execute key
 support to static key
In-Reply-To: <20200619135850.47155-9-aneesh.kumar@linux.ibm.com>
References: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
 <20200619135850.47155-9-aneesh.kumar@linux.ibm.com>
Date: Mon, 06 Jul 2020 17:19:58 +1000
Message-ID: <87o8ot5cv5.fsf@mpe.ellerman.id.au>
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
> Convert the bool to a static key like pkey_disabled.

I'm not convinced this is worth the added complexity of a static key.

It's not used in any performance critical paths, except for context
switch, but that's already guarded by:

	if (old_thread->iamr != new_thread->iamr)

Which should always be false on machines which don't have the execute
key enabled.

cheers

> diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
> index 9e68a08799ee..7d400d5a4076 100644
> --- a/arch/powerpc/mm/book3s64/pkeys.c
> +++ b/arch/powerpc/mm/book3s64/pkeys.c
> @@ -13,13 +13,13 @@
>  #include <linux/of_device.h>
>  
>  DEFINE_STATIC_KEY_TRUE(pkey_disabled);
> +DEFINE_STATIC_KEY_FALSE(execute_pkey_disabled);
>  int  pkeys_total;		/* Total pkeys as per device tree */
>  u32  initial_allocation_mask;   /* Bits set for the initially allocated keys */
>  /*
>   *  Keys marked in the reservation list cannot be allocated by  userspace
>   */
>  u32  reserved_allocation_mask;
> -static bool pkey_execute_disable_supported;
>  static u64 default_amr;
>  static u64 default_iamr;
>  /* Allow all keys to be modified by default */
> @@ -116,9 +116,7 @@ static int pkey_initialize(void)
>  	 * execute_disable support. Instead we use a PVR check.
>  	 */
>  	if (pvr_version_is(PVR_POWER7) || pvr_version_is(PVR_POWER7p))
> -		pkey_execute_disable_supported = false;
> -	else
> -		pkey_execute_disable_supported = true;
> +		static_branch_enable(&execute_pkey_disabled);
>  
>  #ifdef CONFIG_PPC_4K_PAGES
>  	/*
> @@ -214,7 +212,7 @@ static inline void write_amr(u64 value)
>  
>  static inline u64 read_iamr(void)
>  {
> -	if (!likely(pkey_execute_disable_supported))
> +	if (static_branch_unlikely(&execute_pkey_disabled))
>  		return 0x0UL;
>  
>  	return mfspr(SPRN_IAMR);
> @@ -222,7 +220,7 @@ static inline u64 read_iamr(void)
>  
>  static inline void write_iamr(u64 value)
>  {
> -	if (!likely(pkey_execute_disable_supported))
> +	if (static_branch_unlikely(&execute_pkey_disabled))
>  		return;
>  
>  	mtspr(SPRN_IAMR, value);
> @@ -282,7 +280,7 @@ int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
>  		return -EINVAL;
>  
>  	if (init_val & PKEY_DISABLE_EXECUTE) {
> -		if (!pkey_execute_disable_supported)
> +		if (static_branch_unlikely(&execute_pkey_disabled))
>  			return -EINVAL;
>  		new_iamr_bits |= IAMR_EX_BIT;
>  	}
> -- 
> 2.26.2
