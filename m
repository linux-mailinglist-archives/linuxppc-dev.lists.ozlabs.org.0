Return-Path: <linuxppc-dev+bounces-7383-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FB2A75558
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Mar 2025 10:11:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZPs893w0xz2yrd;
	Sat, 29 Mar 2025 20:11:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743239481;
	cv=none; b=FLFKvyE7X/lOcz5UzDyV79bejy1YSl8VpxS5/HU1TUpyQfxeploKg3QOPnM75DqgdXp4t/dw0f0ZZrNePKJyGF8qNhJ3caC8qT8vblORn0CrT+S04vX1bV6muTleo9Tg7wUUNmmWgf8C4NiHGbcB7rkxqgN5zteDN3lctk0YMcC6qng6OjXZIp25ZC8hRYM848PJxhIQc3MDe5Ns6eudB5BJLKsl48YAPKTXNhHJNE8f6LTofoEM41Y43imOOIaq344u3go2pLHiasFFHWJCBC/hA3xOL2FkOWMHqsgaAjppI2pZwg6GGeMVrKi8fSE4h4K/ThqPwNbRrZEP2rKaKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743239481; c=relaxed/relaxed;
	bh=PG07tL+Y0H/qBBYy99tJTr1QzjohoQ87Q5SRquO/ses=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NyFEolDjNttOLZM/2HMaW6/+e9KdYxmkfZyGs8RebBbHO9WcDMjh2josstYwVr/OMzai7XIBGCTZfeo6CI3mYR8hSgNX6Gp2I7UZLOIfwNyPRgVVW156KkvlT17ymdOqDWQUWbEIy7XLpOjYTnczFIZXxLykUp/GPxtimVGeMGJH4NgUNr417nzhTV6t7Otxu8r5vojoRS1xt1GmsnYbUpNW8FrwI5KZRNwGCrYwWFtKaN9bNGEq+vdgc68UINWOGf1AzKF4GWUkhQRr2TymjNa7lCzkPm9QiuXBRP+/FJ1sOu6Px3xFKYrznuZs7x/r9iLiUHXF8X5B2Re0Sxv2Rw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UjPmF/0W; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UjPmF/0W;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZPs861tKLz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Mar 2025 20:11:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1743239475;
	bh=PG07tL+Y0H/qBBYy99tJTr1QzjohoQ87Q5SRquO/ses=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UjPmF/0WsFqfzCZ25WR5X7bBuTApeNjqGKXSNraNYwNj3URKO8K5v0crtvy/g5OWC
	 r3X41uYC7LTFNIAH7UnmOqBfuPqiBtsn1G65Tyl1RNTNcERC6zefkxDGqCTcdneZ2L
	 8kwIu3A8UyzWgADIRkgizOj6r8OqOex8JsT7eZaJlcBA/B728NcL2mCiKOpxAOut5f
	 jSOe1LUl7RN+011FRNnfaYbcGiz4tCXy+vScOcMe2bQ7cdwyOcVueetYsSBmoX4D9c
	 D9IAlwH3XzsoUCls6ys75AX6IfMcaipnzdK1AIrv8YoC9A/mMqdJOKY5ak3iPhHE4C
	 anSaiwwVAhj4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZPs7z5CH5z4x8W;
	Sat, 29 Mar 2025 20:11:11 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Cc: Michal Suchanek <msuchanek@suse.de>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, Masahiro Yamada
 <masahiroy@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel@vger.kernel.org, "Nysal Jan K.A." <nysal@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/boot: Fix build with gcc 15
In-Reply-To: <20250314092528.15506-1-msuchanek@suse.de>
References: <Z86liwlwP5WvrEkw@kitsune.suse.cz>
 <20250314092528.15506-1-msuchanek@suse.de>
Date: Sat, 29 Mar 2025 20:11:08 +1100
Message-ID: <875xjsjj6b.fsf@mpe.ellerman.id.au>
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
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Michal Suchanek <msuchanek@suse.de> writes:
> Similar to x86 the ppc boot code does not build with GCC 15.
>
> Copy the fix from
> commit ee2ab467bddf ("x86/boot: Use '-std=gnu11' to fix build with GCC 15")
>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
> v2: Move the fix outside of ifdef to apply to all subarchitectures
> ---
>  arch/powerpc/boot/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 1ff6ad4f6cd2..210c60d3d4cc 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -32,6 +32,8 @@ else
>      BOOTAR := $(AR)
>  endif
>  
> +BOOTTARGETFLAGS	+= -std=gnu11
> +
 
BOOTTARGETFLAGS gets added to CFLAGS and AFLAGS.

I think -std=gnu11 should only be added to CFLAGS. In which case it'd be
better to add it directly to BOOTCFLAGS further down.

cheers

