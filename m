Return-Path: <linuxppc-dev+bounces-8548-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5607FAB60A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 04:06:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxxY46H31z2ypW;
	Wed, 14 May 2025 12:06:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747188408;
	cv=none; b=NelJbzFdvbadtQmdduPRqn2MGrQRPg89HNgrUvRx0l5ieUSxQPu9LaHKBwamWStwzdm0JK2Kq9XsRg9YumP6aleCS07SZfOZcJuvfOjjWpGZ+PiE1BqKkbqqCKDW2Te5otEQFPKjQFhL1LZriB0iDR2x2rrS12donJ36TXyhHsRh8pZidl62lXOxjHEimT43bhj5WJlSAKbS++QklsMqHpv7YHSXoJMgUPtx0WojW4Lunb6eitdRinMEmRgtEGzYoyaoL9deAJPnMHgMFWzqxf0nF/fBG6m8jnC+rVVGQ5AueQM0NyENmZ+FH4sFK/91FKJ28RTLoBlQfbB14KgpVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747188408; c=relaxed/relaxed;
	bh=yvY/bm6Hh4NE0YBVK462WGTKf5v0RX9ZOLr04MIqrk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kw4tX9/DXr1YXdzlmv3/OWXubrBL8T26rwdb0XEfB+YhE0fJPlWu15YzivM3dRCLEqGcQat3c9g6WwPDJWJIp/AkEa4Sw9PPiUGno5r2jmtTxZtVi3JTI5ZfpyYov3YhM38/MNQm3WG+usSHSHX1Qs3CRZiLW6HV6o3Dp6Hcah+dB1s+sqJra6ngKZhCClzB83NhS7hHs6kFOISMwlk+pMnONR/gVMe53IedNZd3hen4OPVrXybypRAD06MPOVEZZmcsaS/GNmTw/LCkV9SIGSUHgUVEMD+abuv/RsWBdXjqH4gCFdqlCWXW64kHopO0KfxjLynqPFqGakkenAb2Hg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=fPVD0oWU; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=paulus@gandalf.ozlabs.org; receiver=lists.ozlabs.org) smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=fPVD0oWU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gandalf.ozlabs.org (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=paulus@gandalf.ozlabs.org; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxxY355FXz2ydj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 12:06:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1747188407;
	bh=yvY/bm6Hh4NE0YBVK462WGTKf5v0RX9ZOLr04MIqrk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fPVD0oWUWRwtpP5n4Mb8XhRtcp2h+NmgNOVi6yn/WXTGneOhqZ8npeGg7Y2jsbRR9
	 L19Wv8iXaU8SmGWEz41/G8+ovi3JRdFJW6tlNRyMmKQ2BOU7b4kmgk/gEE2ax1T8Z1
	 YrHmZ9ajvJZ6Hen+HR4nDOxf8rtN+KX/S/2cVrqfyLHzevEy8KXkSAuT9D6wUPHJt5
	 erwi6KHqj/SMsMxZbv9FmDAm1T6Z04yibEag1IlpoiLRHd+5jfUAMdAwyl9ewzlDvS
	 NtNk+IcEmEtuxSNjRnnr+//wIj0i6IvQPKLaOonWBi8ugCRydeLlnRwRdwqnZ+NqxB
	 Nh60wqd2xJeZg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4ZxxY33w9lz4xPF; Wed, 14 May 2025 12:06:47 +1000 (AEST)
Date: Wed, 14 May 2025 12:06:41 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Crash in __do_IRQ with gcc 15
Message-ID: <aCP6sXStzfplyvXm@bruin>
References: <aB6teOoVLWkdvyBu@bruin>
 <4a2c63a7-4ed2-47c5-b5f7-19e323c267f5@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a2c63a7-4ed2-47c5-b5f7-19e323c267f5@linux.ibm.com>
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, May 11, 2025 at 06:32:25PM +0530, Madhavan Srinivasan wrote:
> 
> Can you try with this patch, I am testing this in my setup.
> 
> Maddy
> 
> 
> diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
> index a0e8b998c9b5..2ce7a4f2b2fb 100644
> --- a/arch/powerpc/kernel/irq.c
> +++ b/arch/powerpc/kernel/irq.c
> @@ -276,7 +276,11 @@ static __always_inline void call_do_irq(struct pt_regs *regs, void *sp)
>                    [callee] "i" (__do_irq)
>                  : // Clobbers
>                    "lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6",
> +#if __GNUC__ >= 15
> +                  "cr7", "r0", "r2", "r4", "r5", "r6", "r7", "r8", "r9", "r10",
> +#else
>                    "cr7", "r0", "r4", "r5", "r6", "r7", "r8", "r9", "r10",
> +#endif
>                    "r11", "r12"
>         );
>  }

That works as long as I have CONFIG_PPC_KERNEL_PCREL enabled, but with
it disabled, it fails to compile.  With PCREL disabled, the kernel
runs just fine without the r2 clobber.  I guess it needs to be:

#if __GNUC__ >= 15 && IS_ENABLED(CONFIG_PPC_KERNEL_PCREL)

or something like that.

Thanks,
Paul.

