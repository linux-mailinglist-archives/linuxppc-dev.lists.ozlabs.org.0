Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0365BC348
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 09:01:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWFvH3qykz304j
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 17:00:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=W6354r2I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWFth1Dwhz2xG7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 17:00:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=W6354r2I;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MWFtg2fTVz4xG6;
	Mon, 19 Sep 2022 17:00:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1663570827;
	bh=L3tem0uADoiBYbot/yv8uOZ06CEW/rqksjEmxUFy8JA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=W6354r2IURC4zxaDy7TGapraIndtbH0YNRIzO+Rz1+dW1QP3p1Wh2OuO2lQ/2Zedl
	 rOID+eIoFYbHq1CdRaMtF1cdxu72yf3nnbMS/mUChw0128UIXyGAPB/SrIyhgLFKrd
	 MCf2Bnd5tw5R394i0qyTBi6UJB+ZJgq+xvgE0CUpjecAK16PlOptnjCQGGXZXiT98v
	 a4H7T/d1Wh0SQH3mwcic84M/ORUAr9zIqw2Ebklm10zONqi/w3ikxpgpdUmOdhqia2
	 LEvBO8C4eKEUZ+V13AOe/Djj4NlbLlMnEc2JgSXp/gop3bBxBXHx9rrg0dqZupek4q
	 g06Llsx9fP4dw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/4] powerpc/64s: Add DEBUG_PAGEALLOC for radix
In-Reply-To: <20220919014437.608167-1-nicholas@linux.ibm.com>
References: <20220919014437.608167-1-nicholas@linux.ibm.com>
Date: Mon, 19 Sep 2022 17:00:26 +1000
Message-ID: <87k05zlugl.fsf@mpe.ellerman.id.au>
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
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index db2f3d193448..483c99bfbde5 100644
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
> @@ -503,6 +504,9 @@ static unsigned long __init radix_memory_block_size(void)
>  {
>  	unsigned long mem_block_size = MIN_MEMORY_BLOCK_SIZE;
>  
> +	if (debug_pagealloc_enabled())
> +		return PAGE_SIZE;
> +
>  	/*
>  	 * OPAL firmware feature is set by now. Hence we are ok
>  	 * to test OPAL feature.
> @@ -519,6 +523,9 @@ static unsigned long __init radix_memory_block_size(void)
>  
>  static unsigned long __init radix_memory_block_size(void)
>  {
> +	if (debug_pagealloc_enabled())
> +		return PAGE_SIZE;
> +
>  	return 1UL * 1024 * 1024 * 1024;
>  }
  
This value ends up in radix_mem_block_size, which is returned by 
pnv_memory_block_size(), which is wired up as ppc_md.memory_block_size,
and that's called by memory_block_size_bytes().

And I thought that value had to be >= MIN_MEMORY_BLOCK_SIZE.

#define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
#define SECTION_SIZE_BITS       24


I would expect us to hit the panic in memory_dev_init().

So that's odd.

I suspect you need to leave radix_memory_block_size() alone, or at least
make sure you return MIN_MEMORY_BLOCK_SIZE when debug page alloc is
enabled.

We probably need a separate variable that holds the max page size used
for the linear mapping, and that would then be 1G in the normal case or
PAGE_SIZE in the debug page alloc case.

cheers
