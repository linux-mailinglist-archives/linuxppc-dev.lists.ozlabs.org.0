Return-Path: <linuxppc-dev+bounces-3081-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 330699C35D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2024 02:11:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xms2S4GGBz2xy7;
	Mon, 11 Nov 2024 12:11:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731287504;
	cv=none; b=fck++xlSaX/pYV4tdqR3f/QykyOppADAR3AxJcUSjwnCthotvN88qFcziL2e/qmR5dJQ1HHY8bfd/tWoa2TDsq5ON48AS44P0sijHiA7f3AkT2DZ1Pb7TLshASDl8+HdihrWajQwREj7gS78EYnudCpmW4YBAONYKqSRD5vMAzBHy+rldVW1Zud1ezjgQmCX5fbLrLJjqriOlcLOS7q4kMDC6gS67Y2OmYeIaIRSXYFZlFlDe195r3bJEU3qDu4uyGPOGwCNbtXnd2z7hEBY15txPXW78Zb2s6isCqFa19VTkypuI6wY94Vd/iGThOf0QDnowdBkWTC4xa09VCeXog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731287504; c=relaxed/relaxed;
	bh=a/0zm3MDXQoyiuSwhNM/q97OKgNwCzM8MCZdUyeHH08=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dL/f+zh7S7mXSPiOHzZVjvZC6XC8k7XvVLYJY6CcOctQskqd6akElKZqLnRioB3LFW7hN0CeUYyY1jnimu0emtrY7Hd/F/LqiyALqiRv9Hn1+9vCJVk47+AMW7qvbZQ1auhED2i8qCr4Y9hq9+dcluHuB3BTcJ/xAPHJOa2SyXmRg9pgAss7sdbzMyhnmXSKwHGIZaEk1WVdNkqb4/94N1jZHeVe+fCpiDhcQ2JGJjaFK1VBavEPUlXEzibE6Md6zqsxEgAZbNbRWBXFZXT3377H1wAoZIzADzGO2KbPZyxdqayRtNvT/5s88T3rZUFDJKYbcpFiwK8e1RoLgFmABA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jn9mWKx/; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jn9mWKx/;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xms2Q2Mq3z2xvR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 12:11:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731287494;
	bh=a/0zm3MDXQoyiuSwhNM/q97OKgNwCzM8MCZdUyeHH08=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jn9mWKx/RaTVuSdEMIkaaWGe9emYy+XspqqHekK+sCMMnM03JnUzsntVfbwWHtwfO
	 qLo8Z2lVxHK1/lbYloNJbGivOkEXjbZzkqyzRe8+LHnvHue+8Cw8h4TGSYR1JTDoq3
	 /bwv1kZxoD3yqn+rpNu24wHHaaVhkL1A5JQS7NaiosVQPGczm1iVq48cu/Af259JO3
	 NTLd0jqiC8p0G3oN3qm7J96seZqrg9iJytCvZoB7MTLgFmVt1b+3FkKhbUGHJH9WZc
	 vN1UDursvGoBG86QK7J5onghYVgiF9vAint+hpltfOsXxBaTvNmBflgJRc8QpWvX19
	 NSOklzYy7VFfg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xms2G0fFRz4wbr;
	Mon, 11 Nov 2024 12:11:33 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thorsten Blum <thorsten.blum@linux.dev>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Thorsten Blum <thorsten.blum@linux.dev>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: Transliterate author name and remove FIXME
In-Reply-To: <20241110162139.5179-2-thorsten.blum@linux.dev>
References: <20241110162139.5179-2-thorsten.blum@linux.dev>
Date: Mon, 11 Nov 2024 12:11:34 +1100
Message-ID: <87v7wuy3p5.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Thorsten Blum <thorsten.blum@linux.dev> writes:
> The name is Mimi Phuong-Thao Vo.
=20
Is that the correct spelling?

The github commit below suggests it's Mimi Ph=C3=BB=C3=B4ng-Th=C3=A5o V=C3=
=B5.

And presumably the author preferred that spelling, otherwise they would
have just written it in ASCII in the first place.

https://github.com/bminor/binutils-gdb/commit/6603bf38d74409906b3814f6a26c0=
483a5d32e41

cheers

> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/powerpc/boot/rs6000.h | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/boot/rs6000.h b/arch/powerpc/boot/rs6000.h
> index a9d879155ef9..16df8f3c43f1 100644
> --- a/arch/powerpc/boot/rs6000.h
> +++ b/arch/powerpc/boot/rs6000.h
> @@ -1,11 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  /* IBM RS/6000 "XCOFF" file definitions for BFD.
>     Copyright (C) 1990, 1991 Free Software Foundation, Inc.
> -   FIXME: Can someone provide a transliteration of this name into ASCII?
> -   Using the following chars caused a compiler warning on HIUX (so I rep=
laced
> -   them with octal escapes), and isn't useful without an understanding o=
f what
> -   character set it is.
> -   Written by Mimi Ph\373\364ng-Th\345o V\365 of IBM
> +   Written by Mimi Phuong-Thao Vo of IBM
>     and John Gilmore of Cygnus Support.  */
>=20=20
>  /********************** FILE HEADER **********************/
> --=20
> 2.47.0

