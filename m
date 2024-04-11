Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBEB8A097E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 09:16:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PoTjX5JU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFWGZ35cdz3vdj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 17:16:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PoTjX5JU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFWFW4lptz3vZt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 17:15:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 59E14CE2F2D
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 07:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988BDC43399
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 07:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712819756;
	bh=EGxUFWIY3FhDr3OERYjKXmTSAvHQ47fM+usiXa4A2Co=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PoTjX5JUmRzsaa0P9y56kJydskXtPGFPN262bWdaHgDQod2o3roC0PZCNerABsCwG
	 bfYoknQIk2nufau511D9CeAz99/c+XBDYy9O7yS9Z1jFNFtUA7xvKQxJ/mBKdpOcAQ
	 8oBKA5LroCCkdcvSrmvcnHz8S4wEMgGzlbJBgQOBAwfoqFEvq51qHBY4tBRmieeKdp
	 K1V/z2yZw+dZ7cxWukX9RlSxbg26oONq6miKxZS20ViA44IL5h1YPGHEH4QM1NDmps
	 q4uBHpt3fB7RefgLPmbmEkh8QFaXUgnwKcsoM6Ruke9SxJbcWtDtjMPnbo5XIn7C6E
	 5gAsmHwkNvlMw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d48d75ab70so102290651fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 00:15:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7Wt8oLNok3rBG17Z/oB/uuSf3YRi4pqeYNnnI7P/1LohehijsjJ3N5zQGTlHdeiNhUyN31jTeXv/jPjOJKdoSm1SorblDc0435ubKvg==
X-Gm-Message-State: AOJu0Yzp6fNRUeNEERC0wdw/BaS8czwi5/FE8Xzy06CaUG42EXcSxuzr
	mmu4seepX7uNaaOx+5GDhHGMJTDgA+f8EZbIFPiBUoL77yvate0QZJ0jTUDL4rk3pC0dLFIXrlc
	VDMyTbXopU81SjcOfGoE1kCoRLJ8=
X-Google-Smtp-Source: AGHT+IEIbzlNGUw7dH6rrBUAPRiam7orrjfOi6n1jf8KoAxJeALyXjve8wFV4wHUyAY7FtZhkFPztybk10CRfm7afS8=
X-Received: by 2002:a05:651c:211e:b0:2d8:d8b5:73d4 with SMTP id
 a30-20020a05651c211e00b002d8d8b573d4mr2830394ljq.4.1712819754902; Thu, 11 Apr
 2024 00:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com> <87wmp4oo3y.fsf@linaro.org>
 <75a37a4b-f516-40a3-b6b5-4aa1636f9b60@sifive.com> <87wmp4ogoe.fsf@linaro.org> <4c8e63d6-ba33-47fe-8150-59eba8babf2d@sifive.com>
In-Reply-To: <4c8e63d6-ba33-47fe-8150-59eba8babf2d@sifive.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 11 Apr 2024 09:15:43 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGW5XQxXrYaPhT6sCjH7s0EwqzNjWies3b8UWnUBW5Ngw@mail.gmail.com>
Message-ID: <CAMj1kXGW5XQxXrYaPhT6sCjH7s0EwqzNjWies3b8UWnUBW5Ngw@mail.gmail.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
To: Samuel Holland <samuel.holland@sifive.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arch@vger.kernel.org, Thiago Jung Bauermann <thiago.bauermann@linaro.org>, x86@kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

(cc Arnd)

On Thu, 11 Apr 2024 at 03:11, Samuel Holland <samuel.holland@sifive.com> wrote:
>
> Hi Thiago,
>
> On 2024-04-10 8:02 PM, Thiago Jung Bauermann wrote:
> > Samuel Holland <samuel.holland@sifive.com> writes:
> >> On 2024-04-10 5:21 PM, Thiago Jung Bauermann wrote:
> >>>
> >>> Unfortunately this patch causes build failures on arm with allyesconfig
> >>> and allmodconfig. Tested with next-20240410.
> >
> > <snip>
> >
> >> In both cases, the issue is that the toolchain requires runtime support to
> >> convert between `unsigned long long` and `double`, even when hardware FP is
> >> enabled. There was some past discussion about GCC inlining some of these
> >> conversions[1], but that did not get implemented.
> >
> > Thank you for the explanation and the bugzilla reference. I added a
> > comment there mentioning that the problem came up again with this patch
> > series.
> >
> >> The short-term fix would be to drop the `select ARCH_HAS_KERNEL_FPU_SUPPORT` for
> >> 32-bit arm until we can provide these runtime library functions.
> >
> > Does this mean that patch 2 in this series:
> >
> > [PATCH v4 02/15] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
> >
> > will be dropped?
>
> No, because later patches in the series (3, 6) depend on the definition of
> CC_FLAGS_FPU from that patch. I will need to send a fixup patch unless I can
> find a GPL-2 compatible implementation of the runtime library functions.
>

Is there really a point to doing that? Do 32-bit ARM systems even have
enough address space to the map the BARs of the AMD GPUs that need
this support?

Given that this was not enabled before, I don't think the upshot of
this series should be that we enable support for something on 32-bit
ARM that may cause headaches down the road without any benefit.

So I'd prefer a fixup patch that opts ARM out of this over adding
support code for 64-bit conversions.
