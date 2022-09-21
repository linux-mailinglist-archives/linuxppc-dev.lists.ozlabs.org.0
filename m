Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B90F45BFE99
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 15:03:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXdrB4MClz3cFr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 23:03:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Fva9vD0s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXdqd2fRJz2yxQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 23:02:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Fva9vD0s;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MXdqb488Vz4xG7;
	Wed, 21 Sep 2022 23:02:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1663765357;
	bh=tVR1ERCIck0Y/ChkqfjA1TreIEUvGzhMF7W62nKahGc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Fva9vD0ssU2FUxkajpYcHjuMWl9N8zWDrV/aVcLriXoX3ZYSRLOPJgAkftVV3ovZN
	 w3WG05uyfBRed/OZa3/kwWAorpSOpzadjrWJkc3w1b74Sv0Mqepb8nR04a/Cq4RgWR
	 UlLJvW5oK9sNOnDaH4gytX+xeLkQf1B1UT1Cts3iXpdeHxTloX8uKys3i7z2JjHl9r
	 Z0Kbyiqv7MYaXdHkFPWz7IcMPmTdFKJErQYVv2vu029DEES/T6/7Xq0lzzGXOYoIT/
	 xDQYXX/USXSJAjBZgWJXuniGr9rB1KiJzL53BO1XG5alqgSNMsFto1kNH/W9Ffr/XI
	 OTi1tl6JvjzkQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] powerpc/prom_init: drop PROM_BUG()
In-Reply-To: <20220920122302.99195-3-david@redhat.com>
References: <20220920122302.99195-1-david@redhat.com>
 <20220920122302.99195-3-david@redhat.com>
Date: Wed, 21 Sep 2022 23:02:35 +1000
Message-ID: <877d1w2844.fsf@mpe.ellerman.id.au>
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Baoquan He <bhe@redhat.com>, David Hildenbrand <david@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, Dave Young <dyoung@redhat.com>, linux-doc@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>, linux-mm@kvack.org, David Laight <David.Laight@ACULAB.COM>, Nicholas Piggin <npiggin@gmail.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Hildenbrand <david@redhat.com> writes:
> Unused, let's drop it.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/powerpc/kernel/prom_init.c | 6 ------
>  1 file changed, 6 deletions(-)

Thanks. I'll take this one via the powerpc tree, and the others can go
via wherever?

cheers

> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index a6669c40c1db..d464ba412084 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -96,12 +96,6 @@ static int of_workarounds __prombss;
>  #define OF_WA_CLAIM	1	/* do phys/virt claim separately, then map */
>  #define OF_WA_LONGTRAIL	2	/* work around longtrail bugs */
>  
> -#define PROM_BUG() do {						\
> -        prom_printf("kernel BUG at %s line 0x%x!\n",		\
> -		    __FILE__, __LINE__);			\
> -	__builtin_trap();					\
> -} while (0)
> -
>  #ifdef DEBUG_PROM
>  #define prom_debug(x...)	prom_printf(x)
>  #else
> -- 
> 2.37.3
