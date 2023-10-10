Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A3D7BF8F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 12:46:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GsNX9efb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Xcw1RMGz3c8x
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 21:46:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GsNX9efb;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4Xc30sxNz2ykV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 21:45:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1696934716;
	bh=Keye6tp09f7AaDHq21s2ZPcLTfXNXkaJSM26tkcvZns=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GsNX9efb9iY0prGMW73Nnj2xFLseuu4l7MCN1wgrNZDmeA+S6RNDOlNnD2F74dUgf
	 vz8QECYtcFm/dK2WZTyBng84y3YC+pjMqUNLPAdeU1+T4mhhZTW0ew/nQuSV7NpPLz
	 kNQSsL/MmeeJiWmRl6S1hPkejirK4ww6v8DbmbcPbgM3BvbPv/2MNkgKgPe5ezANIN
	 JGtpQJC74sCjuuAKv3l3H19pOubSP+3xvvpGysgB1iuBQq18SuQpc3UvygEwvKCcTg
	 jrtHxcqN58MAtgbyod/FQiXGd7QJ1pi1mnTyk4KqRZCmd7Nin3BVFdcox+7OaXGr1H
	 V1oWgFlnJ7fuQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S4Xbw1xFYz4xWL;
	Tue, 10 Oct 2023 21:45:14 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/85xx: Fix math emulation exception
In-Reply-To: <066caa6d9480365da9b8ed83692d7101e10ac5f8.1695657339.git.christophe.leroy@csgroup.eu>
References: <066caa6d9480365da9b8ed83692d7101e10ac5f8.1695657339.git.christophe.leroy@csgroup.eu>
Date: Tue, 10 Oct 2023 21:45:10 +1100
Message-ID: <8734yisqmh.fsf@mail.lhotse>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Booting mpc85xx_defconfig kernel on QEMU leads to:

What machine/CPU model are you using for that?

I tried ppce500/e500 and that is working OK for me, ie. boots to
userspace and I see math instructions being emulated via the emulated
stats.

cheers

> Bad trap at PC: fe9bab0, SR: 2d000, vector=800
> awk[82]: unhandled trap (5) at 0 nip fe9bab0 lr fe9e01c code 5 in libc-2.27.so[fe5a000+17a000]
> awk[82]: code: 3aa00000 3a800010 4bffe03c 9421fff0 7ca62b78 38a00000 93c10008 83c10008
> awk[82]: code: 38210010 4bffdec8 9421ffc0 7c0802a6 <fc00048e> d8010008 4815190d 93810030
> Trace/breakpoint trap
> WARNING: no useful console
>
> This is because allthough CONFIG_MATH_EMULATION is selected,
> Exception 800 calls unknown_exception().
>
> Call emulation_assist_interrupt() instead.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/head_85xx.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/head_85xx.S b/arch/powerpc/kernel/head_85xx.S
> index 97e9ea0c7297..0f1641a31250 100644
> --- a/arch/powerpc/kernel/head_85xx.S
> +++ b/arch/powerpc/kernel/head_85xx.S
> @@ -395,7 +395,7 @@ interrupt_base:
>  #ifdef CONFIG_PPC_FPU
>  	FP_UNAVAILABLE_EXCEPTION
>  #else
> -	EXCEPTION(0x0800, FP_UNAVAIL, FloatingPointUnavailable, unknown_exception)
> +	EXCEPTION(0x0800, FP_UNAVAIL, FloatingPointUnavailable, emulation_assist_interrupt)
>  #endif
>  
>  	/* System Call Interrupt */
> -- 
> 2.41.0
