Return-Path: <linuxppc-dev+bounces-8497-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26286AB2F16
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 May 2025 07:46:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZwpW10s9kz2xS2;
	Mon, 12 May 2025 15:46:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747028765;
	cv=none; b=GHoTiI5PCcy6ddUJ2sQT7/56kIq93/1INqOVvHbrs5sqnfkgO1+fuNbp6m5rz6H8eZ2mLRv3hWrBwhDkvf11Owd5HIkpu+7g5o9d5WD9SHWPtmZdiPPjePzLpBdSVQ8jI59Ho6neoozjFnQzFp5h5sicbVONO7VNTLh88cDHlfEQjjq8ZM0qKn7XS3XMKnu0zX2QGlrks3YhbSkQ0aRgnbrqmhknRDM62Z1h8QObZZ+ec78t9LIz7JYMorE+7P6NCIjPMpVwznx2Y+l9ARVx/sfMDK6gQEe9BebRjhCABqFfW6oMBC9Ji4QHEygyrxayCrwKFxMOLlgGIKuu/D0y/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747028765; c=relaxed/relaxed;
	bh=xxYezVCCW8thv+qLiUz6l9UAqKd/qP+JO8d98YSqd48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=e/Amwekwe709nY5sYj1Vpr9JbpR798anMTKSaQLvIMhGx151f9zTmIro6Ztg+Gcj955p+c/judBFijsU9Tg/fCkyd2tJbAWjUni346YobuMdwLKB+SLssJ5tKF+NJGS8AaCKRi2t3+wsBxCOaQrOzO8d5RU1Dw0JaBSC3cP4O7QQNa2TpQO8xJsgS4XFBRb4WTRKjRsOprkEfCrJRIoONoYfSVE8xZYD5/Dgb2/80rYb9j0oYi30h0/s5QCtRQ+npzlt6ScT7vLjOksV3dZtzOjU2IgDXQAcA4gupdlf2qG958DdUogT9HBW9X/M/8bRTSFsdVF8tJIWDoNcuenZOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=S/s7t2pO; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=S/s7t2pO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZwpVw0tBMz2xPL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 15:45:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xxYezVCCW8thv+qLiUz6l9UAqKd/qP+JO8d98YSqd48=; b=S/s7t2pOkSMknAlt9Xo72xB+Xk
	2BeBKd0JobLfzVY1rfopu4wpLQVmbiyoIyrKWNfw7fJElr2DnZf+2tHomWPWndlZcrQd/HdtxrhMo
	tTihOowVp20dSE+SUvgkndWKyD9qKp1x0wWN4TQ/VwCRY6nFbhGy50FuzlO8OKpMeqYiggyoTmsLl
	jQkWg8LN7KnZjUelc9rjFiuoTc8BIYX9Cd3aVWjMbysGB/o95Lhq3vAWZktaVIkqPbsqxzOxFvI26
	OMBaBIB1PNbiIjiT0ucY5IFwu4MO/jlIIwZjeJxlcxvoVPc77KsOtexUw0YOl1fVZTXqXTY0jvh6h
	Lula7ezA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uELz5-005LnN-2T;
	Mon, 12 May 2025 13:45:52 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 12 May 2025 13:45:51 +0800
Date: Mon, 12 May 2025 13:45:51 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	Jason@zx2c4.com, tytso@mit.edu
Subject: Re: [PATCH 0/4] crypto: lib/chacha - improve type safety
Message-ID: <aCGLDzAkVn65P4n4@gondor.apana.org.au>
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
In-Reply-To: <20250505181824.647138-1-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Eric Biggers <ebiggers@kernel.org> wrote:
> This series can also be retrieved from:
> 
>    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git chacha-prototypes-v1
> 
> This series improves type safety and clarity in the ChaCha functions by
> strongly typing the state array and adding explicit array bounds for
> other fixed-length arrays.  No functional changes.
> 
> Eric Biggers (4):
>  crypto: lib/chacha - strongly type the ChaCha state
>  crypto: lib/chacha - use struct assignment to copy state
>  crypto: lib/chacha - add strongly-typed state zeroization
>  crypto: lib/chacha - add array bounds to function prototypes
> 
> arch/arm/lib/crypto/chacha-glue.c             | 34 ++++----
> arch/arm/lib/crypto/chacha-scalar-core.S      |  5 +-
> arch/arm64/lib/crypto/chacha-neon-glue.c      | 27 ++++---
> arch/mips/lib/crypto/chacha-glue.c            |  6 +-
> arch/powerpc/lib/crypto/chacha-p10-glue.c     | 17 ++--
> arch/powerpc/lib/crypto/chacha-p10le-8x.S     |  6 +-
> arch/riscv/lib/crypto/chacha-riscv64-glue.c   |  9 ++-
> arch/riscv/lib/crypto/chacha-riscv64-zvkb.S   | 10 +--
> arch/s390/lib/crypto/chacha-glue.c            | 13 +--
> arch/x86/lib/crypto/chacha_glue.c             | 62 ++++++++------
> crypto/chacha.c                               | 20 ++---
> drivers/char/random.c                         | 41 +++++-----
> fs/bcachefs/checksum.c                        | 18 ++---
> include/crypto/chacha.h                       | 80 ++++++++++++-------
> lib/crypto/chacha.c                           | 40 +++++-----
> lib/crypto/chacha20poly1305-selftest.c        |  8 +-
> lib/crypto/chacha20poly1305.c                 | 53 ++++++------
> lib/crypto/libchacha.c                        |  2 +-
> .../crypto/chacha20-s390/test-cipher.c        | 10 +--
> 19 files changed, 253 insertions(+), 208 deletions(-)
> 
> 
> base-commit: 64745a9ca890ed60d78162ec511e1983e1946d73

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

