Return-Path: <linuxppc-dev+bounces-8198-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3078EAA52DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 19:45:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Znl335gqXz2y8t;
	Thu,  1 May 2025 03:45:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746035151;
	cv=none; b=e1jnjPWqnynPL8ebMGrLy6vw8hziGMFkhVKNxc00UOIuUGsIHisjfGcYCGmI2oYukNifa+qN6FsPxjjgAfBVNxBxfiRHh6QiiIB2sjLrwm7WT8UOsVEsYn3RUjd0GfTKxRKhtB0yY3edXWNqY9/kUHefywSTpGVr6mZ7Kc7LzFRXVDflOilAU7kJREqC/s1S/qf5cmPutVSJpEkHJzzyMRLHBa17Hp0UG0HmIrys51qyj73G+7lDtWPJCV85AO0E4rx+dmkuVjpGAkUlduX1CTlbQP58iAatoPnWR+P3dV/o0zb7qs9mk78iBN8f0tGLb9vaIrX/jqSZrJpNqhdguQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746035151; c=relaxed/relaxed;
	bh=3LIy8RjJcHA6kmS230+26y/VusUu4oONIC/b+zJtksg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DvxWEyb+l8zK2dy+ZBS1cE/wgqd7BG2C3oCd2jhBFVHYovfnmzd0BuY4PJSQlronAD3cTeRgEQbN4aQsbRGvjOBqFACKm4Y5kBInoDjhoXQRYyfdXExao4dYgtaNIjekzQtKkJWM/MJb1ddU23O1QwKl81aqIPoBaPr5aTl8MkyA7xZuMGEhygKieioZaPIoX0DYCFXqDnLSyY7wbZpF7E8EUFmMEpydLZBqGQx/ZAx/rhFJ5OlTXEGcLKjJ7guthVl1sc/jqTAiVw1VHS6Jh9FMj/k8+gj9RDb07ed6xnLqUjvleZ/RE78pH1tjuT6DvYwadp/KKKxA2e5Hi/PfhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b5Ki7Zeo; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b5Ki7Zeo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 54414 seconds by postgrey-1.37 at boromir; Thu, 01 May 2025 03:45:48 AEST
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Znl305LzJz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 May 2025 03:45:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 39BE86842A;
	Wed, 30 Apr 2025 17:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7027EC4CEE7;
	Wed, 30 Apr 2025 17:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746035146;
	bh=KRq3ObS+7bPSh5npZvFvh2C1vvjoanHB8ALoJ0Lw5oY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b5Ki7ZeoUb9ZN4LPaDEoM1o1bvfVz7fD1oztts7rOpVhwqg4oS5OvcmfJCGu3gxUH
	 fT26UoXeSWagXlFQb3TkXpFnlFx9pI6CdXses/373TH68nkQ5m1XnkeCZyjTB3pjL8
	 hB2unDN1O+ZToSdOpBH6aVt6DnPXIiit23u0m97zhbqweH/oPbGvmEvxIZXP3/PGuI
	 fXfOoMh+QT2xdYboklbx8EcmahcftGMdK+N5ysjtRDWRo5qH2CA9yak25NsdYdhKlS
	 5Unk+mvpoO/hy1QMjlUYCjybEmTkDQ2xbgxYdXD5WmCQ7eiojk/2fQ1VOdLNWLhrd4
	 FfCKW0EMC7VFg==
Date: Wed, 30 Apr 2025 10:45:43 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 00/12] crypto: sha256 - Use partial block API
Message-ID: <20250430174543.GB1958@sol.localdomain>
References: <cover.1745992998.git.herbert@gondor.apana.org.au>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1745992998.git.herbert@gondor.apana.org.au>
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

[Added back Cc's that were dropped]

On Wed, Apr 30, 2025 at 02:06:15PM +0800, Herbert Xu wrote:
> This is based on
> 
> 	https://patchwork.kernel.org/project/linux-crypto/list/?series=957785

I'm assuming that you mean that with your diff
https://lore.kernel.org/r/aBGdiv17ztQnhAps@gondor.apana.org.au folded into my
first patch, since otherwise your patch series doesn't apply.  But even with
that done, your patch series doesn't build:

    In file included from ./include/crypto/hash_info.h:12,
                     from crypto/hash_info.c:9:
    ./include/crypto/sha2.h: In function ‘sha256_init’:
    ./include/crypto/sha2.h:101:32: error: ‘struct sha256_state’ has no member named ‘ctx’
      101 |         sha256_block_init(&sctx->ctx);
          |                                ^~

> Rather than going through the lib/sha256 partial block handling,
> use the native shash partial block API.  Add two extra shash
> algorithms to provide testing coverage for lib/sha256.
> 
> Herbert Xu (12):
>   crypto: lib/sha256 - Restore lib_sha256 finup code
>   crypto: sha256 - Use the partial block API for generic
>   crypto: arm/sha256 - Add simd block function
>   crypto: arm64/sha256 - Add simd block function
>   crypto: mips/sha256 - Export block functions as GPL only
>   crypto: powerpc/sha256 - Export block functions as GPL only
>   crypto: riscv/sha256 - Add simd block function
>   crypto: s390/sha256 - Export block functions as GPL only
>   crypto: sparc/sha256 - Export block functions as GPL only
>   crypto: x86/sha256 - Add simd block function
>   crypto: lib/sha256 - Use generic block helper
>   crypto: sha256 - Use the partial block API
>
>  arch/arm/lib/crypto/Kconfig                   |   1 +
>  arch/arm/lib/crypto/sha256-armv4.pl           |  20 +--
>  arch/arm/lib/crypto/sha256.c                  |  16 +--
>  arch/arm64/crypto/sha512-glue.c               |   6 +-
>  arch/arm64/lib/crypto/Kconfig                 |   1 +
>  arch/arm64/lib/crypto/sha2-armv8.pl           |   2 +-
>  arch/arm64/lib/crypto/sha256.c                |  16 +--
>  .../mips/cavium-octeon/crypto/octeon-sha256.c |   4 +-
>  arch/powerpc/lib/crypto/sha256.c              |   4 +-
>  arch/riscv/lib/crypto/Kconfig                 |   1 +
>  arch/riscv/lib/crypto/sha256.c                |  17 ++-
>  arch/s390/lib/crypto/sha256.c                 |   4 +-
>  arch/sparc/lib/crypto/sha256.c                |   4 +-
>  arch/x86/lib/crypto/Kconfig                   |   1 +
>  arch/x86/lib/crypto/sha256.c                  |  16 ++-
>  crypto/sha256.c                               | 134 +++++++++++-------
>  include/crypto/internal/sha2.h                |  46 ++++++
>  include/crypto/sha2.h                         |  14 +-
>  lib/crypto/Kconfig                            |   8 ++
>  lib/crypto/sha256.c                           | 100 +++----------
>  20 files changed, 232 insertions(+), 183 deletions(-)

The EXPORT_SYMBOL => EXPORT_SYMBOL_GPL changes are fine and should just be one
patch.  I was just trying to be consistent with lib/crypto/sha256.c which uses
EXPORT_SYMBOL, but EXPORT_SYMBOL_GPL is fine too.

Everything else in this series is harmful, IMO.

I already covered why crypto_shash should simply use the library and not do
anything special.

As for your sha256_finup "optimization", it's an interesting idea, but
unfortunately it slightly slows down the common case which is count % 64 < 56,
due to the unnecessary copy to the stack and the following zeroization.  In the
uncommon case where count % 64 >= 56 you do get to pass nblocks=2 to
sha256_blocks_*(), but ultimately SHA-256 is serialized block-by-block anyway,
so it ends up being only slightly faster in that case, which again is the
uncommon case.  So while it's an interesting idea, it doesn't seem to actually
be better.  And the fact that that patch is also being used to submit unrelated,
more dubious changes isn't very helpful, of course.

- Eric

