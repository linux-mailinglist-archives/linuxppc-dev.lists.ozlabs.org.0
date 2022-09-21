Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A10275BF4BC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 05:32:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXP9S4BjJz3c8p
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 13:32:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QllW7Kuq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXP8r34rCz30KY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 13:31:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QllW7Kuq;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MXP8k6WsCz4x3w;
	Wed, 21 Sep 2022 13:31:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1663731094;
	bh=4HpcQqZIzj8DPnTrQGNPcXfjgtEIID/jyjf05jicGfw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QllW7Kuqu2ofxNtm0RQKw9meQ6ywHITkO4UuSxqK7SQc8aMjGytsp7nMhNXfFq4uF
	 UnHPhBg3LYvxxfXk40jzVhQIKlkWJG9PtlYYSxSokB6LOxUhoF0WND0GKVxM+tvpHr
	 PgZgY6slJ/SlHcFxkk+OWJcE8LPKnp+Zl3PZI0W6Fto2VI2tW5d1rz8f3GizDg9slA
	 TGCjuviJzvMrucIt+rjGAcIX27HOViFez2NnGJOmupVtmzxct7FYxFHjTTrEAPQnzH
	 AcvjjSx7ISwYAaJWXv5bvcdU6MdChmzCjAaaUhr4Sb7UGR/SdeuW7F63QEqJZG4JaF
	 N8cxae2SY/w4A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/4] powerpc/64s: Add DEBUG_PAGEALLOC for radix
In-Reply-To: <20220921020213.868124-1-nicholas@linux.ibm.com>
References: <20220921020213.868124-1-nicholas@linux.ibm.com>
Date: Wed, 21 Sep 2022 13:31:34 +1000
Message-ID: <87czbp1jzd.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Miehlbradt <nicholas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Miehlbradt <nicholas@linux.ibm.com> writes:
> There is support for DEBUG_PAGEALLOC on hash but not on radix.
> Add support on radix.
>
> Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
> ---
> v2: Revert change to radix_memory_block_size, instead set the size
> in radix_init_pgtable and radix__create_section_mapping directly.
> ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index db2f3d193448..623455c195d8 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -30,6 +30,7 @@
>  #include <asm/trace.h>
>  #include <asm/uaccess.h>
>  #include <asm/ultravisor.h>
> +#include <asm/set_memory.h>
>  
>  #include <trace/events/thp.h>
>  
> @@ -332,6 +333,10 @@ static void __init radix_init_pgtable(void)
>  	unsigned long rts_field;
>  	phys_addr_t start, end;
>  	u64 i;
> +	unsigned long size = radix_mem_block_size;
> +
> +	if (debug_pagealloc_enabled())
> +		size = PAGE_SIZE;
>  
>  	/* We don't support slb for radix */
>  	slb_set_size(0);
> @@ -352,7 +357,7 @@ static void __init radix_init_pgtable(void)
>  		}
>  
>  		WARN_ON(create_physical_mapping(start, end,
> -						radix_mem_block_size,
> +						size,
>  						-1, PAGE_KERNEL));
>  	}

There's only two calls to create_physical_mapping().

Both pass the same value for size, and now both needed updating for
debug page alloc.

Seems like create_physical_mapping() doesn't need the size passed to it
at all, it may as well just use the right value.

> @@ -844,13 +849,18 @@ int __meminit radix__create_section_mapping(unsigned long start,
>  					    unsigned long end, int nid,
>  					    pgprot_t prot)
>  {
> +	unsigned long size = radix_mem_block_size;
> +
> +	if (debug_pagealloc_enabled())
> +		size = PAGE_SIZE;
> +
>  	if (end >= RADIX_VMALLOC_START) {
>  		pr_warn("Outside the supported range\n");
>  		return -1;
>  	}
>  
>  	return create_physical_mapping(__pa(start), __pa(end),
> -				       radix_mem_block_size, nid, prot);
> +				       size, nid, prot);
>  }

cheers
