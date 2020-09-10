Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AB22655DC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 01:57:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnbRc1wXSzDqcM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 09:57:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnbPm3QHYzDqWc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 09:56:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=fiF0C/7y; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BnbPl66bTz9sTH;
 Fri, 11 Sep 2020 09:56:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1599782172;
 bh=fhFJZ8tEpaeqeNQqQJBDCnkVPmjyjoBOeg1MMkx7t98=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fiF0C/7y/PY6O3hcXo1Lr0G8h2KUoVOQ0yVIE95pe3SzigpO7zLBaU0q7fC52lQHE
 fDUggJ33LnNs+9gSvqqzLLLfb5FBEou6AgsTAkNP8Kw6cP0RBT5OFuFVmXly5iGAq6
 gu4ynJxXjgXP7uc6eJs6G3p/JctST3uW7jly9pOqoofjEgHRsK8DxCKyttV8upoKgq
 R/UQplVajVpJdw0Od7AmphrWhKG4QyireE9PHNQqxnIL6TNJDu2UXMU9CB/pAjASSH
 l8GnvM2fyZZ/+ewjYZlQVdYudyZ/dgbEgWOATDzulYjrbbe6gRrPj1Tt1QWvph2+TH
 df2raJL1uDicw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/powermac: Fix low_sleep_handler with KUAP and KUEP
In-Reply-To: <74472ea2a7e8698273643cde7d382bd9f31cd1dd.1598945727.git.christophe.leroy@csgroup.eu>
References: <74472ea2a7e8698273643cde7d382bd9f31cd1dd.1598945727.git.christophe.leroy@csgroup.eu>
Date: Fri, 11 Sep 2020 09:56:10 +1000
Message-ID: <871rj9rxt1.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> low_sleep_handler() has an hardcoded restore of segment registers
> that doesn't take KUAP and KUEP into account.
>
> Use head_32's load_segment_registers() routine instead.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Fixes: a68c31fc01ef ("powerpc/32s: Implement Kernel Userspace Access Protection")
> Fixes: 31ed2b13c48d ("powerpc/32s: Implement Kernel Userspace Execution Prevention.")
> Cc: stable@vger.kernel.org
> ---
>  arch/powerpc/platforms/powermac/sleep.S | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

Doesn't build? pmac32_defconfig, gcc 9.3.0:

ld: arch/powerpc/platforms/powermac/sleep.o: in function `core99_wake_up':
(.text+0x25c): undefined reference to `load_segment_registers'

Missing _GLOBAL() presumably?

cheers

> diff --git a/arch/powerpc/platforms/powermac/sleep.S b/arch/powerpc/platforms/powermac/sleep.S
> index f9a680fdd9c4..51bfdfe85058 100644
> --- a/arch/powerpc/platforms/powermac/sleep.S
> +++ b/arch/powerpc/platforms/powermac/sleep.S
> @@ -294,14 +294,7 @@ grackle_wake_up:
>  	 * we do any r1 memory access as we are not sure they
>  	 * are in a sane state above the first 256Mb region
>  	 */
> -	li	r0,16		/* load up segment register values */
> -	mtctr	r0		/* for context 0 */
> -	lis	r3,0x2000	/* Ku = 1, VSID = 0 */
> -	li	r4,0
> -3:	mtsrin	r3,r4
> -	addi	r3,r3,0x111	/* increment VSID */
> -	addis	r4,r4,0x1000	/* address of next segment */
> -	bdnz	3b
> +	bl	load_segment_registers
>  	sync
>  	isync
>  
> -- 
> 2.25.0
