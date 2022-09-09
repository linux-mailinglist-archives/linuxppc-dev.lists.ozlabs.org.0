Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F085B2E4C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 07:51:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP4qs0VVtz3c3B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 15:51:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mJKWHof4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MP4q94NRjz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 15:51:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mJKWHof4;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MP4q84DQpz4xG8;
	Fri,  9 Sep 2022 15:51:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1662702660;
	bh=vKyV6C6r1Vi5eKElWQb5QtdxDDd96qiCzWYAs2H4YUY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mJKWHof4CSqXZLOVipIvr6x6eGaaAEKie5acaBsV85c5/8Ifp6xJ/hAnT7gGUaulU
	 QbxfpvYZ5YX9bdpKPUloKHGRjc7OYlOj6stC4FuRSdNsuwPn5wb3AVWs7KiMKyQvEi
	 ffsFJAXDlQ/GvEOpdfDGlxP8E5Hf61AVI6Iz3ujFNETqS1x/AVhcgsgyDUKis910Dq
	 SjVeJMBQUChE5YTBpv4j8QzNelOiExq9yYbxwXF0Y16qqGgVSBNBsrwkust69f4F5/
	 HvY/yfdAnRC+9Tw9BqrdwFhbEGZj69ems6yaAkgWsCmw1JeGGFTEFvrpJcK5UOwdHd
	 yote03Gma68dQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH v1 02/19] powerpc/64e: Tie PPC_BOOK3E_64 to PPC_E500MC
In-Reply-To: <f2d30eb7fadcfd89f7ac3784cb0b4a4b47d47db1.1662658653.git.christophe.leroy@csgroup.eu>
References: <4e7e6259e5af0e0e171f19ee1f85ab5b2553723f.1662658653.git.christophe.leroy@csgroup.eu>
 <f2d30eb7fadcfd89f7ac3784cb0b4a4b47d47db1.1662658653.git.christophe.leroy@csgroup.eu>
Date: Fri, 09 Sep 2022 15:50:53 +1000
Message-ID: <87r10ldrk2.fsf@mpe.ellerman.id.au>
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

Hi Christophe,

Thanks for trying to clean up this tangled mess.

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> The only 64-bit Book3E CPUs we support is the e500mc.

AFAIK the e500mc is 32-bit?

We support e5500 and e6500 which are 64-bit Book3E.

They're derivatives of the e500mc AIUI.

So CONFIG_PPC_E500MC actually means e500mc *and later derivatives*.

You can see that with eg:

config SPE_POSSIBLE
	def_bool y
	depends on E500 && !PPC_E500MC

Because e500mc dropped SPE, and so therefore e5500 and e6500 don't have
it either.

And eg:

#ifdef CONFIG_PPC_E500MC
_GLOBAL(__setup_cpu_e6500)
	mflr	r6


> However our Kconfig allows configurating a kernel that has 64-bit
> Book3E support, but no e500mc support enabled. Such a kernel
> would never boot, it doesn't know about any CPUs.

That is true.

> To fix this, force e500mc to be selected whenever we are
> building a 64-bit Book3E kernel.

I think that's a reasonable fix, just it's important to differentiate
between CONFIG_PPC_E500MC (the symbol) and e500mc (the CPU).

> And add a test to detect futur situations where cpu_specs is empty.
                           future
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/cputable.c         | 2 ++
>  arch/powerpc/platforms/Kconfig.cputype | 2 ++
>  2 files changed, 4 insertions(+)
>
..
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 5185d942b455..19fd95a06352 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -108,6 +108,8 @@ config PPC_BOOK3S_64
>  config PPC_BOOK3E_64
>  	bool "Embedded processors"
>  	select PPC_FSL_BOOK3E
> +	select E500
> +	select PPC_E500MC
>  	select PPC_FPU # Make it a choice ?
>  	select PPC_SMP_MUXED_IPI
>  	select PPC_DOORBELL

I think that makes the select of PPC_E500MC below redundant:

config PPC_QEMU_E500
	bool "QEMU generic e500 platform"
	select DEFAULT_UIMAGE
	select E500
	select PPC_E500MC if PPC64


cheers
