Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D73C0220CDA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 14:24:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6Gm26z9ZzDqSW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 22:24:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6Gjt3XvLzDqj1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 22:22:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mybKQfP/; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B6Gjs49tdz9s1x;
 Wed, 15 Jul 2020 22:22:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594815761;
 bh=Y8j90lrvJqU8LkgdUr74V2K/s7Gh4WhJQGlePVUnek8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mybKQfP/UVFZuhYRuLtxJsKUd4PMqXYvQ4BG43NxDXD67VzjEl65QG5gpw1vQvngE
 jB6+kGgkGsDvXAHjeQRGUosfNu94A+eBAOKyUhFoEsAluH5GM14CZZFqNQIv2y3zXz
 IN4QrF9YEhOlYFNAnbye0ZO3jQnYak96lX4fvR81V8BRBakvbizOJW2mXXha5ISDj8
 s+YufzfAcVsYd3QnoMnbLgphqPZyGrJRWrUt2IHz1kcG3fG2hFLyDmpTm57KIO91e1
 Wolmts2eLiKj4cQtbm37OqhXF0gZ1TWjRDj6+aCkLDZya2EBcL8aOiuz13Aj/30cjI
 PhHN5cZA0tOlg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Anton Blanchard <anton@ozlabs.org>, benh@kernel.crashing.org,
 paulus@samba.org, nathanl@linux.ibm.com
Subject: Re: [PATCH] pseries: Fix 64 bit logical memory block panic
In-Reply-To: <20200715000820.1255764-1-anton@ozlabs.org>
References: <20200715000820.1255764-1-anton@ozlabs.org>
Date: Wed, 15 Jul 2020 22:22:35 +1000
Message-ID: <87365tufw4.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Anton Blanchard <anton@ozlabs.org> writes:
> Booting with a 4GB LMB size causes us to panic:
>
>   qemu-system-ppc64: OS terminated: OS panic:
>       Memory block size not suitable: 0x0
>
> Fix pseries_memory_block_size() to handle 64 bit LMBs.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Anton Blanchard <anton@ozlabs.org>
> ---
>  arch/powerpc/platforms/pseries/hotplug-memory.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index 5ace2f9a277e..6574ac33e887 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -27,7 +27,7 @@ static bool rtas_hp_event;
>  unsigned long pseries_memory_block_size(void)
>  {
>  	struct device_node *np;
> -	unsigned int memblock_size = MIN_MEMORY_BLOCK_SIZE;
> +	uint64_t memblock_size = MIN_MEMORY_BLOCK_SIZE;

I changed it to u64.

cheers
