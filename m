Return-Path: <linuxppc-dev+bounces-12752-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D292EBC9DC2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 17:50:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjDqP3jmSz3cZ5;
	Fri, 10 Oct 2025 02:50:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760025041;
	cv=none; b=Z2jw7rFSl8qEAGVTr4R9OU24FYWiKnM7EPamncrw5Ye3FJrUEPNf5nJMmaBHMBiEQGvz6sasTkRYdWIQcyhWOhpWros535yKAo+1gTYT/NbLRf/pnxXqsBut6bQhUTy9HwQl0HopsskTK0R5xCSjuKlR8kdeKsOpyizWSAH2pZyQadqJ2GJdhtIaHfdpMibX9O2dWIzkoHA4RJXdHWX0vDoIoAlofW0GARkGgivdUGbfFOURzccAiEOtRPONHKD+pNdm/MsiH8JwE7anyfNRjNm2xiNz1RK3ZKMNqqU4BImaFgKJEwMS7R22FK36XW/Kr6mrcbmtQi+jnDJZHqA7iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760025041; c=relaxed/relaxed;
	bh=f6gkggpRXgJRJgdcozPg2OBj2mJWRGbZyz54v47te0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=I9ny7mkgo/0L/qYW1TBiGfMIQVYeWAzl1t3HhRMN5WVYkDGjncGMmVZvFfiKy887icK7dTP14Lzslr+R5SUebbTXA5GHXH1MO5BTkJ4N3O8HYAhqp9mO06zn7B6YRWeYL1cyQnCMi8RDgLAB+MjOE1kxjU7+AqY4tEQQdX98aYWRB4QM9Awz8IOt8yICIa6370Z8AceTUcBcLISymhQsHVcOwgdGQISQxu4Ei4/cwkgwQmGd7dQFOQr1aUiPr4mbVDHuP0xUvCPeCmfe5mypU83B4dRDr5p9CyGUk2V3bF9ZpWqVHO6CaeVUcreJ8hcxt/W78eECDbuoEUSx58WX8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjDqN6xMBz2xnt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Oct 2025 02:50:40 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cjBBM5Gldz9sSj;
	Thu,  9 Oct 2025 15:51:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cibJcHzYGNup; Thu,  9 Oct 2025 15:51:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cjBBL4XM5z9sSY;
	Thu,  9 Oct 2025 15:51:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 880138B76D;
	Thu,  9 Oct 2025 15:51:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id b-ev3yzMf1dF; Thu,  9 Oct 2025 15:51:54 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3D3E58B768;
	Thu,  9 Oct 2025 15:51:54 +0200 (CEST)
Message-ID: <60593288-c747-42c5-b05d-27a81ab46021@csgroup.eu>
Date: Thu, 9 Oct 2025 15:51:54 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/addnote: Fix overflow on 32-bit builds
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <2025042122-mustard-wrasse-694572@boujee-and-buff>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <2025042122-mustard-wrasse-694572@boujee-and-buff>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 22/04/2025 à 04:31, Ben Collins a écrit :
> The PUT_64[LB]E() macros need to cast the value to unsigned long long
> like the GET_64[LB]E() macros. Caused lots of warnings when compiled
> on 32-bit, and clobbered addresses (36-bit P4080).
> 
> Signed-off-by: Ben Collins <bcollins@kernel.org>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/boot/addnote.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/boot/addnote.c b/arch/powerpc/boot/addnote.c
> index 53b3b2621457d..78704927453aa 100644
> --- a/arch/powerpc/boot/addnote.c
> +++ b/arch/powerpc/boot/addnote.c
> @@ -68,8 +68,8 @@ static int e_class = ELFCLASS32;
>   #define PUT_16BE(off, v)(buf[off] = ((v) >> 8) & 0xff, \
>   			 buf[(off) + 1] = (v) & 0xff)
>   #define PUT_32BE(off, v)(PUT_16BE((off), (v) >> 16L), PUT_16BE((off) + 2, (v)))
> -#define PUT_64BE(off, v)((PUT_32BE((off), (v) >> 32L), \
> -			  PUT_32BE((off) + 4, (v))))
> +#define PUT_64BE(off, v)((PUT_32BE((off), (unsigned long long)(v) >> 32L), \
> +			  PUT_32BE((off) + 4, (unsigned long long)(v))))
>   
>   #define GET_16LE(off)	((buf[off]) + (buf[(off)+1] << 8))
>   #define GET_32LE(off)	(GET_16LE(off) + (GET_16LE((off)+2U) << 16U))
> @@ -78,7 +78,8 @@ static int e_class = ELFCLASS32;
>   #define PUT_16LE(off, v) (buf[off] = (v) & 0xff, \
>   			  buf[(off) + 1] = ((v) >> 8) & 0xff)
>   #define PUT_32LE(off, v) (PUT_16LE((off), (v)), PUT_16LE((off) + 2, (v) >> 16L))
> -#define PUT_64LE(off, v) (PUT_32LE((off), (v)), PUT_32LE((off) + 4, (v) >> 32L))
> +#define PUT_64LE(off, v) (PUT_32LE((off), (unsigned long long)(v)), \
> +			  PUT_32LE((off) + 4, (unsigned long long)(v) >> 32L))
>   
>   #define GET_16(off)	(e_data == ELFDATA2MSB ? GET_16BE(off) : GET_16LE(off))
>   #define GET_32(off)	(e_data == ELFDATA2MSB ? GET_32BE(off) : GET_32LE(off))


