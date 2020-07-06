Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 816A02152D8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 09:04:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0c4K0X5VzDqjx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 17:04:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0c2X067lzDqLJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 17:02:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=YePjvUcz; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B0c2W4pxpz9sDX;
 Mon,  6 Jul 2020 17:02:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594018947;
 bh=W+eGqg/7z6WFw/rQ5tJzg+7Dp/iEy7W8uSEBXQ4Znyo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=YePjvUczpyxtkOp9F4ppDsgTXWlGhf+BdF58fpqAjs5f9OWvUkjT/yawVg84faA7m
 TC9LDhmVXaG31I2eu+69nVlS2FdllwKR9prWSY89WDjl/yCnDwZyl+liaq2Ux5QtaA
 uQNzlE3t4N1ZuwgF7+o3TXMPPUwNWfMZqt6fgiVScROYMv6avpV/CdC01DSyy8pw2g
 qJTOtxWXMkOn8Mx7Uiz3i4OQKWBPKbgli1IGkEunKtW8QalHEHm7zXMoPiNBF2dlS8
 VIzo0NRsV9c6a9SxUryhNTepmtHIiB8eTxLlhM14KGXGPcFt+ru6mDgZWR6jVgHg81
 IAdrWE72mNolw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 10/26] powerpc/book3s64/pkeys: Convert pkey_total to
 max_pkey
In-Reply-To: <20200619135850.47155-11-aneesh.kumar@linux.ibm.com>
References: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
 <20200619135850.47155-11-aneesh.kumar@linux.ibm.com>
Date: Mon, 06 Jul 2020 17:04:39 +1000
Message-ID: <87tuyl5dko.fsf@mpe.ellerman.id.au>
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
> max_pkey now represents max key value that userspace can allocate.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/pkeys.h |  7 +++++--
>  arch/powerpc/mm/book3s64/pkeys.c | 14 +++++++-------
>  2 files changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
> index 75d2a2c19c04..652bad7334f3 100644
> --- a/arch/powerpc/include/asm/pkeys.h
> +++ b/arch/powerpc/include/asm/pkeys.h
> @@ -12,7 +12,7 @@
>  #include <asm/firmware.h>
>  
>  DECLARE_STATIC_KEY_FALSE(pkey_disabled);
> -extern int pkeys_total; /* total pkeys as per device tree */
> +extern int max_pkey;
>  extern u32 initial_allocation_mask; /*  bits set for the initially allocated keys */
>  extern u32 reserved_allocation_mask; /* bits set for reserved keys */
>  
> @@ -44,7 +44,10 @@ static inline int vma_pkey(struct vm_area_struct *vma)
>  	return (vma->vm_flags & ARCH_VM_PKEY_FLAGS) >> VM_PKEY_SHIFT;
>  }
>  
> -#define arch_max_pkey() pkeys_total
> +static inline int arch_max_pkey(void)
> +{
> +	return max_pkey;
> +}

If pkeys_total = 32 then max_pkey = 31.

So we can't just substitute one for the other. ie. arch_max_pkey() must
have been wrong, or it is wrong now.

> diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
> index 87d882a9aaf2..a4d7287082a8 100644
> --- a/arch/powerpc/mm/book3s64/pkeys.c
> +++ b/arch/powerpc/mm/book3s64/pkeys.c
> @@ -14,7 +14,7 @@
>  
>  DEFINE_STATIC_KEY_FALSE(pkey_disabled);
>  DEFINE_STATIC_KEY_FALSE(execute_pkey_disabled);
> -int  pkeys_total;		/* Total pkeys as per device tree */
> +int  max_pkey;			/* Maximum key value supported */
>  u32  initial_allocation_mask;   /* Bits set for the initially allocated keys */
>  /*
>   *  Keys marked in the reservation list cannot be allocated by  userspace
> @@ -84,7 +84,7 @@ static int scan_pkey_feature(void)
>  
>  static int pkey_initialize(void)
>  {
> -	int os_reserved, i;
> +	int pkeys_total, i;
>  
>  	/*
>  	 * We define PKEY_DISABLE_EXECUTE in addition to the arch-neutral
> @@ -122,12 +122,12 @@ static int pkey_initialize(void)
>  	 * The OS can manage only 8 pkeys due to its inability to represent them
>  	 * in the Linux 4K PTE. Mark all other keys reserved.
>  	 */
> -	os_reserved = pkeys_total - 8;
> +	max_pkey = min(8, pkeys_total);

Shouldn't it be 7 ?

>  #else
> -	os_reserved = 0;
> +	max_pkey = pkeys_total;
>  #endif
>  
> -	if (unlikely((pkeys_total - os_reserved) <= execute_only_key)) {
> +	if (unlikely(max_pkey <= execute_only_key)) {

Isn't that an off-by-one now?

This is one-off boot time code, there's no need to clutter it with
unlikely.

>  		/*
>  		 * Insufficient number of keys to support
>  		 * execute only key. Mark it unavailable.
> @@ -174,10 +174,10 @@ static int pkey_initialize(void)
>  	default_uamor &= ~(0x3ul << pkeyshift(1));
>  
>  	/*
> -	 * Prevent the usage of OS reserved the keys. Update UAMOR
> +	 * Prevent the usage of OS reserved keys. Update UAMOR
>  	 * for those keys.
>  	 */
> -	for (i = (pkeys_total - os_reserved); i < pkeys_total; i++) {
> +	for (i = max_pkey; i < pkeys_total; i++) {

Another off-by-one? Shouldn't we start from max_pkey + 1 ?

>  		reserved_allocation_mask |= (0x1 << i);
>  		default_uamor &= ~(0x3ul << pkeyshift(i));
>  	}

cheers
