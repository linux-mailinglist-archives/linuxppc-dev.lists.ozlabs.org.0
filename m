Return-Path: <linuxppc-dev+bounces-2739-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6289B71C9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2024 02:22:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xf5pF0vgWz2xs4;
	Thu, 31 Oct 2024 12:22:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730337765;
	cv=none; b=KR4UHt9m4y34rBmLNFdtcJxoB9KC3rgRmDFdC9+T440jFugQMJHk/gAhqSutn7aLoI3knOnv4d9dyy/p9bovaVGtZSDrHNdRX7bkSmIjVz4anNu+AIVCXDfpXXZoyUNL/UJL1ZXXHsMCM5iQS2Dauwl4WOotSFT5Om2Wp6/0M0LGkm2U3+q46WLx7UxGcrH0bMf0UtJxrYPUa188NhApsaf+m17IiDttpvpM2kbpNTQSoJgw4VONZf886eYgtq9a4AYccVO7xjxyfXAuqDuYGDUv8r/TPslMNpYZ6yDv5cgUvd2qSpHYxMbW8k2/m2+A8+T1aWFYcd1S3QV6H60/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730337765; c=relaxed/relaxed;
	bh=QjW8Kw5UFmafLnSTxLCguKpJPtpBFspJBqxqy1O825M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FfXk3p5qeP1OW4OkWYjiEnYwrXB5qFtVMiYeb503+1+Fg40CBGJJncb9Hh8CIJGBKtf7ZPTwhDThBPjngntoANq0pZbN6OHoDf0I0OB9Ug8CaJ6Z8YK+VnAWGLN/OUiqEv9RuYo1cE/2S3BCgeN+6vTb6+JLSVEZL30xr5J7wbANOrG/dpFSER447XYKSXPFU+HaWgXI+N5iTe2e4QaVtLI2osIJIIoJpW9LBRUrbpyrF2pR7El9sHWREVwUDP6TNUcGOzzxdIgol/l3WdxSf+lXgJdRHLKtLGb4y2ofveHYFEvx17untoXsHA1JmcnPfKvmLp5gk8sO3QKc9OtAgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=C0Y7jtBx; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=C0Y7jtBx;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xf5pB3n1Bz2xCC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2024 12:22:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730337760;
	bh=QjW8Kw5UFmafLnSTxLCguKpJPtpBFspJBqxqy1O825M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=C0Y7jtBxM2HrGF3Fgeq4yau1+afHnWMC/ktoKCXAG3lCR82udfE4mVv2/ZXCIQfsx
	 U5qU7v343LVxSw4qCipn8OU8QAwyBRiCFG9zVjXR76F4UU/FF8w6G2TCzCT87OQitD
	 255pfCHLZiQHs/HThwTzK+Uk6bzjX6N7NKW0SnDkEionTYsikO76raEoo7MOZ0me97
	 M4xhiSLeJ8mtmtAFlOkqnii4KTVenm/FixC4kKuxQV5hv5L/M5oXaayzyX8gwfPSNx
	 wbbYqNvkt9wOBPBmqHTppWKssdZWmoZ17CnWM3SrR6eWPh9+OxEMDOgPnx/E+3vPOx
	 MD5ALWY2q3Bng==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xf5p503Tfz4xGC;
	Thu, 31 Oct 2024 12:22:36 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Matthew Maurer <mmaurer@google.com>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu
 <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, Daniel
 Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH v8 1/3] modules: Support extended MODVERSIONS info
In-Reply-To: <20241030-extended-modversions-v8-1-93acdef62ce8@google.com>
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-1-93acdef62ce8@google.com>
Date: Thu, 31 Oct 2024 12:22:36 +1100
Message-ID: <874j4tcbhf.fsf@mpe.ellerman.id.au>
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Matthew Maurer <mmaurer@google.com> writes:
> Adds a new format for MODVERSIONS which stores each field in a separate
> ELF section. This initially adds support for variable length names, but
> could later be used to add additional fields to MODVERSIONS in a
> backwards compatible way if needed. Any new fields will be ignored by
> old user tooling, unlike the current format where user tooling cannot
> tolerate adjustments to the format (for example making the name field
> longer).
>
> Since PPC munges its version records to strip leading dots, we reproduce
> the munging for the new format. Other architectures do not appear to
> have architecture-specific usage of this information.
>
> Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  arch/powerpc/kernel/module_64.c | 24 ++++++++++-
  
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

