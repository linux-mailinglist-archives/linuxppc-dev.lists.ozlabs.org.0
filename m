Return-Path: <linuxppc-dev+bounces-7792-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2ADA93889
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 16:19:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfH2d49G5z3brL;
	Sat, 19 Apr 2025 00:19:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744985977;
	cv=none; b=eIEMmCLClgU3zLmzxbVQJ+NLqFcdxzX44DgdcEI4KXAanM+cPV79JbCNePqblpSkjJoGrPWlplb2C4wQk8oMImEdoUrIrxPevY2kMPSYHPnlek8mgoQ0dqAGk+2cg/zLR8q2QrptSjdQCPjS2nB21ffbrBZ3enelcZl8IBVnJBYVFQLEJ3YpN8Rta+qx5nQeJkMnp4/TMeSjTuPyy2PZrLl5LDsHYOEPm9ADRH18oMoh1KjC5yQ5bwBKs1xYRoCQFvpwRiPvaWNpTZtIIqC48NJHlAb5Z/Yr8DTkNPYKzNFSNe8zJU0Rf4s2dXDwAch/8wjTfYymdiNtiAZibC9wWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744985977; c=relaxed/relaxed;
	bh=g1ASXE1XoNvo3/TalZt9jqQKX2TOoBOweyI40SQbKec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3fR2nE2CMIwxDuCW+dhVaGlee+P1iC/COn9Hn4FgsAfrMeTv5advZHCOfCDQKOt3pyehWbu+lTMcKpVau6GhKSxdHJXI7hhvZ559DHYOtixV1M/m2Ld2I62buzTiijIbPE68v3vMrXh0l3DhY0TV4sb4uwUKckOmpBx69bvfc/Rr5GnQuAYmCNPlmuiIjmj9tD8oykt47b2t+++EvGAfcJkoa8eM5H3m7QgnuL7ebv+e6a8lN2X/6UYnMm1xgXx9eY6V3IFK/WldT0ITXwfFGvHDHmxoXUh3O3SFPqZ94DZFOq8/rfduZzi1Qk/lSG6iPh+GyWaCrBC9ixWg6rPeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RRV/mjio; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RRV/mjio;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfH2b65WBz2yqd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Apr 2025 00:19:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 51438A4B4C0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 14:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D35BC4CEE2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 14:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744985972;
	bh=om+Vna/2GFvSm09tdyvQMrH5gELgac15SstCZnvcK14=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RRV/mjioS01PV47nXvZ0TWue3NIWYz4g3TvMtcGSc9SzDjv5ENiZxjjzbX9r29B3r
	 9/rQJy4n6bGeoy4ykbB+W4/4F7W0D3C9D3cINHvpgD0y02oiSDkrEm5G7Vf1UOSJNB
	 RQpnb5utZNxuqYFRuG86JaRbyR2LQdUMJyr2qEc11qUB69jHurGTthMhKqWn9Y9PcS
	 Nzl/cYyfucM8in2jji8Q98Ls2NeNC3pWDwx+RpeSSgWLOWSWmRB1nmRVItasiBs5Oy
	 j4ge2AaFjDu59Ljk0ccoDDlfXsh5ZyrSwgoTZOaXCcDebHhf0VadkqEJMQ5k7pZQjU
	 NX/2hSLrgVIsw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bfed67e08so19896891fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 07:19:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCwUS9zAwPVaKB5lQt+kXbpkbqdZLQiv05hbEwgHXJA9alvVGM0zkt8aSQy/jPjzsbUvZBZSOf4yc+yhw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyjFTuNxfFyWI83Ia9Fv8a7SfJVFfYbAeTlaT4lq+jJSgsn4iDy
	GSHBEuAqgP8qnEytgZN+yC8hzl9hgG24needf4VYi3xiO8la5Xu0zvnpIzcACKFjJAB1WbCY8H0
	uSc4S1IqfxEMFGeuWDmUIargdoT8=
X-Google-Smtp-Source: AGHT+IFnh+q+URrFYgeso0knkjqFFZnTfGmXzWjvKWHdUWW3YHckdLRG/cd76/RqwZUrPe+JG12yfp7YED1LQQgVI5I=
X-Received: by 2002:a05:651c:241:b0:310:779b:9ef1 with SMTP id
 38308e7fff4ca-310904d4972mr9346751fa.13.1744985970634; Fri, 18 Apr 2025
 07:19:30 -0700 (PDT)
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
References: <20250417182623.67808-1-ebiggers@kernel.org>
In-Reply-To: <20250417182623.67808-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 18 Apr 2025 16:19:19 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE4T4p7iCkfo=4RoMeU4sHh47EZyBUSdWv7HTqdAY2oCA@mail.gmail.com>
X-Gm-Features: ATxdqUG3NGrAHvWSlyQ9Wx2CgTU0VxdHzlcc8yhyIdwCb_viAAYGMbAHFukqzA8
Message-ID: <CAMj1kXE4T4p7iCkfo=4RoMeU4sHh47EZyBUSdWv7HTqdAY2oCA@mail.gmail.com>
Subject: Re: [PATCH 00/15] Finish disentangling ChaCha, Poly1305, and BLAKE2s
 from CRYPTO
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 17 Apr 2025 at 20:27, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series removes the unnecessary dependency of the ChaCha, Poly1305,
> and BLAKE2s library functions on the generic crypto infrastructure, i.e.
> CONFIG_CRYPTO.  To do this, it moves arch/*/crypto/Kconfig from a
> submenu of crypto/Kconfig to a submenu of arch/*/Kconfig, then re-adds
> the CRYPTO dependency to the symbols that actually need it.
>
> Patches 14-15 then simplify the ChaCha and Poly1305 symbols by removing
> the unneeded "internal" symbols.
>
> Note that Curve25519 is still entangled.  Later patches will fix that.
>
> Eric Biggers (15):
>   crypto: arm - remove CRYPTO dependency of library functions
>   crypto: arm64 - drop redundant dependencies on ARM64
>   crypto: arm64 - remove CRYPTO dependency of library functions
>   crypto: loongarch - source arch/loongarch/crypto/Kconfig without
>     CRYPTO
>   crypto: mips - remove CRYPTO dependency of library functions
>   crypto: powerpc - drop redundant dependencies on PPC
>   crypto: powerpc - remove CRYPTO dependency of library functions
>   crypto: riscv - remove CRYPTO dependency of library functions
>   crypto: s390 - drop redundant dependencies on S390
>   crypto: s390 - remove CRYPTO dependency of library functions
>   crypto: sparc - source arch/sparc/crypto/Kconfig without CRYPTO
>   crypto: x86 - drop redundant dependencies on X86
>   crypto: x86 - remove CRYPTO dependency of library functions
>   crypto: lib/chacha - remove INTERNAL symbol and selection of CRYPTO
>   crypto: lib/poly1305 - remove INTERNAL symbol and selection of CRYPTO
>

This seems like a good idea.

Acked-by: Ard Biesheuvel <ardb@kernel.org>

