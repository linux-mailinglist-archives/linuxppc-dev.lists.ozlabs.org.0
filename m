Return-Path: <linuxppc-dev+bounces-3548-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB9F9D8460
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2024 12:25:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xxk0X0BV9z2y66;
	Mon, 25 Nov 2024 22:25:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732533947;
	cv=none; b=dEjeFAnj97bfZeF3+gnhGwbCaKdt3G3cwnHz7AurwpT5MfezMfr8FdHWKKaTJAuRo7MuVl71K/QxRfETLOoLEOxy8dZVdRABwJDQsS+0pR60nEDQBefRK+zwbYgmnFHLeWVDxQO2uXKbdJ/kW2yKScKnQOcSzaScsjbBBViTHXN8SbVsvbATW8n3qao1061afBsH26kVbvTEiOnoB6IKLtJ5tsnsB3wpRo1XduQAYtn7HSE5uztItdhb3SOJj+HMjzsBEjP1CHFhPXc9hM2OMFwABrivm/+vRkhg93JM3u3BiLhniwDCADWr4bamwLAQzjOC9O72c3kNPxF411xH+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732533947; c=relaxed/relaxed;
	bh=GEwWZpkSTwqkvb7sbAxuL/F3C5T2lgJTaLKpD4NJ67s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hEVebtH3fp4AfrAEZCffyUPHw8aTmtB77puLF4KCejBMaDdkXiHfNCbkUNGAe2ZAjmXD9FBUrOhaSx/3pxIiz33Q+LQNPLt2yYNZGR9vP0/ZcE0v9vL1G0TzLxuHUQ7XYjes2tnLf8PAVKMvuK/LTzq3E0WBeQ0y3DjLUNZU/uEoaVi7SvTpxoTVRhEkHWqN1l2BHzNFt6YObrakuusCeO7PLe6xM9YLwwqV814ZcMEPF0ZMuGNbUud+QTj3oCqBQPUVBFuCmjMo8uWn6v3y6AzKlraiYuX/inUdTohHydtdPye9NvZ0sIYTLYVdcMdUK7Jvf5DPap7BdTunbRQ3Aw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ibq9vWSI; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ibq9vWSI;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xxk0T1VJmz2xvR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2024 22:25:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1732533935;
	bh=GEwWZpkSTwqkvb7sbAxuL/F3C5T2lgJTaLKpD4NJ67s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ibq9vWSIkcvH3dVNxoDUbmcfbmw9gOTfu7vLdfVcW9ngaj4FXizoh3F73wHquZUQW
	 A6GAdiQISb3502sWECC/O/vKtjQ+j5iAQzNAKpI/OSqzBpKu+2kOoZ85QH9j8tKiXG
	 j0Gt+bvBJILy+G0DpQyq9xbaSD/N71qWWtuvFk0OBielTvVxvNYNblTQ/7HdhzSIp4
	 okDL5RYCU2YpNO5qqFwTmg/FdB2tDeTlh7uZdcvta0HazRG1uNpWpYo26FBtxhncq1
	 NQ64prFmd/qc4XwOayVfEdQ8CjKjOoI7PLm/e4UER4Cx6Q5kQCBY3+BnF2vMwZ9dve
	 3hDyEZuMmKd6g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xxk0B3vybz4xcr;
	Mon, 25 Nov 2024 22:25:30 +1100 (AEDT)
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
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Jonathan Corbet
 <corbet@lwn.net>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, Matthew Maurer
 <mmaurer@google.com>
Subject: Re: [PATCH v10 1/5] modules: Support extended MODVERSIONS info
In-Reply-To: <20241123-extended-modversions-v10-1-0fa754ffdee3@google.com>
References: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
 <20241123-extended-modversions-v10-1-0fa754ffdee3@google.com>
Date: Mon, 25 Nov 2024 22:25:31 +1100
Message-ID: <87mshntv10.fsf@mpe.ellerman.id.au>
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
>  kernel/module/internal.h        | 11 +++++
>  kernel/module/main.c            | 92 +++++++++++++++++++++++++++++++++++++----
>  kernel/module/version.c         | 45 ++++++++++++++++++++
>  4 files changed, 162 insertions(+), 10 deletions(-)

I already acked version 8, which AFAICS is identical to this version
(for this patch at least).

Not sure if you dropped my ack on purpose, but here have another one :)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

