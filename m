Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 560683DF90E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 02:54:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfYD81HCZz3cRc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 10:54:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SecjGxb4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=SecjGxb4; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfYCk5JQXz2yXs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 10:54:09 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GfYCg5V6nz9s5R;
 Wed,  4 Aug 2021 10:54:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1628038448;
 bh=ZBaaN+tHPwpLYY+UfYI00dZzEufAibCKvfz+hWbOPT8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SecjGxb4zhSK/gvdLmqKFw1IObeowXLCrXHbse9GzKj3Ujnp4pPaxQiQ2do9cGDFJ
 q79FFv5+8WEH1jFVUanj6Mob5W/7BhNZc5XS0lyBzoO06GntTYDE2+6U0gHXZNhN2s
 NNb1h4//1FAyuf7c+bgmtyT1nXF2KgY12kaetCTEzyo0wcT31T7RIXHaeMKBeH3GDA
 843YqXp8YhqEwVmxGj4YaBk9loKPGf7K2923QVx50MYuGyv4qJ4JmTTdinaNYvGLX8
 LTV0n3kjj3VKiJ3FUIqVDa3QhsRvl198z3za6WSj9CYzbtvGTEdHInVdKYawEWQuDj
 Adlu0iS1k34gA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] cpuidle: pseries: Mark pseries_idle_proble() as __init
In-Reply-To: <20210803211547.1093820-1-nathan@kernel.org>
References: <20210803211547.1093820-1-nathan@kernel.org>
Date: Wed, 04 Aug 2021 10:54:04 +1000
Message-ID: <87lf5ini6r.fsf@mpe.ellerman.id.au>
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linux-pm@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Chancellor <nathan@kernel.org> writes:
> After commit 7cbd631d4dec ("cpuidle: pseries: Fixup CEDE0 latency only
> for POWER10 onwards"), pseries_idle_probe() is no longer inlined when
> compiling with clang, which causes a modpost warning:
>
> WARNING: modpost: vmlinux.o(.text+0xc86a54): Section mismatch in
> reference from the function pseries_idle_probe() to the function
> .init.text:fixup_cede0_latency()
> The function pseries_idle_probe() references
> the function __init fixup_cede0_latency().
> This is often because pseries_idle_probe lacks a __init
> annotation or the annotation of fixup_cede0_latency is wrong.
>
> pseries_idle_probe() is a non-init function, which calls
> fixup_cede0_latency(), which is an init function, explaining the
> mismatch. pseries_idle_probe() is only called from
> pseries_processor_idle_init(), which is an init function, so mark
> pseries_idle_probe() as __init so there is no more warning.
>
> Fixes: 054e44ba99ae ("cpuidle: pseries: Add function to parse extended CEDE records")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/cpuidle/cpuidle-pseries.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I don't see this in my builds for some reason, but I guess toolchain or
config differences probably explain it.

Regardless, the patch is correct so I'll pick it up, thanks.

cheers

> diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
> index bba449b77641..7e7ab5597d7a 100644
> --- a/drivers/cpuidle/cpuidle-pseries.c
> +++ b/drivers/cpuidle/cpuidle-pseries.c
> @@ -403,7 +403,7 @@ static void __init fixup_cede0_latency(void)
>   * pseries_idle_probe()
>   * Choose state table for shared versus dedicated partition
>   */
> -static int pseries_idle_probe(void)
> +static int __init pseries_idle_probe(void)
>  {
>  
>  	if (cpuidle_disable != IDLE_NO_OVERRIDE)
>
> base-commit: a6cae77f1bc89368a4e2822afcddc45c3062d499
> -- 
> 2.33.0.rc0
